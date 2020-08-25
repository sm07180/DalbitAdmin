/*
 * for webrtc play to Wowza Streaming Engine
 *
 * by Wowza, modified by ag315
 */

window.WebRTCPlayAdapter = function() {
	let that = {};			// return object
	let registry = {};		// event handlers

	let peerConnection = null;
	let peerConnectionConfig = {};
	let remoteStream = null;
	let wsConnection = null;
	let wsUrl = null;
	let repeaterRetryCount = 0;
	let streamInfo = {
		applicationName: '',
		streamName: '',
		sessionId: ''
	};

	// check webRTC implements.
	window.RTCPeerConnection = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection;
	window.RTCIceCandidate = window.RTCIceCandidate || window.mozRTCIceCandidate || window.webkitRTCIceCandidate;
	window.RTCSessionDescription = window.RTCSessionDescription || window.mozRTCSessionDescription || window.webkitRTCSessionDescription;

	/*
	 * on 헨들러 발동시키는 함수.
	 */
	function fire(type, parameter) {
		let handlers;
		let handler;
		let i;

		if (registry.hasOwnProperty(type)) {
			handlers = registry[type];

			for (i = 0; i < handlers.length; i += 1) {
				handler = handlers[i];
				if (typeof handler === 'function') {
					handler.call(null, parameter);
				}
			}
		}
	}

	// 이벤트 헨들러 받아주는 함수.
	function on(type, callback) {
		if (registry.hasOwnProperty(type)) {
			registry[type].push(callback);
		} else {
			registry[type] = [callback]
		}
	}

	function setInfo(info) {
		streamInfo.applicationName = info.applicationName;
		streamInfo.streamName = info.streamName;
		wsUrl = info.wsUrl;
	}

	function start(info) {
		// 정보세팅.
		setInfo(info);

		// 웹소켓 연결시작하자!!!
		wsConnect();
	};

	// 에러발생.(에러오브젝트 그대로 던진다.)
	function errorHandler(error) {
		fire('error', error);
	}

	// 웹소켓 연결시작한다.
	function wsConnect() {
		wsConnection = new WebSocket(wsUrl);
		wsConnection.binaryType = 'arraybuffer';

		// 접속되었다.
		wsConnection.onopen = function() {
			console.log("wsConnection.onopen");

			// peerconnection 생성.
			peerConnection = new RTCPeerConnection(peerConnectionConfig);
			peerConnection.onconnectionstatechange = connectionStateChange;
			peerConnection.onaddstream = gotRemoteStream;

			// offer 달라고 하자.
			sendPlayGetOffer();
		}

		// offer 달라고 하자.
		function sendPlayGetOffer() {
			let message = {
				direction: 'play',
				command: 'getOffer',
				streamInfo: streamInfo
			};
			console.log('sendPlayGetOffer: ', message);
			wsConnection.send(JSON.stringify(message));
		}

		// answer sdp 메시지왔다.
		wsConnection.onmessage = function(evt) {
			console.log("wsConnection.onmessage: " + evt.data);

			let msgJSON = JSON.parse(evt.data);
			let msgStatus = Number(msgJSON['status']);
			let msgCommand = msgJSON['command'];

			// 메시지 상태값이 '504' 는 스트림이 준비가 안된 상태다. 일정시간정도 재시도하자.
			// 메시지 상태값이 '514' 인 경우는 관련스트림이 없는거다. 걍 중지하면 되는데....
			//   edge 에서 요청할때 origin 에 있는데 요상태가 오는경우가 있드라 걍 같이 retry 해주자.
			if (msgStatus == 504 || msgStatus == 514) {	// stream not ready 
				repeaterRetryCount++;
				if (repeaterRetryCount < 10) {
					console.log('Retry sendPlayGetOffer 2 seconds later because => ', msgJSON.statusDescription);
					setTimeout(sendPlayGetOffer, 2000);
				} else {
					stop();
				}
				return
			}

			if (msgStatus != 200) {
				errorHandler(new Error(msgJSON['statusDescription']));
				stop();
				return;
			}

			// offer sdp 가 오면 sessioniId 값이 담겨있을꺼다. 저장해두자.
			let streamInfoResponse = msgJSON['streamInfo'];
			if (streamInfoResponse !== undefined) {
				streamInfo.sessionId = streamInfoResponse.sessionId;
			}

			// offer 의 sdp 가 왔으니 처리하자.
			let sdpData = msgJSON['sdp'];
			if (sdpData !== undefined) {
				console.log('original sdp: ', msgJSON.sdp.sdp);

				// We mundge the SDP here, before creating an Answer
				// If you can get the new MediaAPI to work this might
				// not be needed.
				msgJSON.sdp.sdp = enhanceSDP(msgJSON.sdp.sdp);

				// Android/IOS 에서 rtmp 로 송출할때 1 채널로 방송이 들어오는데 그때 sdp 중에
				// a=rtpmap:96 OPUS/48000/1  로 들어오는데 그걸 그대로 처리하면 에러나드라.
				// 그래서 2 채널로 들어온걸로 바꿔버린다.
				msgJSON.sdp.sdp = msgJSON.sdp.sdp.replace('OPUS/48000/1','OPUS/48000/2');

				console.log('enhanced sdp: ', msgJSON.sdp.sdp);

				peerConnection.setRemoteDescription(new RTCSessionDescription(msgJSON.sdp), function() {
					peerConnection.createAnswer(gotDescription, errorHandler);
				}, errorHandler);
			}

			// icecandidate 가 왔으면 처리한다.
			let iceCandidates = msgJSON['iceCandidates'];
			if (iceCandidates !== undefined) {
				for(let index in iceCandidates) {
					console.log('iceCandidates: ', iceCandidates[index]);
					let ice = new RTCIceCandidate(iceCandidates[index]);
					peerConnection.addIceCandidate(ice);
				}
			}

			// 응답이 제대로 왔으면 웹소켓 할일 다했다. 닫아블자.
			if ('sendResponse'.localeCompare(msgCommand) == 0) {
				if (wsConnection != null) wsConnection.close();
				wsConnection = null;
			}
		}

		// 웹소켓 닫혔다.
		wsConnection.onclose = function() {
			console.log("wsConnection.onclose");
		}

		// 웹소켓 에러났다.
		wsConnection.onerror = function(evt) {
			errorHandler(new Error(JSON.stringify(evt)));
			stop();
		}
	}

	function connectionStateChange(event) {
		if (event.type == 'connectionstatechange') {
			fire('pcStateChange', peerConnection.connectionState);
		}
	}

	// 로컬sdp 세팅하고 wowza 한테 내꺼 보내자.
	function gotDescription(description) {
		// stereo 로 청취하기위해서 아래 라인이 필요하다.
		description.sdp = description.sdp.replace('useinbandfec=1', 'useinbandfec=1; stereo=1; maxaveragebitrate=510000');

		// set local sdp and send message.
		peerConnection.setLocalDescription(description)
			.then(() => {
				let message = {
					direction: 'play',
					command: 'sendResponse',
					streamInfo: streamInfo,
					sdp: description
				};
				console.log('sendResponse: ', message);
				wsConnection.send(JSON.stringify(message));
			})
			.then(error => errorHandler(error));
	}

	// sdp 가공.
	function enhanceSDP(sdpStr, enhanceData) {
		let sdpLines = sdpStr.split(/\r\n/);
		let sdpSection = 'header';
		let hitMID = false;
		let sdpStrRet = '';

		for(let sdpIndex in sdpLines) {
			let sdpLine = sdpLines[sdpIndex];

			if ( sdpLine.length == 0 )
				continue;

			if ( sdpLine.includes("profile-level-id") )
			{
				console.log("found profile-id");
				// This profile seems to be correct for the stream publishing,
				// however will not allow Safari to play it back, so we swap
				// it for a baseline constrained one, which is declared when
				// Safari publishes in the SDP.
				if ( sdpLine.includes("640029") )
				{
					sdpLine = sdpLine.replace("640029","42E01F");
				}
			}

			sdpStrRet +=sdpLine;
			sdpStrRet += '\r\n';
		}

		return sdpStrRet;
	};

	// 리모트 스트림이 들어왔다.
	function gotRemoteStream(event) {
		console.log('gotRemoteStream: ', event.stream);
		remoteStream = event.stream;
	}

	// play 멈추자.
	function stop() {
		if (peerConnection != null) peerConnection.close();
		peerConnection = null;

		if (wsConnection != null) wsConnection.close();
		wsConnection = null;

		// reset retry count.
		repeaterRetryCount = 0;

		console.log("stop play...");
	}

	function getStream() {
		return remoteStream;
	}

	// 리턴 object
	return {
		on,					// 'error','pcStateChange' 이벤트 제공.
		start,				// 방송 시작.
		stop,				// 방송 중지.
		getStream,			// remote 스트림 return
	};
};


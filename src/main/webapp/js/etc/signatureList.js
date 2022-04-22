const signatureDataDefaultValue = {
  active: false,      // 현재 탭이 시그니쳐 탭 여부
  itemList: [],       // 특정 회원 아이템 리스트 저장용

  item_paging: null,  // 전체 아이템 리스트 테이블 페이징
  mem_paging: null,    // 특정 회원의 아이템리스트 테이블 페이징

  sgnt_mem_no: 0,        // 수정시 시그니처 아이템 주인의 memNo (api param)
  table_section_id: '#main-header #page-wrapper #headerTab #itemList #signatureGiftList',

  item_pageNo: 1,
  mem_pageNo: 1,
  item_pagination: [],
  mem_pagination: [],
  fetch_itemListFn: function () {
    const pageNo = signatureData.item_pageNo;
    const pagePerCnt = 50;
    // 회원 테이블 정보 초기화
    signatureData.memberTableClearFn();

    util.getAjaxData('', '/rest/content/item/signatureGift/list', {pageNo},
      (id, res, param) => {
        const {result, data, summary, pagingVo} = res;

        if (result === 'success') {
          //data set
          signatureData.item_paging = pagingVo;
          
          //render
          const target = document.body.querySelector(signatureData.table_section_id);
          const summaryEl = target.querySelector("#summary_data");
          const table = target.querySelector("#table_sgnt_all_list");
          const paginate = target.querySelector('#list_info_giftList_paginate1');

          // --- 페이징 그리기 ----
          // 페이지네이션 클릭이벤트
          paginate.innerHTML = pagingRender(pageNo, signatureData.item_paging, pagePerCnt);

          const pagingClickEvent = (e) => {
            const pageNo = parseInt(e.currentTarget.dataset.page);
            signatureData.item_pageNo = pageNo;
            signatureData.fetch_itemListFn();
          };
          paginate.querySelectorAll("ul li").forEach((el) => {
            if(el?.dataset?.page) {
              el.addEventListener('click', pagingClickEvent);
            }
          })
          // ----------------------

          if (!target.classList.contains('active')) {
            target.classList.add('active');
          }
          if (!target.classList.contains('in')) {
            target.classList.add('in');
          }

          const thead = '<th>No</th><th>회원번호</th><th>닉네임</th><th>스타DJ 횟수</th><th>저가 아이템<br/>(1개~49개)</th><th>중가 아이템<br/>(50개~99개)</th><th>고가 아이템<br/>(100개~3000개)</th>';
          let tbody = '';

          data.map((v, idx) => {
            const {high_price_item, low_price_item, mem_nick, mem_no, middle_price_item, specialdj_cnt, ins_date, upd_date} = v;

            tbody += `<tr data-mem_no=${mem_no} onclick="sgnt_RowClickEvent(this)" style="cursor:pointer;">
            <td>${pagingVo.totalCnt - (pagePerCnt* (pageNo-1) + (idx))}</td>
            <td>${mem_no}</td>
            <td>${mem_nick}</td>
            <td>${specialdj_cnt}회</td>
            <td>${low_price_item}개</td>
            <td>${middle_price_item}개</td>
            <td>${high_price_item}개</td>
          </tr>`;
          });

          // 상단 총선물현황 
          summaryEl.innerText = `${summary?.totalGiftCnt}건`;

          // 상단 테이블 그리기
          table.innerHTML =
            `
            <thead>${thead}</thead>
            <tbody>${tbody}</tbody>
          `;
        }
      });
  },
  fetch_memberItemListFn: function () {
    const pageNo = signatureData.mem_pageNo;
    const pagePerCnt = 10;
    util.getAjaxData('',
      '/rest/content/item/member/signatureGift/list',
      {memNo: signatureData.sgnt_mem_no, pageNo, pagePerCnt},
      (id, res, param) => {
        const {result, data, summary, pagingVo} = res;

        if (result === 'success') {
          //data set
          signatureData.itemList = data;
          signatureData.mem_paging = pagingVo;

          //render
          const target = document.body.querySelector(signatureData.table_section_id);
          const table = target.querySelector("#table_sgnt_mem_list");
          const paginate = target.querySelector('#list_info_giftList_paginate2');

          // --- 페이징 그리기 ----
          // 페이지네이션 클릭이벤트
          const pagingClickEvent = (e) => {
            const pageNo = parseInt(e.currentTarget.dataset.page);
            signatureData.mem_pageNo = pageNo;
            signatureData.fetch_memberItemListFn();
          };
          paginate.innerHTML = pagingRender(pageNo, signatureData.mem_paging, pagePerCnt);

          paginate.querySelectorAll("ul li").forEach((el) => {
            if(el?.dataset?.page) {
              el.addEventListener('click', pagingClickEvent);
            }
          })
          // ----------------------

          const thead = `
          <th></th>
          <th>No.</th>
          <th>사용영역</th>
          <th>파일등록 필드</th>
          <th>플레이타임</th>
          <th>코드</th>
          <th>이미지</th>
          <th>아이템명</th>
          <th>타입</th>
          <th>수량</th>
          <th>가격</th>
          <th>IOS 가격</th>
          <th>설명</th>
          <th>사운드여부</th>
          <th>TTS 여부</th>
          <th>게시상태</th>
          <th>등록/수정일</th>
          <th>선물현황</th>
          <th>등록자</th>`;
          let tbody = '';

          const typeColumnData = (data) => {
            let result = "";
            let arrCode = data.split("");
            if (arrCode.length < 3) return data;

            if (arrCode[0] == "1") result += "/ 신규 "
            if (arrCode[1] == "1") result += "/ 인기 "
            if (arrCode[2] == "1") result += "/ 한정 "
            if (!common.isEmpty(result)) result = result.substring(1);

            return result;
          };
          data.map((v, idx) => {
            const {
              use_area, file_slct, play_time, item_code, item_thumbnail, item_name, item_type, byeol,
              item_price, item_price_ios, desc, sound_yn, tts_use_yn, view_yn, lastupdDate, regDateFormat, purchase_count, op_name, webp_image
            } = v;
            //onclick="sgnt_formActiveEvent(this)"
            tbody += `<tr data-idx=${idx} style="cursor:pointer;">
            <td><input type="checkbox" style="height:50px;"/></td>
            <td>${pagingVo.totalCnt - (pagePerCnt* (pageNo-1) + (idx))}</td>
            <td>${util.getCommonCodeLabel(use_area, item_useArea)}</td>
            <td>${file_slct}</td>
            <td>${play_time}초</td>
            <td>${item_code}</td>
            <td><img src=${item_thumbnail} width="50px" height="50px" class="_webpImage" data-webpImage=${webp_image}></td>
            <td>${item_name}</td>
            <td>${typeColumnData(item_type)}</td>
            <td>${byeol}</td>
            <td>${item_price}</td>
            <td>${item_price_ios}</td>
            <td>${desc}</td>
            <td>${sound_yn === 1 ? 'Y' : 'N'}</td>
            <td>${tts_use_yn?.toUpperCase()}</td>
            <td>${view_yn === 1 ? 'Y' : 'N'}</td>
            <td>${regDateFormat}</td>
            <td>${purchase_count}</td>
            <td>${op_name}</td>
          </tr>`;
          });

          // 상단 테이블 그리기
          table.innerHTML = `
            <thead>${thead}</thead>
            <tbody>${tbody}</tbody>
          `;
          table.addEventListener('click', sgnt_formActiveEvent);
        } else {  //fail
          signatureData.memberTableClearFn();
        }
      });
  },
  memberTableClearFn: function(){
    //data set
    signatureData.itemList = [];
    signatureData.mem_paging = null;
    //render
    const target = document.body.querySelector(signatureData.table_section_id);
    const table = target.querySelector("#table_sgnt_mem_list");
    table.innerHTML =
      `
        <thead></thead>
        <tbody></tbody>
      `;
  }
}

const signatureData = {...signatureDataDefaultValue};

function onClickSignatureTab() {
  signatureData.active = true;
  $("#searchForm").hide(); // 검색 폼
  $("#chargeListContent").hide(); // 충전 하단 폼
  $("#exchangeListContent").hide(); // 교환 아이템 하단 폼
  $("#giftListContent").hide(); // 선물아이템 상세 하단 폼

  document.body.querySelectorAll("#main-header #page-wrapper #headerTab #itemList .active")?.forEach((item) => {
    item.classList.remove('active', 'in');
  });

  // page init (상단 테이블 불러오기)
  signatureData.fetch_itemListFn();

}
// 상단 테이블 클릭
function sgnt_RowClickEvent(e) {
  /* 하단 입력 폼 hide */
  initSelectDataInfo();// 폼 데이터 초기화
  $("#giftListContent").hide();
  signatureData.item_pageNo = 1;
  signatureData.mem_pageNo = 1;

  signatureData.sgnt_mem_no = e.dataset.mem_no;
  signatureData.fetch_memberItemListFn();
};

// 선물아이템 상세 입력/수정 폼 활성하기
function sgnt_formActiveEvent(e) {

  let findInput = false;
  if(e.target.nodeName ==='INPUT') {
    return;
  }

  // 하단 입력 폼 hide ->  show
  // Table에서 TR요소 찾기
  const trElement = e?.path.find((v) => v?.nodeName === 'TR');
  if (trElement?.dataset?.idx) {
    $("#giftListContent").show();
    const rowData = signatureData.itemList[trElement.dataset.idx];

    // 수정 폼 데이터 세팅하기 (아이템 상세 조회용 param값 item_code만 사용하고, 폼에 뿌려지는 데이터는 API 응답으로 세팅)
    fnc_giftList.updateData(rowData);
  }
};

// 등록 버튼 이벤트
function sgnt_insertBtnEvent() {
  /* 하단 입력 폼 hide ->  show */
  $("#giftListContent").show();
  /* 등록 */
  initSelectDataInfo();// 폼 데이터 초기화
  $("#tab_giftDetail").click();
};

// 체크박스 초기화
function sgnt_checkBoxDefault() {
  // 하단 테이블
  const target = document.body.querySelector(signatureData.table_section_id);
  const table = target.querySelector("#table_sgnt_mem_list");
  // checkbox list
  const list = table.querySelectorAll("input[type=checkbox]");
  list.forEach((e) => {
    e.checked = false;
  });

};

// 삭제 버튼 이벤트
function sgnt_deleteBtnEvent() {
  const target = document.body.querySelector(signatureData.table_section_id);
  const table = target.querySelector("#table_sgnt_mem_list");

  // checkbox list
  const list = table.querySelectorAll("input[type=checkbox]");
  let itemCodeArr = [];

  list.forEach((e, idx) => {
    if (e.checked) {
      itemCodeArr.push(signatureData.itemList[idx]?.item_code || '');
    }
  });

  const delParam = itemCodeArr.join();  // 'G12345, G12345'
  if (delParam.length === 0) {
    alert("삭제할 정보를 선택해주세요.");
    return;
  }

  if (confirm("선택하신 " + itemCodeArr.length + "건의 정보를 삭제 하시겠습니까?")) {
    util.getAjaxData('', "/rest/content/item/gift/delete", {item_code: delParam},
      (dst_id, data, dst_params) => {
        alert(data.message);

        /* 하단 입력 폼 hide */
        initSelectDataInfo();// 폼 데이터 초기화
        $("#giftListContent").hide();
        $('html').animate({scrollTop: 0}, 100);

        signatureData.fetch_itemListFn();
        signatureData.fetch_memberItemListFn();
      },
      (data, textStatus, jqXHR) => {
        alert(data.message);
        console.log('시그니처 아이템 삭제 실패', data, textStatus, jqXHR);
      });
  }

};

// 아이템 순서 변경 팝업
function sgnt_itemOrder() {
  util.windowOpen(`/content/item/popup/signatureItemOrder/${signatureData.sgnt_mem_no}`, "500", "700", "아이템 노출 순서 변경");
};

// 페이지네이션 그리기
function pagingRender(pageNo, {totalCnt}, pagePerCnt){
  const pageCnt = Math.ceil(totalCnt / pagePerCnt);
  let uiFlag = '';
  let btnCnt;
  let btnList = ``;
  let dotBool = true;

  let r = [];
  let gNum = 5;
  for(let i=0; i<pageCnt; i++){
    // const prev = (Math.floor(i / gNum) * gNum) - 1;
    // const next = Math.ceil((i + 1) / gNum) * gNum;
    r.push({num: i+1  });
  }

  let prevBtn = false;
  let nextBtn = '';
  r.map((data, idx) => {
    if( Math.floor((pageNo - 1) / gNum ) * gNum -1 < idx && idx < Math.ceil(pageNo / gNum) * gNum) { // < 5, < 10
      // 처음 버튼
      // 이전 버튼
      if(!prevBtn){
        const className = pageNo === 1 ? 'disabled': '';
        prevBtn = true;
        btnList +=`
            <li class="paginate_button first ${className}" aria-controls="list_info_giftList" tabindex="0" id="list_info_giftList_first" data-page='1'><a href="#">처음</a></li>
            <li class="paginate_button previous ${className}" aria-controls="list_info_giftList" tabindex="0" id="list_info_giftList_previous" data-page='${pageNo-1}'><a href="#">이전</a></li>
            `;
      }

      btnList += `
      <li class= '${"paginate_button" + (pageNo === (data.num) ? " active" : "")}' aria-controls="list_info_giftList" tabindex="0" data-page='${data.num}'>
        <a href="#">${data.num}</a>
      </li>
      `;
      
      // 다음 버튼
      // 마지막 버튼
      if(!nextBtn){//data.next < pageCnt - 1 &&
        const className =  pageNo < pageCnt ? '' : 'disabled';
        nextBtn = `
            <li class="paginate_button next ${className}" aria-controls="list_info_giftList" tabindex="0" id="list_info_giftList_next" data-page='${pageNo+1}'><a href="#">다음</a></li>
            <li class="paginate_button last ${className}" aria-controls="list_info_giftList" tabindex="0" id="list_info_giftList_last" data-page='${pageCnt}'><a href="#">마지막</a></li>
            `;
      }
    }
  });
  // 다음, 마지막 버튼 추가
  btnList += nextBtn;

  return (`<ul class="pagination borderless">${btnList}</ul>`);
}

//      ... <li class="paginate_button disabled" aria-controls="list_info_giftList" tabindex="0" id="list_info_giftList_ellipsis"><a href="#">…</a></li>
package com.dalbit.payment.module.cnnew_v0003;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class McashManager {
    private AckParam ap;
    private String ServerIp = "";
    private String SwitchIP = "";
    private int serverPort = 0;
    private int recvTimeOut = 0;
    private String ServerEncode = "EUC-KR";
    private String UserEncode = "EUC-KR";
    private String configPath = "";
    private boolean isManualConfig = false;
    private boolean isEng = false;
    private String logDir;
    private String KeySeq;
    private String Key;
    private String logLevel;
    private String Ver = "DJ01";

    public void setConfigFileDir(String dirPath) {
        this.configPath = dirPath;
    }

    public void setVer(String ver) {
        this.Ver = ver;
    }

    public void setServerInfo(String serverIp, String switchIp, int serverPort, int recvTimeOut, String logDir, String KeySeq, String Key, String UserEncode, String logLevel) {
        this.ServerIp = serverIp;
        this.SwitchIP = switchIp;
        this.serverPort = serverPort;
        this.recvTimeOut = recvTimeOut;
        this.logDir = logDir;
        this.KeySeq = KeySeq;
        this.Key = Key;
        this.UserEncode = UserEncode;
        this.logLevel = logLevel;
        this.isManualConfig = true;
    }

    public McashManager() {
    }

    public McashManager(boolean isEng) {
        this.isEng = isEng;
    }

    public AckParam McashApprv(String mode, String recordKey, String svcId, String mobilId, String tradeId, String prdtPrice, String billKey, String partCancelYn) throws IOException {
        this.ap = new AckParam(mode, recordKey, svcId, mobilId, tradeId, prdtPrice, billKey, partCancelYn);
        this.ap = this.McashApprv(this.ap);
        return this.ap;
    }

    public AckParam McashApprv(String mode, String recordKey, String svcId, String mobilId, String tradeId, String prdtPrice, String billKey, String partCancelYn, String prdtNm, String authType, String currency, String taxDiv, String taxPrice, String taxFreePrice, String nointFlag, String cardNo, String exprDt, String interest, String cardPw, String socialNo, String pointDiv, String userId, String userNm, String userEmail, String userIp, String autobillDate, String autobillEndDate) throws IOException {
        this.ap = new AckParam(mode, recordKey, svcId, mobilId, tradeId, prdtPrice, billKey, partCancelYn, prdtNm, authType, currency, taxDiv, taxPrice, taxFreePrice, nointFlag, cardNo, exprDt, interest, cardPw, socialNo, pointDiv, userId, userNm, userEmail, userIp, autobillDate, autobillEndDate);
        this.ap = this.McashApprv(this.ap);
        return this.ap;
    }

    public AckParam McashApprv(AckParam ap) throws IOException {
        FileMaker fm = null;
        if (!this.isManualConfig) {
            fm = new FileMaker(this.configPath, "");
            if (!fm.getResultcd().equals("0000")) {
                ap.setResultCd(fm.getResultcd());
                ap.setResultMsg(fm.getResultmsg());
                fm.writeln("Error : ErrCode[" + fm.getResultcd() + "]" + "ErrMsg[" + fm.getResultmsg() + "]");
                fm.close();
                return ap;
            }

            fm.writeln("iNFO : JSP - VER[" + fm.getVer() + "] SEND DATA ============>");
            this.ServerIp = fm.getServerIp();
            this.serverPort = fm.getServerPort();
            this.SwitchIP = fm.getswitchIp();
            this.recvTimeOut = fm.getRecvTimeOut();
            this.UserEncode = fm.getUserEncode();
            fm.writeln("iNFO : UserEncode \t[ " + this.UserEncode + " ]");
        } else {
            fm = new FileMaker(this.Ver, this.ServerIp, this.SwitchIP, this.serverPort, this.recvTimeOut, this.logDir, this.KeySeq, this.Key, this.UserEncode, this.logLevel);
            if (!fm.getResultcd().equals("0000")) {
                ap.setResultCd(fm.getResultcd());
                ap.setResultMsg(fm.getResultmsg());
                fm.writeln("Error : ErrCode[" + fm.getResultcd() + "]" + "ErrMsg[" + fm.getResultmsg() + "]");
                fm.close();
                return ap;
            }
        }

        PacketInspect pi = new PacketInspect(this.configPath, this.logDir);
        ap = pi.checkRequest(ap, this.isEng);
        if (!ap.getResultCd().equals("0000")) {
            fm.close();
            return ap;
        } else {
            pi.writeClientLog(ap);
            ap.setVer(fm.getVer());
            ap.setKeySeq(fm.getKeySeq());
            String svcidKey = ap.getSvcId().length() < 8 ? ap.getSvcId() : ap.getSvcId().substring(0, 8);
            ap.setCipherKey(svcidKey + svcidKey);
            if (svcidKey.length() < 8) {
                ap.setCipherKey(this.paddingC(svcidKey, 8) + this.paddingC(svcidKey, 8));
            }

            ConnectSocket cs = new ConnectSocket(this.configPath);
            cs.Connect(this.ServerIp, this.SwitchIP, this.serverPort, this.recvTimeOut, this.logDir);
            if (!cs.getResultcd().equals("0000")) {
                ap.setResultCd(cs.getResultcd());
                if (this.isEng) {
                    ap.setResultMsg("[9902] CONNECT ERROR");
                } else {
                    ap.setResultMsg("[9902]?????? ???????????????.");
                }

                fm.writeln("Error : ErrCode[" + cs.getResultcd() + "] ?????? [" + this.ServerIp + "] DR[" + this.SwitchIP + "] ????????????");
                fm.close();
                cs.close();
                return ap;
            } else {
                try {
                    cs.setSocket(ap.getSocketStr(this.UserEncode), this.ServerEncode, this.logDir);
                } catch (Exception var7) {
                    ap.setResultCd("9903");
                    if (this.isEng) {
                        ap.setResultMsg("[9903] CONNECT ERROR");
                    } else {
                        ap.setResultMsg("[9903]?????? ???????????????.");
                    }

                    fm.writeln("Error : ErrCode[" + ap.getResultCd() + "] PACKET SEND EXCEPTION - " + var7.toString());
                    fm.close();
                    cs.close();
                    return ap;
                }

                if (!cs.getResultcd().equals("0000")) {
                    ap.setResultCd(cs.getResultcd());
                    if (this.isEng) {
                        ap.setResultMsg("[9903] CONNECT ERROR");
                    } else {
                        ap.setResultMsg("[9903]?????? ???????????????.");
                    }

                    fm.writeln("Error : ErrCode[" + cs.getResultcd() + "] PACKET SEND TCP/IP SOCKET ?????? ??????");
                    fm.close();
                    cs.close();
                    return ap;
                } else {
                    try {
                        cs.getSocket(this.ServerEncode, this.logDir);
                    } catch (Exception var8) {
                        var8.printStackTrace();
                        if (this.isEng) {
                            ap.setResultMsg("[9904] CONNECT ERROR");
                        } else {
                            ap.setResultMsg("[9904]?????? ???????????????.");
                        }

                        fm.writeln("Error : ErrCode[" + ap.getResultCd() + "] PACKET RECV EXCEPTION - " + var8.toString());
                        fm.close();
                        cs.close();
                        return ap;
                    }

                    if (!cs.getResultcd().equals("0000")) {
                        ap.setResultCd(cs.getResultcd());
                        if (this.isEng) {
                            ap.setResultMsg("[9904] CONNECT ERROR");
                        } else {
                            ap.setResultMsg("[9904]?????? ???????????????.");
                        }

                        fm.writeln("Error : 1 Result Length = " + cs.getResult().getBytes().length);
                        fm.writeln("Error : 1 Result [" + cs.getResult() + "]");
                        if ("9906".equals(cs.getResultcd())) {
                            fm.writeln("Error : ErrCode[" + cs.getResultcd() + "] PACKET RECV TIMEOUT");
                            ap.setResultMsg("[9906]PACKET RECV TIMEOUT");
                        } else {
                            fm.writeln("Error : ErrCode[" + cs.getResultcd() + "] PACKET RECV ?????? ??????");
                        }

                        fm.close();
                        cs.close();
                        return ap;
                    } else {
                        if (cs.getResultcd().length() == 6) {
                            ap.setSocketStr(cs.getResult(), this.ServerEncode);
                            cs.close();
                        } else {
                            ap.setSocketStr(cs.getResult(), this.ServerEncode);
                            cs.close();
                        }

                        fm.close();
                        pi.writeServerLog(ap);
                        return ap;
                    }
                }
            }
        }
    }

    public String paddingC(String temp, int size) throws UnsupportedEncodingException {
        String t = strKorByteCut(temp, size, "euc-kr");
        return this.rpad(t, size, ' ');
    }

    public static String strKorByteCut(String str, int length, String enc) {
        if (str == null) {
            return str;
        } else {
            StringBuilder strBuf = new StringBuilder();

            try {
                byte[] byteKor = str.getBytes(enc);
                if (byteKor.length <= length) {
                    return str;
                } else {
                    int byteSize = enc.equalsIgnoreCase("euc-kr") ? 2 : 3;
                    byte[] hangle = new byte[byteSize];

                    for(int i = 0; i < length; ++i) {
                        if ((byteKor[i] & 128) == 128) {
                            hangle[0] = byteKor[i];
                            ++i;
                            hangle[1] = byteKor[i];
                            if (byteSize == 3) {
                                ++i;
                                hangle[2] = byteKor[i];
                            }

                            if (i < length) {
                                strBuf.append(new String(hangle, enc));
                            }
                        } else {
                            strBuf.append((char)byteKor[i]);
                        }
                    }

                    return strBuf.toString();
                }
            } catch (Exception var8) {
                var8.printStackTrace();
                return str;
            }
        }
    }

    public String rpad(String strSource, int iLength, char cPadder) throws UnsupportedEncodingException {
        StringBuilder sbBuffer = null;
        int iByteSize;
        if (!this.isEmpty(strSource)) {
            iByteSize = this.getByteSize(strSource);
            if (iByteSize > iLength) {
                return new String(strSource.getBytes("euc-kr"), 0, iLength);
            } else if (iByteSize == iLength) {
                return strSource;
            } else {
                int iPadLength = iLength - iByteSize;
                sbBuffer = new StringBuilder(strSource);

                for(int j = 0; j < iPadLength; ++j) {
                    sbBuffer.append(cPadder);
                }

                return sbBuffer.toString();
            }
        } else {
            sbBuffer = new StringBuilder();

            for(iByteSize = 0; iByteSize < iLength; ++iByteSize) {
                sbBuffer.append(cPadder);
            }

            return sbBuffer.toString();
        }
    }

    public boolean isEmpty(String strSource) {
        return strSource == null || "".equals(strSource);
    }

    public int getByteSize(String str) {
        if (str != null && str.length() != 0) {
            byte[] byteArray = null;

            try {
                byteArray = str.getBytes("euc-kr");
            } catch (UnsupportedEncodingException var4) {
            }

            return byteArray == null ? 0 : byteArray.length;
        } else {
            return 0;
        }
    }
}

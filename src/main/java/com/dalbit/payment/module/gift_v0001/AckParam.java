package com.dalbit.payment.module.gift_v0001;

import lombok.extern.slf4j.Slf4j;

import java.io.UnsupportedEncodingException;

@Slf4j
public class AckParam {
    private String Ver;
    private String CryptGB = "1";
    private String KeySeq;
    private String Mode = "";
    private String Recordkey = "";
    private String Mrchid = "";
    private String Svcid = "";
    private String Tradeid = "";
    private String Prdtcd = "";
    private String Prdtnm = "";
    private String Prdtprice = "";
    private String Userid = "";
    private String Username = "";
    private String Userphoneno = "";
    private String Usersocialno = "";
    private String Useremail = "";
    private String Userhost = "";
    private String Emailflag = "";
    private String Item = "";
    private String Mobilid = "";
    private String User = "";
    private String Pass = "";
    private String bnlUserNm;
    private String Authtype = "";
    private String Authno = "";
    private String Reqcards = "0";
    private String Pinno1;
    private String Pinno2;
    private String Pinno3;
    private String Pinno4;
    private String Pinno5;
    private String Pinno6;
    private String Paytype;
    private String Pinpw1;
    private String Pinpw2;
    private String Pinpw3;
    private String Pinpw4;
    private String Pinpw5;
    private String Pinpw6;
    private String Bnlid;
    private String Bnlpass;
    private String Cardprice1;
    private String Cardprice2;
    private String Cardprice3;
    private String Cardprice4;
    private String Cardprice5;
    private String Subreq1;
    private String Subreq2;
    private String Subreq3;
    private String Subreq4;
    private String Subreq5;
    private String Useyn1;
    private String Useyn2;
    private String Useyn3;
    private String Useyn4;
    private String Useyn5;
    private String Cpcharno;
    private String Actdate;
    private String Resultcd;
    private String Resultmsg;
    private String Entpnm;
    private String Chargeamt;
    private String Cashamt;
    private String Remainamt;
    private String Paycards;
    private String Cardseq1;
    private String Cardseq2;
    private String Cardseq3;
    private String Cardseq4;
    private String Cardseq5;
    private String Scratchcnt;
    private String ScratchNo1;
    private String ScratchResCd1;
    private String ScratchResMsg1;
    private String ScratchPrice1;
    private String ScratchNo2;
    private String ScratchResCd2;
    private String ScratchResMsg2;
    private String ScratchPrice2;
    private String ScratchNo3;
    private String ScratchResCd3;
    private String ScratchResMsg3;
    private String ScratchPrice3;
    private String ScratchNo4;
    private String ScratchResCd4;
    private String ScratchResMsg4;
    private String ScratchPrice4;
    private String ScratchNo5;
    private String ScratchResCd5;
    private String ScratchResMsg5;
    private String ScratchPrice5;
    private String ScratchNoPw1;
    private String ScratchNoPw2;
    private String ScratchNoPw3;
    private String ScratchNoPw4;
    private String ScratchNoPw5;
    private String ScratchRemain1;
    private String ScratchRemain2;
    private String ScratchRemain3;
    private String ScratchRemain4;
    private String ScratchRemain5;
    private String Filler;
    private String SocketStr;
    private int SocketStrLength;
    private String CipherKey;
    McashSeed seed = new McashSeed();

    public AckParam() {
        this.Reqcards = "0";
        this.Pinno1 = "";
        this.Pinno2 = "";
        this.Pinno3 = "";
        this.Pinno4 = "";
        this.Pinno5 = "";
        this.Pinno6 = "";
        this.bnlUserNm = "";
        this.Paytype = "";
        this.Pinpw1 = "";
        this.Pinpw2 = "";
        this.Pinpw3 = "";
        this.Pinpw4 = "";
        this.Pinpw5 = "";
        this.Pinpw6 = "";
        this.Bnlid = "";
        this.Bnlpass = "";
        this.Cardprice1 = "";
        this.Cardprice2 = "";
        this.Cardprice3 = "";
        this.Cardprice4 = "";
        this.Cardprice5 = "";
        this.Subreq1 = "";
        this.Subreq2 = "";
        this.Subreq3 = "";
        this.Subreq4 = "";
        this.Subreq5 = "";
        this.Useyn1 = "";
        this.Useyn2 = "";
        this.Useyn3 = "";
        this.Useyn4 = "";
        this.Useyn5 = "";
        this.Cpcharno = "";
        this.Actdate = "";
        this.Resultcd = "";
        this.Resultmsg = "";
        this.Entpnm = "";
        this.Chargeamt = "";
        this.Cashamt = "";
        this.Remainamt = "";
        this.Paycards = "0";
        this.Cardseq1 = "";
        this.Cardseq2 = "";
        this.Cardseq3 = "";
        this.Cardseq4 = "";
        this.Cardseq5 = "";
        this.Scratchcnt = "";
        this.ScratchNo1 = "";
        this.ScratchResCd1 = "";
        this.ScratchResMsg1 = "";
        this.ScratchPrice1 = "";
        this.ScratchNo2 = "";
        this.ScratchResCd2 = "";
        this.ScratchResMsg2 = "";
        this.ScratchPrice2 = "";
        this.ScratchNo3 = "";
        this.ScratchResCd3 = "";
        this.ScratchResMsg3 = "";
        this.ScratchPrice3 = "";
        this.ScratchNo4 = "";
        this.ScratchResCd4 = "";
        this.ScratchResMsg4 = "";
        this.ScratchPrice4 = "";
        this.ScratchNo5 = "";
        this.ScratchResCd5 = "";
        this.ScratchResMsg5 = "";
        this.ScratchPrice5 = "";
        this.ScratchNoPw1 = "";
        this.ScratchNoPw2 = "";
        this.ScratchNoPw3 = "";
        this.ScratchNoPw4 = "";
        this.ScratchNoPw5 = "";
        this.ScratchRemain1 = "";
        this.ScratchRemain2 = "";
        this.ScratchRemain3 = "";
        this.ScratchRemain4 = "";
        this.ScratchRemain5 = "";
        this.Filler = "";
        this.SocketStr = "";
        this.SocketStrLength = 0;
    }

    public String getSocketStr(String userEncode, String cashGb) {
        String szPrdtprice = "";
        String szUserSocno = "";
        String szUser = "";
        String szPass = "";
        String szPinno1 = "";
        String szPinno2 = "";
        String szPinno3 = "";
        String szPinno4 = "";
        String szPinno5 = "";
        String szPinpw1 = "";
        String szPinpw2 = "";
        String szPinpw3 = "";
        String szPinpw4 = "";
        String szPinpw5 = "";
        szPrdtprice = McashSeed.encodeString(this.Prdtprice, this.CipherKey.getBytes());
        if ("HM".equals(cashGb)) {
            szUser = McashSeed.encodeString(this.User, this.CipherKey.getBytes());
        } else if (!"FC".equals(cashGb) && ("20".equals(this.Mode) || "30".equals(this.Mode))) {
            szUserSocno = McashSeed.encodeString(this.Usersocialno, this.CipherKey.getBytes());
        }

        if ("GM".equals(cashGb) || "GC".equals(cashGb) || "HM".equals(cashGb)) {
            szPass = McashSeed.encodeString(this.Pass, this.CipherKey.getBytes());
        }

        szPinno1 = McashSeed.encodeString(this.Pinno1, this.CipherKey.getBytes());
        szPinno2 = McashSeed.encodeString(this.Pinno2, this.CipherKey.getBytes());
        szPinno3 = McashSeed.encodeString(this.Pinno3, this.CipherKey.getBytes());
        szPinno4 = McashSeed.encodeString(this.Pinno4, this.CipherKey.getBytes());
        szPinno5 = McashSeed.encodeString(this.Pinno5, this.CipherKey.getBytes());
        if ("HM".equals(cashGb) || "GC".equals(cashGb)) {
            szPinpw1 = McashSeed.encodeString(this.Pinpw1, this.CipherKey.getBytes());
            szPinpw2 = McashSeed.encodeString(this.Pinpw2, this.CipherKey.getBytes());
            szPinpw3 = McashSeed.encodeString(this.Pinpw3, this.CipherKey.getBytes());
            szPinpw4 = McashSeed.encodeString(this.Pinpw4, this.CipherKey.getBytes());
            szPinpw5 = McashSeed.encodeString(this.Pinpw5, this.CipherKey.getBytes());
        }

        StringBuffer strBuffer = new StringBuffer();
        strBuffer.append(CommonUtil.makePacketStr(this.Ver, 4));
        strBuffer.append(CommonUtil.makePacketStr(this.CryptGB, 1));
        strBuffer.append(CommonUtil.makePacketStr(this.KeySeq, 1));
        if (!"GG".equals(cashGb) && !"GC".equals(cashGb)) {
            strBuffer.append(CommonUtil.makePacketStr(this.Mode, 2));
        } else {
            strBuffer.append(CommonUtil.makePacketStr(this.Mode, 3));
        }

        strBuffer.append(CommonUtil.makePacketStr(this.Recordkey, 20));
        strBuffer.append(CommonUtil.makePacketStr(this.Svcid, 12));
        strBuffer.append(CommonUtil.makePacketStr(this.Tradeid, 40));
        if (!"FC".equals(cashGb)) {
            strBuffer.append(CommonUtil.makePacketStr(this.Prdtcd, 30));
        }

        if (!"FC".equals(cashGb) || !"20".equals(this.Mode) && !"30".equals(this.Mode)) {
            strBuffer.append(CommonUtil.makePacketStr(this.Prdtnm, 30));
            strBuffer.append(CommonUtil.makePacketStr(szPrdtprice, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Userid, 20));
        } else if ("20".equals(this.Mode)) {
            strBuffer.append(CommonUtil.makePacketStr(szPrdtprice, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Mobilid, 13));
            strBuffer.append(CommonUtil.makePacketStr(this.Reqcards, 1));
            strBuffer.append(CommonUtil.makePacketStr(this.Subreq1, 1));
            strBuffer.append(CommonUtil.makePacketStr(this.Pinno1, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Cardprice1, 8));
            strBuffer.append(CommonUtil.makePacketStr(this.Subreq2, 1));
            strBuffer.append(CommonUtil.makePacketStr(this.Pinno2, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Cardprice2, 8));
            strBuffer.append(CommonUtil.makePacketStr(this.Subreq3, 1));
            strBuffer.append(CommonUtil.makePacketStr(this.Pinno3, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Cardprice3, 8));
            strBuffer.append(CommonUtil.makePacketStr(this.Subreq4, 1));
            strBuffer.append(CommonUtil.makePacketStr(this.Pinno4, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Cardprice4, 8));
            strBuffer.append(CommonUtil.makePacketStr(this.Subreq5, 1));
            strBuffer.append(CommonUtil.makePacketStr(this.Pinno5, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Cardprice5, 8));
            strBuffer.append(CommonUtil.makePacketStr(this.Filler, 119));
        } else {
            strBuffer.append(CommonUtil.makePacketStr(this.Prdtprice, 8));
            strBuffer.append(CommonUtil.makePacketStr(this.Mobilid, 13));
            strBuffer.append(CommonUtil.makePacketStr(this.Filler, 49));
        }

        if ("FC".equals(cashGb) && "10".equals(this.Mode)) {
            strBuffer.append(CommonUtil.makePacketStr(this.Username, 30));
            strBuffer.append(CommonUtil.makePacketStr(this.Userphoneno, 12));
            strBuffer.append(CommonUtil.makePacketStr(szUserSocno, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Useremail, 30));
            strBuffer.append(CommonUtil.makePacketStr(this.Userhost, 30));
            strBuffer.append(CommonUtil.makePacketStr(this.Emailflag, 1));
            strBuffer.append(CommonUtil.makePacketStr(this.Item, 8));
            strBuffer.append(CommonUtil.makePacketStr(this.Reqcards, 1));
            strBuffer.append(CommonUtil.makePacketStr(szPinno1, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno2, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno3, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno4, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno5, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Filler, 84));
        }

        if ("GM".equals(cashGb) || "GC".equals(cashGb)) {
            strBuffer.append(CommonUtil.makePacketStr(this.Username, 30));
            strBuffer.append(CommonUtil.makePacketStr(this.Userphoneno, 12));
            strBuffer.append(CommonUtil.makePacketStr(szUserSocno, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Useremail, 30));
            strBuffer.append(CommonUtil.makePacketStr(this.Userhost, 20));
            strBuffer.append(CommonUtil.makePacketStr(this.Emailflag, 1));
            strBuffer.append(CommonUtil.makePacketStr(this.Item, 8));
            if ("GC".equals(cashGb)) {
                strBuffer.append(CommonUtil.makePacketStr(this.Mobilid, 15));
            } else {
                strBuffer.append(CommonUtil.makePacketStr(this.Mobilid, 13));
            }

            if ("GM".equals(cashGb)) {
                strBuffer.append(CommonUtil.makePacketStr(this.User, 20));
                strBuffer.append(CommonUtil.makePacketStr(szPass, 32));
                strBuffer.append(CommonUtil.makePacketStr(this.Authtype, 1));
                strBuffer.append(CommonUtil.makePacketStr(this.Authno, 10));
                strBuffer.append(CommonUtil.makePacketStr(this.Reqcards, 1));
                if (Integer.parseInt(this.Reqcards) > 0) {
                    strBuffer.append(CommonUtil.makePacketStr(szPinno1, 64));
                    strBuffer.append(CommonUtil.makePacketStr(szPinno2, 64));
                    strBuffer.append(CommonUtil.makePacketStr(szPinno3, 64));
                    strBuffer.append(CommonUtil.makePacketStr(szPinno4, 64));
                    strBuffer.append(CommonUtil.makePacketStr(szPinno5, 64));
                    strBuffer.append(CommonUtil.makePacketStr(this.Filler, 128));
                } else {
                    strBuffer.append(CommonUtil.makePacketStr(this.Filler, 48));
                }
            }

            if ("GC".equals(cashGb)) {
                strBuffer.append(CommonUtil.makePacketStr(this.User, 20));
                strBuffer.append(CommonUtil.makePacketStr(szPass, 64));
                strBuffer.append(CommonUtil.makePacketStr(this.Reqcards, 1));
                strBuffer.append(CommonUtil.makePacketStr(this.Filler, 74));
                if ("".equals(this.Reqcards)) {
                    this.Reqcards = "0";
                }

                if (Integer.parseInt(this.Reqcards) > 0) {
                    strBuffer.append(CommonUtil.makePacketStr(szPinno1, 32));
                    strBuffer.append(CommonUtil.makePacketStr(szPinpw1, 32));
                    strBuffer.append(CommonUtil.makePacketStr(szPinno2, 32));
                    strBuffer.append(CommonUtil.makePacketStr(szPinpw2, 32));
                    strBuffer.append(CommonUtil.makePacketStr(szPinno3, 32));
                    strBuffer.append(CommonUtil.makePacketStr(szPinpw3, 32));
                    strBuffer.append(CommonUtil.makePacketStr(szPinno4, 32));
                    strBuffer.append(CommonUtil.makePacketStr(szPinpw4, 32));
                    strBuffer.append(CommonUtil.makePacketStr(szPinno5, 32));
                    strBuffer.append(CommonUtil.makePacketStr(szPinpw5, 32));
                }
            }
        }

        if ("GG".equals(cashGb)) {
            strBuffer.append(CommonUtil.makePacketStr(this.Username, 30));
            strBuffer.append(CommonUtil.makePacketStr(this.Userphoneno, 12));
            strBuffer.append(CommonUtil.makePacketStr(szUserSocno, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Emailflag, 1));
            strBuffer.append(CommonUtil.makePacketStr(this.Useremail, 30));
            strBuffer.append(CommonUtil.makePacketStr(this.Userhost, 20));
            strBuffer.append(CommonUtil.makePacketStr(this.Item, 8));
            strBuffer.append(CommonUtil.makePacketStr(this.Mobilid, 13));
            strBuffer.append(CommonUtil.makePacketStr(this.Filler, 60));
            strBuffer.append(CommonUtil.makePacketStr(this.Reqcards, 1));
            strBuffer.append(CommonUtil.makePacketStr(szPinno1, 64));
            strBuffer.append(CommonUtil.makePacketStr(this.Filler, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno2, 64));
            strBuffer.append(CommonUtil.makePacketStr(this.Filler, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno3, 64));
            strBuffer.append(CommonUtil.makePacketStr(this.Filler, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno4, 64));
            strBuffer.append(CommonUtil.makePacketStr(this.Filler, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno5, 64));
            strBuffer.append(CommonUtil.makePacketStr(this.Filler, 32));
        }

        if ("HM".equals(cashGb)) {
            strBuffer.append(CommonUtil.makePacketStr(this.Useremail, 30));
            strBuffer.append(CommonUtil.makePacketStr(this.Emailflag, 1));
            strBuffer.append(CommonUtil.makePacketStr(this.Item, 8));
            strBuffer.append(CommonUtil.makePacketStr(this.Mobilid, 15));
            if ("20".equals(this.Mode)) {
                strBuffer.append(CommonUtil.makePacketStr("P", 1));
            } else {
                strBuffer.append(CommonUtil.makePacketStr("C", 1));
            }

            strBuffer.append(CommonUtil.makePacketStr(szUser, 64));
            strBuffer.append(CommonUtil.makePacketStr(szPass, 64));
            strBuffer.append(CommonUtil.makePacketStr(this.Reqcards, 1));
            strBuffer.append(CommonUtil.makePacketStr(szPinno1, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinpw1, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno2, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinpw2, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno3, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinpw3, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno4, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinpw4, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinno5, 32));
            strBuffer.append(CommonUtil.makePacketStr(szPinpw5, 32));
            strBuffer.append(CommonUtil.makePacketStr(this.Userhost, 20));
            strBuffer.append(CommonUtil.makePacketStr(this.Filler, 84));
        }

        this.SocketStrLength = CommonUtil.strLength(strBuffer.toString());
        return strBuffer.toString();
    }

    public String setSocketStr(String paramString, String userEncode, String cashGb) {
        if (paramString == null) {
            return "-1";
        } else {
            byte[] arrayOfByte = new byte[1024];

            try {
                arrayOfByte = paramString.getBytes("EUC-KR");
            } catch (UnsupportedEncodingException var25) {
                var25.printStackTrace();
            }

            int i = 0;
            String str1 = "";
            String strCard1 = "";
            String strCard2 = "";
            String strCard3 = "";
            String strCard4 = "";
            String strCard5 = "";
            String strCardPw1 = "";
            String strCardPw2 = "";
            String strCardPw3 = "";
            String strCardPw4 = "";
            String strCardPw5 = "";
            String strCardRemain1 = "";
            String strCardRemain2 = "";
            String strCardRemain3 = "";
            String strCardRemain4 = "";
            String strCardRemain5 = "";
            String strUser = "";
            String strRemain = "";

            try {
                this.Ver = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                i = i + 4;
                this.CryptGB = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                ++i;
                this.KeySeq = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                ++i;
                if (!"GG".equals(cashGb) && !"GC".equals(cashGb)) {
                    this.Mode = CommonUtil.trim(new String(arrayOfByte, i, 2, "EUC-KR"));
                    i += 2;
                } else {
                    this.Mode = CommonUtil.trim(new String(arrayOfByte, i, 3, "EUC-KR"));
                    i += 3;
                }

                this.Recordkey = CommonUtil.trim(new String(arrayOfByte, i, 20, "EUC-KR"));
                i += 20;
                this.Svcid = CommonUtil.trim(new String(arrayOfByte, i, 12, "EUC-KR"));
                i += 12;
                this.Tradeid = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                i += 40;
                if (!"FC".equals(cashGb) || !"31".equals(this.Mode)) {
                    str1 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.Prdtprice = McashSeed.decodeString(str1, this.CipherKey.getBytes()).trim();
                }

                if ("GM".equals(cashGb)) {
                    this.Mobilid = CommonUtil.trim(new String(arrayOfByte, i, 13, "EUC-KR"));
                    i += 13;
                    this.Actdate = CommonUtil.trim(new String(arrayOfByte, i, 14, "EUC-KR"));
                    i += 14;
                    this.Resultcd = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                    i += 4;
                    this.Resultmsg = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                    i += 100;
                    this.Entpnm = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                    i += 40;
                    this.User = CommonUtil.trim(new String(arrayOfByte, i, 20, "EUC-KR"));
                    i += 20;
                    this.Chargeamt = CommonUtil.trim(new String(arrayOfByte, i, 9, "EUC-KR"));
                    i += 9;
                    this.Remainamt = CommonUtil.trim(new String(arrayOfByte, i, 9, "EUC-KR"));
                    i += 9;
                    this.Authtype = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                    ++i;
                    this.Paycards = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                    ++i;
                    if (Integer.parseInt(this.Paycards) > 0) {
                        strCard1 = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                        i += 64;
                        this.ScratchNo1 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        this.ScratchResCd1 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.ScratchResMsg1 = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                        i += 40;
                        this.ScratchPrice1 = CommonUtil.trim(new String(arrayOfByte, i, 9, "EUC-KR"));
                        i += 9;
                    }

                    if (Integer.parseInt(this.Paycards) > 1) {
                        strCard2 = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                        i += 64;
                        this.ScratchNo2 = McashSeed.decodeString(strCard2, this.CipherKey.getBytes()).trim();
                        this.ScratchResCd2 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.ScratchResMsg2 = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                        i += 40;
                        this.ScratchPrice2 = CommonUtil.trim(new String(arrayOfByte, i, 9, "EUC-KR"));
                        i += 9;
                    }

                    if (Integer.parseInt(this.Paycards) > 2) {
                        strCard3 = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                        i += 64;
                        this.ScratchNo3 = McashSeed.decodeString(strCard3, this.CipherKey.getBytes()).trim();
                        this.ScratchResCd3 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.ScratchResMsg3 = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                        i += 40;
                        this.ScratchPrice3 = CommonUtil.trim(new String(arrayOfByte, i, 9, "EUC-KR"));
                        i += 9;
                    }

                    if (Integer.parseInt(this.Paycards) > 3) {
                        strCard4 = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                        i += 64;
                        this.ScratchNo4 = McashSeed.decodeString(strCard4, this.CipherKey.getBytes()).trim();
                        this.ScratchResCd4 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.ScratchResMsg4 = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                        i += 40;
                        this.ScratchPrice4 = CommonUtil.trim(new String(arrayOfByte, i, 9, "EUC-KR"));
                        i += 9;
                    }

                    if (Integer.parseInt(this.Paycards) > 4) {
                        strCard5 = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                        i += 64;
                        this.ScratchNo5 = McashSeed.decodeString(strCard5, this.CipherKey.getBytes()).trim();
                        this.ScratchResCd5 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.ScratchResMsg5 = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                        i += 40;
                        this.ScratchPrice5 = CommonUtil.trim(new String(arrayOfByte, i, 9, "EUC-KR"));
                        i += 9;
                    }
                }

                if ("GC".equals(cashGb)) {
                    this.Mobilid = CommonUtil.trim(new String(arrayOfByte, i, 15, "EUC-KR"));
                    i += 15;
                    this.Actdate = CommonUtil.trim(new String(arrayOfByte, i, 14, "EUC-KR"));
                    i += 14;
                    this.Resultcd = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                    i += 4;
                    this.Resultmsg = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                    i += 100;
                    this.Entpnm = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                    i += 40;
                    this.User = CommonUtil.trim(new String(arrayOfByte, i, 20, "EUC-KR"));
                    i += 20;
                    this.bnlUserNm = CommonUtil.trim(new String(arrayOfByte, i, 20, "EUC-KR"));
                    i += 20;
                    this.Remainamt = CommonUtil.trim(new String(arrayOfByte, i, 10, "EUC-KR"));
                    i += 10;
                    this.Paycards = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                    ++i;
                    if (Integer.parseInt(this.Paycards) > 0) {
                        this.Cardseq1 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchResCd1 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.ScratchResMsg1 = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                        i += 100;
                        strCard1 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchNo1 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        strCardPw1 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchNoPw1 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        this.ScratchPrice1 = CommonUtil.trim(new String(arrayOfByte, i, 10, "EUC-KR"));
                        i += 10;
                    }

                    if (Integer.parseInt(this.Paycards) > 1) {
                        this.Cardseq2 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchResCd2 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.ScratchResMsg2 = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                        i += 100;
                        strCard2 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchNo2 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        strCardPw2 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchNoPw2 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        this.ScratchPrice2 = CommonUtil.trim(new String(arrayOfByte, i, 10, "EUC-KR"));
                        i += 10;
                    }

                    if (Integer.parseInt(this.Paycards) > 2) {
                        this.Cardseq3 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchResCd3 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.ScratchResMsg3 = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                        i += 100;
                        strCard3 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchNo3 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        strCardPw3 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchNoPw3 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        this.ScratchPrice3 = CommonUtil.trim(new String(arrayOfByte, i, 10, "EUC-KR"));
                        i += 10;
                    }

                    if (Integer.parseInt(this.Paycards) > 3) {
                        this.Cardseq4 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchResCd4 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.ScratchResMsg4 = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                        i += 100;
                        strCard4 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchNo4 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        strCardPw4 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchNoPw4 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        this.ScratchPrice4 = CommonUtil.trim(new String(arrayOfByte, i, 10, "EUC-KR"));
                        i += 10;
                    }

                    if (Integer.parseInt(this.Paycards) > 4) {
                        this.Cardseq5 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchResCd5 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.ScratchResMsg5 = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                        i += 100;
                        strCard5 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchNo5 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        strCardPw5 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchNoPw5 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                        this.ScratchPrice5 = CommonUtil.trim(new String(arrayOfByte, i, 10, "EUC-KR"));
                        i += 10;
                    }
                }

                if ("GG".equals(cashGb)) {
                    this.Mobilid = CommonUtil.trim(new String(arrayOfByte, i, 13, "EUC-KR"));
                    i += 13;
                    this.Actdate = CommonUtil.trim(new String(arrayOfByte, i, 14, "EUC-KR"));
                    i += 14;
                    this.Resultcd = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                    i += 4;
                    this.Resultmsg = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                    i += 100;
                    this.Filler = CommonUtil.trim(new String(arrayOfByte, i, 55, "EUC-KR"));
                    i += 55;
                    this.Paycards = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                    ++i;
                    strCard1 = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                    i += 64;
                    this.ScratchNo1 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                    this.ScratchResCd1 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                    i += 4;
                    this.ScratchResMsg1 = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                    i += 40;
                    strCardRemain1 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchPrice1 = McashSeed.decodeString(strCardRemain1, this.CipherKey.getBytes()).trim();
                    strCard2 = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                    i += 64;
                    this.ScratchNo2 = McashSeed.decodeString(strCard2, this.CipherKey.getBytes()).trim();
                    this.ScratchResCd2 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                    i += 4;
                    this.ScratchResMsg2 = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                    i += 40;
                    strCardRemain2 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchPrice2 = McashSeed.decodeString(strCardRemain2, this.CipherKey.getBytes()).trim();
                    strCard3 = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                    i += 64;
                    this.ScratchNo3 = McashSeed.decodeString(strCard3, this.CipherKey.getBytes()).trim();
                    this.ScratchResCd3 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                    i += 4;
                    this.ScratchResMsg3 = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                    i += 40;
                    strCardRemain3 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchPrice3 = McashSeed.decodeString(this.ScratchRemain3, this.CipherKey.getBytes()).trim();
                    strCard4 = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                    i += 64;
                    this.ScratchNo4 = McashSeed.decodeString(strCard4, this.CipherKey.getBytes()).trim();
                    this.ScratchResCd4 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                    i += 4;
                    this.ScratchResMsg4 = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                    i += 40;
                    strCardRemain4 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchPrice4 = McashSeed.decodeString(this.ScratchRemain4, this.CipherKey.getBytes()).trim();
                    strCard5 = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                    i += 64;
                    this.ScratchNo5 = McashSeed.decodeString(strCard5, this.CipherKey.getBytes()).trim();
                    this.ScratchResCd5 = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                    i += 4;
                    this.ScratchResMsg5 = CommonUtil.trim(new String(arrayOfByte, i, 40, "EUC-KR"));
                    i += 40;
                    strCardRemain5 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchPrice5 = McashSeed.decodeString(this.ScratchRemain5, this.CipherKey.getBytes()).trim();
                }

                if ("FC".equals(cashGb)) {
                    if ("11".equals(this.Mode)) {
                        this.Emailflag = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.Item = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.Reqcards = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.Resultcd = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.Resultmsg = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                        i += 100;
                        this.Mobilid = CommonUtil.trim(new String(arrayOfByte, i, 13, "EUC-KR"));
                        i += 13;
                        this.Actdate = CommonUtil.trim(new String(arrayOfByte, i, 14, "EUC-KR"));
                        i += 14;
                        this.Paycards = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.Useyn1 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchResMsg1 = CommonUtil.trim(new String(arrayOfByte, i, 16, "EUC-KR"));
                        i += 16;
                        this.Cardseq1 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchNo1 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchRemain1 = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.ScratchPrice1 = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.Useyn2 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchResMsg2 = CommonUtil.trim(new String(arrayOfByte, i, 16, "EUC-KR"));
                        i += 16;
                        this.Cardseq2 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchNo2 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchRemain2 = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.ScratchPrice2 = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.Useyn3 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchResMsg3 = CommonUtil.trim(new String(arrayOfByte, i, 16, "EUC-KR"));
                        i += 16;
                        this.Cardseq3 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchNo3 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchRemain3 = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.ScratchPrice3 = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.Useyn4 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchResMsg4 = CommonUtil.trim(new String(arrayOfByte, i, 16, "EUC-KR"));
                        i += 16;
                        this.Cardseq4 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchNo4 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchRemain4 = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.ScratchPrice4 = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.Useyn5 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchResMsg5 = CommonUtil.trim(new String(arrayOfByte, i, 16, "EUC-KR"));
                        i += 16;
                        this.Cardseq5 = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                        ++i;
                        this.ScratchNo5 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                        i += 32;
                        this.ScratchRemain5 = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.ScratchPrice5 = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.Filler = CommonUtil.trim(new String(arrayOfByte, i, 116, "EUC-KR"));
                        i += 116;
                    } else if ("21".equals(this.Mode)) {
                        this.Resultcd = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.Resultmsg = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                        i += 100;
                        this.Mobilid = CommonUtil.trim(new String(arrayOfByte, i, 13, "EUC-KR"));
                        i += 13;
                        this.Actdate = CommonUtil.trim(new String(arrayOfByte, i, 14, "EUC-KR"));
                        i += 14;
                        this.Cpcharno = CommonUtil.trim(new String(arrayOfByte, i, 15, "EUC-KR"));
                        i += 15;
                        this.Filler = CommonUtil.trim(new String(arrayOfByte, i, 292, "EUC-KR"));
                        i += 292;
                    } else if ("31".equals(this.Mode)) {
                        this.Prdtprice = CommonUtil.trim(new String(arrayOfByte, i, 8, "EUC-KR"));
                        i += 8;
                        this.Resultcd = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                        i += 4;
                        this.Resultmsg = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                        i += 100;
                        this.Mobilid = CommonUtil.trim(new String(arrayOfByte, i, 13, "EUC-KR"));
                        i += 13;
                        this.Actdate = CommonUtil.trim(new String(arrayOfByte, i, 14, "EUC-KR"));
                        i += 14;
                        this.Filler = CommonUtil.trim(new String(arrayOfByte, i, 292, "EUC-KR"));
                        i += 31;
                    }
                }

                if ("HM".equals(cashGb)) {
                    this.Mobilid = CommonUtil.trim(new String(arrayOfByte, i, 15, "EUC-KR"));
                    i += 15;
                    this.Actdate = CommonUtil.trim(new String(arrayOfByte, i, 14, "EUC-KR"));
                    i += 14;
                    this.Resultcd = CommonUtil.trim(new String(arrayOfByte, i, 4, "EUC-KR"));
                    i += 4;
                    this.Resultmsg = CommonUtil.trim(new String(arrayOfByte, i, 100, "EUC-KR"));
                    i += 100;
                    strUser = CommonUtil.trim(new String(arrayOfByte, i, 64, "EUC-KR"));
                    i += 64;
                    this.User = McashSeed.decodeString(strUser, this.CipherKey.getBytes()).trim();
                    strRemain = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.Remainamt = McashSeed.decodeString(strRemain, this.CipherKey.getBytes()).trim();
                    this.Paycards = CommonUtil.trim(new String(arrayOfByte, i, 1, "EUC-KR"));
                    ++i;
                    strCard1 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchNo1 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                    strCardPw1 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchNoPw1 = McashSeed.decodeString(strCard1, this.CipherKey.getBytes()).trim();
                    strCardRemain1 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchPrice1 = McashSeed.decodeString(strCardRemain1, this.CipherKey.getBytes()).trim();
                    strCard2 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchNo2 = McashSeed.decodeString(strCard2, this.CipherKey.getBytes()).trim();
                    strCardPw2 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchNoPw2 = McashSeed.decodeString(strCardPw2, this.CipherKey.getBytes()).trim();
                    strCardRemain2 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchPrice2 = McashSeed.decodeString(strCardRemain2, this.CipherKey.getBytes()).trim();
                    strCard3 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchNo3 = McashSeed.decodeString(strCard3, this.CipherKey.getBytes()).trim();
                    strCardPw3 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchNoPw3 = McashSeed.decodeString(strCardPw3, this.CipherKey.getBytes()).trim();
                    strCardRemain3 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchPrice3 = McashSeed.decodeString(strCardRemain3, this.CipherKey.getBytes()).trim();
                    strCard4 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchNo4 = McashSeed.decodeString(strCard4, this.CipherKey.getBytes()).trim();
                    strCardPw4 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchNoPw4 = McashSeed.decodeString(strCardPw4, this.CipherKey.getBytes()).trim();
                    strCardRemain4 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchPrice4 = McashSeed.decodeString(strCardRemain4, this.CipherKey.getBytes()).trim();
                    strCard5 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchNo5 = McashSeed.decodeString(strCard5, this.CipherKey.getBytes()).trim();
                    strCardPw5 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchNoPw5 = McashSeed.decodeString(strCardPw5, this.CipherKey.getBytes()).trim();
                    strCardRemain5 = CommonUtil.trim(new String(arrayOfByte, i, 32, "EUC-KR"));
                    i += 32;
                    this.ScratchPrice5 = McashSeed.decodeString(strCardRemain5, this.CipherKey.getBytes()).trim();
                    this.Filler = CommonUtil.trim(new String(arrayOfByte, i, 138, "EUC-KR"));
                    i += 138;
                }

                return "0000";
            } catch (Exception var26) {
                var26.printStackTrace();
                log.error("McashGift-Error:  " + var26.toString());
                return "-1";
            }
        }
    }

    public String getVer() {
        return this.Ver;
    }

    public void setVer(String ver) {
        this.Ver = ver;
    }

    public String getCryptGB() {
        return this.CryptGB;
    }

    public void setCryptGB(String cryptGB) {
        this.CryptGB = cryptGB;
    }

    public String getKeySeq() {
        return this.KeySeq;
    }

    public void setKeySeq(String keySeq) {
        this.KeySeq = keySeq;
    }

    public String getMode() {
        return this.Mode;
    }

    public void setMode(String mode) {
        this.Mode = mode;
    }

    public String getRecordkey() {
        return this.Recordkey;
    }

    public void setRecordkey(String recordkey) {
        this.Recordkey = recordkey;
    }

    public String getMrchid() {
        return this.Mrchid;
    }

    public void setMrchid(String mrchid) {
        this.Mrchid = mrchid;
    }

    public String getSvcid() {
        return this.Svcid;
    }

    public void setSvcid(String svcid) {
        this.Svcid = svcid;
    }

    public String getTradeid() {
        return this.Tradeid;
    }

    public void setTradeid(String tradeid) {
        this.Tradeid = tradeid;
    }

    public String getPrdtcd() {
        return this.Prdtcd;
    }

    public void setPrdtcd(String prdtcd) {
        this.Prdtcd = prdtcd;
    }

    public String getPrdtnm() {
        return this.Prdtnm;
    }

    public void setPrdtnm(String prdtnm) {
        this.Prdtnm = prdtnm;
    }

    public String getPrdtprice() {
        return this.Prdtprice;
    }

    public void setPrdtprice(String prdtprice) {
        this.Prdtprice = prdtprice;
    }

    public String getUserid() {
        return this.Userid;
    }

    public void setUserid(String userid) {
        this.Userid = userid;
    }

    public String getUsername() {
        return this.Username;
    }

    public void setUsername(String username) {
        this.Username = username;
    }

    public String getUserphoneno() {
        return this.Userphoneno;
    }

    public void setUserphoneno(String userphoneno) {
        this.Userphoneno = userphoneno;
    }

    public String getUsersocialno() {
        return this.Usersocialno;
    }

    public void setUsersocialno(String usersocialno) {
        this.Usersocialno = usersocialno;
    }

    public String getUseremail() {
        return this.Useremail;
    }

    public void setUseremail(String useremail) {
        this.Useremail = useremail;
    }

    public String getUserhost() {
        return this.Userhost;
    }

    public void setUserhost(String userhost) {
        this.Userhost = userhost;
    }

    public String getEmailflag() {
        return this.Emailflag;
    }

    public void setEmailflag(String emailflag) {
        this.Emailflag = emailflag;
    }

    public String getItem() {
        return this.Item;
    }

    public void setItem(String item) {
        this.Item = item;
    }

    public String getMobilid() {
        return this.Mobilid;
    }

    public void setMobilid(String mobilid) {
        this.Mobilid = mobilid;
    }

    public String getUser() {
        return this.User;
    }

    public void setUser(String user) {
        this.User = user;
    }

    public String getPass() {
        return this.Pass;
    }

    public void setPass(String pass) {
        this.Pass = pass;
    }

    public String getAuthtype() {
        return this.Authtype;
    }

    public void setAuthtype(String authtype) {
        this.Authtype = authtype;
    }

    public String getAuthno() {
        return this.Authno;
    }

    public void setAuthno(String authno) {
        this.Authno = authno;
    }

    public String getReqcards() {
        return this.Reqcards;
    }

    public void setReqcards(String reqcards) {
        this.Reqcards = reqcards;
    }

    public String getPinno1() {
        return this.Pinno1;
    }

    public void setPinno1(String pinno1) {
        this.Pinno1 = pinno1;
    }

    public String getPinno2() {
        return this.Pinno2;
    }

    public void setPinno2(String pinno2) {
        this.Pinno2 = pinno2;
    }

    public String getPinno3() {
        return this.Pinno3;
    }

    public void setPinno3(String pinno3) {
        this.Pinno3 = pinno3;
    }

    public String getPinno4() {
        return this.Pinno4;
    }

    public void setPinno4(String pinno4) {
        this.Pinno4 = pinno4;
    }

    public String getPinno5() {
        return this.Pinno5;
    }

    public void setPinno5(String pinno5) {
        this.Pinno5 = pinno5;
    }

    public String getPinno6() {
        return this.Pinno6;
    }

    public void setPinno6(String pinno6) {
        this.Pinno6 = pinno6;
    }

    public String getActdate() {
        return this.Actdate;
    }

    public void setActdate(String actdate) {
        this.Actdate = actdate;
    }

    public String getResultcd() {
        return this.Resultcd;
    }

    public void setResultcd(String resultcd) {
        this.Resultcd = resultcd;
    }

    public String getResultmsg() {
        return this.Resultmsg;
    }

    public void setResultmsg(String resultmsg) {
        this.Resultmsg = resultmsg;
    }

    public String getEntpnm() {
        return this.Entpnm;
    }

    public void setEntpnm(String entpnm) {
        this.Entpnm = entpnm;
    }

    public String getPaycards() {
        return this.Paycards;
    }

    public void setPaycards(String paycards) {
        this.Paycards = paycards;
    }

    public String getFiller() {
        return this.Filler;
    }

    public void setFiller(String filler) {
        this.Filler = filler;
    }

    public int getSocketStrLength() {
        return this.SocketStrLength;
    }

    public void setSocketStrLength(int socketStrLength) {
        this.SocketStrLength = socketStrLength;
    }

    public String getCipherKey() {
        return this.CipherKey;
    }

    public void setCipherKey(String cipherKey) {
        this.CipherKey = cipherKey;
    }

    public McashSeed getSeed() {
        return this.seed;
    }

    public void setSeed(McashSeed seed) {
        this.seed = seed;
    }

    public String getScratchcnt() {
        return this.Scratchcnt;
    }

    public void setScratchcnt(String scratchcnt) {
        this.Scratchcnt = scratchcnt;
    }

    public String getChargeamt() {
        return this.Chargeamt;
    }

    public void setChargeamt(String chargeamt) {
        this.Chargeamt = chargeamt;
    }

    public String getCashamt() {
        return this.Cashamt;
    }

    public void setCashamt(String cashamt) {
        this.Cashamt = cashamt;
    }

    public String getRemainamt() {
        return this.Remainamt;
    }

    public void setRemainamt(String remainamt) {
        this.Remainamt = remainamt;
    }

    public String getPaytype() {
        return this.Paytype;
    }

    public void setPaytype(String paytype) {
        this.Paytype = paytype;
    }

    public String getPinpw1() {
        return this.Pinpw1;
    }

    public void setPinpw1(String pinpw1) {
        this.Pinpw1 = pinpw1;
    }

    public String getPinpw2() {
        return this.Pinpw2;
    }

    public void setPinpw2(String pinpw2) {
        this.Pinpw2 = pinpw2;
    }

    public String getPinpw3() {
        return this.Pinpw3;
    }

    public void setPinpw3(String pinpw3) {
        this.Pinpw3 = pinpw3;
    }

    public String getPinpw4() {
        return this.Pinpw4;
    }

    public void setPinpw4(String pinpw4) {
        this.Pinpw4 = pinpw4;
    }

    public String getPinpw5() {
        return this.Pinpw5;
    }

    public void setPinpw5(String pinpw5) {
        this.Pinpw5 = pinpw5;
    }

    public String getPinpw6() {
        return this.Pinpw6;
    }

    public void setPinpw6(String pinpw6) {
        this.Pinpw6 = pinpw6;
    }

    public String getBnlid() {
        return this.Bnlid;
    }

    public void setBnlid(String bnlid) {
        this.Bnlid = bnlid;
    }

    public String getBnlpass() {
        return this.Bnlpass;
    }

    public void setBnlpass(String bnlpass) {
        this.Bnlpass = bnlpass;
    }

    public String getCardprice1() {
        return this.Cardprice1;
    }

    public void setCardprice1(String cardprice1) {
        this.Cardprice1 = cardprice1;
    }

    public String getCardprice2() {
        return this.Cardprice2;
    }

    public void setCardprice2(String cardprice2) {
        this.Cardprice2 = cardprice2;
    }

    public String getCardprice3() {
        return this.Cardprice3;
    }

    public void setCardprice3(String cardprice3) {
        this.Cardprice3 = cardprice3;
    }

    public String getCardprice4() {
        return this.Cardprice4;
    }

    public void setCardprice4(String cardprice4) {
        this.Cardprice4 = cardprice4;
    }

    public String getCardprice5() {
        return this.Cardprice5;
    }

    public void setCardprice5(String cardprice5) {
        this.Cardprice5 = cardprice5;
    }

    public String getSubreq1() {
        return this.Subreq1;
    }

    public void setSubreq1(String subreq1) {
        this.Subreq1 = subreq1;
    }

    public String getSubreq2() {
        return this.Subreq2;
    }

    public void setSubreq2(String subreq2) {
        this.Subreq2 = subreq2;
    }

    public String getSubreq3() {
        return this.Subreq3;
    }

    public void setSubreq3(String subreq3) {
        this.Subreq3 = subreq3;
    }

    public String getSubreq4() {
        return this.Subreq4;
    }

    public void setSubreq4(String subreq4) {
        this.Subreq4 = subreq4;
    }

    public String getSubreq5() {
        return this.Subreq5;
    }

    public void setSubreq5(String subreq5) {
        this.Subreq5 = subreq5;
    }

    public String getCardseq1() {
        return this.Cardseq1;
    }

    public void setCardseq1(String cardseq1) {
        this.Cardseq1 = cardseq1;
    }

    public String getCardseq2() {
        return this.Cardseq2;
    }

    public void setCardseq2(String cardseq2) {
        this.Cardseq2 = cardseq2;
    }

    public String getCardseq3() {
        return this.Cardseq3;
    }

    public void setCardseq3(String cardseq3) {
        this.Cardseq3 = cardseq3;
    }

    public String getCardseq4() {
        return this.Cardseq4;
    }

    public void setCardseq4(String cardseq4) {
        this.Cardseq4 = cardseq4;
    }

    public String getCardseq5() {
        return this.Cardseq5;
    }

    public void setCardseq5(String cardseq5) {
        this.Cardseq5 = cardseq5;
    }

    public String getScratchNo1() {
        return this.ScratchNo1;
    }

    public void setScratchNo1(String scratchNo1) {
        this.ScratchNo1 = scratchNo1;
    }

    public String getScratchResCd1() {
        return this.ScratchResCd1;
    }

    public void setScratchResCd1(String scratchResCd1) {
        this.ScratchResCd1 = scratchResCd1;
    }

    public String getScratchResMsg1() {
        return this.ScratchResMsg1;
    }

    public void setScratchResMsg1(String scratchResMsg1) {
        this.ScratchResMsg1 = scratchResMsg1;
    }

    public String getScratchPrice1() {
        return this.ScratchPrice1;
    }

    public void setScratchPrice1(String scratchPrice1) {
        this.ScratchPrice1 = scratchPrice1;
    }

    public String getScratchNo2() {
        return this.ScratchNo2;
    }

    public void setScratchNo2(String scratchNo2) {
        this.ScratchNo2 = scratchNo2;
    }

    public String getScratchResCd2() {
        return this.ScratchResCd2;
    }

    public void setScratchResCd2(String scratchResCd2) {
        this.ScratchResCd2 = scratchResCd2;
    }

    public String getScratchResMsg2() {
        return this.ScratchResMsg2;
    }

    public void setScratchResMsg2(String scratchResMsg2) {
        this.ScratchResMsg2 = scratchResMsg2;
    }

    public String getScratchPrice2() {
        return this.ScratchPrice2;
    }

    public void setScratchPrice2(String scratchPrice2) {
        this.ScratchPrice2 = scratchPrice2;
    }

    public String getScratchNo3() {
        return this.ScratchNo3;
    }

    public void setScratchNo3(String scratchNo3) {
        this.ScratchNo3 = scratchNo3;
    }

    public String getScratchResCd3() {
        return this.ScratchResCd3;
    }

    public void setScratchResCd3(String scratchResCd3) {
        this.ScratchResCd3 = scratchResCd3;
    }

    public String getScratchResMsg3() {
        return this.ScratchResMsg3;
    }

    public void setScratchResMsg3(String scratchResMsg3) {
        this.ScratchResMsg3 = scratchResMsg3;
    }

    public String getScratchPrice3() {
        return this.ScratchPrice3;
    }

    public void setScratchPrice3(String scratchPrice3) {
        this.ScratchPrice3 = scratchPrice3;
    }

    public String getScratchNo4() {
        return this.ScratchNo4;
    }

    public void setScratchNo4(String scratchNo4) {
        this.ScratchNo4 = scratchNo4;
    }

    public String getScratchResCd4() {
        return this.ScratchResCd4;
    }

    public void setScratchResCd4(String scratchResCd4) {
        this.ScratchResCd4 = scratchResCd4;
    }

    public String getScratchResMsg4() {
        return this.ScratchResMsg4;
    }

    public void setScratchResMsg4(String scratchResMsg4) {
        this.ScratchResMsg4 = scratchResMsg4;
    }

    public String getScratchPrice4() {
        return this.ScratchPrice4;
    }

    public void setScratchPrice4(String scratchPrice4) {
        this.ScratchPrice4 = scratchPrice4;
    }

    public String getScratchNo5() {
        return this.ScratchNo5;
    }

    public void setScratchNo5(String scratchNo5) {
        this.ScratchNo5 = scratchNo5;
    }

    public String getScratchResCd5() {
        return this.ScratchResCd5;
    }

    public void setScratchResCd5(String scratchResCd5) {
        this.ScratchResCd5 = scratchResCd5;
    }

    public String getScratchResMsg5() {
        return this.ScratchResMsg5;
    }

    public void setScratchResMsg5(String scratchResMsg5) {
        this.ScratchResMsg5 = scratchResMsg5;
    }

    public String getScratchPrice5() {
        return this.ScratchPrice5;
    }

    public void setScratchPrice5(String scratchPrice5) {
        this.ScratchPrice5 = scratchPrice5;
    }

    public String getScratchNoPw1() {
        return this.ScratchNoPw1;
    }

    public void setScratchNoPw1(String scratchNoPw1) {
        this.ScratchNoPw1 = scratchNoPw1;
    }

    public String getScratchNoPw2() {
        return this.ScratchNoPw2;
    }

    public void setScratchNoPw2(String scratchNoPw2) {
        this.ScratchNoPw2 = scratchNoPw2;
    }

    public String getScratchNoPw3() {
        return this.ScratchNoPw3;
    }

    public void setScratchNoPw3(String scratchNoPw3) {
        this.ScratchNoPw3 = scratchNoPw3;
    }

    public String getScratchNoPw4() {
        return this.ScratchNoPw4;
    }

    public void setScratchNoPw4(String scratchNoPw4) {
        this.ScratchNoPw4 = scratchNoPw4;
    }

    public String getScratchNoPw5() {
        return this.ScratchNoPw5;
    }

    public void setScratchNoPw5(String scratchNoPw5) {
        this.ScratchNoPw5 = scratchNoPw5;
    }

    public String getBnlUserNm() {
        return this.bnlUserNm;
    }

    public void setBnlUserNm(String bnlUserNm) {
        this.bnlUserNm = bnlUserNm;
    }

    public String getScratchRemain1() {
        return this.ScratchRemain1;
    }

    public void setScratchRemain1(String scratchRemain1) {
        this.ScratchRemain1 = scratchRemain1;
    }

    public String getScratchRemain2() {
        return this.ScratchRemain2;
    }

    public void setScratchRemain2(String scratchRemain2) {
        this.ScratchRemain2 = scratchRemain2;
    }

    public String getScratchRemain3() {
        return this.ScratchRemain3;
    }

    public void setScratchRemain3(String scratchRemain3) {
        this.ScratchRemain3 = scratchRemain3;
    }

    public String getScratchRemain4() {
        return this.ScratchRemain4;
    }

    public void setScratchRemain4(String scratchRemain4) {
        this.ScratchRemain4 = scratchRemain4;
    }

    public String getScratchRemain5() {
        return this.ScratchRemain5;
    }

    public void setScratchRemain5(String scratchRemain5) {
        this.ScratchRemain5 = scratchRemain5;
    }

    public String getUseyn1() {
        return this.Useyn1;
    }

    public void setUseyn1(String useyn1) {
        this.Useyn1 = useyn1;
    }

    public String getUseyn2() {
        return this.Useyn2;
    }

    public void setUseyn2(String useyn2) {
        this.Useyn2 = useyn2;
    }

    public String getUseyn3() {
        return this.Useyn3;
    }

    public void setUseyn3(String useyn3) {
        this.Useyn3 = useyn3;
    }

    public String getUseyn4() {
        return this.Useyn4;
    }

    public void setUseyn4(String useyn4) {
        this.Useyn4 = useyn4;
    }

    public String getUseyn5() {
        return this.Useyn5;
    }

    public void setUseyn5(String useyn5) {
        this.Useyn5 = useyn5;
    }

    public String getCpcharno() {
        return this.Cpcharno;
    }

    public void setCpcharno(String cpcharno) {
        this.Cpcharno = cpcharno;
    }
}
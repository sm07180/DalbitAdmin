package com.dalbit.payment.module.gift_v0001;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class CommonUtil {
    public CommonUtil() {
    }

    public static String Encode(String temp) {
        String tmp = "";
        if (temp == null) {
            temp = "";
            return temp;
        } else {
            try {
                tmp = URLEncoder.encode(temp);
                return tmp;
            } catch (NullPointerException var3) {
                return tmp;
            }
        }
    }

    public static String Decode(String temp) {
        String tmp = "";
        if (temp == null) {
            temp = "";
            return temp;
        } else {
            try {
                tmp = URLDecoder.decode(temp);
                return tmp;
            } catch (NullPointerException var3) {
                return tmp;
            }
        }
    }

    public static String Decode_1(String temp) {
        String tmp = "";
        String tmp1 = "";
        if (temp != null && temp.length() >= 1) {
            tmp1 = temp;

            try {
                tmp = new String(temp.getBytes("8859_1"), "KSC5601");
                if (tmp.indexOf("?") > -1) {
                    tmp = tmp1;
                }

                return tmp;
            } catch (UnsupportedEncodingException var4) {
                return tmp;
            } catch (NullPointerException var5) {
                return tmp;
            }
        } else {
            temp = "";
            return temp;
        }
    }

    public static String nullChk(String temp) {
        return temp != null ? temp : "";
    }

    public static int strLength(String temp) {
        return temp != null ? temp.getBytes().length : 0;
    }

    public static int strLength(String temp, int maxLength) {
        int n = strLength(temp);
        int n_1 = temp.length();
        return maxLength - n + n_1;
    }

    public static String makePacketStr(String temp, int maxLength) {
        return rpad(temp, maxLength, ' ');
    }

    public static String rpad(String strSource, int iLength, char cPadder) {
        StringBuffer sbBuffer = null;
        int iByteSize;
        if (!isEmpty(strSource)) {
            iByteSize = getByteSize(strSource);
            if (iByteSize > iLength) {
                return new String(strSource.getBytes(), 0, iLength);
            } else if (iByteSize == iLength) {
                return strSource;
            } else {
                int iPadLength = iLength - iByteSize;
                sbBuffer = new StringBuffer(strSource);

                for (int j = 0; j < iPadLength; ++j) {
                    sbBuffer.append(cPadder);
                }

                return sbBuffer.toString();
            }
        } else {
            sbBuffer = new StringBuffer();

            for (iByteSize = 0; iByteSize < iLength; ++iByteSize) {
                sbBuffer.append(cPadder);
            }

            return sbBuffer.toString();
        }
    }

    public static boolean isEmpty(String strSource) {
        return strSource == null || "".equals(strSource);
    }

    public static int getByteSize(String str) {
        if (str != null && str.length() != 0) {
            byte[] byteArray = null;

            try {
                byteArray = str.getBytes("EUC-KR");
            } catch (UnsupportedEncodingException var3) {
            }

            return byteArray == null ? 0 : byteArray.length;
        } else {
            return 0;
        }
    }

    public static String qStrDigit(String str) {
        if (str == null) {
            return "-1";
        } else {
            int count = strLength(str);

            for (int i = 0; i < count; ++i) {
                if (str.charAt(i) < '0' || str.charAt(i) > '9') {
                    return "-1";
                }
            }

            return "0000";
        }
    }

    public static String ConvertStr(int n) {
        String tmp = "";

        try {
            tmp = Integer.toString(n);
            return tmp;
        } catch (NullPointerException var3) {
            return tmp;
        }
    }

    public static String trim(String temp) {
        String tmp = "";
        if (temp == null) {
            return tmp;
        } else {
            try {
                tmp = temp.trim();
            } catch (NullPointerException var5) {
            } finally {
                ;
            }

            return tmp;
        }
    }

    public static String szmakeStr(String org, int i, String str, String dir) {
        if (org == null) {
            org = "";
            return org;
        } else {
            StringBuffer stringbuffer = new StringBuffer();
            String s1 = str;
            int j = 0;
            j = org.length();
            int k;
            if (dir.equals("right")) {
                stringbuffer.append(org);

                for (k = j; k < i; ++k) {
                    stringbuffer.append(s1);
                }
            } else {
                for (k = j; k < i; ++k) {
                    stringbuffer.append(s1);
                }

                stringbuffer.append(org);
            }

            return stringbuffer.toString();
        }
    }

    public static boolean chkSSNDigit(String ssn) {
        int total = 0;
        int result = 0;
        boolean ssn_chk = false;
        int n = 2;
        int len = ssn.length();
        int check = Integer.parseInt(ssn.substring(len - 1, len));

        for (int i = 0; i < len - 1; ++i) {
            if (n > 9) {
                n = 2;
            }

            total += Integer.parseInt(ssn.substring(i, i + 1)) * n;
            ++n;
        }

        result = total % 11;
        switch (result) {
            case 0:
                result = 10;
                break;
            case 1:
                result = 11;
        }

        result = 11 - result;
        if (result == check) {
            ssn_chk = true;
        }

        return ssn_chk;
    }
}
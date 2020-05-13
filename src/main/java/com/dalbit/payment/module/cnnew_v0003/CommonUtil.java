package com.dalbit.payment.module.cnnew_v0003;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class CommonUtil {
    public static String Encode(String temp) {
        String tmp = "";
        if (temp == null) {
            temp = "";
            return temp;
        }
        try {
            tmp = URLEncoder.encode(temp);
        }
        catch (NullPointerException ex) {
            return tmp;
        }
        return tmp;
    }

    public static String Decode(String temp) {
        String tmp = "";
        if (temp == null) {
            temp = "";
            return temp;
        }
        try {
            tmp = URLDecoder.decode(temp);
        }
        catch (NullPointerException ex) {
            return tmp;
        }
        return tmp;
    }

    public static String Decode_1(String temp) {
        String tmp = "";
        String tmp2 = "";
        if (temp == null || temp.length() < 1) {
            temp = "";
            return temp;
        }
        tmp2 = temp;
        try {
            tmp = new String(temp.getBytes("8859_1"), "KSC5601");
            if (tmp.indexOf("?") > -1) {
                tmp = tmp2;
            }
        }
        catch (UnsupportedEncodingException ex) {
            return tmp;
        }
        catch (NullPointerException ex2) {
            return tmp;
        }
        return tmp;
    }

    public static String nullChk(final String temp) {
        if (temp != null) {
            return temp;
        }
        return "";
    }

    public static String nullChk(final String temp, final String defaultValue) {
        if (temp != null) {
            return temp;
        }
        return defaultValue;
    }

    public static int strLength(final String temp) {
        return getByteSize(temp);
    }

    public static int strLength(final String temp, final int maxLength) {
        final int n = strLength(temp);
        final int n_1 = temp.length();
        return maxLength - n + n_1;
    }

    public static int stringByteSize(final String str) {
        if (str == null || str.length() == 0) {
            return 0;
        }
        int size = 0;
        for (int i = 0; i < str.length(); ++i) {
            size += charByteSize(str.charAt(i));
        }
        return size;
    }

    public static int charByteSize(final char ch) {
        if (ch <= '\u007f') {
            return 1;
        }
        if (ch <= '\u07ff') {
            return 2;
        }
        if (ch <= '\uffff') {
            return 2;
        }
        return 4;
    }

    public static String makePacketStr(final String temp, final int maxLength) {
        return rpad(temp, maxLength, ' ');
    }

    public static String rpad(final String strSource, final int iLength, final char cPadder) {
        StringBuffer sbBuffer = null;
        if (isEmpty(strSource)) {
            sbBuffer = new StringBuffer();
            for (int j = 0; j < iLength; ++j) {
                sbBuffer.append(cPadder);
            }
            return sbBuffer.toString();
        }
        final int iByteSize = getByteSize(strSource);
        if (iByteSize > iLength) {
            return new String(strSource.getBytes(), 0, iLength);
        }
        if (iByteSize == iLength) {
            return strSource;
        }
        final int iPadLength = iLength - iByteSize;
        sbBuffer = new StringBuffer(strSource);
        for (int i = 0; i < iPadLength; ++i) {
            sbBuffer.append(cPadder);
        }
        return sbBuffer.toString();
    }

    public static String lpad(final String strSource, final int iLength, final char cPadder) {
        StringBuilder sbBuffer = null;
        if (isEmpty(strSource)) {
            sbBuffer = new StringBuilder();
            for (int j = 0; j < iLength; ++j) {
                sbBuffer.append(cPadder);
            }
            return sbBuffer.toString();
        }
        final int iByteSize = getByteSize(strSource);
        if (iByteSize > iLength) {
            return new String(strSource.getBytes(), 0, iLength);
        }
        if (iByteSize == iLength) {
            return strSource;
        }
        final int iPadLength = iLength - iByteSize;
        sbBuffer = new StringBuilder();
        for (int i = 0; i < iPadLength; ++i) {
            sbBuffer.append(cPadder);
        }
        sbBuffer.append(strSource);
        return sbBuffer.toString();
    }

    public static boolean isEmpty(final String strSource) {
        return strSource == null || "".equals(strSource);
    }

    public static int getByteSize(final String str) {
        if (str == null || str.length() == 0) {
            return 0;
        }
        byte[] byteArray = null;
        try {
            byteArray = str.getBytes("EUC-KR");
        }
        catch (UnsupportedEncodingException ex) {}
        if (byteArray == null) {
            return 0;
        }
        return byteArray.length;
    }

    public static String makePacketStr(String temp, final int maxLength, final String UserEncode) {
        if (temp == null) {
            temp = "";
            return temp;
        }
        final StringBuffer strBuffer = new StringBuffer();
        final String Filler = " ";
        int tempLength = 0;
        tempLength = stringByteSize(temp);
        strBuffer.append(temp);
        for (int i = tempLength; i < maxLength; ++i) {
            strBuffer.append(Filler);
        }
        return strBuffer.toString();
    }

    public static String getMakePacketStr(String temp, final int maxLength) {
        if (temp == null) {
            temp = "";
            return temp;
        }
        final StringBuffer strBuffer = new StringBuffer();
        int tempLength = 0;
        temp = trim(temp);
        tempLength = stringByteSize(temp) + temp.length();
        strBuffer.append(temp);
        return strBuffer.toString();
    }

    public static String qStrDigit(final String str) {
        if (str == null) {
            return "-1";
        }
        for (int count = strLength(str), i = 0; i < count; ++i) {
            if (str.charAt(i) < '0' || str.charAt(i) > '9') {
                return "-1";
            }
        }
        return "0000";
    }

    public static String ConvertStr(final int n) {
        String tmp = "";
        try {
            tmp = Integer.toString(n);
        }
        catch (NullPointerException ex) {
            return tmp;
        }
        return tmp;
    }

    public static String trim(final String temp) {
        String tmp = "";
        if (temp == null) {
            return tmp;
        }
        try {
            tmp = temp.trim();
        }
        catch (NullPointerException ex) {}
        return tmp;
    }

    public static String szmakeStr(String org, final int i, final String str, final String dir) {
        if (org == null) {
            org = "";
            return org;
        }
        final StringBuffer stringbuffer = new StringBuffer();
        final String s1 = str;
        int j = 0;
        j = org.length();
        if (dir.equals("right")) {
            stringbuffer.append(org);
            for (int k = j; k < i; ++k) {
                stringbuffer.append(s1);
            }
        }
        else {
            for (int k = j; k < i; ++k) {
                stringbuffer.append(s1);
            }
            stringbuffer.append(org);
        }
        return stringbuffer.toString();
    }

    public static boolean chkSSNDigit(final String ssn) {
        int total = 0;
        int result = 0;
        boolean ssn_chk = false;
        int n = 2;
        final int len = ssn.length();
        final int check = Integer.parseInt(ssn.substring(len - 1, len));
        for (int i = 0; i < len - 1; ++i) {
            if (n > 9) {
                n = 2;
            }
            total += Integer.parseInt(ssn.substring(i, i + 1)) * n;
            ++n;
        }
        result = total % 11;
        switch (result) {
            case 0: {
                result = 10;
                break;
            }
            case 1: {
                result = 11;
                break;
            }
        }
        result = 11 - result;
        if (result == check) {
            ssn_chk = true;
        }
        return ssn_chk;
    }

    public static String paddingC(final String temp, final int size) {
        final String t = strKorByteCut(temp, size, "euc-kr");
        return rpad(t, size, ' ');
    }

    public static String paddingN(final String numStr, final int size) {
        return lpad(numStr, size, '0');
    }

    public static String strKorByteCut(final String str, final int length, final String enc) {
        if (str == null) {
            return str;
        }
        final StringBuilder strBuf = new StringBuilder();
        try {
            final byte[] byteKor = str.getBytes(enc);
            if (byteKor.length <= length) {
                return str;
            }
            final int byteSize = enc.equalsIgnoreCase("euc-kr") ? 2 : 3;
            final byte[] hangle = new byte[byteSize];
            for (int i = 0; i < length; ++i) {
                if ((byteKor[i] & 0x80) == 0x80) {
                    hangle[0] = byteKor[i];
                    hangle[1] = byteKor[++i];
                    if (byteSize == 3) {
                        hangle[2] = byteKor[++i];
                    }
                    if (i < length) {
                        strBuf.append(new String(hangle, enc));
                    }
                }
                else {
                    strBuf.append((char)byteKor[i]);
                }
            }
            return strBuf.toString();
        }
        catch (Exception e) {
            e.printStackTrace();
            return str;
        }
    }
}

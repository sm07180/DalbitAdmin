package com.dalbit.payment.module.ucCancel_v0001;

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
        if (temp == null || temp.length() < 1) {
            temp = "";
            return temp;
        }
        try {
            tmp = new String(temp.getBytes("8859_1"), "KSC5601");
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

    public static int strLength(final String temp) {
        if (temp != null) {
            return temp.getBytes().length;
        }
        return 0;
    }

    public static int strLength(final String temp, final int maxLength) {
        final int n = strLength(temp);
        final int n_1 = temp.length();
        return maxLength - n + n_1;
    }

    public static String makePacketStr(String temp, final int maxLength) {
        if (temp == null) {
            temp = "";
            return temp;
        }
        final StringBuffer strBuffer = new StringBuffer();
        final String Filler = "\u0000";
        int tempLength = 0;
        tempLength = stringByteSize(temp);
        strBuffer.append(temp);
        for (int i = tempLength; i < maxLength; ++i) {
            strBuffer.append(Filler);
        }
        return strBuffer.toString();
    }

    public static String makePacketInt(final int dataLangth, final int maxLength) {
        final StringBuffer strBuffer = new StringBuffer();
        final String Filler = "0";
        int i;
        for (int digitLength = i = Integer.toString(dataLangth).length(); i < maxLength; ++i) {
            strBuffer.append(Filler);
        }
        strBuffer.append(dataLangth);
        return strBuffer.toString();
    }

    public static String trim(final String temp) {
        String tmp = "";
        if (temp == null) {
            return tmp;
        }
        try {
            tmp = temp.trim();
        }
        catch (NullPointerException ex) {
            ex.printStackTrace();
        }
        return tmp;
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

    public static String qStrDigit(final String str) {
        for (int count = strLength(str), i = 0; i < count; ++i) {
            if (str.charAt(i) < '0' || str.charAt(i) > '9') {
                return "-1";
            }
        }
        return "0000";
    }
}

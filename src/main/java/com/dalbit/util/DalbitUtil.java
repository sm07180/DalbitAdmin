package com.dalbit.util;

import com.dalbit.administrate.dao.Adm_MenuDao;
import com.dalbit.administrate.service.Adm_AuthorityService;
import com.dalbit.broadcast.vo.procedure.P_BroadcastEditInputVo;
import com.dalbit.broadcast.vo.procedure.P_GuestListInputVo;
import com.dalbit.broadcast.vo.procedure.P_ListenForceLeaveVo;
import com.dalbit.common.vo.CookieVo;
import com.dalbit.common.vo.LocationVo;
import com.dalbit.common.vo.MenuVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.main.vo.procedure.P_StatVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.member.vo.procedure.P_MemberReportVo;
import com.dalbit.member.vo.procedure.P_MemberSetting;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import okhttp3.FormBody;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.env.Environment;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Slf4j
@Component
public class DalbitUtil {

    private static Environment environment;
    private static Mem_MemberDao mem_MemberDao;
    private static Adm_MenuDao adm_MenuDao;
    private static JwtUtil jwtUtil;
    private static String SERVER_API_URL;

    @Autowired
    private Environment activeEnvironment;

    @Autowired
    private Mem_MemberDao activeMem_MemberDao;

    @Autowired
    private Adm_MenuDao active_adm_MenuDao;

    @Autowired
    private JwtUtil active_jwtUtil;

    @Value("${server.api.url}")
    private String active_SERVER_API_URL;

    @PostConstruct
    private void init () {
        environment = this.activeEnvironment;
        mem_MemberDao = this.activeMem_MemberDao;
        jwtUtil = this.active_jwtUtil;
        SERVER_API_URL = this.active_SERVER_API_URL;
        adm_MenuDao = this.active_adm_MenuDao;
    }

    private static Adm_AuthorityService admAuthorityService;
    @Autowired(required=true)
    public void setAdmAuthorityService(Adm_AuthorityService admAuthorityService) {
        this.admAuthorityService = admAuthorityService;
    }

    public static boolean isNullBlank(String checkValue) {
        return checkValue == null || "".equals(checkValue);
    }

    public static String randomValue(String type, int cnt) {
        type = type.toLowerCase();

        StringBuffer strPwd = new StringBuffer();
        char[] str = new char[1];
        int i;
        if (type.equals("p")) {
            for(i = 0; i < cnt; ++i) {
                str[0] = (char)((int)(Math.random() * 94.0D + 33.0D));
                strPwd.append(str);
            }
        } else if (type.equals("a")) {
            for(i = 0; i < cnt; ++i) {
                str[0] = (char)((int)(Math.random() * 26.0D + 65.0D));
                strPwd.append(str);
            }
        } else if (type.equals("string")) {
            for(i = 0; i < cnt; ++i) {
                str[0] = (char)((int)(Math.random() * 26.0D + 97.0D));
                strPwd.append(str);
            }
        } else {
            //int i;
            if (type.equals("number")) {
                int[] strs = new int[1];

                for(i = 0; i < cnt; ++i) {
                    strs[0] = (int)(Math.random() * 9.0D);
                    strPwd.append(strs[0]);
                }
            } else if (type.equals("c")) {
                Random rnd = new Random();

                for(i = 0; i < cnt; ++i) {
                    if (rnd.nextBoolean()) {
                        strPwd.append((char)(rnd.nextInt(26) + 97));
                    } else {
                        strPwd.append(rnd.nextInt(10));
                    }
                }
            } else if(type.equals("e")){
                char[] passwordTable =  {'!', '@', '#', '$', '%', '^', '&', '*','(', ')'};
                Random random = new Random(System.currentTimeMillis());
                for(i = 0; i < cnt; i++) {
                    strPwd.append(Character.toString(passwordTable[random.nextInt(passwordTable.length)]));
                }
            }
        }

        return strPwd.toString();
    }

    /**
     * ????????? ?????? ????????? ??????
     * @param list
     * @return
     */
    public static boolean isEmpty(List list){
        if(list == null){
            return true;
        }
        return 0 < list.size() ? false : true;
    }

    /**
     * Object ?????? ????????? ??????
     * @param object
     * @return
     */
    public static boolean isEmpty(Object object) {
        return object != null ? false : true;
    }


    /**
     * ????????? ??????
     * @param year
     * @return
     */
    public static int ageCalculation(int year){
        Calendar calendar = new GregorianCalendar(Locale.KOREA);
        int currentYear = calendar.get(Calendar.YEAR);
        int age = currentYear - year + 1;

        String integerAge = Integer.toString(age);
        String stringAge = integerAge.substring(0,1)+"0";
        age = Integer.parseInt(stringAge);

        return age;
    }

    /**
     * DalbitUtil ?????????
     */
    public DalbitUtil() {
    }

    /**
     * ????????? ????????? ????????? ??????????????? ????????????.
     * @param date ????????????
     * @return ????????????(true/false)
     */
    public static boolean isDate( String date ) {
        return isDate( date , null );
    }

    public static boolean isDate( String date , String format ) {
        if( date == null )
            return false;
        if( format == null )
            format = "yyyyMMdd";
        DateFormat df = new SimpleDateFormat( format , Locale.KOREA );
        df.setLenient( false );
        date = date.replaceAll( "\\D" , "" );
        try {
            df.parse( date );
            return true;
        }catch( ParseException pe ) {
            return false;
        }catch( Exception e ) {
            return false;
        }
    }


    /**
     * <p>
     * String??? ????????????("") ?????? null ?????? ????????????.
     * </p>
     *
     * <pre>
     *  StringUtil.isEmpty(null)      = true
     *  StringUtil.isEmpty("")        = true
     *  StringUtil.isEmpty(" ")       = false
     *  StringUtil.isEmpty("bob")     = false
     *  StringUtil.isEmpty("  bob  ") = false
     * </pre>
     *
     * @param str - ?????? ?????? ??????????????????????????? null??? ?????????
     * @return <code>true</code> - ???????????? String ??? ??? ????????? ?????? null??? ??????
     */
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    /**
     * <p>?????? ???????????? ????????? ?????? ?????? ??????(char)??? ????????????.</p>
     *
     * <pre>
     * StringUtil.remove(null, *)       = null
     * StringUtil.remove("", *)         = ""
     * StringUtil.remove("queued", 'u') = "qeed"
     * StringUtil.remove("queued", 'z') = "queued"
     * </pre>
     *
     * @param str  ???????????? ?????? ?????????
     * @param remove  ???????????? ??????????????? ????????? ?????? ?????????
     * @return ???????????? ???????????? ????????? ???????????????. ?????????????????? null??? ?????? ?????????????????? null
     */
    public static String remove(String str, char remove) throws NullPointerException{
        if (isEmpty(str) || str.indexOf(remove) == -1) {
            return str;
        }
        char[] chars = str.toCharArray();
        int pos = 0;
        for (int i = 0; i < chars.length; i++) {
            if (chars[i] != remove) {
                chars[pos++] = chars[i];
            }
        }
        return new String(chars, 0, pos);
    }


    /**
     * <p><code>str</code> ??? <code>searchStr</code>??? ??????(index) ????????? ??????.</p>
     *
     * <p>????????? ??? <code>null</code>??? ?????? ?????? <code>-1</code>??? ??????.</p>
     *
     * <pre>
     * StringUtil.indexOf(null, *)          = -1
     * StringUtil.indexOf(*, null)          = -1
     * StringUtil.indexOf("", "")           = 0
     * StringUtil.indexOf("aabaabaa", "a")  = 0
     * StringUtil.indexOf("aabaabaa", "b")  = 2
     * StringUtil.indexOf("aabaabaa", "ab") = 1
     * StringUtil.indexOf("aabaabaa", "")   = 0
     * </pre>
     *
     * @param str  ?????? ?????????
     * @param searchStr  ?????? ???????????????
     * @return ?????? ????????? ??? ?????? ?????????????????? ?????? ?????? ?????? ???????????? ???????????? ????????? null??? ?????? -1
     */
    public static int indexOf(String str, String searchStr) throws NullPointerException{
        if (str == null || searchStr == null) {
            return -1;
        }
        return str.indexOf(searchStr);
    }

    /**
     * <p>???????????? decode ????????? ????????? ????????? ?????? ???????????????.
     * <code>sourStr</code>??? <code>compareStr</code>??? ?????? ?????????
     * <code>returStr</code>??? ????????????, ?????????  <code>defaultStr</code>??? ????????????.
     * </p>
     *
     * <pre>
     * StringUtil.decode(null, null, "foo", "bar")= "foo"
     * StringUtil.decode("", null, "foo", "bar") = "bar"
     * StringUtil.decode(null, "", "foo", "bar") = "bar"
     * StringUtil.decode("??????", "??????", null, "bar") = null
     * StringUtil.decode("??????", "??????  ", "foo", null) = null
     * StringUtil.decode("??????", "??????", "foo", "bar") = "foo"
     * StringUtil.decode("??????", "??????  ", "foo", "bar") = "bar"
     * </pre>
     *
     * @param sourceStr ????????? ?????????
     * @param compareStr ?????? ?????? ?????????
     * @param returnStr sourceStr??? compareStr??? ?????? ?????? ??? ????????? ?????????
     * @param defaultStr sourceStr??? compareStr??? ?????? ?????? ??? ????????? ?????????
     * @return sourceStr??? compareStr??? ?????? ??????(equal)??? ??? returnStr??? ????????????,
     *         <br/>????????? defaultStr??? ????????????.
     */
    public static String decode(String sourceStr, String compareStr, String returnStr, String defaultStr) throws NullPointerException{
        if (sourceStr == null && compareStr == null) {
            return returnStr;
        }

        if (sourceStr == null && compareStr != null) {
            return defaultStr;
        }

        if (sourceStr.trim().equals(compareStr)) {
            return returnStr;
        }

        return defaultStr;
    }

    /**
     * <p>???????????? decode ????????? ????????? ????????? ?????? ???????????????.
     * <code>sourStr</code>??? <code>compareStr</code>??? ?????? ?????????
     * <code>returStr</code>??? ????????????, ?????????  <code>sourceStr</code>??? ????????????.
     * </p>
     *
     * <pre>
     * StringUtil.decode(null, null, "foo") = "foo"
     * StringUtil.decode("", null, "foo") = ""
     * StringUtil.decode(null, "", "foo") = null
     * StringUtil.decode("??????", "??????", "foo") = "foo"
     * StringUtil.decode("??????", "?????? ", "foo") = "??????"
     * StringUtil.decode("??????", "??????", "foo") = "??????"
     * </pre>
     *
     * @param sourceStr ????????? ?????????
     * @param compareStr ?????? ?????? ?????????
     * @param returnStr sourceStr??? compareStr??? ?????? ?????? ??? ????????? ?????????
     * @return sourceStr??? compareStr??? ?????? ??????(equal)??? ??? returnStr??? ????????????,
     *         <br/>????????? sourceStr??? ????????????.
     */
    public static String decode(String sourceStr, String compareStr, String returnStr) throws NullPointerException{
        return decode(sourceStr, compareStr, returnStr, sourceStr);
    }

    /**
     * ????????? null?????? ???????????? null??? ?????? "" ??? ????????? ?????????
     * @param object ?????? ??????
     * @return resultVal ?????????
     */
    public static String isNullToString(Object object) {
        String string = "";

        if (object != null) {
            string = object.toString().trim();
        }

        return string;
    }

    public static String convertRequestParamToString(HttpServletRequest request, String parameterName){
        if(request != null && parameterName != null){
            return DalbitUtil.isNullToString(request.getParameter(parameterName)).trim();
        }
        return "";
    }

    public static int convertRequestParamToInteger(HttpServletRequest request, String parameterName){
        try{
            return Integer.valueOf(request.getParameter(parameterName));
        }catch (Exception e){
            return -1;
        }

    }


    /**
     * <p>{@link String#toLowerCase()}??? ???????????? ???????????? ????????????.</p>
     *
     * <pre>
     * StringUtil.lowerCase(null)  = null
     * StringUtil.lowerCase("")    = ""
     * StringUtil.lowerCase("aBc") = "abc"
     * </pre>
     *
     * @param str ???????????? ??????????????? ??? ?????????
     * @return ???????????? ????????? ?????????, null??? ???????????? <code>null</code> ??????
     */
    public static String lowerCase(String str) {
        if (str == null) {
            return null;
        }

        return str.toLowerCase();
    }

    /**
     * <p>{@link String#toUpperCase()}??? ???????????? ???????????? ????????????.</p>
     *
     * <pre>
     * StringUtil.upperCase(null)  = null
     * StringUtil.upperCase("")    = ""
     * StringUtil.upperCase("aBc") = "ABC"
     * </pre>
     *
     * @param str ???????????? ??????????????? ??? ?????????
     * @return ???????????? ????????? ?????????, null??? ???????????? <code>null</code> ??????
     */
    public static String upperCase(String str) {
        if (str == null) {
            return null;
        }

        return str.toUpperCase();
    }




    /**
     * ??????????????? ??? ?????????????????? ??????????????? ????????? ?????? ??????????????? ??????('<' -> & lT)?????? ????????????
     * @param 	srcString 		- '<'
     * @return 	???????????????('<' -> "&lt"
     * @exception NullPointerException
     * @see
     */
    public static String getSpclStrCnvr(String srcString) throws NullPointerException{

        String rtnStr = null;

        try {
            StringBuffer strTxt = new StringBuffer("");

            char chrBuff;
            int len = srcString.length();

            for (int i = 0; i < len; i++) {
                chrBuff = (char) srcString.charAt(i);

                switch (chrBuff) {
                    case '<':
                        strTxt.append("&lt;");
                        break;
                    case '>':
                        strTxt.append("&gt;");
                        break;
                    case '&':
                        strTxt.append("&amp;");
                        break;
                    default:
                        strTxt.append(chrBuff);
                }
            }

            rtnStr = strTxt.toString();

        } catch (NullPointerException e) {
            return srcString;
        }

        return rtnStr;
    }

    /**
     * ?????????????????????????????? ???????????? ???????????? ?????? ???????????????17?????????TIMESTAMP?????? ????????? ??????
     *
     * @param
     * @return Timestamp ???
     * @see
     */
    public static String getTimeStamp() {

        String rtnStr = null;

        // ???????????? ???????????? ?????? ?????? ??????(??????-???-??? ???:???:???:???(???????????? ???))
        String pattern = "yyyyMMddhhmmssSSS";

        SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, LocaleContextHolder.getLocale());
        Timestamp ts = new Timestamp(System.currentTimeMillis());

        rtnStr = sdfCurrent.format(ts.getTime());

        return rtnStr;
    }



    public static String getStringMap(HashMap map, String key){
        try{
            return map.get(key).toString();
        }catch (Exception e){
            log.debug("StringUtil.getStringMap error - key name is [{}]", key);
            return "";
        }
    }

    public static int getIntMap(HashMap map, String key) {
        try{
            return Integer.valueOf(getStringMap(map, key));
        }catch (Exception e){
            log.debug("StringUtil.getIntMap error - key name is [{}]", key);
            return 0;
        }
    }

    public static Double getDoubleMap(HashMap map, String key){
        try{
            return Double.valueOf(getStringMap(map, key));
        }catch (Exception e){
            log.debug("StringUtil.getDoubleMap error - key name is [{}]", key);
            return 0.0;
        }
    }

    public static boolean getBooleanMap(HashMap map, String key) {
        try{
            return Boolean.valueOf(getStringMap(map, key));
        }catch (Exception e){
            log.debug("StringUtil.getBooleanMap error - key name is [{}]", key);
            return false;
        }
    }

    public static String getProperty(String key){
        return environment.getProperty(key);

    }

    public static boolean isLogin(){
        return !("anonymousUser".equals(MemberVo.getMyMemNo()) || MemberVo.getMyMemNo().startsWith("8"));
    }


    /**
     * IP ?????? ????????????
     */
    public static String getIp(HttpServletRequest request){
        String clientIp = request.getHeader("Proxy-Client-IP");
        if (clientIp == null) {
            clientIp = request.getHeader("WL-Proxy-Client-IP");
            if (clientIp == null) {
                clientIp = request.getHeader("X-Forwarded-For");
                if (clientIp == null) {
                    clientIp = request.getRemoteAddr();
                }
            }
        }
        return clientIp;
    }

    /**
     * ????????????, ??????, ?????? ????????????
     */
    public static LocationVo getLocation(HttpServletRequest request){

        return getLocation(getIp(request));
    }
    /**
     * ????????????, ??????, ?????? ????????????
     */
    public static LocationVo getLocation(String ip){

        String apiResult = RestApiUtil.sendGet(getProperty("geo.location.server.url") + ip);
        LocationVo locationVo = new LocationVo();
        try {
            locationVo = new Gson().fromJson(apiResult, LocationVo.class);
        }catch (Exception e){
            locationVo.setRegionName("????????????");
        }

        return locationVo;
    }
    /**
     * ????????? path ?????? ??????
     */
    public static String replacePath(String path){
        return path.replace("/temp", "");
    }

    /**
     * UTC ??? ??????
     *
     * @param dt
     * @return
     */
    public static LocalDateTime getUTC(Date dt){
        return LocalDateTime.ofInstant(dt.toInstant(), ZoneId.of("UTC"));
    }

    /**
     * UTC?????? ?????? ?????? ??????
     *
     * @param dt
     * @return
     */
    public static String getUTCFormat(Date dt){
        return getUTC(dt).format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
    }

    public static String convertDateFormat(Date date, String format){
        format = isEmpty(format) ? "yyyyMMddHHmmss" : format;

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
        return simpleDateFormat.format(date);
    }

    /**
     * UTC?????? ??????????????? ??????
     *
     * @param dt
     * @return
     */
    public static long getUTCTimeStamp(Date dt){
        return Timestamp.valueOf(getUTC(dt)).getTime() / 1000;
    }

    /**
     * ????????? ??????
     * @return
     */
    public static Collection<GrantedAuthority> getAuthorities(){
        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        return authorities;
    }

    public static Collection<GrantedAuthority> getGuestAuthorities(){
        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_ANONYMOUS"));
        return authorities;
    }

    public static boolean isEmptyHeaderAuthToken(String header){
        return isEmpty(header) || "undefined".equals(header);
    }

    public static boolean isAnonymousUser(Object principal){
        return isEmpty(principal) || "anonymousUser".equals(principal);
    }

    public static String getActiveProfile(){
        return environment.getActiveProfiles()[0];
    }

    public static String setTimestampInJsonOutputVo(){
        StringBuffer sb = new StringBuffer();
        sb.append(getTimeStamp());

        sb.append("_");
        sb.append(getActiveProfile());
        return sb.toString();
    }

    public static CookieVo parseCookie(String cookieString){

        CookieVo cookieVo = new CookieVo();

        String[] cookieGubun = cookieString.split(";");


        for (String cookieSlice : cookieGubun) {
            String[] temp = cookieSlice.split("=");
            if(temp[0].trim().equals("path")){
                cookieVo.setPath(temp[1]);
            }else if(temp[0].trim().equals("domain")){
                cookieVo.setDomain(temp[1]);
            }else{
                cookieVo.setKey(temp[0]);
                cookieVo.setValue(temp[1]);
            }
        }

        log.info(cookieVo.toString());
        return cookieVo;
    }

    public static List<CookieVo> parseCookieList(ArrayList<String> cookieStringList){
        ArrayList cookieList = new ArrayList<CookieVo>();
        cookieStringList.forEach(cookieString -> {
            cookieList.add(parseCookie(cookieString));
        });
        return cookieList;
    }

    /**
     * ??????????????? ?????? ?????? ??????
     */
    public static String randomBgValue() {
        StringBuffer strPwd = new StringBuffer();
        int[] strs = new int[1];
        for (int i = 0; i < 1; ++i) {
            strs[0] = (int) (Math.random() * 5.0D);
            strPwd.append(strs[0]);
        }
        return strPwd.toString();
    }

    /**
     * ??????????????? ?????? ?????? ??????
     */
    public static String randomClipImgValue() {
        StringBuffer bf = new StringBuffer();
        String[] num = {"0","1"};
        ArrayList<String> list = new ArrayList<>(Arrays.asList(num));
        if(list != null) {
            for(int i=0; i<list.size(); i++) {
                list.get(i);
            }
        }
        Collections.shuffle(list);

        String[] num_ = list.toArray(new String[list.size()]);
        bf.append(num_[0]);
        return bf.toString();
    }

    /**
     * ????????? ????????? ??????
     */
    public static boolean isSmsPhoneNoChk(String phoneNo){
        return phoneNo.matches("(01[016789])(\\d{3,4})(\\d{4})");
    }

    public static List<MenuVo> getMenuList(){
        return admAuthorityService.getLnbMemberAuthInfo(MemberVo.getUserInfo().getEmp_no());
    }

    public static String convertPhoneNo(String phoneNo){
        return phoneNo.replaceFirst("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
    }

    public static String convertJuminNo(String phoneNo){
        return phoneNo.replaceFirst("(\\d{6})(\\d{7})", "$1-$2");
    }

    /**
     * ???????????? ?????? ????????????
     */
    public static String getUserAgent(HttpServletRequest request){
        String userAgent  = request.getHeader("User-Agent");
        String browser;
        if (userAgent .indexOf("MSIE") > -1 || userAgent .indexOf("Trident") > -1) {
            browser = "MSIE";
        } else if (userAgent .indexOf("Opera") > -1) {
            browser =  "Opera";
        } else if (userAgent .indexOf("Firefox") > -1) {
            browser = "Firefox";
        } else if (userAgent .indexOf("Chrome") > -1) {
            browser = "Chrome";
        } else if (userAgent .indexOf("Safari") > -1) {
            browser = "Safari";
        }else {
            browser = "Firefox";
        }
        return browser;
    }


    /**
     *  ???????????? ?????????
     */
    public static String uniDecode(String uni){
        StringBuffer str = new StringBuffer();
        for( int i= uni.indexOf("\\u") ; i > -1 ; i = uni.indexOf("\\u") ){// euc-kr(%u), utf-8(//u)
            str.append( uni.substring( 0, i ) );
            str.append( String.valueOf( (char)Integer.parseInt( uni.substring( i + 2, i + 6 ) ,16) ) );
            uni = uni.substring( i +6);
        }
        str.append( uni );
        return str.toString();
    }

    /**
     *  sql lpad ?????? ??????
     */
    public static String lpad(String str, int len, String addStr) {
        String result = str;
        int templen   = len - result.length();

        for (int i = 0; i < templen; i++){
            result = addStr + result;
        }
        return result;
    }

    public static String exceptionUser(){
        String name = "??????";
        return name;
    }

    /**
     *  ?????? Pattern ????????? ?????? ???????????? ??????
     */
    public static String getDate(String pattern) {
        SimpleDateFormat formatter = new SimpleDateFormat(pattern, LocaleContextHolder.getLocale());
        Calendar cal = Calendar.getInstance();
        return formatter.format(cal.getTime());
    }

    /**
     * 1000 ?????? ??????
     */
    public static String comma(int number){
        String str = String.format("%,d", number);
        return str;
    }


    /**
     *  ?????????????????? yyyy-MM-dd HH:mm:ss ??????
     */
    public static String stringToDate(String str) throws ParseException {
        Date date  = new SimpleDateFormat("yyyyMMddHHmmss").parse(str);
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return fmt.format(date);
    }


    /**
     * ???????????? ??????
     */
    public static String getPayWayConvert(String str){
        if (str.equals("CN")) {
            str = "????????????";
        } else if (str.equals("MC")) {
            str = "?????????";
        } else if (str.equals("VA")) {
            str = "????????????";
        } else if (str.equals("InApp")) {
            str = "??????(IOS)";
        } else if (str.equals("InAppAos")) {
            str = "??????(AOS)";
        } else if (str.equals("InAppOneStore")) {
            str = "????????????(AOS)";
        } else if (str.equals("GM")) {
            str = "???????????????";
        } else if (str.equals("HM")) {
            str = "?????????????????????";
        } else if (str.equals("cashbee")) {
            str = "?????????";
        } else if (str.equals("tmoney")) {
            str = "?????????";
        } else if (str.equals("payco")) {
            str = "?????????";
        } else if (str.equals("kakaopay")) {
            str = "???????????????";
        } else if (str.equals("GG")) {
            str = "???????????????(??????)";
        } else if (str.equals("GC")) {
            str = "?????????????????????";
        } else if (str.equals("kakaoMoney")) {
            str = "???????????????(??????)";
        } else {
            str = "-";
        }
        return str;
    }


    /**
     * ????????? ??????
     */
    public static String getPlatformConvert(int os){
        String platform="";
        if(os == 1){
            platform = "AOS";
        } else if (os == 2) {
            platform = "IOS";
        } else if (os == 3) {
            platform = "PC";
        } else {
            platform = "-";
        }
        return platform;
    }

    public static String convertInternationalPhone(String phone, String prefix){
        phone = phone.replaceAll("-", "");
        if(!isSmsPhoneNoChk(phone)){
            return null;
        }

        if(!phone.startsWith("01")){
            return null;
        }

        return prefix + phone.substring(1);
    }

    public static String randomValueDatetime(int suffixCnt){
        SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddHHmmssSSS");
        String dataFormat = sdf.format(new Date());

        return dataFormat + randomValue("number", suffixCnt);
    }

    /*
     * ?????? ???????????? ??????
     */
    public static MemberVo getMemInfo(String mem_no){
        MemberVo memInfoOutVo = mem_MemberDao.getMemberInfo(mem_no);
        return memInfoOutVo;
    }


    public static String convertNumberType(int data){
        return NumberFormat.getInstance().format(data);
    }

    public static HashMap<String, String> getPreviousDate(P_StatVo pStatVo){

        HashMap<String, String> map = new HashMap<>();

        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy.MM.dd");
        // ?????????
        int sYear  = Integer.parseInt(pStatVo.getStartDate().substring(0, 4));
        int sMonth = Integer.parseInt(pStatVo.getStartDate().substring(5, 7));
        int sDay = Integer.parseInt(pStatVo.getStartDate().substring(8, 10));
        Calendar sCal = Calendar.getInstance();
        sCal.set(sYear, sMonth - 1, sDay);

        // ?????????
        int eYear  = Integer.parseInt(pStatVo.getEndDate().substring(0, 4));
        int eMonth = Integer.parseInt(pStatVo.getEndDate().substring(5, 7));
        int eDay = Integer.parseInt(pStatVo.getEndDate().substring(8, 10));
        Calendar eCal = Calendar.getInstance();
        eCal.set(eYear, eMonth - 1, eDay);

        // ?????? ?????????
        if(pStatVo.getSlctType() == 0){ // ?????????
            sCal.add(Calendar.DATE, -1);     // ?????? ???
            eCal.add(Calendar.DATE, -1);     // ?????? ???
        }else if(pStatVo.getSlctType() == 1){   //?????????
            sCal.add(Calendar.MONTH, -1);    // ?????? ???
            eCal.add(Calendar.MONTH, -1);    // ?????? ???
        }else if(pStatVo.getSlctType() == 2){   // ?????????
            sCal.add(Calendar.YEAR, -1);     // 1??? ???
            eCal.add(Calendar.YEAR, -1);     // 1??? ???
        }
        String sDate = dateFormatter.format(sCal.getTime());
        String eDate;
        if(pStatVo.getSlctType() == 0) { // ?????????
            eDate = sDate;
        }else{
            eDate = eCal.get(Calendar.YEAR) + "." + DalbitUtil.lpad(String.valueOf(eCal.get(Calendar.MONTH) + 1), 2, "0") + "." + eCal.getActualMaximum(Calendar.DAY_OF_MONTH);
        }

        map.put("sDate",sDate);
        map.put("eDate",eDate);

        return map;
    }

    /**
     * PUSH/?????? ?????? ?????? ??????
     *
     * TRUE : ??????
     * FALSE : ??????
     *
     * */
    public static boolean isMemberPushRejection(String mem_no, String pushType){
        if(isEmpty(mem_no)){return true;}

        P_MemberSetting setting =  mem_MemberDao.getMemberSetting(mem_no);

        if(isEmpty(setting)){return true;}

        int type = Integer.parseInt(pushType);
        if(type == 11){ // DJ?????? ??????
            return setting.getSet_1() == 0;
        }else if(type == 18){   // DJ ???????????? ??????
            return setting.getSet_2() == 0;
        }else if(type == 16){   //??? ??????
            return setting.getSet_3() == 0;
        }else if(type == 17){   //????????? ??????
            return setting.getSet_4() == 0;
        }else if(type == 15 || type == 61){ //?????? ??????
            return setting.getSet_5() == 0;
        }else if(type == 60){      // 1:1 ?????? ?????? ??????
            return setting.getSet_6() == 0;
        }else if(type == 51 || type == 59 || type == 92 || type == 93 || type == 94 ) {     // ????????? ??????
            return setting.getSet_7() == 0;
        }else{     // ??????
            return setting.getAll_ok() == 0;
        }
    }

    public static String escapeCharDecode(String data){
        if(isEmpty(data)){
            return "";
        }
        data = StringUtils.replace(data, "\\\\n", "\\n");
        data = StringUtils.replace(data, "\\\\r", "\\r");
        data = StringUtils.replace(data, "\\\\t", "\\t");
        data = StringUtils.replace(data, "\\\\/", "\\/");
        data = StringUtils.replace(data, "\\\\'", "\\'");
        //data = StringUtils.replace(data, "\\\\\"", "\\\"");
        return data;
    }


    /**
     * CORS ????????? ?????? Response ?????? ??????
     * @param request
     * @param response
     */
    public static void setHeader(HttpServletRequest request, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, DELETE, OPTIONS");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Origin,Accept,X-Requested-With,Content-Type,Access-Control-Request-Method,Access-Control-Request-Headers,Authorization,"+DalbitUtil.getProperty("sso.header.cookie.name")+","+DalbitUtil.getProperty("rest.custom.header.name")+",redirectUrl,Proxy-Client-IP,WL-Proxy-Client-IP,X-Forwarded-For");
        response.setHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
        response.setHeader("Access-Control-Allow-Credentials", "true");
    }

    /**
     * ?????????DJ ?????? ???????????? ??????
     * @param star
     * @param isSpecial
     * @return
     */
    public static long computeExchangeAmt(long star, int isSpecial){

        long cashBasic = star * 60;
        long specialBenefit = 0;

        //?????????DJ ??????
        if(isSpecial == 1){
            specialBenefit = (long) (Math.floor(cashBasic * 0.005) * 10);
        }

        long sum = cashBasic + specialBenefit;

        long incomeTax = (long) (Math.floor(sum * 0.003) * 10);
        long residentTax = (long) (Math.floor(incomeTax * 0.01) * 10);
        long taxCash = incomeTax + residentTax; //??????????????????
        long feeCash = 500; //???????????????

        long total = sum - taxCash - feeCash;

        return total;
    }

    /**
     *  unique??? ??????????????? ?????? ???????????? (????????????????????? ??????)
     */
    public static String getTradeId(String serviceId){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
        String appr_dtm =serviceId + "_" + dateFormat.format(new Date());
        return appr_dtm;
    }

    /**
     * String to Date ????????????
     */
    public static String stringToDatePattern(String str, String beforePattern, String afterPattern) throws ParseException{
        SimpleDateFormat beForeFormat = new SimpleDateFormat(beforePattern);
        Date beforeDate = beForeFormat.parse(str);
        SimpleDateFormat afterFormat = new SimpleDateFormat(afterPattern);
        return afterFormat.format(beforeDate);
    }

    public static String timeStampDay(int timeSecond){

        try {
            if(timeSecond <= 0){
                return "";
            }

            int day = (int) Math.floor(timeSecond / 60 / 60 / 24);
            int day_s = day * 60 * 60 * 24;
            int hours_s = timeSecond - (day_s);
            int hours = (int) Math.floor(hours_s / 60 / 60);
            int minutes_s = timeSecond - (day_s + (hours * 60 * 60));
            int minutes = (int) Math.floor(minutes_s / 60);

            String timeData = "";
            if(day != 0){
                timeData = day + "??? " + hours  + "??????";
            }else{
                if(hours != 0){
                    timeData = hours  + "?????? " + minutes + "???";
                }else{
                    timeData = minutes + "???";
                }
            }

            return timeData;
        }catch (Exception e){
            return timeSecond + "";
        }
    }
}

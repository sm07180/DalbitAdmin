package com.dalbit.customer.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_QuestionListOutputVo extends BaseVo {

    private int qnaIdx;
    private String mem_no;
    private String mem_userid;
    private String mem_nick;
    private String mem_sex;
    private String mem_birth_year;
    private String mem_birth_month;
    private String mem_birth_day;
    private String mem_phone;
    private int mem_level;
    private String mem_grade;
    private int slct_type;
    private String question_title;
    private String question_contents;
    private String add_file1;
    private String file_name1;
    private String add_file2;
    private String file_name2;
    private String add_file3;
    private String file_name3;
    private String fileCnt;
    private String phone;
    private String email;
    private String answer;
    private int state;
    private int inner;
    private String platform;
    private String browser;
    private String ip;
    private String op_name;
    private Date op_date;
    private String opDateFormat;
    private Date write_date;
    private String writeDateFormat;
    private String adminMemoCnt;
    private String nick_name;
    private String mem_state;

    private int totalQnaCnt;
    private int totalOpCnt;

    private int totalCnt;
    private int pageNo;
    private int pageCnt;
    private int totalQna;
    private int type1Cnt;
    private int type2Cnt;
    private int type3Cnt;
    private int type4Cnt;
    private int type5Cnt;
    private int type6Cnt;
    private int type7Cnt;
    private int type99Cnt;

    private int no_totalQna;
    private int no_type1Cnt;
    private int no_type2Cnt;
    private int no_type3Cnt;
    private int no_type4Cnt;
    private int no_type5Cnt;
    private int no_type6Cnt;
    private int no_type7Cnt;
    private int no_type99Cnt;

    public void setWrite_date(Date write_date) {
        this.write_date = write_date;
        this.writeDateFormat = DalbitUtil.convertDateFormat(write_date, "yyyy.MM.dd HH:mm:ss");
    }
    public void setOp_date(Date op_date) {
        this.op_date = op_date;
        this.opDateFormat = DalbitUtil.convertDateFormat(op_date, "yyyy.MM.dd HH:mm:ss");
    }
}

package com.dalbit.money.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ResourceInfoOutVo {

    private long sum_join_cnt;
    private long sum_levelup_cnt;
    private long sum_charge_cnt;
    private long sum_cancel_cnt;
    private long sum_itemgift_cnt;
    private long sum_change_cnt;
    private long sum_attendance_cnt;
    private long sum_event_cnt;
    private long sum_block_cnt;
    private long sum_withdrawal_cnt;
    private long sum_mem_total_cnt;
    private long sum_op_charge_cnt;
    private long sum_op_cancel_cnt;
    private long sum_op_gift_cnt;
    private long sum_op_change_cnt;
    private long sum_op_admin_cnt;
    private long sum_op_test_in_cnt;
    private long sum_op_test_out_cnt;
    private long sum_op_attendance_cnt;
    private long sum_op_event_cnt;
    private long sum_op_total_cnt;
    private long total_use_dal;
    private long total_exist_dal;


    private long sum_gift_cnt;
    private long sum_exchange_cnt;
    private long total_use_byeol;
    private long total_exist_byeol;

}

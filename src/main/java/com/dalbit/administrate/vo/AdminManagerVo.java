package com.dalbit.administrate.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminManagerVo {
    // tb_admin_test_account에서 뽑아낼 mem_no 변수
    String mem_no;
    int is_admin;

    // tb_member_broadcast_manager에 insert 할 변수
    String manager_mem_no;
    String control;
    String last_upd_date;


}

package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class AmountVo {
    private Integer total, tax_free, vat, point, discount;
}

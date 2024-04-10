package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CouponAddPojo {

    private String title;
    private String coupon_code;
    private int coupon_type;
    private String start_date;
    private String end_date;
    private int discount;
    private int discount_type;
    private int minimum_shopping;
    private int maximum_discount;
    private int is_expire;
    private int is_multiple_buy;
}

package cn.second_hand.cart.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    public static String currentDatetime() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
        return format.format(new Date());
    }
}

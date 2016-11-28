package model;

import java.util.Date;

/**
 * Created by dell on 24-Nov-16.
 */
public interface Notification {
    void setOrder(Order order);
    Order getOrder();

    void setFirst(Date first);
    Date getFirst();

    void setSecond(Date second);
    Date getSecond();

    void setThird(Date third);
    Date getThird();

}

package model;

/**
 * Created by Vic on 24-Nov-16.
 */
public interface OrderStatus {
    /**
     * @param code  - for programming
     */
    void setCode(String code);
    String getCode();

    /**
     * @param name  - for interface
     */
    void setName(String name);
    String getName();
}

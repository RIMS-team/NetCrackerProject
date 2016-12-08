package service.templates;

import model.Employee;
import model.Order;
import model.OrderStatus;
import model.User;

import java.util.Date;
import java.util.List;

/**
 * Created by Elina on 01.12.2016.
 */
 public interface UIServiceTempl {
     List<Employee> getListEmployeesInventory(boolean empFilter, int invFilter); // emplFilter - all or only debtors
                                                                                       // invFilter - inventory type

     List<List> getPagesFromEmployeesList(List<Employee> list, int rowNum);

     List<Order> getListOrdersNotifications(User user, Employee employee, Date startDate, Date endDate,
                                                  OrderStatus orderStatus, int notificationType);

     List<List> getPagesFromOrdersList(List<Order> list, int rowNum);
}

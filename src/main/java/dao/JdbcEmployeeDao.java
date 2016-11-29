package dao;

import model.Employee;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by netcracker on 29.11.2016.
 */
public class JdbcEmployeeDao implements EmployeeDao {

    private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public void insert(Employee employee) {

//        String sql = "INSERT INTO Employee " +
//                "(EMPLOYEE_ID,PHONENUMBER,FULLNAME,EMAIL) VALUES (?, ?, ?, ?)";
        String sql = "INSERT ALL\n" +
                "  INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) VALUES (28,NULL,1,'Кристина',NULL)\n" +
                "  INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE,VALUE_ID)VALUES (1,28,'Кристина',null,null)\n" +
                "  INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE,VALUE_ID)VALUES (2,28,'kristina@gmail.com',null,null)\n" +
                "  INTO ATTRIBUTES (ATTR_ID,OBJECT_ID,VALUE,DATE_VALUE,VALUE_ID)VALUES (3,28,'0941232323',null,null)\n" +
                "SELECT * FROM dual;";

        Connection conn = null;

        try {
            conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, employee.getId());
//            ps.setInt(2, employee.getPhoneNumber());
//            ps.setString(3, employee.getFullName());
//            ps.setString(4, employee.geteMail());
            ps.executeUpdate();
            ps.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                }
            }
        }

    }

    @Override
    public Employee findByEmployeeId(int employeeId) {

//        String sql = "SELECT * FROM employees WHERE employee_ID = ?";
        String sql = "SELECT EMP.OBJECT_ID AS EMPLOYEE_ID, PHONE_ATTR.VALUE AS PHONE_NUMBER, FNAME_ATTR.VALUE AS FULL_NAME, EMAIL_ATTR.VALUE AS EMAIL\n" +
                "FROM OBJECTS EMP, ATTRIBUTES FNAME_ATTR, ATTRIBUTES EMAIL_ATTR, ATTRIBUTES PHONE_ATTR\n" +
                "WHERE EMP.OBJECT_TYPE_ID = 1 /* EMPLOYEE */\n" +
                "AND EMP.OBJECT_ID = FNAME_ATTR.OBJECT_ID\n" +
                "AND EMP.OBJECT_ID = EMAIL_ATTR.OBJECT_ID\n" +
                "AND EMP.OBJECT_ID = PHONE_ATTR.OBJECT_ID\n" +
                "AND FNAME_ATTR.ATTR_ID = 1 /* FULL_NAME */\n" +
                "AND EMAIL_ATTR.ATTR_ID = 2 /* EMAIL */\n" +
                "AND PHONE_ATTR.ATTR_ID = 3 /* PHONE_NUMBER */\n" +
                "AND EMP.OBJECT_ID = ?;";

        Connection conn = null;

        try {
            conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, employeeId);
            Employee employee = null;
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                employee = new Employee(
                        rs.getInt("employee_ID"),
                        rs.getInt("phone_number"),
                        rs.getString("fullname"),
                        rs.getString("email")
                );
            }
            rs.close();
            ps.close();
            return employee;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public List<Employee> findAllEmployee() {

//        String sql = "SELECT * FROM employees WHERE employee_ID = ?";
        String sql = "SELECT EMP.OBJECT_ID AS EMPLOYEE_ID, PHONE_ATTR.VALUE AS PHONE_NUMBER, FNAME_ATTR.VALUE AS FULL_NAME, EMAIL_ATTR.VALUE AS EMAIL\n" +
                "FROM OBJECTS EMP, ATTRIBUTES FNAME_ATTR, ATTRIBUTES EMAIL_ATTR, ATTRIBUTES PHONE_ATTR\n" +
                "WHERE EMP.OBJECT_TYPE_ID = 1 /* EMPLOYEE */\n" +
                "AND EMP.OBJECT_ID = FNAME_ATTR.OBJECT_ID\n" +
                "AND EMP.OBJECT_ID = EMAIL_ATTR.OBJECT_ID\n" +
                "AND EMP.OBJECT_ID = PHONE_ATTR.OBJECT_ID\n" +
                "AND FNAME_ATTR.ATTR_ID = 1 /* FULL_NAME */\n" +
                "AND EMAIL_ATTR.ATTR_ID = 2 /* EMAIL */\n" +
                "AND PHONE_ATTR.ATTR_ID = 3; /* PHONE_NUMBER */";

        Connection conn = null;

        try {
            conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<Employee> list=new ArrayList();
            if (rs.next()) {
                Employee employee = new Employee(
                        rs.getInt("employee_ID"),
                        rs.getInt("phone_number"),
                        rs.getString("fullname"),
                        rs.getString("email")
                );
                list.add(employee);
            }
            rs.close();
            ps.close();
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                }
            }
        }
    }
}


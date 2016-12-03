package dao;

import dao.Mappers.EmployeeMapper;
import model.Employee;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Created by netcracker on 29.11.2016.
 */
public class JdbcEmployeeTemplate implements EmployeeDao {

    private DataSource dataSource;
    private JdbcTemplate jdbcTemplateObject;
    private PlatformTransactionManager transactionManager;


    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplateObject = new JdbcTemplate(dataSource);
    }

    public void setTransactionManager(PlatformTransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }

    @Override
    //пока не трогать
    public void insert(Employee employee) {
//
//        String sql = "INSERT INTO Employee " +
//                "(EMPLOYEE_ID,PHONENUMBER,FULLNAME,EMAIL) VALUES (?, ?, ?, ?)";
//        Connection conn = null;
//        Locale.setDefault(new Locale("es","ES"));
//        try {
//            conn = dataSource.getConnection();
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, employee.getId());
//            ps.setInt(2, employee.getPhoneNumber());
//            ps.setString(3, employee.getFullName());
//            ps.setString(4, employee.geteMail());
//            ps.executeUpdate();
//            ps.close();
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//
//        } finally {
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (SQLException e) {
//                }
//            }
//        }

    }
    @Override
    public Employee findByEmployeeId(int employeeId) {
        Locale.setDefault(Locale.ENGLISH);
        TransactionDefinition def = new DefaultTransactionDefinition();
        TransactionStatus status = transactionManager.getTransaction(def);
        Employee employee=null;
        try {
            String sql = "SELECT EMP.OBJECT_ID AS EMPLOYEE_ID, PHONE_ATTR.VALUE AS PHONE_NUMBER, FNAME_ATTR.VALUE AS FULL_NAME, EMAIL_ATTR.VALUE AS EMAIL\n" +
                    "FROM OBJECTS EMP, ATTRIBUTES FNAME_ATTR, ATTRIBUTES EMAIL_ATTR, ATTRIBUTES PHONE_ATTR\n" +
                    "WHERE EMP.OBJECT_TYPE_ID = 1 /* EMPLOYEE */\n" +
                    "AND EMP.OBJECT_ID = FNAME_ATTR.OBJECT_ID\n" +
                    "AND EMP.OBJECT_ID = EMAIL_ATTR.OBJECT_ID\n" +
                    "AND EMP.OBJECT_ID = PHONE_ATTR.OBJECT_ID\n" +
                    "AND FNAME_ATTR.ATTR_ID = 1 /* FULL_NAME */\n" +
                    "AND EMAIL_ATTR.ATTR_ID = 2 /* EMAIL */\n" +
                    "AND PHONE_ATTR.ATTR_ID = 3 /* PHONE_NUMBER */\n" +
                    "AND EMP.OBJECT_ID = ?";
            employee = jdbcTemplateObject.queryForObject(sql,
                    new Object[]{employeeId}, new EmployeeMapper());
        }catch (DataAccessException e) {
            System.out.println("Error in select record, rolling back");
            transactionManager.rollback(status);
            throw e;
        }
        return employee;
    }

    @Override
    public List<Employee> findAllEmployee() {
        Locale.setDefault(Locale.ENGLISH);
        TransactionDefinition def = new DefaultTransactionDefinition();
        TransactionStatus status = transactionManager.getTransaction(def);

        String sql="SELECT EMP.OBJECT_ID AS EMPLOYEE_ID, PHONE_ATTR.VALUE AS PHONE_NUMBER, FNAME_ATTR.VALUE AS FULL_NAME, EMAIL_ATTR.VALUE AS EMAIL\n" +
                "FROM OBJECTS EMP, ATTRIBUTES FNAME_ATTR, ATTRIBUTES EMAIL_ATTR, ATTRIBUTES PHONE_ATTR\n" +
                "WHERE EMP.OBJECT_TYPE_ID = 1 /* EMPLOYEE */\n" +
                "AND EMP.OBJECT_ID = FNAME_ATTR.OBJECT_ID\n" +
                "AND EMP.OBJECT_ID = EMAIL_ATTR.OBJECT_ID\n" +
                "AND EMP.OBJECT_ID = PHONE_ATTR.OBJECT_ID\n" +
                "AND FNAME_ATTR.ATTR_ID = 1 /* FULL_NAME */\n" +
                "AND EMAIL_ATTR.ATTR_ID = 2 /* EMAIL */\n" +
                "AND PHONE_ATTR.ATTR_ID = 3 ";
        List <Employee> employees=null;
        try {
        employees = jdbcTemplateObject.query(sql,
                new EmployeeMapper());
    }catch (DataAccessException e) {
        System.out.println("Error in select record, rolling back");
        transactionManager.rollback(status);
        throw e;
    }
        return employees;
    }
}


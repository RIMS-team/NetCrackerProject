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

        String sql = "INSERT INTO Employee " +
                "(EMPLOYEE_ID,PHONENUMBER,FULLNAME,EMAIL) VALUES (?, ?, ?, ?)";
        Connection conn = null;

        try {
            conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, employee.getId());
            ps.setInt(2, employee.getPhoneNumber());
            ps.setString(3, employee.getFullName());
            ps.setString(4, employee.geteMail());
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

        String sql = "SELECT * FROM employees WHERE employee_ID = ?";

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

        String sql = "SELECT * FROM employees WHERE employee_ID = ?";

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


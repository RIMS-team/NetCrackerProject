package dao.Mappers;

import model.Employee;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Admin on 03.12.2016.
 */
public class EmployeeMapper implements RowMapper<Employee> {
    public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
        Employee employee = new Employee(
                rs.getInt("EMPLOYEE_ID"),
                rs.getInt("PHONE_NUMBER"),
                rs.getString("FULL_NAME"),
                rs.getString("EMAIL")
        );
        return employee;
    }
}

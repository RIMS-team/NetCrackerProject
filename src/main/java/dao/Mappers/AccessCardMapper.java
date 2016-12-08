package dao.Mappers;

import model.AccessCard;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Kristina on 05.12.2016.
 */
public class AccessCardMapper implements RowMapper<AccessCard> {

    public AccessCard mapRow(ResultSet rs, int rowNum) throws SQLException {
        AccessCard accessCard = new AccessCard(
                rs.getInt("OBJECT_ID"),
                rs.getString("CARD_STATUS"),
                rs.getString("CARD_ID")
        );
        return accessCard;
    }
}

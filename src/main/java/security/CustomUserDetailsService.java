package security;

import dao.impl.JdbcUser;
import model.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * Created by trvler135 on 06.12.2016.
 */
public class CustomUserDetailsService implements UserDetailsService {

    ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException{
        JdbcUser jdbcUser = (JdbcUser) context.getBean("userDAO");
        User user = jdbcUser.findByEmail(email);
        return new org.springframework.security.core.userdetails.User(
                user.geteMail(),
                user.getPassword(),
                AuthorityUtils.createAuthorityList("ROLE_USER"));
    }

}

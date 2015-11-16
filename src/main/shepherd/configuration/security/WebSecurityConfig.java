package configuration.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import util.enums.RoleType;

import javax.sql.DataSource;

@Configuration
@EnableWebMvcSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    
    private static final String USERS_QUERY = "SELECT username, password, enabled FROM users WHERE username=?";
    private static final String ROLES_QUERY = "SELECT username, role FROM user_roles WHERE username=?";

    @Autowired
    DataSource dataSource;

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .jdbcAuthentication()
                .dataSource(dataSource)
                .usersByUsernameQuery(USERS_QUERY)
                .authoritiesByUsernameQuery(ROLES_QUERY)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    @Bean(name="authenticationManager")
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(4);
    }

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery(USERS_QUERY).authoritiesByUsernameQuery(ROLES_QUERY);
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/assets/**", "/css/**", "/img/**", "/js/**", "/fonts/**", "/swf/**", "/barcode/**", "/session-expired");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login").failureUrl("/login?error").defaultSuccessUrl("/main", true).usernameParameter("username").passwordParameter("password").permitAll(true).and().csrf().and().logout().logoutUrl("/logout").logoutSuccessUrl("/login?logout").permitAll(true);
        http.sessionManagement().maximumSessions(1).expiredUrl("/session-expired");
        http.authorizeRequests().antMatchers("/admin").hasAnyRole(RoleType.ROLE_ADMIN.getLabel(), RoleType.ROLE_SUPERUSER.getLabel()).anyRequest().hasAnyRole(RoleType.ROLE_USER.getLabel(),RoleType.ROLE_ADMIN.getLabel()).and().exceptionHandling().accessDeniedPage("/403");
    }

}

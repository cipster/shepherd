package projectManager.core.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;

import javax.sql.DataSource;

@Configuration
@EnableWebMvcSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery("select username,password, enabled from users where username=?").authoritiesByUsernameQuery("select username, role from user_roles where username=?");
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/assets/**", "/css/**", "/img/**", "/js/**", "/fonts/**", "/upload/**", "/projAdmin/**", "/files/**","/delete/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.formLogin().loginPage("/login").failureUrl("/login?error").defaultSuccessUrl("/main", true).usernameParameter("username").passwordParameter("password").permitAll(true).and().csrf().and().sessionManagement().maximumSessions(1).expiredUrl("/session-expired").and().and().logout().logoutUrl("/logout").logoutSuccessUrl("/login?logout").permitAll(true);
        http.authorizeRequests().antMatchers("/download/**").hasRole("DOWNLOAD").and().exceptionHandling().accessDeniedPage("/403");
        http.authorizeRequests().antMatchers("/admin").hasRole("ADMIN").anyRequest().hasRole("USER").and().exceptionHandling().accessDeniedPage("/403");
    }

}
package projectManager.core;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.beans.factory.annotation.Autowired;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:jdbc.properties")
public class Datasource {

  @Autowired
  private Environment env;

  @Bean(name = "dataSource")
      public BasicDataSource dataSource() {
          BasicDataSource driverManagerDataSource = new BasicDataSource();
          driverManagerDataSource.setDriverClassName(env.getProperty("database.driverClassName"));
          driverManagerDataSource.setUrl(env.getProperty("database.databaseurl"));
          driverManagerDataSource.setUsername(env.getProperty("database.username"));
          driverManagerDataSource.setPassword(env.getProperty("database.password"));
          driverManagerDataSource.setTestOnBorrow(true);
          driverManagerDataSource.setRemoveAbandoned(true);
          driverManagerDataSource.setInitialSize(5);
          driverManagerDataSource.setMaxActive(10);
          driverManagerDataSource.setMaxIdle(1800);
          
          return driverManagerDataSource;
    }

    @Bean
    public PlatformTransactionManager txManager() {
          return new DataSourceTransactionManager(dataSource());
    }
    
    
    
}

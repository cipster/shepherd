package configuration;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.core.env.Environment;
import org.springframework.transaction.annotation.Isolation;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:jdbc.properties")
public class DatasourceConfig {

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
          driverManagerDataSource.setDefaultTransactionIsolation(Isolation.READ_COMMITTED.value());
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

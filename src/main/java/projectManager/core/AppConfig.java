package projectManager.core;


import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.*;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.converter.support.AllEncompassingFormHttpMessageConverter;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import projectManager.core.security.WebSecurityConfig;
import projectManager.repository.dao.*;
import projectManager.repository.dao.jdbc.*;

import java.util.List;

@EnableWebMvc
@Configuration
@EnableTransactionManagement
@EnableGlobalMethodSecurity(prePostEnabled=true)
@PropertySource("classpath:jdbc.properties")
@ComponentScan(basePackages = {"projectManager.mvc"})
@Import({WebSecurityConfig.class})
public class AppConfig extends WebMvcConfigurerAdapter {

    @Autowired
    private Environment env;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/assets/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
        registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
        registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/resources/img/");
        registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
        registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
        registry.addResourceHandler("/swf/**").addResourceLocations("/WEB-INF/resources/swf/");
        registry.addResourceHandler("/barcode/**").addResourceLocations("/WEB-INF/resources/barcode/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("lang");
        registry.addInterceptor(localeChangeInterceptor);
    }

    @Bean
    public PlatformTransactionManager txManager() {
        return new DataSourceTransactionManager(dataSource());
    }

    @Bean
    public LocaleResolver localeResolver() {
        CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
        cookieLocaleResolver.setDefaultLocale(StringUtils.parseLocaleString("ro"));
        return cookieLocaleResolver;
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Bean
    public MessageSource messageSource() {

        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames("classpath:messages");
        // if true, the key of the message will be displayed if the key is not
        // found, instead of throwing a NoSuchMessageException
        messageSource.setUseCodeAsDefaultMessage(true);
        messageSource.setDefaultEncoding("UTF-8");
        // # -1 : never reload, 0 always reload
        messageSource.setCacheSeconds(0);
        return messageSource;
    }

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/view/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        StringHttpMessageConverter stringConverter = new StringHttpMessageConverter();
        stringConverter.setWriteAcceptCharset(false);

        converters.add(new AllEncompassingFormHttpMessageConverter());
        converters.add(jackson2Converter());
    }

    @Bean
    public MappingJackson2HttpMessageConverter jackson2Converter() {
        return new MappingJackson2HttpMessageConverter();
    }

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
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(-1);
        return multipartResolver;
    }

    @Bean
    public ListaProiecteDAO listaProiecteDAO() {
        return new ListaProiecteJDBCDAO(dataSource());
    }

    @Bean
    public AlteMaterialeDAO alteMaterialeDAO() {
        return new AlteMaterialeJDBCDAO(dataSource());
    }

    @Bean
    public BdDAO bdDAO() {
        return new BdJDBCDAO(dataSource());
    }

    @Bean
    public ChestionarFinalDAO chestionarFinalDAO() {
        return new ChestionarFinalJDBCDAO(dataSource());
    }

    @Bean
    public ClientDAO clientiDAO() {
        return new ClientiJDBCDAO(dataSource());
    }

    @Bean
    public PropunereDAO propunereDAO() {
        return new PropunereJDBCDAO(dataSource());
    }

    @Bean
    public RaportFinalJDBCDAO raportFinalJDBCDAO() {
        return new RaportFinalJDBCDAO(dataSource());
    }

    @Bean
    public UserDAO userDAO() {
        return new UserJDBCDAO(dataSource());
    }

    @Bean
    public UserRolesDAO userRolesDAO() {
        return new UserRolesJDBCDAO(dataSource());
    }

    @Bean
    public RolesDAO rolesJDBCDAO() {
        return new RolesDAOImpl(dataSource());
    }

    @Bean
    public Cod1DAO cod1DAO() {
        return new Cod1DAOImpl(dataSource());
    }

    @Bean
    public Cod2DAO cod2DAO() {
        return new Cod2DAOImpl(dataSource());
    }

    @Bean
    public Cod3DAO cod3DAO() {
        return new Cod3DAOImpl(dataSource());
    }

    @Bean
    public LocDAO locDAO() {
        return new LocDAOImpl(dataSource());
    }

    @Bean
    public PersoanaDAO persoanaDAO() {
            return new PersoanaDAOImpl(dataSource());
        }

    @Bean
    public EvidentaInventarDAO evidentaInventarDAO() {
        return new EvidentaInventarDAOImpl(dataSource());
    }

    @Bean
    public ArticoleDAO articoleDAO() {
        return new ArticoleDAOImpl(dataSource());
    }
}

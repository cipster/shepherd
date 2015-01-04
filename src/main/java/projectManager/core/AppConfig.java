package projectManager.core;


import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.converter.support.AllEncompassingFormHttpMessageConverter;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
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
@EnableGlobalMethodSecurity(prePostEnabled=true)
@ComponentScan(basePackages = {"projectManager.mvc"})
@Import({WebSecurityConfig.class})
public class AppConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/assets/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
        registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
        registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/resources/img/");
        registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
        registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
        registry.addResourceHandler("/swf/**").addResourceLocations("/WEB-INF/resources/swf/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("lang");
        registry.addInterceptor(localeChangeInterceptor);
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
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        return converter;
    }

    @Bean(name = "dataSource")
    public DriverManagerDataSource dataSource() {
        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setDriverClassName("com.mysql.jdbc.Driver");
        driverManagerDataSource.setUrl("jdbc:mysql://127.0.0.1:3306/proiecte");
        driverManagerDataSource.setUsername("root");
        driverManagerDataSource.setPassword("cucubau");
        return driverManagerDataSource;
    }

    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(-1);
        return multipartResolver;
    }

    @Bean
    public ListaProiecteJDBCDAO listaProiecteDAO() {
        ListaProiecteJDBCDAO listaProiecteJDBCDAO = new ListaProiecteJDBCDAO(dataSource());
        return listaProiecteJDBCDAO;
    }

    @Bean
    public AlteMaterialeJDBCDAO alteMaterialeDAO() {
        AlteMaterialeJDBCDAO alteMaterialeJDBCDAO = new AlteMaterialeJDBCDAO(dataSource());
        return alteMaterialeJDBCDAO;
    }

    @Bean
    public BdJDBCDAO bdDAO() {
        BdJDBCDAO bdJDBCDAO = new BdJDBCDAO(dataSource());
        return bdJDBCDAO;
    }

    @Bean
    public ChestionarFinalJDBCDAO chestionarFinalDAO() {
        ChestionarFinalJDBCDAO chestionarFinalJDBCDAO = new ChestionarFinalJDBCDAO(dataSource());
        return chestionarFinalJDBCDAO;
    }

    @Bean
    public ClientiJDBCDAO clientiJDBCDAO() {
        ClientiJDBCDAO clientiJDBCDAO = new ClientiJDBCDAO(dataSource());
        return clientiJDBCDAO;
    }

    @Bean
    public PropunereJDBCDAO propunereJDBCDAO() {
        return new PropunereJDBCDAO(dataSource());
    }

    @Bean
    public RaportFinalJDBCDAO raportFinalJDBCDAO() {
        RaportFinalJDBCDAO raportFinalJDBCDAO = new RaportFinalJDBCDAO(dataSource());
        return raportFinalJDBCDAO;
    }

    @Bean
    public UserJDBCDAO userJDBCDAO() {
        UserJDBCDAO userJDBCDAO = new UserJDBCDAO(dataSource());
        return userJDBCDAO;
    }

    @Bean
    public UserRolesJDBCDAO userRolesJDBCDAO() {
            UserRolesJDBCDAO userRolesJDBCDAO = new UserRolesJDBCDAO(dataSource());
            return userRolesJDBCDAO;
    }

    @Bean
    public RolesJDBCDAO rolesJDBCDAO() {
            RolesJDBCDAO rolesJDBCDAO = new RolesJDBCDAO(dataSource());
            return rolesJDBCDAO;
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

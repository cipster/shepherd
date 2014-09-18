package projectManager.core;


import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.http.MediaType;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.util.StringUtils;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import projectManager.core.security.WebSecurityConfig;
import projectManager.dao.jdbc.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@EnableWebMvc
@Configuration
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

    @Override
    public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
        configurer.favorPathExtension(true).useJaf(false).ignoreAcceptHeader(true).mediaType("html", MediaType.TEXT_HTML).mediaType("json", MediaType.APPLICATION_JSON).defaultContentType(MediaType.TEXT_HTML);
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
    public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {

        List<ViewResolver> resolvers = new ArrayList<ViewResolver>();

        InternalResourceViewResolver r1 = new InternalResourceViewResolver();
        r1.setPrefix("/WEB-INF/view/");
        r1.setSuffix(".jsp");
        r1.setViewClass(JstlView.class);
        resolvers.add(r1);

        JsonViewResolver r2 = new JsonViewResolver();
        resolvers.add(r2);

        ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
        resolver.setViewResolvers(resolvers);
        resolver.setContentNegotiationManager(manager);
        return resolver;

    }

    @Bean(name = "dataSource")
    public DriverManagerDataSource dataSource() {
        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setDriverClassName("com.mysql.jdbc.Driver");
        driverManagerDataSource.setUrl("jdbc:mysql://127.0.0.1:3306/proiecte");
        driverManagerDataSource.setUsername("root");
        driverManagerDataSource.setPassword("");
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
        PropunereJDBCDAO propunereJDBCDAO = new PropunereJDBCDAO(dataSource());
        return propunereJDBCDAO;
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

    /**
     * View resolver for returning JSON in a view-based system. Always returns a
     * {@link MappingJackson2JsonView}.
     */
    public class JsonViewResolver implements ViewResolver {

        public View resolveViewName(String viewName, Locale locale) throws Exception {
            MappingJackson2JsonView view = new MappingJackson2JsonView();
            view.setPrettyPrint(true);
            return view;
        }
    }
}

package projectManager.core;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SpringMvcInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{AppConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return null; /*new Class[] { WebSecurityConfig.class };*/
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

}
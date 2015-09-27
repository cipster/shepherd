package configuration;

import freemarker.template.TemplateException;
import freemarker.template.utility.HtmlEscape;
import freemarker.template.utility.XmlEscape;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.ui.freemarker.FreeMarkerConfigurationFactoryBean;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Configuration
public class FreemarkerConfig {
    @Bean
    public FreeMarkerConfigurationFactoryBean freeMarkerConfigurationFactoryBean(final XmlEscape xmlEscape,
                                                                                 final HtmlEscape htmlEscape) {

        FreeMarkerConfigurationFactoryBean freeMarkerConfigurationFactoryBean = new FreeMarkerConfigurationFactoryBean();

        Properties freeMarkerSettings = new Properties();
        freeMarkerSettings.setProperty("datetime_format", "MM/dd/yyyy");
        freeMarkerSettings.setProperty("number_format", "0.##");
        freeMarkerSettings.setProperty("whitespace_stripping", "true");
        freeMarkerSettings.setProperty("api_builtin_enabled", "true");
        freeMarkerSettings.setProperty("auto_import", "layouts/layouts.ftl as layout");
        freeMarkerSettings.setProperty("auto_import", "/spring.ftl as spring");
        freeMarkerConfigurationFactoryBean.setFreemarkerSettings(freeMarkerSettings);


        Map<String, Object> variables = new HashMap<>();
        variables.put("xml_escape", xmlEscape);
        variables.put("html_escape", htmlEscape);
        freeMarkerConfigurationFactoryBean.setFreemarkerVariables(variables);

        freeMarkerConfigurationFactoryBean.setTemplateLoaderPath("/WEB-INF/ftl");

        return freeMarkerConfigurationFactoryBean;
    }

    @Bean
    public XmlEscape fmXmlEscape() {
        return new XmlEscape();
    }

    @Bean
    public HtmlEscape fmHtmlEscape() {
        return new HtmlEscape();
    }

    @Bean
    public FreeMarkerConfigurer freeMarkerConfigurer(
            final FreeMarkerConfigurationFactoryBean freeMarkerConfigurationFactoryBean) throws IOException,
            TemplateException {

        FreeMarkerConfigurer freeMarkerConfigurer = new FreeMarkerConfigurer();
        freeMarkerConfigurer.setConfiguration(freeMarkerConfigurationFactoryBean.createConfiguration());
        return freeMarkerConfigurer;

    }

}

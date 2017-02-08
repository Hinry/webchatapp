package project.hrininlab.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.format.FormatterRegistry;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import project.hrininlab.DAO.UserDao;
import project.hrininlab.service.UserDetailServiceImpl;

/**
 * Created by mrhri on 29.01.2017.
 */
@Configuration
@EnableWebMvc
@ComponentScan({"project.hrininlab.config","project.hrininlab.Controllers", "project.hrininlab.service", "project.hrininlab.DAO"})
//@Import({ AppSecurityConfig.class })
public class WebConfig extends WebMvcConfigurerAdapter {


    @Autowired
    ConvertUserRole converter;

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/view/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").
                addResourceLocations("WEB-INF/resources/").setCachePeriod(180);
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(converter);
    }

    @Bean
    public UserDetailsService getUserDetailsService(){
        return new UserDetailServiceImpl();
    }

    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("messages");
        return messageSource;
    }
}

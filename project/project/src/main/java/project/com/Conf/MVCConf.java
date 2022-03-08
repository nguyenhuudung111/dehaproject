package project.com.Conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import project.com.dto.Constants;



@Configuration
public class MVCConf implements WebMvcConfigurer , Constants {
	
	/**
	 * cau hinh 1 controller de handler cac reqquest kieu
	 * http://localhost:9999/user/css/styles.css
	 * http://localhost:9999/user/css/script.css
	 * static files nhu : css ,js , img
	 */
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		// classpath : <-> src/main/resources
		registry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		registry.addResourceHandler("/manager/**").addResourceLocations("classpath:/manager/");
		
		//upload nguoi dung 
		registry.addResourceHandler("/upload/**").addResourceLocations("file:"+UPLOAD_FOLDER_ROOT);
	}
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		
		return bean;
	}
}

package com.greenrecipe.main.configuration;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.greenrecipe.main.interceptor.AutoLoginInterceptor;

@Configuration
@MapperScan(basePackages = "com.greenrecipe.main.mybatis.**")
@PropertySource("classpath:/application.properties")
public class MybatisConfiguration {

	@Autowired
	ApplicationContext applicationContext;
	
	@Autowired
	AutoLoginInterceptor autoLoginInterceptor;
	
	@Bean
	public SqlSessionFactory seqSessionFactory(DataSource dataSource) throws Exception {
		final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		sessionFactory.setMapperLocations(applicationContext.getResources("classpath:mybatis-config.xml"));
		sessionFactory.setMapperLocations(applicationContext.getResources("classpath:mapper/*.xml"));
		return sessionFactory.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
    
	
	
}
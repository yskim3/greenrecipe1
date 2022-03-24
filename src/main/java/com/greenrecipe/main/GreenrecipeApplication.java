package com.greenrecipe.main;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.greenrecipe.main.mybatis.**")
public class GreenrecipeApplication {

	public static void main(String[] args) {
		SpringApplication.run(GreenrecipeApplication.class, args);
	}

}

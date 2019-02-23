package com.flange.store.console;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.flange.store.mapper")
public class ConsoleApplication {

	public static void main(String[] args) {
		SpringApplication.run(ConsoleApplication.class, args);
	}

}

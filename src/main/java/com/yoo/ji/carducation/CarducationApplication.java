package com.yoo.ji.carducation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class CarducationApplication {

    public static void main(String[] args) {
        SpringApplication.run(CarducationApplication.class, args);//WAS
    }

}

package com.zlk.zlkproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ZlkprojectApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(ZlkprojectApplication.class, args);
    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(ZlkprojectApplication.class);
    }
}

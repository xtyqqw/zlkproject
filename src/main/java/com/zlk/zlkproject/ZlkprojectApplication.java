package com.zlk.zlkproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class ZlkprojectApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZlkprojectApplication.class, args);
    }

}

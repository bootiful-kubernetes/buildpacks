package com.example.hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@SpringBootApplication
public class HelloApplication {

	@GetMapping("/")
	Map<String, String> hello() {
		return Map.of("greetings", "Hello, Java!");
	}

	public static void main(String[] args) {
		SpringApplication.run(HelloApplication.class, args);
	}

}

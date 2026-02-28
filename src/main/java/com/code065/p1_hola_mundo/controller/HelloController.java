package com.code065.p1_hola_mundo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/")
    public String home() {
        return "Hola mundo desde Spring Boot";
    }

    @GetMapping("/saludo")
    public String saludo() {
        return "Saludos del grupo code065";
    }
}

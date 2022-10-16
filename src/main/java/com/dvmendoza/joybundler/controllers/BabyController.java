package com.dvmendoza.joybundler.controllers;


import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dvmendoza.joybundler.models.Baby;
import com.dvmendoza.joybundler.services.BabyService;
import com.dvmendoza.joybundler.services.UserService;

@Controller
public class BabyController {
    @Autowired
    BabyService service;
    @Autowired
    UserService userService;

    @GetMapping("/names/new")
    String createForm(@ModelAttribute("baby") Baby baby, Model model, HttpSession session) {
        model.addAttribute("user", userService.getOne((Long) session.getAttribute("userId")));
        return "createBaby.jsp";
    }
    @PostMapping("/home")
    String create(@Valid @ModelAttribute("baby") Baby baby, BindingResult results) {
    	if(results.hasErrors()) {
    		return "createBaby.jsp";
    	}
        service.create(baby);
        return "redirect:/home";
    }
    @GetMapping("/home")
    String showAll(Model model, HttpSession session) {
        List<Baby> baby = service.getAll();
        Long id = (Long) session.getAttribute("userId");
        model.addAttribute("user", userService.getOne((Long) session.getAttribute("userId")));
        model.addAttribute("baby", baby);
        return "home.jsp";
    }
    @GetMapping("/names/{id}")
    String showOne(@PathVariable Long id, Model model, HttpSession session) {
        Baby baby = service.getOne(id);
        model.addAttribute("baby", baby);
        model.addAttribute("user", userService.getOne((Long) session.getAttribute("userId")));
        return "showOne.jsp";
    }
    @GetMapping("/names/edit/{id}")
    public String edit(@PathVariable("id")Long id, Model model, HttpSession session){
        Baby baby = service.getOne(id);
        model.addAttribute("baby", baby);
        return "edit.jsp";
    }
   
    @PutMapping("/names/{id}")
    String update(
            @Valid
            @ModelAttribute("baby") Baby baby,
            BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            service.update(baby);
            return "redirect:/home";
        }
    }
    @RequestMapping("/names/destroy/{id}")
    String destroy(@PathVariable("id") Long id) {
        service.destroy(service.getOne(id));
        return "redirect:/home";
    }
}
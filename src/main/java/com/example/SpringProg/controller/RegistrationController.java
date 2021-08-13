package com.example.SpringProg.controller;


import com.example.SpringProg.domain.User;
import com.example.SpringProg.domain.dto.CaptchaResponseDto;
import com.example.SpringProg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class RegistrationController {
    private final static String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserService userService;

    @Value("${recaptcha.secret}")
    private String secret;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam(name = "password2") String passwordConfirm,
            @RequestParam(name = "g-recaptcha-response") String captchaResponse,
            @Valid User user,
            BindingResult bindingResult,
            Model model
    ){

        String url = String.format(CAPTCHA_URL, secret, captchaResponse);
        CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

        if(!response.isSuccess()){
            model.addAttribute("captchaError", "Fill captcha");
        }

        boolean differentPasswords = user.getPassword() != null && !user.getPassword().equals(passwordConfirm);
        boolean isEmptyUsername = ObjectUtils.isEmpty(user.getUsername());
        boolean isEmptyPassword = ObjectUtils.isEmpty(user.getPassword());
        boolean isEmptyPassword2 = ObjectUtils.isEmpty(passwordConfirm);
        boolean isEmptyEmail = ObjectUtils.isEmpty(user.getEmail());

        if (isEmptyUsername){
            model.addAttribute("usernameError", "User name can not be empty");

        }

        if (differentPasswords){
            model.addAttribute("password2Error", "Passwords are different!");
        }

        if (isEmptyPassword){
            model.addAttribute("passwordError", "Password can not be empty");
        }

        if (isEmptyPassword2){
            model.addAttribute("password2Error", "Password can not be empty");
        }

        if (isEmptyEmail){
            model.addAttribute("emailError", "Email can not be empty");
        }

        if (!response.isSuccess()||isEmptyUsername||isEmptyPassword||isEmptyEmail||differentPasswords|| bindingResult.hasErrors()){
            Map<String, List<String>> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);

            return "registration";

        }

        if (!userService.addUser(user)){
            model.addAttribute("usernameError", "User exists!");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){
        boolean isActivated = userService.activateUser(code);

        if (isActivated){
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Activation code is not found!");
        }

        return "login";
    }


}

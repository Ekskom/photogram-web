package com.example.SpringProg.controller;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.example.SpringProg.domain.Message;
import com.example.SpringProg.domain.User;
import com.example.SpringProg.domain.dto.MessageDto;
import com.example.SpringProg.repo.MessageRepo;
import com.example.SpringProg.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import javax.validation.Valid;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

@Controller
public class MainController {

    @Value("my-new-bucket-photogram")
    private String bucketName;

    @Autowired
    private AmazonS3 s3;

    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private MessageService messageService;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }



    @GetMapping("/main")
    public String main(
            @AuthenticationPrincipal User user,
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model
    ) {


        List<MessageDto> messages = messageService.messageSet(filter, user);

        Collections.reverse(messages);


        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);


        return "main";
    }



    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            @Valid Model model,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer



    ) throws IOException {
        message.setAuthor(user);




        boolean isTagEmpty = ObjectUtils.isEmpty(message.getTag());
        if(isTagEmpty) {
            model.addAttribute("tagError", "Text can not be empty");
            return "main";
        }



        if (bindingResult.hasErrors()) {

            Map<String, List<String>> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);

            return "main";

        } else {

            model.addAttribute("message", message);

            messageRepo.save(message);

        }

        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);

        model.addAttribute("tag", message.getTag());

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));

        return "redirect:" + components.getPath();

    }

    @GetMapping("/addPhoto")
    public String addPhoto(
            @AuthenticationPrincipal User user,
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model
    ) {

        List<MessageDto> messages = messageService.messageSet(filter, user);

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "addPhoto";
    }



    @PostMapping("/addPhoto")
    public String addFile(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            @Valid Model model,
            @RequestParam("file") MultipartFile file,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer

    ) throws IOException {
        message.setAuthor(user);

        boolean isFileEmpty = file.isEmpty();

        if(isFileEmpty) {
            model.addAttribute("fileError", "File can not be empty");
            return "addPhoto";
        }

        boolean isTagEmpty = ObjectUtils.isEmpty(message.getTag());

        if(isTagEmpty) {
            model.addAttribute("tagError", "Tag can not be empty");

        }

        if (isTagEmpty || bindingResult.hasErrors()) {

            Map<String, List<String>> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);

            return "addPhoto";

        } else {

            uploadFile(message, file);

            Set<User> likes = message.getLikes();

            if(likes.contains(user)){
                likes.remove(user);
            } else {
                likes.add(user);
            }

            model.addAttribute("message", message);

            messageRepo.save(message);

        }

        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));

        return "redirect:" + components.getPath();

    }

    @GetMapping("/likes")
    public String myLikes(
            @AuthenticationPrincipal User currentUser,
            Model model,
            @RequestParam(required = false, defaultValue = "") String filter
    ) {

        Iterable<MessageDto> messages = messageService.messageSet(filter, currentUser);

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "likes";
    }

    private void uploadFile(@Valid Message message, MultipartFile file){

        File fileObj = convertMultiPartFileToFile(file);

        String uuidFile = UUID.randomUUID().toString();
        String fileName = uuidFile + "." + file.getOriginalFilename();

        s3.putObject(new PutObjectRequest(bucketName, fileName, fileObj));
        fileObj.delete();

        message.setFilename(fileName);

    }

    private File convertMultiPartFileToFile(MultipartFile file) {
        File convertedFile = new File(file.getOriginalFilename());
        try (FileOutputStream fos = new FileOutputStream(convertedFile)) {
            fos.write(file.getBytes());
        } catch (IOException e) {
            System.out.println(e);
        }
        return convertedFile;
    }
}
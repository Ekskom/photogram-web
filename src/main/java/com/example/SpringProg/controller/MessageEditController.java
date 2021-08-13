package com.example.SpringProg.controller;

import com.example.SpringProg.domain.Message;
import com.example.SpringProg.domain.User;
import com.example.SpringProg.domain.dto.MessageDto;
import com.example.SpringProg.repo.MessageRepo;
import com.example.SpringProg.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;


@Controller
public class MessageEditController {

    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private MessageService messageService;

    @Autowired
    private MainController mainController;


    @GetMapping("/user-messages/{author}")
    public String userMessages(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message
    ) {


        List<MessageDto> messages = messageService.messageListForUser(currentUser, author);


        model.addAttribute("userChannel", author);
        model.addAttribute("subscriptionsCount", author.getSubscribtions().size());
        model.addAttribute("subscribersCount", author.getSubscribers().size());
        model.addAttribute("isSubscriber", author.getSubscribers().contains(currentUser));
        model.addAttribute("messages", messages);
        model.addAttribute("messagesSize", messages.size());
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(author));


        return "userMessages";
    }

    @PostMapping("/user-messages/{user}")
    public String updateMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @Valid Message message,
            BindingResult bindingResult,
            @Valid Model model,
            @RequestParam(value = "id") Message id,
            @RequestParam("tag") String tag,
            @RequestParam("file") MultipartFile file
    ) throws IOException {

        boolean isTagEmpty = ObjectUtils.isEmpty(message.getTag());

        if (isTagEmpty) {
            model.addAttribute("tagError", "Tag can not be empty");
             return  "user-messages/" + user;
        }
        boolean isFileEmpty = ObjectUtils.isEmpty(file);
        if(isFileEmpty) {
            model.addAttribute("fileError", "File can not be empty");
            return "/user-messages/"+ user;
        }

        if (bindingResult.hasErrors()) {

            Map<String, List<String>> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);

            return "user-messages/" + user;
        }

            if (message.getId().equals(currentUser)) {
                if (!ObjectUtils.isEmpty(tag)) {
                    message.setTag(tag);
                }

                mainController.saveFile(id, file);

                messageRepo.save(id);
            }

            return "redirect:/user-messages/" + user;

    }

    @GetMapping("/del-user-messages/{user}")
    public String deleteMessage(
            @PathVariable Long user,
            @RequestParam("message") Long messageId
    ) throws IOException {

        messageRepo.deleteById(messageId);

        return "redirect:/user-messages/" + user;
    }

    @GetMapping("/messages/{message}/like")
    public String like(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Message message,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ){
        Set<User> likes = message.getLikes();

        if(likes.contains(currentUser)){
            likes.remove(currentUser);
        } else {
            likes.add(currentUser);
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));



        return "redirect:" + components.getPath();
    }

}


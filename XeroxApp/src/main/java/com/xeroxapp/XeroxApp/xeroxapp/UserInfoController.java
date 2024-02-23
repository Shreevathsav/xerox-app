package com.xeroxapp.XeroxApp.xeroxapp;

import com.xeroxapp.XeroxApp.DTO.UserDTO;
import com.xeroxapp.XeroxApp.user.UserService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@PreAuthorize("hasRole('ROLE_USER')")
@RequestMapping("/api/v1/user/xerox-app")
public class UserInfoController {
    private final UserService userService;
    @GetMapping
    public ResponseEntity<UserDTO> healthCheck(HttpServletRequest request){
        UserDTO userDTO = userService.getUserProfile(request);
        return  ResponseEntity.ok(userDTO);
    }
}

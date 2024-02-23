package com.xeroxapp.XeroxApp.auth;

import com.xeroxapp.XeroxApp.user.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class RegisterRequest {
    private String name;
    private String email;
    private String password;
    private String collegeId;
    private String mobileNumber;
    private Role Role;
    private String userFcmToken;
}

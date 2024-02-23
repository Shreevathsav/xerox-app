package com.xeroxapp.XeroxApp.DTO;

import com.xeroxapp.XeroxApp.user.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
    private String name;
    private String email;
    private String password;
    private String collegeId;
    private String mobileNumber;

    public static UserDTO fromEntity(User user) {
        return UserDTO.builder()
                .name(user.getName())
                .email(user.getEmail())
                .collegeId(user.getCollegeId())
                .mobileNumber(user.getMobileNumber())
                .build();
    }
}

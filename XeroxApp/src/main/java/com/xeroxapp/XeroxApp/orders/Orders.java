package com.xeroxapp.XeroxApp.orders;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xeroxapp.XeroxApp.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "_orders")
public class Orders {
    @Id
    @GeneratedValue
    public Integer id;

    public String fileName;

    public String filePath;

    public boolean isPaid;

    public boolean isOrderFullfilled;

    public String dateTime;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    public User user;
}

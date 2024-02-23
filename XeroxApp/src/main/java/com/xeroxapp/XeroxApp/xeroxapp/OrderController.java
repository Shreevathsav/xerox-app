package com.xeroxapp.XeroxApp.xeroxapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.xeroxapp.XeroxApp.orders.Orders;
import com.xeroxapp.XeroxApp.services.OrderServices;

@RestController
@PreAuthorize("hasRole('ROLE_USER')")
@RequestMapping("/api/v1/getOrdersByUser")
public class OrderController {

    @Autowired
    OrderServices orderServices;

    @GetMapping
    public ResponseEntity<List<Orders>> getOrderByUser(@RequestHeader("Authorization") String token) {
        return ResponseEntity.ok(orderServices.getOrdersByUser(token));

    }
}

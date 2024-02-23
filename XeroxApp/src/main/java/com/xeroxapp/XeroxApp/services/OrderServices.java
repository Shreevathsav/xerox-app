package com.xeroxapp.XeroxApp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xeroxapp.XeroxApp.config.JwtService;
import com.xeroxapp.XeroxApp.orders.OrderRepository;
import com.xeroxapp.XeroxApp.orders.Orders;
import com.xeroxapp.XeroxApp.user.User;
import com.xeroxapp.XeroxApp.user.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderServices {

    @Autowired
    JwtService jwtService;

    private final UserRepository repository;

    private final OrderRepository orderRepository;

    public void markOrderAsFulfilled(Integer orderId) {
        Orders order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found with id: " + orderId));
        order.setOrderFullfilled(true); // Assuming you have setter method for isOrderFulfilled
        orderRepository.save(order);
    }

    public List<Orders> getOrdersByUser(String token) {
        String jwtToken = token.substring(7);
        System.out.println(" orderservices token : " + jwtToken);
        String userName = jwtService.extractUsername(jwtToken);
        User user = repository.findByEmail(userName).orElseThrow();

        List<Orders> ordersByUser = orderRepository.findAllOrdersByUser(user.getId());
        return ordersByUser;
    }
}

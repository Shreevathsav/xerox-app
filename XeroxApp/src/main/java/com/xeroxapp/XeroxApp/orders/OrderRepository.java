package com.xeroxapp.XeroxApp.orders;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<Orders, Integer> {

    @Query("SELECT o FROM Orders o JOIN User u ON o.user.id = u.id WHERE u.id = :id")
    List<Orders> findAllOrdersByUser(Integer id);

    @Query("SELECT o FROM Orders o")
    List<Orders> findAllOrders();
}

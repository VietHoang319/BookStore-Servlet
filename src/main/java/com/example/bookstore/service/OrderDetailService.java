package com.example.bookstore.service;

import com.example.bookstore.model.OrderDetail;

import java.util.List;

public interface OrderDetailService extends GeneralService<OrderDetail> {
    List<OrderDetail> findByOrderId(String id);
}

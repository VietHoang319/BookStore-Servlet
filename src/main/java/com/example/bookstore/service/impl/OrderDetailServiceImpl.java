package com.example.bookstore.service.impl;

import com.example.bookstore.model.OrderDetail;
import com.example.bookstore.service.OrderDetailService;

import java.sql.SQLException;
import java.util.List;

public class OrderDetailServiceImpl implements OrderDetailService {
    @Override
    public void add(OrderDetail orderDetail) throws SQLException {

    }

    @Override
    public OrderDetail findById(int id) throws SQLException {
        return null;
    }

    @Override
    public List<OrderDetail> findAll() {
        return null;
    }

    @Override
    public List<OrderDetail> findByName(String name) {
        return null;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean update(OrderDetail orderDetail) throws SQLException {
        return false;
    }
}

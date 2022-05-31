package com.example.bookstore.service.impl;

import com.example.bookstore.model.Order;
import com.example.bookstore.service.OrderService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class OrderServiceImpl implements OrderService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/bookstore?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

    @Override
    public void add(Order order) throws SQLException {
        String insertOrder = "insert into orderr(id, customerId, orderDate, totalAmount, status) values (?,?,?,?,1);";
        try (Connection conn = getConnection(); PreparedStatement preparedStatement = conn.prepareStatement(insertOrder)) {
            preparedStatement.setString(1, String.valueOf(order.getId()));
            preparedStatement.setString(2, String.valueOf(order.getCustomer().getId()));
            preparedStatement.setString(3, String.valueOf(order.getOrderDate()));
            preparedStatement.setString(4, String.valueOf(order.getTotalAmount()));
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public Order findById(int id) throws SQLException {
        return null;
    }

    @Override
    public List<Order> findAll() {
        return null;
    }

    @Override
    public List<Order> findByName(String name) {
        return null;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Order order) throws SQLException {
        return false;
    }
}

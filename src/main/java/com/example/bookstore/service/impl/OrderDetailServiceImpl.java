package com.example.bookstore.service.impl;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.OrderDetail;
import com.example.bookstore.service.OrderDetailService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailServiceImpl implements OrderDetailService {
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
    public void add(OrderDetail orderDetail) throws SQLException {
        String insertOrderDetail = "insert into orderdetail(orderId, bookId, numberOfOrder, intoMoney) values (?,?,?,?)";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(insertOrderDetail)){
            preparedStatement.setString(1, String.valueOf(orderDetail.getOrder().getId()));
            preparedStatement.setString(2, String.valueOf(orderDetail.getBook().getId()));
            preparedStatement.setString(3, String.valueOf(orderDetail.getNumberOfOrder()));
            preparedStatement.setString(4, String.valueOf(orderDetail.getIntoMoney()));
            preparedStatement.executeUpdate();
        }
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

    @Override
    public List<OrderDetail> findByOrderId(String id) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String query = "select od.bookId, b.name, numberOfOrder, intoMoney\n" +
                "from orderdetail od\n" +
                "join book b on b.id = od.bookId where od.orderId = ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int bookId = resultSet.getInt("bookId");
                String name = resultSet.getString("name");
                int numberOfOrder = resultSet.getInt("numberOfOrder");
                int intoMoney = resultSet.getInt("intoMoney");
                Book book = new Book(bookId, name);
                orderDetails.add(new OrderDetail(book, numberOfOrder, intoMoney));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderDetails;
    }
}

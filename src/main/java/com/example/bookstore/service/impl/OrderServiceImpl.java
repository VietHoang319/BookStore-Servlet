package com.example.bookstore.service.impl;

import com.example.bookstore.model.Order;
import com.example.bookstore.model.User;
import com.example.bookstore.service.OrderService;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
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
        List<Order> orders = new ArrayList<>();
        String query = "select o.id, o.customerId, u.name, o.staffId, u2.name, orderDate, totalAmount, o.status\n" +
                "from orderr o\n" +
                "join user u on o.customerId = u.id\n" +
                "join user u2 on o.staffId = u2.id;";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                int customerId = resultSet.getInt("customerId");
                String nameCustomer = resultSet.getString("u.name");
                int staffId = resultSet.getInt("staffId");
                String nameStaff = resultSet.getString("u2.name");
                LocalDate localDate = LocalDate.parse(resultSet.getString("orderDate"));
                int totalAmount = resultSet.getInt("totalAmount");
                User customer = new User(customerId, nameCustomer);
                User staff = new User(staffId, nameStaff);
                int status = resultSet.getInt("status");
                Order order = new Order(id, customer, staff, localDate, totalAmount, status);
                orders.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;
    }

    @Override
    public List<Order> findByName(String name) {
        return null;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    public boolean delete(String id) throws SQLException {
        boolean rowDelete;
        String deleteOrder = "UPDATE orderr set status = 0 where id = ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(deleteOrder)) {
            preparedStatement.setString(1, id);
            rowDelete = preparedStatement.executeUpdate() > 0;
        }
        return false;
    }

    @Override
    public boolean update(Order order) throws SQLException {
        return false;
    }

    @Override
    public List<Order> findByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        String query = "select o.id, o.customerId, u.name, orderDate, totalAmount\n" +
                "from orderr o\n" +
                "join user u on o.customerId = u.id\n" +
                "where o.status = 1 and o.customerId = ?;";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)){
            preparedStatement.setString(1, String.valueOf(userId));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                int customerId = resultSet.getInt("customerId");
                String name = resultSet.getString("name");
                LocalDate localDate = LocalDate.parse(resultSet.getString("orderDate"));
                int totalAmount = resultSet.getInt("totalAmount");
                User user = new User(customerId, name);
                Order order = new Order(id, user, localDate, totalAmount);
                orders.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;
    }

    @Override
    public Order findById(String id) {
        String query = "select id, orderDate, totalAmount from orderr where id = ?";
        Order order = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)){
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String idFind = resultSet.getString("id");
                LocalDate orderDate = LocalDate.parse(resultSet.getString("orderDate"));
                int totalAmount = resultSet.getInt("totalAmount");
                order = new Order(idFind, orderDate, totalAmount);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return order;
    }

    @Override
    public List<Order> findUnconfirm() {
        List<Order> orders = new ArrayList<>();
        String query = "select o.id, o.customerId, u.name, orderDate, totalAmount\n" +
                "from orderr o\n" +
                "join user u on o.customerId = u.id\n" +
                "where o.status = 1;";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)){
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                int customerId = resultSet.getInt("customerId");
                String name = resultSet.getString("name");
                LocalDate localDate = LocalDate.parse(resultSet.getString("orderDate"));
                int totalAmount = resultSet.getInt("totalAmount");
                User user = new User(customerId, name);
                Order order = new Order(id, user, localDate, totalAmount);
                orders.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;
    }
}

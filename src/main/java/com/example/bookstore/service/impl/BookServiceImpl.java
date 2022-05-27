package com.example.bookstore.service.impl;

import com.example.bookstore.model.Book;
import com.example.bookstore.service.BookService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookServiceImpl implements BookService {
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
    public void add(Book book) throws SQLException {

    }

    @Override
    public Book findById(int id) {
        Book book = null;
        String query = "select * from book where id = ?";
        try (Connection conn = getConnection(); PreparedStatement preparedStatement = conn.prepareStatement(query)){

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return book;
    }

    @Override
    public List<Book> findAll() {
        List<Book> books = new ArrayList<>();
        String query = "select id, name, image, price from book where status = true;";
        try (Connection conn = getConnection(); PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int price = rs.getInt("price");
                books.add(new Book(id, name, image, price));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }

    @Override
    public List<Book> findByName(String name) {
        List<Book> books = new ArrayList<>();
        String query = "select id, name, image, price from book where name like ? and status = true;";
        try (Connection conn = getConnection(); PreparedStatement preparedStatement = conn.prepareStatement(query)){
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nameFind = rs.getString("name");
                String image = rs.getString("image");
                int price = rs.getInt("price");
                books.add(new Book(id, nameFind, image, price));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Book book) throws SQLException {
        return false;
    }
}

package com.example.bookstore.service.impl;

import com.example.bookstore.model.Author;
import com.example.bookstore.service.AuthorService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AuthorServiceImpl implements AuthorService {
    private boolean Updated;

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?useSSL=false", "root", "123456");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void add(Author author) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into author(name,status) values(?, ?)");) {
            preparedStatement.setString(1, author.getName());
            preparedStatement.setBoolean(2, author.isStatus());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();


        } catch (SQLException e) {

        }
    }


    @Override
    public Author findById(int id) throws SQLException {
        Author author = null ;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from author where id = ?;");){
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idFind = rs.getInt("id");
                String name = rs.getString("name");
                boolean status = rs.getBoolean("Status");

                author = new Author(idFind, name,status);
            }
        }
        catch (SQLException e) {
        }
        return author;
    }

    @Override
    public List<Author> findAll() {
        List<Author> authors = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from author");) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                boolean status = rs.getBoolean("status");
                authors.add(new Author(id, name, status));
            }
        } catch (SQLException e) {
        }
        return authors;
    }

    @Override
    public List<Author> findByName(String name) {
        return null;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Author author) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE author set name=? where id=?");) {
            statement.setString(1, author.getName());
            statement.setInt(2,author.getId());
            statement.executeUpdate();
        }
        return false;
    }
}

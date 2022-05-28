package com.example.bookstore.service.impl;

import com.example.bookstore.model.Role;
import com.example.bookstore.model.User;
import com.example.bookstore.service.UserService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static java.sql.DriverManager.getConnection;

public class UserServiceImpl implements UserService {
    public UserServiceImpl() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?useSSL=false", "root", "123456");
        } catch (SQLException e) {

        } catch (ClassNotFoundException e) {

        }
        return connection;
    }
    @Override
    public void add(User user) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into user(username,password,name,phone,roleId,status ) values (?,?,?,?,?,? )");) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3,user.getName());
            preparedStatement.setString(4,user.getPhone());
            preparedStatement.setInt(5,user.getRoleId());
            preparedStatement.setBoolean(6,user.isStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {

        }

    }

    @Override
    public User findById(int id) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from user where id =?");) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int roleId = rs.getInt("roleId");
                boolean status = rs.getBoolean("status");
                user = new User(id, username, password,name,phone,roleId,status);
            }
        } catch (SQLException e) {
        }
        return user;
    }

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select id,username,password,name ,phone,roleId,status from user where (roleId=2 or roleId=1) and status=true" );) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int roleId = rs.getInt("roleId");
                boolean status = rs.getBoolean("status");
                users.add(new User(id, username, password,name,phone,roleId,status));
            }
        } catch (SQLException e) {

        }
        return users;
    }


    @Override
    public List<User> findByName(String name) {
        List<User> users = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select id,username,password,name ,phone,roleId,status from user where (roleId=2 or roleId=1) and name like ? and status = true; ");) {
            preparedStatement.setString(1, '%'+name+'%');
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String nameFind = rs.getString("name");
                String phone = rs.getString("phone");
                int roleId = rs.getInt("roleId");
                boolean status = rs.getBoolean("status");
                users.add(new User(id,username,password,nameFind,phone,roleId,status));
            }
        } catch (SQLException e) {

        }
        return users;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement("delete from user where id=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public boolean delete(User user) throws SQLException{
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("update user set status=false where id=?;");) {
            preparedStatement.setInt(1, user.getId());
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    @Override
    public boolean update(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("update user set name=?,phone =?,roleId=? where id=?;");) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPhone());
            preparedStatement.setInt(3, user.getRoleId());
            preparedStatement.setInt(4, user.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}

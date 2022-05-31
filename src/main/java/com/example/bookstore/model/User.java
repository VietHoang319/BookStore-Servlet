package com.example.bookstore.model;

public class User {
    private int id;
    private String username;
    private String password;
    private String name;
    private String phone;
    private int roleId;
    private boolean status;

    public User() {
    }

    public User(String username, String password, String name, String phone, int roleId, boolean status) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.roleId = roleId;
        this.status = status;
    }

    public User(int id, String username) {
        this.id = id;
        this.username = username;
    }

    public User(int id, String username, String userpass, String name, String phone, int roleId, boolean status) {
        this.id = id;
        this.username = username;
        this.password = userpass;
        this.name = name;
        this.phone = phone;
        this.roleId = roleId;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}

package com.example.bookstore.service;

import java.sql.SQLException;
import java.util.List;

public interface GeneralService<T> {
    void add(T t) throws SQLException;
    T findById(int id) throws SQLException;
    List<T> findAll();
    List<T> findByName(String name);
    boolean delete(int id) throws SQLException;
    boolean update(T t) throws SQLException;
}

package com.example.bookstore.service;

import com.example.bookstore.model.Book;

import java.util.List;

public interface BookService extends GeneralService<Book> {
    public List<Book> findByCategoryId(int categoryId);
    List<Book> findByAuthorId(int authorId);
}

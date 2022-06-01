package com.example.bookstore.service;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.OrderDetail;

import java.util.List;

public interface BookService extends GeneralService<Book> {
    List<Book> findByCategoryId(int categoryId);
    List<Book> findByAuthorId(int authorId);
    void editQuantity(List<OrderDetail> orderDetails);
    List<Book> findTop6BookOfOrder();
}

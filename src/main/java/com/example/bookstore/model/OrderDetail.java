package com.example.bookstore.model;

public class OrderDetail {
    private Order order;
    private Book book;
    private int numberOfOrder;
    private int intoMoney;

    public OrderDetail() {
    }

    public OrderDetail(Order order, Book book, int numberOfOrder, int intoMoney) {
        this.order = order;
        this.book = book;
        this.numberOfOrder = numberOfOrder;
        this.intoMoney = intoMoney;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getNumberOfOrder() {
        return numberOfOrder;
    }

    public void setNumberOfOrder(int numberOfOrder) {
        this.numberOfOrder = numberOfOrder;
    }

    public int getIntoMoney() {
        return intoMoney;
    }

    public void setIntoMoney(int intoMoney) {
        this.intoMoney = intoMoney;
    }
}

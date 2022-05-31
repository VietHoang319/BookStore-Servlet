package com.example.bookstore.model;

public class Book {
    private int id;
    private String name;
    private Author author;
    private Category category;
    private String image;
    private int price;
    private int numberOfBook;
    private boolean status;

    public Book() {
    }

    public Book(int id, String name, Author author, Category category, String image, int price, int numberOfBook, boolean status) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.category = category;
        this.image = image;
        this.price = price;
        this.numberOfBook = numberOfBook;
        this.status = status;
    }

    public Book(int id, String name, String image, int price) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
    }

    public Book(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Book(int id, String name, Author author, Category category, String image, int price, int numberOfBook) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.category = category;
        this.image = image;
        this.price = price;
        this.numberOfBook = numberOfBook;
    }

    public Book(int id, String name, Category category, String image, int price) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.image = image;
        this.price = price;
    }

    public Book(String name, Author author, Category category, String image, int price, int numberOfBook) {
        this.name = name;
        this.author = author;
        this.category = category;
        this.image = image;
        this.price = price;
        this.numberOfBook = numberOfBook;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getNumberOfBook() {
        return numberOfBook;
    }

    public void setNumberOfBook(int numberOfBook) {
        this.numberOfBook = numberOfBook;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}

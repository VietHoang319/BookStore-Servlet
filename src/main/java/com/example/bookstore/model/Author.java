package com.example.bookstore.model;

public class Author {
    private int id ;
    private String name ;
    private boolean status;

    public Author() {
    }

    public Author(int id, String name, boolean status) {
        this.id = id;
        this.name = name;
        this.status = status;
    }

    public Author(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Author(String name, boolean status) {
        this.name = name;
        this.status = status;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}

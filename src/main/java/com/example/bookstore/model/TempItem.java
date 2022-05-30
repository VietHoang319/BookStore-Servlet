package com.example.bookstore.model;

public class TempItem {
    private static int id = 0;
    private User user;
    private int quantity;

    public TempItem(User user, int quantity) {
        id = id + 1;
        this.user = user;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        TempItem.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}

package com.example.bookstore.controller;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.TempItem;
import com.example.bookstore.model.User;
import com.example.bookstore.service.BookService;
import com.example.bookstore.service.impl.BookServiceImpl;
import com.example.bookstore.service.impl.TempOrder;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TempOrderServlet", value = "/carts")
public class TempOrderServlet extends HttpServlet {
    BookService bookService = new BookServiceImpl();
    TempOrder tempOrderManage = new TempOrder();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession httpSession = request.getSession();
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteItem(request, response, httpSession);
                break;
            case "confirm":
                confirmOrder(request, response, httpSession);
                break;
            default:
                showTempOrder(request, response, httpSession);
        }
    }

    private void confirmOrder(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) {
        List<TempItem> tempOrder = (List<TempItem>) httpSession.getAttribute("tempOrder");

    }

    private void deleteItem(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws IOException {
        List<TempItem> tempOrder = (List<TempItem>) httpSession.getAttribute("tempOrder");
        int id = Integer.parseInt(request.getParameter("id"));
        for (int i = 0; i < tempOrder.size(); i++) {
            if (tempOrder.get(i).getId() == id) {
                tempOrder.remove(tempOrder.get(i));
            }
        }
        response.sendRedirect("/carts");
    }

    private void showTempOrder(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart/list.jsp");
        List<TempItem> tempOrder = (List<TempItem>) httpSession.getAttribute("tempOrder");
        if(tempOrder == null) {
            tempOrder = new ArrayList<>();
            httpSession.setAttribute("tempOrder", tempOrder);
        }
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession httpSession = request.getSession();
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                try {
                    addToTemp(request, response, httpSession);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void addToTemp(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws SQLException, IOException {
        List<TempItem> tempOrder = (List<TempItem>) httpSession.getAttribute("tempOrder");
        int numberOfOrder = Integer.parseInt(request.getParameter("numberOfOrder"));
        int bookId = Integer.parseInt(request.getParameter("id"));
        Book book = bookService.findById(bookId);
        TempItem tempItem = new TempItem(book, numberOfOrder);
        if (tempOrder == null) {
            tempOrder = new ArrayList<>();
            httpSession.setAttribute("tempOrder", tempOrder);
        }
        tempOrderManage.addToTemp(tempItem, tempOrder);
        response.sendRedirect("/carts");
    }
}

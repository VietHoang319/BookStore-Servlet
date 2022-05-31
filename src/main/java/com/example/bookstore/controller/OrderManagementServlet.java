package com.example.bookstore.controller;

import com.example.bookstore.model.Order;
import com.example.bookstore.service.OrderService;
import com.example.bookstore.service.impl.OrderServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderManagementServlet", value = "/order-management")
public class OrderManagementServlet extends HttpServlet {
    OrderService orderService = new OrderServiceImpl();
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
            default:
                showOrder(request, response);
        }
    }

    private void showOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("order/list.jsp");
        List<Order> orders = orderService.findAll();
        request.setAttribute("orders", orders);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

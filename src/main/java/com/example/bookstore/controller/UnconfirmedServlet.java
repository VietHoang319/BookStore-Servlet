package com.example.bookstore.controller;

import com.example.bookstore.model.Order;
import com.example.bookstore.model.OrderDetail;
import com.example.bookstore.service.OrderDetailService;
import com.example.bookstore.service.OrderService;
import com.example.bookstore.service.impl.OrderDetailServiceImpl;
import com.example.bookstore.service.impl.OrderServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UnconfirmedServlet", value = "/unconfirmed-orders")
public class UnconfirmedServlet extends HttpServlet {
    OrderServiceImpl orderService = new OrderServiceImpl();
    OrderDetailService orderDetailService = new OrderDetailServiceImpl();
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
                try {
                    deleteOrder(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "search":
                searchOrderDetail(request, response);
                break;
            default:
                showUnconfirmedOrder(request,response,httpSession);
        }
    }

    private void searchOrderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("order-detail/order-detail.jsp");
        String id = request.getParameter("id");
        List<OrderDetail> orderDetails = orderDetailService.findByOrderId(id);
        Order order = orderService.findById(id);
        request.setAttribute("order", order);
        request.setAttribute("orderDetails", orderDetails);
        requestDispatcher.forward(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String id = request.getParameter("id");
        orderService.delete(id);
        response.sendRedirect("/unconfirmed-orders");
    }

    private void showUnconfirmedOrder(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("order/unconfirmed.jsp");
        int userId = (int) httpSession.getAttribute("userId");
        List<Order> orders = orderService.findByUserId(userId);
        request.setAttribute("orders", orders);
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
        switch (action) {}
    }
}

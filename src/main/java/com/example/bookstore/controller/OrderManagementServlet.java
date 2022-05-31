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
import java.util.List;

@WebServlet(name = "OrderManagementServlet", value = "/order-management")
public class OrderManagementServlet extends HttpServlet {
    OrderService orderService = new OrderServiceImpl();
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
            case "unconfirm":
                showUnconfirm(request, response);
                break;
            case "confirm":
                confirmOrder(request, response);
                break;
            case "delete":
                deleteOrder(request, response);
                break;
            case "search":
                searchOrderDetail(request, response);
                break;
            default:
                showOrder(request, response);
        }
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) {
    }

    private void confirmOrder(HttpServletRequest request, HttpServletResponse response) {
        
    }

    private void showUnconfirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("order/unconfirm-manage.jsp");
        List<Order> orders = orderService.findUnconfirm();
        request.setAttribute("orders", orders);
        requestDispatcher.forward(request, response);
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

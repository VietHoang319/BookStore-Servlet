package com.example.bookstore.controller;

import com.example.bookstore.model.Role;
import com.example.bookstore.model.User;
import com.example.bookstore.service.impl.CustomerServiceImpl;
import com.example.bookstore.service.impl.RoleServiceImpl;
import com.example.bookstore.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {
    CustomerServiceImpl customerService = new CustomerServiceImpl();
    RoleServiceImpl roleService = new RoleServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "search":
                showSearchCustomer(request,response);
                break;
            default:
                showCustomerList(request,response);
        }
    }

    private void showSearchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list.jsp");
        String name = request.getParameter("name");
        List<User> users = customerService.findByName(name);
        List<Role> roles = roleService.findAllUser(users);
        request.setAttribute("users",users);
        request.setAttribute("roles",roles);
        requestDispatcher.forward(request,response);
    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list.jsp");
        List<User> users = customerService.findAll();
        List<Role> roles = roleService.findAllUser(users);
        request.setAttribute("users",users);
        request.setAttribute("roles",roles);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
    }
}

package com.example.bookstore.controller;

import com.example.bookstore.model.User;
import com.example.bookstore.service.impl.CustomerServiceImpl;
import com.example.bookstore.service.impl.RoleServiceImpl;
import com.example.bookstore.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", urlPatterns = "/registers")
public class RegisterServlet extends HttpServlet {
    UserServiceImpl userService = new UserServiceImpl();
    RoleServiceImpl roleService = new RoleServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showRegisterForm(request, response);
        }
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("register/register.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createCustomer(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (password ==null){

        }
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        if (userService.findByUserName(username) == null) {
            userService.add(new User(username, password, name, phone, roleId, status));
            response.sendRedirect("/logins");
        } else {
            request.setAttribute("mess", "Tài khoản đã tồn tại");
//            response.sendRedirect("/registers");
            request.getRequestDispatcher("register/register.jsp").forward(request,response);
        }
    }
}

package com.example.bookstore.controller;

import com.example.bookstore.model.User;
import com.example.bookstore.service.impl.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "LoginServlet", urlPatterns = "/logins")
public class LoginServlet extends HttpServlet {
    CustomerServiceImpl customerService = new CustomerServiceImpl();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "logout":
                logout(request,response,session);
                break;
            default:
                showLoginForm(request, response);
        }
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("login/login.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                try {
                    login(request, response, session);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        if (session.getAttribute("name")!=null){
            session.invalidate();
        }
        response.sendRedirect("/homes");
    }

    private void login(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = customerService.findByUserNamePassword(username , password);
        if(user == null){
            response.sendRedirect("logins");
        } else {
            session.setAttribute("phone",user.getPhone());
            session.setAttribute("name" , user.getName());
            session.setAttribute("roleId",user.getRoleId());
            response.sendRedirect("/homes");
        }
    }
}

package com.example.bookstore.controller;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.User;
import com.example.bookstore.service.impl.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet(name = "LoginServlet", urlPatterns = "/logins")
public class LoginServlet extends HttpServlet {
    CustomerServiceImpl customerService = new CustomerServiceImpl();
    static int currentId =0;
    static String name ="";

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
            case "view":
                showViewUser(request,response);
                break;
            case "logout":
                logout(request,response,session);
                break;
            default:
                showLoginForm(request, response);
        }
    }

    private void showViewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = customerService.findById(currentId);
        request.setAttribute("users", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("login/view.jsp");
        requestDispatcher.forward(request, response);
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
            case "view":
                try {
                    editUser(request,response,session);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException, SQLException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        customerService.update(new User(currentId,username,password,name,phone,roleId,status));
        session.setAttribute("name", name);
        response.sendRedirect("/");
    }

    private void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        if (session.getAttribute("name")!=null){
            session.invalidate();
        }
        response.sendRedirect("/");
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
            session.setAttribute("userId", user.getId());
            currentId = user.getId();
            name = user.getName();
            response.sendRedirect("/");
        }
    }
}

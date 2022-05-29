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
import java.sql.SQLException;
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
            case "edit":
                showEditCustomer(request,response);
                break;
            case "delete":
                try {
                    deleteCustomer(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                showCustomerList(request,response);
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.delete(customerService.findById(id));
        response.sendRedirect("/customers");
    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/edit.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        User user = customerService.findById(id);
        request.setAttribute("users",user);
        requestDispatcher.forward(request,response);
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
        switch (action){
            case "edit":
                try {
                    editCustomer(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        customerService.update(new User(id,username,password,name,phone,roleId,status));
        response.sendRedirect("/customers");
    }
}

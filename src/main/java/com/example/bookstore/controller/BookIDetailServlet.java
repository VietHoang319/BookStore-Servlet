package com.example.bookstore.controller;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.Category;
import com.example.bookstore.service.BookService;
import com.example.bookstore.service.CategoryService;
import com.example.bookstore.service.impl.BookServiceImpl;
import com.example.bookstore.service.impl.CategoryServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BookDetailServlet", value = "/book-details")
public class BookIDetailServlet extends HttpServlet {
    BookService bookService = new BookServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();
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
            case "searchCategory":
                searchCategory(request,response);
                break;
            case "searchAuthor":
                searchAuthor(request,response);
                break;
            default:
                try {
                    showBookDetail(request, response, httpSession);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
        }
    }

    private void searchAuthor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/author-list.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        List<Book> book = bookService.findByAuthorId(id);
        request.setAttribute("books",book);
        requestDispatcher.forward(request,response);
    }

    private void searchCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/category-list.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        List<Book> book = bookService.findByCategoryId(id);
        request.setAttribute("books",book);
        requestDispatcher.forward(request,response);

    }

    private void showBookDetail(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookService.findById(id);
        request.setAttribute("book", book);
        List<Book> books = bookService.findTop6BookOfOrder();
        request.setAttribute("books", books);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/book-detail.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
    }
}

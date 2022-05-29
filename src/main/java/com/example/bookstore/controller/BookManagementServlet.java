package com.example.bookstore.controller;

import com.example.bookstore.model.Author;
import com.example.bookstore.model.Book;
import com.example.bookstore.model.Category;
import com.example.bookstore.service.AuthorService;
import com.example.bookstore.service.BookService;
import com.example.bookstore.service.CategoryService;
import com.example.bookstore.service.impl.AuthorServiceImpl;
import com.example.bookstore.service.impl.BookServiceImpl;
import com.example.bookstore.service.impl.CategoryServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BookManagementServlet", value = "/book-management")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class BookManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    BookService bookService = new BookServiceImpl();
    AuthorService authorService = new AuthorServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

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
                showList(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/book-management.jsp");
        List<Book> books = bookService.findAll();
        List<Author> authors = authorService.findAll();
        List<Category> categories = categoryService.findAll();
        request.setAttribute("books", books);
        request.setAttribute("authors", authors);
        request.setAttribute("categories", categories);
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

            case "Thêm":
                try {
                    createBook(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void createBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        int authorId = Integer.parseInt(request.getParameter("authorId"));
        Author author = authorService.findById(authorId);
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Category category = categoryService.findById(categoryId);
        String imageText = request.getParameter("image");
        int price = Integer.parseInt(request.getParameter("price"));
        int numberOfBook = Integer.parseInt(request.getParameter("numberOfBook"));
        String filePart = "";
//        for (Part part : request.getParts()) {
//            String fileName = extractFileName(part);
//            fileName = new File(fileName).getName();
//            filePart = this.getFolderUpload() + File.separator + fileName;
//            part.write(filePart);
//        }
        bookService.add(new Book(name, author, category, imageText, price, numberOfBook));
        response.sendRedirect("/book-management");
    }

    private File getFolderUpload() {
        File folderUpload = new File("E:\\CodeGym\\BookStore\\Upload");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}

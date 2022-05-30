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

@WebServlet(name = "BookInforServlet", value = "/book-infors")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class BookInforServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    BookService bookService = new BookServiceImpl();
    AuthorService authorService = new AuthorServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                try {
                    deleteBook(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                try {
                    showBookInfor(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookService.delete(id);
        response.sendRedirect("/book-management");
    }

    private void showBookInfor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookService.findById(id);
        request.setAttribute("book", book);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/book-infor.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "Sửa":
                try {
                    editBook(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void editBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int authorId = Integer.parseInt(request.getParameter("authorId"));
        Author author = authorService.findById(authorId);
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Category category = categoryService.findById(categoryId);
        String imageText = request.getParameter("image");
        int price = Integer.parseInt(request.getParameter("price"));
        int numberOfBook = Integer.parseInt(request.getParameter("numberOfBook"));
        if(!(imageText.contains("https://") || imageText.contains("E:\\CodeGym\\BookStore\\Upload"))) {
//            imageText = this.getFolderUpload().getAbsolutePath() + File.separator + imageText;
//            for (Part part : request.getParts()) {
//                part.write(imageText);
//            }
            imageText = "Upload/" + imageText;
        }
        bookService.update(new Book(id, name, author, category, imageText, price, numberOfBook));
        response.sendRedirect("/book-infors?id=" + id);
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

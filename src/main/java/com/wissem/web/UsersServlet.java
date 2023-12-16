package com.wissem.web;

import java.io.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wissem.business.entities.Post;
import com.wissem.business.entities.Role;
import com.wissem.business.entities.User;
import com.wissem.dao.PostDAO;
import com.wissem.dao.UserDAO;
import com.wissem.util.GsonLocalDateTimeAdapter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/users")
public class UsersServlet extends HttpServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    // prevent unauthorized users from accessing the users route
    if(!user.getRole().equals(Role.ADMIN)) {
      response.sendRedirect(request.getContextPath() + "/");
      return;
    }

    List<User> users = UserDAO.getUsers();

    // Set the users list as a request attribute
    request.setAttribute("users", users);

    // Forward the request to the JSP page
    RequestDispatcher dispatcher = request.getRequestDispatcher("/users.jsp");
    dispatcher.forward(request, response);

  }
}
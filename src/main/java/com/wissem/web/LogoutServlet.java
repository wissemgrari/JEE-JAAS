package com.wissem.web;

import java.io.*;
import java.util.List;

import com.wissem.business.entities.User;
import com.wissem.dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   HttpSession session = request.getSession();
   session.removeAttribute("user");
   request.removeAttribute("user");

    // Redirect to index.jsp upon successful login
    response.sendRedirect(request.getContextPath() + "/login.jsp");

  }
}
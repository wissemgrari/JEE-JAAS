package com.wissem.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wissem.business.SingletonConnection;
import com.wissem.business.entities.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  private final Connection connection = SingletonConnection.getConnection();

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    response.setContentType("text/html");

    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmed_password = request.getParameter("confirmed_password");

    try {
      // check if passwords match
      if(!password.equals(confirmed_password)) {
        // passwords does not match
        request.setAttribute("errorMessage", "Passwords does not match");
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
        return;
      }

      // check for existent email address
      PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) FROM users WHERE email=?");
      ps1.setString(1, email);
      ResultSet result = ps1.executeQuery();

      if(result.next() && result.getInt(1) > 0) {
        // Email exists in the table
        request.setAttribute("errorMessage", "This email is already taken.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
        return;
      }

      // If the email does not exist, proceed with the registration
      PreparedStatement ps2 = connection.prepareStatement("INSERT INTO users (fullname, email, password) VALUES (?, ?, ?)");
      ps2.setString(1, fullname);
      ps2.setString(2, email);
      ps2.setString(3, password);

      // Execute the insertion
      int rowsAffected = ps2.executeUpdate();

      if (rowsAffected > 0) {
        // Registration successful
        // Redirect to login.jsp
        // response.sendRedirect(request.getContextPath() + "/login.jsp");
        request.setAttribute("successMessage", "Registration completed. You can login.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
      } else {
        // Registration failed
        request.setAttribute("errorMessage", "Registration failed. Please try again.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
      }
    } catch (SQLException e) {
      throw new ServletException("Database access error", e);
    }
  }
}

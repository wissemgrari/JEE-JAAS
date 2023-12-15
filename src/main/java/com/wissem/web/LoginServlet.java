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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  private final Connection connection = SingletonConnection.getConnection();

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    response.setContentType("text/html");

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
      PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
      ps.setString(1, email);
      ps.setString(2, password);
      ResultSet result = ps.executeQuery();


      if (result.next()) {
        // create session and store the user
        HttpSession session = request.getSession();
        User user = new User(result);

        session.setAttribute("user", user);
        request.setAttribute("user", user);

        // Redirect to index.jsp upon successful login
        response.sendRedirect(request.getContextPath() + "/");

      } else {
        // Set an error message attribute in the request
        request.setAttribute("errorMessage", "Please check your email and password.");

        // Forward the request back to the login.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
      }

    } catch (SQLException e) {
      throw new ServletException("Database access error", e);
    }
  }
}

package com.wissem.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wissem.business.SingletonConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  private final Connection connection = SingletonConnection.getConnection();

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    response.setContentType("text/html");

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    try {
      PreparedStatement ps = connection.prepareStatement("SELECT username FROM users WHERE username=? AND password=?");
      ps.setString(1, username);
      ps.setString(2, password);
      ResultSet result = ps.executeQuery();


      if (result.next()) {
        // Redirect to index.jsp upon successful login
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
      } else {
        out.println("<h1>Login failed!</h1>");
      }

    } catch (SQLException e) {
      throw new ServletException("Database access error", e);
    }
  }
}

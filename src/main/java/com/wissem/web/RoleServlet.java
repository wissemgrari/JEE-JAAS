package com.wissem.web;

import java.io.IOException;

import com.wissem.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/role")
public class RoleServlet extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    // Retrieve parameters from the request
    String userIdStr = request.getParameter("userId");
    String role = request.getParameter("role");


    try {
      int userId = Integer.parseInt(userIdStr);
      UserDAO.updateUserRole(userId, role);

      // Send a success response
      response.getWriter().write("Role updated successfully");
      response.setStatus(HttpServletResponse.SC_OK);
    } catch (NumberFormatException e) {
      // Handle the case where userId is not a valid integer
      response.getWriter().write("Invalid user ID");
      response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
    } catch (Exception e) {
      // Handle other exceptions
      response.getWriter().write("Error updating role");
      response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
  }
}

package com.wissem.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wissem.business.SingletonConnection;
import com.wissem.business.entities.Post;
import com.wissem.business.entities.User;
import com.wissem.dao.PostDAO;
import com.wissem.util.GsonLocalDateTimeAdapter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/posts")
public class IndexServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private final Connection connection = SingletonConnection.getConnection();

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    List<Post> posts = PostDAO.getPosts();

    Gson gson = new GsonBuilder()
      .registerTypeAdapter(LocalDateTime.class, new GsonLocalDateTimeAdapter())
      .create();
//    Gson gson = new Gson();
    String json = gson.toJson(posts);

    // Set content type and write JSON to the response
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);
  }


  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    String postContent = request.getParameter("post-content");

    // create the post object
    Post post = new Post();
    post.setCreator(user.getFullname());
    post.setContent(postContent);
    post.setCreatedAt(LocalDateTime.now());

    try {

      PreparedStatement ps = connection.prepareStatement("INSERT INTO posts (creator, content, createdAt) VALUES (?, ?, ?)");
      ps.setString(1, post.getCreator());
      ps.setString(2, post.getContent());
      ps.setString(3, post.getCreatedAt().toString());

      // Execute the insertion
      int rowsAffected = ps.executeUpdate();

      if (rowsAffected > 0) {
        request.setAttribute("successMessage", "Post uploaded.");
        response.sendRedirect(request.getContextPath() + "/index.jsp");
      } else {
        request.setAttribute("errorMessage", "Something went wrong!");
        response.sendRedirect(request.getContextPath() + "/index.jsp");
      }
    } catch (SQLException e) {
      throw new ServletException("Database access error", e);
    }
  }

}

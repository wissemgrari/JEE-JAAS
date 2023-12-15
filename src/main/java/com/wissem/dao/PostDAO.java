package com.wissem.dao;

import com.wissem.business.SingletonConnection;
import com.wissem.business.entities.Post;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
  private static final String GET_POSTS_DESC_QUERY =
    "SELECT * FROM posts ORDER BY createdAt DESC";

  private static final Connection connection = SingletonConnection.getConnection();

  public static List<Post> getPosts() {
    List<Post> posts = new ArrayList<>();
    try {
      PreparedStatement ps = connection.prepareStatement(GET_POSTS_DESC_QUERY);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        Post post = new Post();
        post.setId(rs.getLong("id"));
        post.setCreator(rs.getString("creator"));
        post.setContent(rs.getString("content"));
        post.setCreatedAt(rs.getTimestamp("createdAt").toLocalDateTime());

        posts.add(post);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

    return posts;
  }
}

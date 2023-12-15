package com.wissem.dao;

import com.wissem.business.SingletonConnection;
import com.wissem.business.entities.Role;
import com.wissem.business.entities.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
  private static final String GET_POSTS_DESC_QUERY = "SELECT * FROM users";

  private static final Connection connection = SingletonConnection.getConnection();

  public static List<User> getUsers() {
    List<User> users = new ArrayList<>();

    try {
      PreparedStatement ps = connection.prepareStatement(GET_POSTS_DESC_QUERY);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        User user = new User();
        user.setId(rs.getLong("id"));
        user.setFullname(rs.getString("fullname"));
        user.setEmail(rs.getString("email"));
        user.setRole(Role.valueOf(rs.getString("role")));
        user.setCreatedAt(rs.getTimestamp("createdAt").toLocalDateTime());

        users.add(user);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

    return users;
  }
}

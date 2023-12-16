package com.wissem.dao;

import com.wissem.business.SingletonConnection;
import com.wissem.business.entities.Role;
import com.wissem.business.entities.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
  private static final String GET_USERS_QUERY = "SELECT * FROM users";
  private static final String UPDATE_USER_ROLE_QUERY = "UPDATE users SET role=? WHERE id=?";

  private static final Connection connection = SingletonConnection.getConnection();

  public static List<User> getUsers() {
    List<User> users = new ArrayList<>();

    try {
      PreparedStatement ps = connection.prepareStatement(GET_USERS_QUERY);
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

  public static User updateUserRole(long userId, String newRole) {
    User user = null;

    try {
      PreparedStatement ps = connection.prepareStatement(UPDATE_USER_ROLE_QUERY);
      ps.setString(1, newRole);
      ps.setLong(2, userId);

      int rowsUpdated = ps.executeUpdate();
      if (rowsUpdated > 0) {
        user = getUserById(userId);
      } else {
        System.out.println("No user found with the specified ID.");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

    return user;
  }

  private static User getUserById(long userId) {
    User user = null;

    try {
      PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE id=?");
      ps.setLong(1, userId);
      ResultSet rs = ps.executeQuery();

      if (rs.next()) {
        user = new User();
        user.setId(rs.getLong("id"));
        user.setFullname(rs.getString("fullname"));
        user.setEmail(rs.getString("email"));
        user.setRole(Role.valueOf(rs.getString("role")));
        user.setCreatedAt(rs.getTimestamp("createdAt").toLocalDateTime());
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

    return user;
  }
}

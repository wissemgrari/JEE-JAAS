package com.wissem.business.entities;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class User {
  private Long id;
  private String fullname;
  private String email;
  private String password;

  private LocalDateTime createdAt;

  private Role role = Role.READER;

  public User(){};

  public User(Long id, String fullname, String email, String password, LocalDateTime createdAt) {
    this.id = id;
    this.fullname = fullname;
    this.email = email;
    this.password = password;
    this.createdAt = createdAt;
  }

  // Constructor that takes a ResultSet as a parameter
  public User(ResultSet resultSet) throws SQLException {
    this.id = resultSet.getLong("id");
    this.fullname = resultSet.getString("fullname");
    this.email = resultSet.getString("email");
    this.password = resultSet.getString("password");
    this.role = Role.valueOf(resultSet.getString("role"));
  }
  public Long getId() {
    return id;
  }

  public String getFullname() {
    return fullname;
  }

  public String getEmail() {
    return email;
  }

  public String getPassword() {
    return password;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public void setFullname(String fullname) {
    this.fullname = fullname;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Role getRole() {
    return role;
  }

  public void setRole(Role role) {
    this.role = role;
  }

  public LocalDateTime getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(LocalDateTime createdAt) {
    this.createdAt = createdAt;
  }

  @Override
  public String toString() {
    return "User{" +
      "id=" + id +
      ", fullname='" + fullname + '\'' +
      ", email='" + email + '\'' +
      ", password='" + password + '\'' +
      ", role='" + role + '\'' +
      ", createdAt='" + createdAt + '\'' +
      '}';
  }

  public String getInitials() {
    if (fullname != null && !fullname.isEmpty()) {
      String[] names = fullname.split("\\s+");
      StringBuilder initials = new StringBuilder();

      for (String name : names) {
        if (!name.isEmpty()) {
          initials.append(name.charAt(0));
        }
      }

      return initials.toString().toUpperCase();
    }
    return "";
  }

}


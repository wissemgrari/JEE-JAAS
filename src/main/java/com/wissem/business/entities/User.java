package com.wissem.business.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
  private Long id;
  private String fullname;
  private String email;
  private String password;

  private Role role = Role.READER;

  public User(){};
  public User(Long id, String fullname, String email, String password) {
    this.id = id;
    this.fullname = fullname;
    this.email = email;
    this.password = password;
  }

  // Constructor that takes a ResultSet as a parameter
  public User(ResultSet resultSet) throws SQLException {
    this.id = resultSet.getLong("id");
    this.fullname = resultSet.getString("fullname");
    this.email = resultSet.getString("email");
    this.password = resultSet.getString("password");
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

  @Override
  public String toString() {
    return "User{" +
      "id=" + id +
      ", fullname='" + fullname + '\'' +
      ", email='" + email + '\'' +
      ", password='" + password + '\'' +
      ", role='" + role + '\'' +
      '}';
  }
}


package com.wissem.business.entities;

import java.time.Duration;
import java.time.LocalDateTime;

public class Post {

  private Long id;
  private String creator;
  private String content;
  private LocalDateTime createdAt;

  public Post() {
  }

  public Post(String creator, String content, LocalDateTime createdAt) {
    this.creator = creator;
    this.content = content;
    this.createdAt = createdAt;
  }

  public LocalDateTime getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(LocalDateTime createdAt) {
    this.createdAt = createdAt;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getCreator() {
    return creator;
  }

  public void setCreator(String creator) {
    this.creator = creator;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getContent() {
    return content;
  }

  public String formatRelativeTime() {
    LocalDateTime now = LocalDateTime.now();
    Duration duration = Duration.between(createdAt, now);

    if (duration.toMinutes() < 1) {
      return "Just now";
    } else if (duration.toHours() < 1) {
      long minutes = duration.toMinutes();
      return minutes + (minutes == 1 ? " minute ago" : " minutes ago");
    } else if (duration.toDays() < 1) {
      long hours = duration.toHours();
      return hours + (hours == 1 ? " hour ago" : " hours ago");
    } else if (duration.toDays() < 7) {
      long days = duration.toDays();
      return days + (days == 1 ? " day ago" : " days ago");
    } else if (duration.toDays() < 30) {
      long weeks = duration.toDays() / 7;
      return weeks + (weeks == 1 ? " week ago" : " weeks ago");
    } else if (duration.toDays() < 365) {
      long months = duration.toDays() / 30;
      return months + (months == 1 ? " month ago" : " months ago");
    } else {
      long years = duration.toDays() / 365;
      return years + (years == 1 ? " year ago" : " years ago");
    }
  }

  @Override
  public String toString() {
    return "Post{" +
      "id=" + id +
      ", creator='" + creator + '\'' +
      ", content='" + content + '\'' +
      ", createdAt='" + createdAt + '\'' +
      '}';
  }
}

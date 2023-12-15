package com.wissem.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateFormatter {

  public static String formatToCustomPattern(LocalDateTime dateTime, String pattern) {
    if (dateTime == null) {
      return ""; // Or throw an exception, depending on your requirements
    }

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
    return dateTime.format(formatter);
  }
}

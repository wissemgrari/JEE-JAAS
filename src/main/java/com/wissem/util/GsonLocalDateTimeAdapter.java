package com.wissem.util;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class GsonLocalDateTimeAdapter extends TypeAdapter<LocalDateTime> {
  private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

  @Override
  public void write(JsonWriter out, LocalDateTime value) throws IOException {
    if (value == null) {
      out.nullValue();
    } else {
      out.value(formatter.format(value));
    }
  }

  @Override
  public LocalDateTime read(JsonReader in) throws IOException {
    // Implement deserialization if needed
    return null;
  }
}

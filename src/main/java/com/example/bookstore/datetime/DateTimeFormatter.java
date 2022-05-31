package com.example.bookstore.datetime;

import java.time.LocalDateTime;

public class DateTimeFormatter {
    private final static String PATTERN_DATETIME_CREATE_ID = "ddMMyyHHmmss";
    public static String getPatternDatetimeCreateId() {
        return PATTERN_DATETIME_CREATE_ID;
    }
    public static String formatDateTime(LocalDateTime dateTime, String pattern) {
        java.time.format.DateTimeFormatter formater = java.time.format.DateTimeFormatter.ofPattern(pattern);
        return formater.format(dateTime);
    }
}

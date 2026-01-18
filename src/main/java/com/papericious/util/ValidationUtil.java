package com.papericious.util;

import java.util.regex.Pattern;

public class ValidationUtil {

    // Regex for standard email format
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
    
    // Regex for phone number (10-11 digits)
    private static final Pattern PHONE_PATTERN = Pattern.compile("^\\d{10,11}$");

    // Regex for password: at least 8 chars, at least 1 letter and 1 number
    private static final Pattern PASSWORD_PATTERN = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d).{8,}$");

    public static boolean isValidEmail(String email) {
        return email != null && EMAIL_PATTERN.matcher(email).matches();
    }

    public static boolean isValidPhoneNumber(String phone) {
        return phone != null && PHONE_PATTERN.matcher(phone).matches();
    }

    public static boolean isValidPassword(String password) {
        return password != null && PASSWORD_PATTERN.matcher(password).matches();
    }
}

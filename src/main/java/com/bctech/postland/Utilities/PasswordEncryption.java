package com.bctech.postland.Utilities;

import java.util.Base64;

public class PasswordEncryption {

    public static String encryptPassword(String password){
        return Base64.getEncoder().encodeToString(password.getBytes());
    }

    public static String decryptPassword(String encryptedString){
        return new String (Base64.getDecoder().decode(encryptedString));
    }
}


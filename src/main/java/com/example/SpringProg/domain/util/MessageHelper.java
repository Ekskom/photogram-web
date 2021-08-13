
package com.example.SpringProg.domain.util;

import com.example.SpringProg.domain.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author)
    {
        return author != null ? author.getUsername() : "<none>";
    }
}
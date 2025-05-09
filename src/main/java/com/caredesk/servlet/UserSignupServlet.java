package com.caredesk.servlet;

import com.caredesk.model.User;
import com.caredesk.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/signup")
public class UserSignupServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Password Validation
        if (password == null || password.length() < 8 ||
            !password.matches(".*[A-Z].*") ||
            !password.matches(".*[a-z].*") ||
            !password.matches(".*\\d.*")) {

            request.setAttribute("error", "Password must be at least 8 characters, with uppercase, lowercase and a number.");
            request.getRequestDispatcher("/client/signup.jsp").forward(request, response);
            return;
        }

        // Email check
        boolean exists = isEmailRegistered(email);
        if (exists) {
            request.setAttribute("error", "Email already in use.");
            request.getRequestDispatcher("/client/signup.jsp").forward(request, response);
            return;
        }

        // Create User
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);

        if (userService.createUser(user)) {
            request.setAttribute("success", "Account created successfully! Redirecting to login...");
            request.getRequestDispatcher("/client/signup.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Signup failed. Please try again.");
            request.getRequestDispatcher("/client/signup.jsp").forward(request, response);
        }
    }

    // Check email existence manually (since your service lacks it)
    private boolean isEmailRegistered(String email) {
        List<User> users = userService.getAllUsers();
        for (User user : users) {
            if (user.getEmail().equalsIgnoreCase(email)) {
                return true;
            }
        }
        return false;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.getRequestDispatcher("/client/signup.jsp").forward(request, response);
        }
    }
}
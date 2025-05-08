<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CareDesk Admin Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-orange-100 via-gray-100 to-orange-200 min-h-screen flex items-center justify-center">

    <div class="bg-white rounded-2xl shadow-lg w-full max-w-md p-8">
        <div class="text-center mb-6">
            <h1 class="text-3xl font-bold text-orange-500">CareDesk Admin</h1>
            <p class="text-gray-600 text-sm mt-1">Only Admins and Agents are allowed</p>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/admin/login" class="space-y-5">
            <!-- Email -->
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
                <div class="mt-1 relative">
                    <input type="email" name="email" id="email" required autocomplete="email"
                           value="${param.email != null ? param.email : ''}"
                           class="block w-full pl-10 pr-4 py-2 border border-gray-300 rounded-md focus:ring-orange-400 focus:border-orange-400 sm:text-sm">
                    <div class="absolute left-3 top-2.5 text-gray-400">
                        <i class="fas fa-envelope"></i>
                    </div>
                </div>
            </div>

            <!-- Password -->
            <div>
                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                <div class="mt-1 relative">
                    <input type="password" name="password" id="password" required autocomplete="current-password"
                           class="block w-full pl-10 pr-4 py-2 border border-gray-300 rounded-md focus:ring-orange-400 focus:border-orange-400 sm:text-sm">
                    <div class="absolute left-3 top-2.5 text-gray-400">
                        <i class="fas fa-lock"></i>
                    </div>
                </div>
            </div>

            <!-- Error message -->
            <c:if test="${not empty error}">
                <div class="bg-red-100 text-red-700 border border-red-300 p-3 rounded-md text-sm">
                    <i class="fas fa-exclamation-circle mr-2"></i>${error}
                </div>
            </c:if>

            <!-- Remember + Forgot -->
            <div class="flex items-center justify-between">
                <label class="flex items-center text-sm text-gray-600">
                    <input type="checkbox" class="form-checkbox text-orange-500 mr-2"> Remember me
                </label>
                <a href="mailto:support@caredesk.com" class="text-orange-500 hover:underline text-sm">Forgot password?</a>
            </div>

            <!-- Submit -->
            <button type="submit"
                    class="w-full py-2 bg-orange-500 text-white rounded-md hover:bg-orange-600 transition duration-150 font-medium">
                <i class="fas fa-sign-in-alt mr-2"></i> Login
            </button>
        </form>
    </div>

</body>
</html>
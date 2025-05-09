<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login | CareDesk</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

  <%@ include file="partials/navbar.jsp" %>

  <!-- Login Section -->
  <section class="bg-orange-50 py-20">
    <div class="container mx-auto px-4">
      <div class="max-w-md mx-auto bg-white p-8 rounded-xl shadow-lg space-y-6">

        <!-- Branding -->
        <div class="text-center">
          <a href="${pageContext.request.contextPath}/" class="text-3xl font-bold text-orange-500 flex items-center justify-center space-x-2">
            <i class="fas fa-headset"></i>
            <span>CareDesk</span>
          </a>
          <h2 class="mt-4 text-2xl font-bold text-gray-900">Log in to your account</h2>
          <p class="mt-2 text-sm text-gray-600">
            Or
            <a href="${pageContext.request.contextPath}/signup" class="font-medium text-orange-500 hover:text-orange-600">
              create a new account
            </a>
          </p>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty error}">
          <div class="bg-red-100 text-red-800 px-4 py-2 rounded-md text-sm text-center font-medium">
            ${error}
          </div>
        </c:if>

        <!-- Login Form -->
        <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-5">

          <!-- Email -->
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700">Email address</label>
            <input id="email" name="email" type="email" required autocomplete="email"
              class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:ring-orange-400 focus:border-orange-400 sm:text-sm"
              placeholder="you@example.com">
          </div>

          <!-- Password -->
          <div>
            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
            <input id="password" name="password" type="password" required autocomplete="current-password"
              class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:ring-orange-400 focus:border-orange-400 sm:text-sm"
              placeholder="••••••••">
          </div>

          <!-- Options -->
          <div class="flex items-center justify-between">
            <label class="flex items-center text-sm text-gray-600">
              <input type="checkbox" class="form-checkbox text-orange-500 mr-2"> Remember me
            </label>
            <a href="mailto:support@caredesk.com" class="text-orange-500 hover:underline text-sm">Forgot password?</a>
          </div>

          <!-- Submit -->
          <button type="submit"
            class="w-full py-2 bg-orange-500 text-white rounded-md hover:bg-orange-600 transition duration-150 font-medium flex items-center justify-center space-x-2">
            <i class="fas fa-lock"></i>
            <span>Sign in</span>
          </button>
        </form>
      </div>
    </div>
  </section>

  <%@ include file="partials/footer.jsp" %>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Signup | CareDesk</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

  <%@ include file="partials/navbar.jsp" %>

  <section class="bg-orange-50 py-20">
    <div class="container mx-auto px-4">
      <div class="max-w-md mx-auto bg-white p-8 rounded-xl shadow-lg space-y-6">

        <!-- Branding -->
        <div class="text-center">
          <a href="${pageContext.request.contextPath}/" class="text-3xl font-bold text-orange-600 flex items-center justify-center space-x-2">
            <i class="fas fa-headset"></i>
            <span>CareDesk</span>
          </a>
          <h2 class="mt-4 text-2xl font-bold text-gray-900">Create a new account</h2>
          <p class="mt-2 text-sm text-gray-600">
            Already have an account?
            <a href="${pageContext.request.contextPath}/login" class="font-medium text-orange-600 hover:text-orange-500">
              Sign in here
            </a>
          </p>
        </div>

        <!-- Success Message -->
        <c:if test="${not empty success}">
          <div class="bg-green-100 text-green-800 px-4 py-2 rounded-md text-sm text-center font-medium">
            ${success}
          </div>
          <script>
            setTimeout(() => {
              window.location.href = '${pageContext.request.contextPath}/login';
            }, 3000);
          </script>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty error}">
          <div class="bg-red-100 text-red-800 px-4 py-2 rounded-md text-sm text-center font-medium">
            ${error}
          </div>
        </c:if>

        <!-- Signup Form -->
        <form action="${pageContext.request.contextPath}/signup" method="POST" class="space-y-5" onsubmit="return validateForm()">
          
          <!-- Full Name -->
          <div>
            <label for="full_name" class="block text-sm font-medium text-gray-700">Full Name</label>
            <input id="full_name" name="full_name" type="text" required
              class="mt-1 block w-full px-4 py-2 border border-orange-300 rounded-lg shadow-sm focus:ring-orange-500 focus:border-orange-500 sm:text-sm"
              placeholder="Jane Doe">
          </div>

          <!-- Email -->
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700">Email address</label>
            <input id="email" name="email" type="email" required
              class="mt-1 block w-full px-4 py-2 border border-orange-300 rounded-lg shadow-sm focus:ring-orange-500 focus:border-orange-500 sm:text-sm"
              placeholder="you@example.com">
          </div>

          <!-- Password -->
          <div>
            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
            <input id="password" name="password" type="password" required
              class="mt-1 block w-full px-4 py-2 border border-orange-300 rounded-lg shadow-sm focus:ring-orange-500 focus:border-orange-500 sm:text-sm"
              placeholder="••••••••">
          </div>

          <!-- Password Validation -->
          <div class="text-sm text-gray-600 space-y-1" id="passwordHints">
            <p id="lengthHint" class="flex items-center"><i class="fa fa-circle text-xs mr-2"></i> At least 8 characters</p>
            <p id="uppercaseHint" class="flex items-center"><i class="fa fa-circle text-xs mr-2"></i> One uppercase letter</p>
            <p id="lowercaseHint" class="flex items-center"><i class="fa fa-circle text-xs mr-2"></i> One lowercase letter</p>
            <p id="digitHint" class="flex items-center"><i class="fa fa-circle text-xs mr-2"></i> One number</p>
          </div>

          <!-- Submit -->
          <div>
            <button id="signupBtn" type="submit" disabled
              class="w-full flex justify-center items-center space-x-2 px-4 py-2 text-sm font-semibold text-white bg-orange-500 hover:bg-orange-600 rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-orange-400">
              <i class="fas fa-user-plus"></i>
              <span>Sign Up</span>
            </button>
          </div>
        </form>
      </div>
    </div>
  </section>

  <%@ include file="partials/footer.jsp" %>

  <!-- Password Validation Script -->
  <script>
    const password = document.getElementById("password");
    const signupBtn = document.getElementById("signupBtn");

    const lengthHint = document.getElementById("lengthHint");
    const uppercaseHint = document.getElementById("uppercaseHint");
    const lowercaseHint = document.getElementById("lowercaseHint");
    const digitHint = document.getElementById("digitHint");

    function updateHints(valid, hint) {
      hint.classList.toggle("text-green-600", valid);
      hint.classList.toggle("text-red-600", !valid);
    }

    password.addEventListener("input", () => {
      const val = password.value;

      const validLength = val.length >= 8;
      const validUpper = /[A-Z]/.test(val);
      const validLower = /[a-z]/.test(val);
      const validDigit = /\d/.test(val);

      updateHints(validLength, lengthHint);
      updateHints(validUpper, uppercaseHint);
      updateHints(validLower, lowercaseHint);
      updateHints(validDigit, digitHint);

      signupBtn.disabled = !(validLength && validUpper && validLower && validDigit);
    });

    function validateForm() {
      return !signupBtn.disabled;
    }
  </script>

</body>
</html>
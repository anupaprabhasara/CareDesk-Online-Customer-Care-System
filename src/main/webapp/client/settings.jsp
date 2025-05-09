<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Settings | CareDesk</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-orange-50">
<%@ include file="partials/navbarsession.jsp" %>

<div class="max-w-7xl mx-auto my-12 bg-white p-10 rounded-2xl shadow-md border border-orange-200">
  <h2 class="text-3xl font-bold text-orange-600 mb-8">Update Your Profile</h2>

  <form method="post" action="${pageContext.request.contextPath}/settings">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
      <!-- Left Side -->
      <div class="space-y-6">
        <div>
          <label class="block text-gray-700 font-medium mb-1">Full Name</label>
          <input type="text" name="full_name" value="${user.fullName}" required
                 class="w-full px-4 py-2 border border-orange-300 bg-orange-50 rounded-md focus:ring-2 focus:ring-orange-400">
        </div>
        <div>
          <label class="block text-gray-700 font-medium mb-1">Email</label>
          <input type="email" name="email" value="${user.email}" required
                 class="w-full px-4 py-2 border border-orange-300 bg-orange-50 rounded-md focus:ring-2 focus:ring-orange-400">
        </div>
      </div>

      <!-- Right Side -->
      <div class="space-y-6">
        <div>
          <label class="block text-gray-700 font-medium mb-1">New Password</label>
          <input id="password" type="password" name="new_password" placeholder="Leave blank to keep current password"
                 class="w-full px-4 py-2 border border-orange-300 bg-orange-50 rounded-md focus:ring-2 focus:ring-orange-400">
          <div id="password-hints" class="text-sm text-gray-600 space-y-1 mt-2">
            <p id="lengthHint" class="text-red-600">At least 8 characters</p>
            <p id="uppercaseHint" class="text-red-600">At least one uppercase letter</p>
            <p id="lowercaseHint" class="text-red-600">At least one lowercase letter</p>
            <p id="digitHint" class="text-red-600">At least one number</p>
          </div>
        </div>
        <div>
          <label class="block text-gray-700 font-medium mb-1">Current Password <span class="text-red-600">*</span></label>
          <input type="password" name="current_password" required
                 class="w-full px-4 py-2 border border-orange-300 bg-orange-50 rounded-md focus:ring-2 focus:ring-orange-400">
        </div>
      </div>
    </div>

    <!-- Button -->
    <div class="mt-10 text-right">
      <button id="submitBtn" type="submit"
              class="bg-orange-500 text-white px-6 py-2 rounded-md hover:bg-orange-600 transition font-semibold"
              disabled>
        <i class="fas fa-save mr-2"></i> Save Changes
      </button>
    </div>
  </form>

  <!-- Feedback messages -->
  <c:if test="${not empty error}">
    <div class="mt-6 text-red-600 font-medium">${error}</div>
  </c:if>
  <c:if test="${not empty success}">
    <div class="mt-6 text-green-600 font-medium">${success}</div>
  </c:if>
</div>

<!-- Validation Script -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const passwordInput = document.getElementById("password");
    const submitBtn = document.getElementById("submitBtn");

    const lengthHint = document.getElementById("lengthHint");
    const uppercaseHint = document.getElementById("uppercaseHint");
    const lowercaseHint = document.getElementById("lowercaseHint");
    const digitHint = document.getElementById("digitHint");

    function validate() {
      const val = passwordInput.value;
      const isEmpty = val.trim() === "";
      const lengthValid = val.length >= 8;
      const uppercaseValid = /[A-Z]/.test(val);
      const lowercaseValid = /[a-z]/.test(val);
      const digitValid = /\d/.test(val);

      lengthHint.className = lengthValid ? "text-green-600" : "text-red-600";
      uppercaseHint.className = uppercaseValid ? "text-green-600" : "text-red-600";
      lowercaseHint.className = lowercaseValid ? "text-green-600" : "text-red-600";
      digitHint.className = digitValid ? "text-green-600" : "text-red-600";

      submitBtn.disabled = !(isEmpty || (lengthValid && uppercaseValid && lowercaseValid && digitValid));
    }

    passwordInput.addEventListener("input", validate);
    validate();
  });
</script>

<%@ include file="partials/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>CareDesk | Edit Admin</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gradient-to-br from-orange-100 via-gray-100 to-orange-200 min-h-screen text-gray-800 flex">

  <!-- Sidebar (fixed) -->
  <%@ include file="../partials/sidebar.jsp" %>

  <!-- Main Content with Sidebar Margin -->
  <div class="flex-1 flex flex-col md:ml-60">

    <!-- Topbar -->
    <%@ include file="../partials/header.jsp" %>

    <!-- Main Area -->
    <main class="flex-1 p-6 space-y-6">

      <!-- Admin Update Form -->
      <form action="${pageContext.request.contextPath}/admin/admin" method="POST" class="bg-white shadow-lg rounded-lg p-8 w-full">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${admin.adminId}">

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          
          <!-- Left Side -->
          <div class="space-y-4">
            <div>
              <label class="block text-sm font-medium mb-1" for="fullName">Full Name</label>
              <input type="text" id="fullName" name="fullName" required
                     value="${admin.fullName}"
                     class="w-full px-4 py-2 rounded-lg border border-orange-300 bg-orange-50 text-gray-800 focus:ring-2 focus:ring-orange-400 focus:outline-none">
            </div>

            <div>
              <label class="block text-sm font-medium mb-1" for="email">Email</label>
              <input type="email" id="email" name="email" required
                     value="${admin.email}"
                     class="w-full px-4 py-2 rounded-lg border border-orange-300 bg-orange-50 text-gray-800 focus:ring-2 focus:ring-orange-400 focus:outline-none">
            </div>

            <div>
              <label class="block text-sm font-medium mb-1" for="role">Role</label>
              <select id="role" name="role" required
                      class="w-full px-4 py-2 rounded-lg border border-orange-300 bg-orange-50 text-gray-800 focus:ring-2 focus:ring-orange-400 focus:outline-none">
                <option value="">-- Select Role --</option>
                <option value="Admin" ${admin.role == 'Admin' ? 'selected' : ''}>Admin</option>
                <option value="Agent" ${admin.role == 'Agent' ? 'selected' : ''}>Agent</option>
              </select>
            </div>
          </div>

          <!-- Right Side -->
          <div class="space-y-4">
            <div>
              <label class="block text-sm font-medium mb-1" for="password">Password</label>
              <input type="password" id="password" name="password"
                     value="${admin.password}"
                     class="w-full px-4 py-2 mb-2 rounded-lg border border-orange-300 bg-orange-50 text-gray-800 focus:ring-2 focus:ring-orange-400 focus:outline-none"
                     oninput="validatePassword()">

              <!-- Password Validation Info -->
              <div class="text-sm space-y-1 hidden" id="passwordCriteria">
                <p id="length" class="text-red-500">At least 8 characters</p>
                <p id="uppercase" class="text-red-500">At least 1 uppercase letter</p>
                <p id="number" class="text-red-500">At least 1 number</p>
                <p id="special" class="text-red-500">At least 1 special character</p>
              </div>
            </div>
          </div>

        </div>

        <!-- Submit Button -->
        <div class="mt-8 flex justify-end">
          <button id="submitButton" type="submit"
                  class="flex items-center gap-2 px-6 py-2 bg-orange-500 hover:bg-orange-600 text-white rounded-lg font-semibold transition">
            <i class="fas fa-save"></i> Update Admin
          </button>
        </div>
      </form>

    </main>
  </div>

  <!-- JavaScript -->
  <%@ include file="../partials/script.jsp" %>

  <script>
    function validatePassword() {
      const passwordInput = document.getElementById('password');
      const password = passwordInput.value;
      const length = document.getElementById('length');
      const uppercase = document.getElementById('uppercase');
      const number = document.getElementById('number');
      const special = document.getElementById('special');
      const passwordCriteria = document.getElementById('passwordCriteria');
      const submitButton = document.getElementById('submitButton');

      if (password.length > 0) {
        passwordCriteria.classList.remove('hidden');

        const isLengthValid = password.length >= 8;
        const isUppercaseValid = /[A-Z]/.test(password);
        const isNumberValid = /[0-9]/.test(password);
        const isSpecialValid = /[!@#$%^&*]/.test(password);

        length.className = isLengthValid ? "text-green-500" : "text-red-500";
        uppercase.className = isUppercaseValid ? "text-green-500" : "text-red-500";
        number.className = isNumberValid ? "text-green-500" : "text-red-500";
        special.className = isSpecialValid ? "text-green-500" : "text-red-500";

        submitButton.disabled = !(isLengthValid && isUppercaseValid && isNumberValid && isSpecialValid);
      } else {
        passwordCriteria.classList.add('hidden');
        submitButton.disabled = false;
      }
    }

    window.onload = validatePassword;
  </script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>CareDesk | User Management</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gradient-to-br from-orange-100 via-gray-100 to-orange-200 min-h-screen text-gray-800 flex">

  <!-- Sidebar -->
  <%@ include file="../partials/sidebar.jsp" %>

  <!-- Main Content -->
  <div class="flex-1 flex flex-col md:ml-60">

    <!-- Topbar -->
    <%@ include file="../partials/header.jsp" %>

    <!-- Main Area -->
    <main class="flex-1 p-6 space-y-6">

      <!-- Actions -->
      <div class="flex justify-end">
        <div class="relative w-full md:w-1/3">
          <input id="search" type="text" placeholder="Search users..."
                 class="w-full pl-10 pr-4 py-2 rounded-lg bg-white border border-orange-300 focus:ring-2 focus:ring-orange-400 focus:outline-none text-gray-800">
          <i class="fas fa-search absolute left-3 top-3 text-orange-400"></i>
        </div>
      </div>

      <!-- Table -->
      <div class="overflow-x-auto bg-white shadow-lg rounded-lg">
        <table class="w-full text-sm text-left">
          <thead class="text-xs uppercase bg-orange-200 text-orange-900">
            <tr>
              <th class="px-6 py-4">ID</th>
              <th class="px-6 py-4">Full Name</th>
              <th class="px-6 py-4">Email</th>
              <th class="px-6 py-4 text-center">Actions</th>
            </tr>
          </thead>
          <tbody id="table" class="text-gray-700">
            <c:choose>
              <c:when test="${not empty users}">
                <c:forEach var="user" items="${users}">
                  <tr class="border-b border-orange-100 hover:bg-orange-100/50">
                    <td class="px-6 py-4">${user.userId}</td>
                    <td class="px-6 py-4">${user.fullName}</td>
                    <td class="px-6 py-4">${user.email}</td>
                    <td class="px-6 py-4 text-center space-x-3">
                      <a href="${pageContext.request.contextPath}/admin/user?action=delete&id=${user.userId}" onclick="return confirm('Are you sure you want to delete this user?');" class="text-red-500 hover:text-red-600">
                        <i class="fas fa-trash"></i> Delete
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="4" class="px-6 py-4 text-center text-gray-400">No users found.</td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>

    </main>
  </div>

  <!-- JavaScript -->
  <%@ include file="../partials/script.jsp" %>

</body>
</html>
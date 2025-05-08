<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="fixed top-0 left-0 w-60 hidden md:flex flex-col bg-white border-r border-orange-200 shadow-md h-screen z-20">
  <!-- Logo -->
  <div class="p-6 text-center border-b border-orange-200">
    <h1 class="text-2xl font-bold text-orange-500">CareDesk</h1>
    <c:if test="${not empty sessionScope.role}">
      <p class="mt-1 text-sm text-gray-500">Your role:
        <span class="font-semibold text-orange-400">${sessionScope.role}</span>
      </p>
    </c:if>
  </div>

  <!-- Navigation -->
  <nav class="flex-1 px-4 py-6 space-y-2 overflow-y-auto text-sm font-medium">
  	<!-- Show only if role is Agent -->
    <c:if test="${sessionScope.role == 'Agent'}">
      <a href="${pageContext.request.contextPath}/admin/ticket"
        class="flex items-center p-3 rounded hover:bg-orange-100 transition text-gray-700 hover:text-orange-600">
        <i class="fas fa-ticket-alt mr-3"></i> Tickets
      </a>

      <a href="${pageContext.request.contextPath}/admin/response"
        class="flex items-center p-3 rounded hover:bg-orange-100 transition text-gray-700 hover:text-orange-600">
        <i class="fas fa-reply mr-3"></i> Responses
      </a>

      <a href="${pageContext.request.contextPath}/admin/feedback"
        class="flex items-center p-3 rounded hover:bg-orange-100 transition text-gray-700 hover:text-orange-600">
        <i class="fas fa-comments mr-3"></i> Feedback
      </a>
    </c:if>

    <!-- Show only if role is Admin -->
    <c:if test="${sessionScope.role == 'Admin'}">
      <a href="${pageContext.request.contextPath}/admin/admin"
        class="flex items-center p-3 rounded hover:bg-orange-100 transition text-gray-700 hover:text-orange-600">
        <i class="fas fa-users-cog mr-3"></i> Admins
      </a>

      <a href="${pageContext.request.contextPath}/admin/user"
        class="flex items-center p-3 rounded hover:bg-orange-100 transition text-gray-700 hover:text-orange-600">
        <i class="fas fa-user mr-3"></i> Users
      </a>
    </c:if>
  </nav>

  <!-- Logout -->
  <div class="p-4 border-t border-orange-200">
    <a href="${pageContext.request.contextPath}/admin/logout"
       class="w-full flex items-center justify-center text-red-500 hover:text-red-600 font-semibold transition">
      <i class="fas fa-sign-out-alt mr-2"></i> Logout
    </a>
  </div>
</aside>
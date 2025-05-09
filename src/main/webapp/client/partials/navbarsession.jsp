<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Navigation Bar -->
<nav class="bg-orange-500 text-white sticky top-0 z-50 shadow-lg">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between items-center h-16">

      <!-- Brand -->
      <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2 text-2xl font-bold">
        <i class="fas fa-headset"></i> <span>CareDesk</span>
      </a>

      <!-- Right Section -->
      <div class="flex items-center space-x-4">

        <!-- User Menu -->
        <div class="relative">
          <button onclick="toggleUserMenu()" class="flex items-center space-x-2 hover:text-orange-200 focus:outline-none">
            <img src="https://ui-avatars.com/api/?name=${sessionScope.name}&background=fb923c&color=fff"
                 alt="${sessionScope.name}" class="w-8 h-8 rounded-full">
            <span class="hidden sm:block">${sessionScope.name}</span>
            <i class="fas fa-chevron-down text-sm"></i>
          </button>

          <!-- Dropdown -->
          <div id="userDropdown"
               class="hidden absolute right-0 mt-2 w-48 bg-white text-gray-700 rounded-md shadow-lg border border-gray-100 z-50 overflow-hidden">
            <div class="px-4 py-3 border-b">
              <p class="text-xs text-gray-500">Signed in as</p>
              <p class="font-semibold break-words text-sm text-gray-800">${sessionScope.email}</p>
            </div>
            <a href="${pageContext.request.contextPath}/profile" class="flex items-center px-4 py-2 hover:bg-gray-50"><i class="fas fa-user mr-2 text-gray-500"></i>Profile</a>
            <a href="${pageContext.request.contextPath}/ticket" class="flex items-center px-4 py-2 hover:bg-gray-50"><i class="fas fa-ticket-alt mr-2 text-gray-500"></i>My Tickets</a>
            <a href="${pageContext.request.contextPath}/settings" class="flex items-center px-4 py-2 hover:bg-gray-50"><i class="fas fa-cog mr-2 text-gray-500"></i>Settings</a>
            <div class="border-t">
              <a href="${pageContext.request.contextPath}/logout"
                 class="flex items-center px-4 py-2 text-red-600 hover:bg-red-50"><i class="fas fa-sign-out-alt mr-2"></i>Logout</a>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</nav>

<script>
  function toggleUserMenu() {
    const dropdown = document.getElementById('userDropdown');
    dropdown.classList.toggle('hidden');
  }

  document.addEventListener('click', (event) => {
    const dropdown = document.getElementById('userDropdown');
    if (!event.target.closest('button')) {
      dropdown.classList.add('hidden');
    }
  });
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>CareDesk | Create Response</title>
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

      <!-- Response Create Form -->
      <form action="${pageContext.request.contextPath}/admin/response" method="POST"
            class="bg-white shadow-lg rounded-lg p-8 w-full">
        <input type="hidden" name="action" value="create">
        <input type="hidden" name="ticketId" value="${ticketId}">

        <div class="space-y-6">
          <div>
            <label class="block text-sm font-medium mb-1" for="message">Response Message</label>
            <textarea id="message" name="message" rows="6" required
                      class="w-full px-4 py-2 rounded-lg border border-orange-300 bg-orange-50 text-gray-800 focus:ring-2 focus:ring-orange-400 focus:outline-none"></textarea>
          </div>
        </div>

        <!-- Submit Button -->
        <div class="mt-8 flex justify-end">
          <button type="submit"
            class="flex items-center gap-2 px-6 py-2 bg-orange-500 hover:bg-orange-600 text-white rounded-lg font-semibold transition">
            <i class="fas fa-paper-plane"></i> Submit Response
          </button>
        </div>
      </form>

    </main>
  </div>

  <%@ include file="../partials/script.jsp" %>

</body>
</html>
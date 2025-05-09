<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Submit Ticket | CareDesk</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

  <c:choose>
    <c:when test="${isLoggedIn}">
      <%@ include file="../partials/navbarsession.jsp" %>
    </c:when>
    <c:otherwise>
      <%@ include file="../partials/navbar.jsp" %>
    </c:otherwise>
  </c:choose>

  <!-- Form Section -->
  <section class="bg-orange-50 py-20">
    <div class="max-w-7xl mx-auto px-6">
      <div class="bg-white rounded-2xl shadow-lg p-10 border border-orange-200">
        <div class="mb-8 text-center">
          <h2 class="text-3xl font-bold text-orange-600 mb-2">Submit a Support Ticket</h2>
          <p class="text-gray-600">We're here to help. Fill out the form and our team will get back to you shortly.</p>
        </div>

        <form action="${pageContext.request.contextPath}/ticket" method="post" class="space-y-6">
          <input type="hidden" name="action" value="create">

          <!-- Subject -->
          <div>
            <label for="subject" class="block text-sm font-medium text-gray-700 mb-1">Subject</label>
            <input type="text" id="subject" name="subject" required
              class="w-full px-4 py-2 border border-orange-300 rounded-lg bg-orange-50 focus:ring-2 focus:ring-orange-400 focus:outline-none placeholder-gray-500"
              placeholder="Briefly describe your issue">
          </div>

          <!-- Description -->
          <div>
            <label for="description" class="block text-sm font-medium text-gray-700 mb-1">Description</label>
            <textarea id="description" name="description" rows="5" required
              class="w-full px-4 py-2 border border-orange-300 rounded-lg bg-orange-50 focus:ring-2 focus:ring-orange-400 focus:outline-none placeholder-gray-500"
              placeholder="Provide more details about your issue..."></textarea>
          </div>

          <!-- Category -->
          <div>
            <label for="category" class="block text-sm font-medium text-gray-700 mb-1">Category</label>
            <select id="category" name="category" required
              class="w-full px-4 py-2 border border-orange-300 rounded-lg bg-orange-50 focus:ring-2 focus:ring-orange-400 focus:outline-none">
              <option value="">-- Select a Category --</option>
              <option value="Technical">Technical</option>
              <option value="Billing">Billing</option>
              <option value="Account">Account</option>
              <option value="Other">Other</option>
            </select>
          </div>

          <!-- Submit Button -->
          <div class="pt-6 text-right">
            <button type="submit"
              class="inline-flex items-center px-6 py-2 bg-orange-500 text-white font-semibold rounded-lg hover:bg-orange-600 transition">
              <i class="fas fa-paper-plane mr-2"></i> Submit Ticket
            </button>
          </div>
        </form>
      </div>
    </div>
  </section>

  <%@ include file="../partials/footer.jsp" %>

</body>
</html>
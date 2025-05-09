<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Home | CareDesk</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

  <!-- Dynamic Navbar -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <%@ include file="partials/navbarsession.jsp" %>
    </c:when>
    <c:otherwise>
      <%@ include file="partials/navbar.jsp" %>
    </c:otherwise>
  </c:choose>

  <!-- Hero Section -->
  <section class="relative bg-orange-50 h-[30rem] flex items-center justify-center text-center">
    <!-- Background -->
    <div class="absolute inset-0 bg-cover bg-center opacity-40" style="background-image: url('https://knowmax-ai-website.s3.amazonaws.com/wp-content/uploads/2023/12/26004145/Customer-Service-Call-Center.webp');"></div>
    <div class="absolute inset-0 bg-orange-200 bg-opacity-70"></div>

    <!-- Content -->
    <div class="relative z-10 px-6 max-w-3xl">
      <h1 class="text-4xl md:text-5xl font-bold text-orange-700 mb-4">Support That Cares</h1>
      <p class="text-lg md:text-xl text-gray-800 mb-6">CareDesk helps you manage support tickets, communicate with agents, and ensure customer satisfaction in one place.</p>
      <div class="flex flex-col md:flex-row justify-center gap-4">
        <a href="${pageContext.request.contextPath}/ticket?action=create"
           class="bg-orange-500 text-white px-8 py-3 rounded-lg hover:bg-orange-600 transition shadow">
          <i class="fas fa-ticket-alt mr-2"></i> Submit Ticket
        </a>
        <a href="${pageContext.request.contextPath}/ticket"
           class="border-2 border-orange-500 text-orange-600 px-8 py-3 rounded-lg hover:bg-orange-100 transition shadow">
          <i class="fas fa-comments mr-2"></i> View Tickets
        </a>
      </div>
    </div>
  </section>

  <!-- Services Section -->
  <section class="py-20 bg-white">
    <div class="container mx-auto px-4">
      <div class="text-center mb-12">
        <h2 class="text-3xl font-bold text-orange-600">Our Services</h2>
        <p class="text-gray-600 mt-2">Empowering your support journey with powerful tools</p>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-10 text-center">
        <div>
          <div class="w-16 h-16 bg-orange-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <i class="fas fa-headset text-2xl text-orange-500"></i>
          </div>
          <h3 class="text-xl font-semibold mb-2">Customer Support</h3>
          <p class="text-gray-600">Connect with our support team anytime</p>
        </div>
        <div>
          <div class="w-16 h-16 bg-orange-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <i class="fas fa-reply text-2xl text-orange-500"></i>
          </div>
          <h3 class="text-xl font-semibold mb-2">Quick Responses</h3>
          <p class="text-gray-600">Receive fast and effective solutions</p>
        </div>
        <div>
          <div class="w-16 h-16 bg-orange-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <i class="fas fa-chart-line text-2xl text-orange-500"></i>
          </div>
          <h3 class="text-xl font-semibold mb-2">Feedback Insights</h3>
          <p class="text-gray-600">Track and improve based on real feedback</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Call to Action -->
  <section class="bg-orange-400 py-12 text-white text-center">
    <div class="container mx-auto px-4">
      <h2 class="text-3xl font-bold mb-4">Need help resolving a customer issue?</h2>
      <p class="mb-6">Submit a ticket or chat with our agents and get quick assistance.</p>
      <a href="${pageContext.request.contextPath}/ticket"
         class="inline-block px-8 py-3 bg-white text-orange-600 font-semibold rounded-lg hover:bg-orange-100 transition">
        <i class="fas fa-life-ring mr-2"></i> Get Support
      </a>
    </div>
  </section>

  <%@ include file="partials/footer.jsp" %>

</body>
</html>
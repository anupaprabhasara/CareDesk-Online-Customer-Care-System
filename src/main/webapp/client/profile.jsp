<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile | CareDesk</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-orange-50 text-gray-800">

<%@ include file="./partials/navbarsession.jsp" %>

<section class="py-16">
  <div class="max-w-7xl mx-auto px-6">
    <div class="bg-white p-8 rounded-2xl shadow-lg border border-orange-200">
      <!-- Header -->
      <div class="flex items-center gap-6 mb-10">
        <img src="https://ui-avatars.com/api/?name=${sessionScope.name}&background=f97316&color=fff"
             alt="${sessionScope.name}" class="w-20 h-20 rounded-full shadow">
        <div>
          <h2 class="text-3xl font-bold text-orange-600">${user.fullName}</h2>
          <p class="text-gray-600 text-sm">CareDesk User</p>
        </div>
      </div>

      <!-- Info Cards -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div class="bg-orange-50 border border-orange-200 rounded-xl p-6 shadow-sm">
          <div class="flex items-center mb-2 text-orange-600 font-semibold text-sm uppercase tracking-wide">
            <i class="fas fa-user mr-2"></i> Full Name
          </div>
          <p class="text-gray-800 text-lg font-medium">${user.fullName}</p>
        </div>

        <div class="bg-orange-50 border border-orange-200 rounded-xl p-6 shadow-sm">
          <div class="flex items-center mb-2 text-orange-600 font-semibold text-sm uppercase tracking-wide">
            <i class="fas fa-envelope mr-2"></i> Email Address
          </div>
          <p class="text-gray-800 text-lg font-medium">${user.email}</p>
        </div>

        <div class="bg-orange-50 border border-orange-200 rounded-xl p-6 shadow-sm md:col-span-2">
          <div class="flex items-center mb-2 text-orange-600 font-semibold text-sm uppercase tracking-wide">
            <i class="fas fa-shield-alt mr-2"></i> Account Type
          </div>
          <p class="text-gray-700 text-lg">Standard User</p>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="./partials/footer.jsp" %>

</body>
</html>
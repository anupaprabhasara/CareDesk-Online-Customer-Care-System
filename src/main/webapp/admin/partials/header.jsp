<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
    String uri = request.getRequestURI();
    String pageTitle = "Dashboard Overview";

    if (uri.contains("/admin/admin")) {
        pageTitle = "Admin Management";
    } else if (uri.contains("/admin/user")) {
        pageTitle = "User Management";
    } else if (uri.contains("/admin/ticket")) {
        pageTitle = "Ticket Management";
    } else if (uri.contains("/admin/response")) {
        pageTitle = "Response Management";
    } else if (uri.contains("/admin/feedback")) {
        pageTitle = "Feedback Management";
    }

    request.setAttribute("pageTitle", pageTitle);
%>

<header class="flex justify-between items-center p-4 bg-orange-400 shadow-sm">
  <h2 class="text-xl font-bold text-white">${pageTitle}</h2>
  <div class="flex items-center space-x-4">
    <div class="text-right text-sm">
      <p class="text-white font-semibold">${sessionScope.fullName}</p>
      <p class="text-orange-100 text-xs">${sessionScope.email}</p>
    </div>
    <img
      src="https://ui-avatars.com/api/?name=${sessionScope.fullName}&background=f97316&color=fff"
      alt="Profile" class="w-10 h-10 rounded-full shadow-md border-2 border-white">
  </div>
</header>
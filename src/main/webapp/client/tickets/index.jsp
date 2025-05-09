<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Tickets | CareDesk</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

  <%@ include file="../partials/navbarsession.jsp" %>

  <section class="py-16 bg-orange-50">
    <div class="max-w-7xl mx-auto px-6">
      <div class="flex items-center justify-between mb-8">
        <h2 class="text-3xl font-bold text-orange-600">My Support Tickets</h2>
        <a href="${pageContext.request.contextPath}/ticket?action=create"
           class="inline-flex items-center gap-2 bg-orange-500 text-white px-5 py-2 rounded-lg hover:bg-orange-600 transition">
          <i class="fas fa-plus"></i> New Ticket
        </a>
      </div>

      <div class="overflow-x-auto bg-white shadow-md rounded-lg">
        <table class="min-w-full text-sm text-left">
          <thead class="bg-orange-200 text-orange-900">
            <tr>
              <th class="px-6 py-4">Ticket ID</th>
              <th class="px-6 py-4">Subject</th>
              <th class="px-6 py-4">Category</th>
              <th class="px-6 py-4">Status</th>
              <th class="px-6 py-4">Created</th>
              <th class="px-6 py-4 text-center">Actions</th>
            </tr>
          </thead>
          <tbody class="text-gray-800">
            <c:choose>
              <c:when test="${not empty tickets}">
                <c:forEach var="ticket" items="${tickets}" varStatus="loop">
                  <tr class="border-b hover:bg-orange-100/50">
                    <td class="px-6 py-4">#00${ticket.ticketId}</td>
                    <td class="px-6 py-4">${ticket.subject}</td>
                    <td class="px-6 py-4">${ticket.category}</td>
                    <td class="px-6 py-4">
                      <span class="inline-block px-2 py-1 text-xs rounded-full
                        ${ticket.status eq 'Open' ? 'bg-green-100 text-green-700' :
                          ticket.status eq 'In Progress' ? 'bg-yellow-100 text-yellow-700' :
                          ticket.status eq 'Resolved' ? 'bg-blue-100 text-blue-700' :
                          'bg-gray-200 text-gray-700'}">
                        ${ticket.status}
                      </span>
                    </td>
                    <td class="px-6 py-4">${ticket.createdAt}</td>
                    <td class="px-6 py-4 text-left space-x-2">
					  <a href="${pageContext.request.contextPath}/responses?ticketId=${ticket.ticketId}"
					     class="text-blue-500 hover:text-blue-700">
					    <i class="fas fa-comments"></i> View Responses
					  </a>
					
					  <c:if test="${ticket.status eq 'Open'}">
					    <a href="${pageContext.request.contextPath}/ticket?action=delete&id=${ticket.ticketId}"
					       onclick="return confirm('Are you sure you want to delete this ticket?');"
					       class="text-red-500 hover:text-red-700">
					      <i class="fas fa-trash"></i> Delete
					    </a>
					  </c:if>
					
					  <c:if test="${ticket.status ne 'Open'}">
					    <span class="text-gray-400 text-sm italic">Locked</span>
					  </c:if>
					</td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="6" class="px-6 py-4 text-center text-gray-400">You have not submitted any tickets yet.</td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>
    </div>
  </section>

  <%@ include file="../partials/footer.jsp" %>

</body>
</html>
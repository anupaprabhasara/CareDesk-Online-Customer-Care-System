<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Responses | CareDesk</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<%@ include file="../partials/navbarsession.jsp" %>

<section class="py-16 bg-orange-50 min-h-[360px]">
  <div class="max-w-7xl mx-auto px-6">
    <div class="flex items-center justify-between mb-8">
      <h2 class="text-3xl font-bold text-orange-600">Responses to Ticket #00${ticketId}</h2>
      <a href="${pageContext.request.contextPath}/ticket" 
         class="inline-flex items-center gap-2 bg-orange-500 text-white px-5 py-2 rounded-lg hover:bg-orange-600 transition">
        <i class="fas fa-arrow-left"></i> Back to Tickets
      </a>
    </div>

    <div class="bg-white shadow-md rounded-lg p-6 space-y-6">
      <c:choose>
        <c:when test="${not empty responses}">
          <c:forEach var="response" items="${responses}">
            <div class="border border-orange-200 rounded-md p-4 bg-orange-50">
              <div class="flex justify-between items-center mb-2">
                <div class="font-semibold text-orange-700">
                  ${response.responderName} <span class="text-sm text-gray-500">(${response.responderRole})</span>
                </div>
                <div class="text-xs text-gray-500">
                  ${response.createdAt}
                </div>
              </div>
              <p class="text-gray-700 mb-4">${response.message}</p>

              <!-- Feedback Button -->
              <div class="text-right">
                <a href="${pageContext.request.contextPath}/feedback?action=create&responseId=${response.responseId}"
                   class="inline-flex items-center gap-2 text-sm px-4 py-2 bg-orange-500 text-white rounded-md hover:bg-orange-600 transition">
                  <i class="fas fa-comment-alt"></i> Give Feedback
                </a>
              </div>
            </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <p class="text-center text-gray-500 italic">No responses yet for this ticket.</p>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</section>

<%@ include file="../partials/footer.jsp" %>

</body>
</html>
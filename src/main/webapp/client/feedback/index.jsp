<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Feedback | CareDesk</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

  <%@ include file="../partials/navbarsession.jsp" %>

  <section class="py-16 bg-orange-50 min-h-[360px]">
    <div class="max-w-7xl mx-auto px-6">
      <div class="flex items-center justify-between mb-8">
        <h2 class="text-3xl font-bold text-orange-600">My Feedback</h2>
      </div>

      <div class="overflow-x-auto bg-white shadow-md rounded-lg">
        <table class="min-w-full text-sm text-left">
          <thead class="bg-orange-200 text-orange-900">
            <tr>
              <th class="px-6 py-4">ID</th>
              <th class="px-6 py-4">Response ID</th>
              <th class="px-6 py-4">Rating</th>
              <th class="px-6 py-4">Comment</th>
              <th class="px-6 py-4 text-center">Actions</th>
            </tr>
          </thead>
          <tbody class="text-gray-800">
            <c:choose>
              <c:when test="${not empty feedbacks}">
                <c:forEach var="feedback" items="${feedbacks}">
                  <tr class="border-b hover:bg-orange-100/50">
                    <td class="px-6 py-4">${feedback.feedbackId}</td>
                    <td class="px-6 py-4">#00${feedback.responseId}</td>
                    <td class="px-6 py-4">
                      <c:forEach begin="1" end="5" var="i">
                        <i class="fa-star ${i <= feedback.rating ? 'fas text-amber-500' : 'far text-gray-300'}"></i>
                      </c:forEach>
                    </td>
                    <td class="px-6 py-4">${feedback.comment}</td>
                    <td class="px-6 py-4 text-center">
                      <a href="${pageContext.request.contextPath}/feedback?action=delete&id=${feedback.feedbackId}"
                         onclick="return confirm('Delete this feedback?');"
                         class="text-red-500 hover:text-red-700 text-sm">
                        <i class="fas fa-trash-alt mr-1"></i> Delete
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="5" class="px-6 py-4 text-center text-gray-400">You haven't submitted any feedback yet.</td>
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
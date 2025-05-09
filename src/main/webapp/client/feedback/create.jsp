<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Give Feedback | CareDesk</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    .star {
      font-size: 1.8rem;
      color: #e5e7eb; /* Tailwind gray-200 */
      cursor: pointer;
      transition: color 0.2s;
    }
    .star.filled {
      color: #f59e0b; /* Tailwind amber-500 */
    }
  </style>
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

  <section class="bg-orange-50 py-20">
    <div class="max-w-7xl mx-auto px-6">
      <div class="bg-white rounded-2xl shadow-lg p-10 border border-orange-200">
        <div class="mb-8 text-center">
          <h2 class="text-3xl font-bold text-orange-600 mb-2">Rate Our Support</h2>
          <p class="text-gray-600">We value your opinion. Share your experience regarding the response you received.</p>
        </div>

        <form action="${pageContext.request.contextPath}/feedback" method="post" class="space-y-6">
          <input type="hidden" name="action" value="create">
          <input type="hidden" name="responseId" value="${param.responseId}">
          <input type="hidden" id="rating" name="rating" value="0">

          <!-- Star Rating -->
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Rating</label>
            <div class="flex items-center space-x-1" id="star-container">
              <i class="fas fa-star star" data-value="1"></i>
              <i class="fas fa-star star" data-value="2"></i>
              <i class="fas fa-star star" data-value="3"></i>
              <i class="fas fa-star star" data-value="4"></i>
              <i class="fas fa-star star" data-value="5"></i>
            </div>
          </div>

          <!-- Comment -->
          <div>
            <label for="comment" class="block text-sm font-medium text-gray-700 mb-1">Comment</label>
            <textarea id="comment" name="comment" rows="4" required
              class="w-full px-4 py-2 border border-orange-300 rounded-lg bg-orange-50 focus:ring-2 focus:ring-orange-400 focus:outline-none placeholder-gray-500"
              placeholder="Share your thoughts about the support experience..."></textarea>
          </div>

          <!-- Submit Button -->
          <div class="pt-6 text-right">
            <button type="submit"
              class="inline-flex items-center px-6 py-2 bg-orange-500 text-white font-semibold rounded-lg hover:bg-orange-600 transition">
              <i class="fas fa-comment-dots mr-2"></i> Submit Feedback
            </button>
          </div>
        </form>
      </div>
    </div>
  </section>

  <%@ include file="../partials/footer.jsp" %>

  <!-- Star Rating Script -->
  <script>
    const stars = document.querySelectorAll('.star');
    const ratingInput = document.getElementById('rating');

    stars.forEach(star => {
      star.addEventListener('click', () => {
        const rating = parseInt(star.getAttribute('data-value'));
        ratingInput.value = rating;

        stars.forEach(s => {
          s.classList.toggle('filled', parseInt(s.getAttribute('data-value')) <= rating);
        });
      });
    });
  </script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Footer for CareDesk -->
<footer class="bg-gray-800 text-white py-12">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-8">

      <!-- Brand Info -->
      <div>
        <div class="flex items-center space-x-2 mb-4">
          <i class="fas fa-headset text-2xl text-orange-400"></i>
          <h3 class="text-xl font-bold">CareDesk</h3>
        </div>
        <p class="text-gray-400 text-sm leading-relaxed">
          Centralized customer service and ticketing system for seamless support and feedback management.
        </p>
      </div>

      <!-- Quick Links -->
      <div>
        <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
        <ul class="space-y-2 text-sm">
          <li><a href="${pageContext.request.contextPath}/" class="text-gray-400 hover:text-white transition">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/support" class="text-gray-400 hover:text-white transition">Support</a></li>
          <li><a href="${pageContext.request.contextPath}/tickets" class="text-gray-400 hover:text-white transition">Tickets</a></li>
          <li><a href="${pageContext.request.contextPath}/contact" class="text-gray-400 hover:text-white transition">Contact</a></li>
        </ul>
      </div>

      <!-- Contact Info -->
      <div>
        <h4 class="text-lg font-semibold mb-4">Contact Us</h4>
        <ul class="space-y-2 text-sm text-gray-400">
          <li class="flex items-center">
            <i class="fas fa-envelope mr-2 text-base"></i>
            <a href="mailto:support@caredesk.com" class="hover:text-white transition">support@caredesk.com</a>
          </li>
          <li class="flex items-center">
            <i class="fas fa-phone mr-2 text-base"></i>
            <a href="tel:+94770000000" class="hover:text-white transition">+94 77 000 0000</a>
          </li>
          <li class="flex items-center">
            <i class="fas fa-map-marker-alt mr-2 text-base"></i>
            <span>No. 88, Service Road, Colombo, Sri Lanka</span>
          </li>
        </ul>
      </div>

      <!-- Social Media -->
      <div>
        <h4 class="text-lg font-semibold mb-4">Follow Us</h4>
        <div class="flex space-x-4">
          <a href="#" class="bg-gray-700 w-10 h-10 rounded-full flex items-center justify-center text-gray-400 hover:bg-orange-500 hover:text-white transition">
            <i class="fab fa-facebook-f"></i>
          </a>
          <a href="#" class="bg-gray-700 w-10 h-10 rounded-full flex items-center justify-center text-gray-400 hover:bg-orange-500 hover:text-white transition">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="#" class="bg-gray-700 w-10 h-10 rounded-full flex items-center justify-center text-gray-400 hover:bg-orange-500 hover:text-white transition">
            <i class="fab fa-instagram"></i>
          </a>
          <a href="#" class="bg-gray-700 w-10 h-10 rounded-full flex items-center justify-center text-gray-400 hover:bg-orange-500 hover:text-white transition">
            <i class="fab fa-linkedin-in"></i>
          </a>
        </div>
      </div>

    </div>

    <!-- Footer Bottom -->
    <div class="border-t border-gray-700 mt-10 pt-6 text-center text-sm text-gray-400">
      &copy; 2024 CareDesk. All rights reserved.
    </div>
  </div>
</footer>
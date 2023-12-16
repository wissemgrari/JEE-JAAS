<%@ page import="com.wissem.business.entities.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Error</title>
  <link rel="stylesheet" href="style/main.css">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<nav class="bg-[#1D9BF0] sticky z-[99] top-0 left-0 text-white flex justify-between items-center py-3 px-5">
  <div class="flex items-center gap-5">
    <a href="/" class="text-2xl font-semibold tracking-wider">FEED</a>
    <% User user1 = (User) session.getAttribute("user");
      if (user1 != null && user1.getRole().toString().equals("ADMIN")) { %>
    <a href="/users" class="text-base">Users</a>
    <% } %>
  </div>
  <form action="${pageContext.request.contextPath}/logout" method="POST" class="flex items-center space-x-5 text-xs">
    <div class="flex items-center space-x-5">
      <div class="w-10 h-10 rounded-full grid place-items-center bg-black text-white">
        <p class="uppercase font-medium">
          <%
            if (user1 != null) { %>
          <%= user1.getInitials() %>
          <% } %>
        </p>
      </div>
      <button class="btn btn-white" type="submit">Log out</button>
    </div>
  </form>
</nav>

<main class="wrapper">
  <%-- Check for the error message and display it --%>
  <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
  <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
  <div class="relative max-w-[480px] p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-100" role="alert">
    <div class="flex items-start">
      <svg class="flex-shrink-0 inline w-4 h-4 me-3 mt-0.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
           fill="currentColor" viewBox="0 0 20 20">
        <path
          d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
      </svg>
      <div class="flex flex-col">
        <h1 class="font-medium">FAILED</h1>
        <p class="font-normal mt-2"><%= errorMessage %>
        </p>
        <a class="bg-red-300 py-2 px-3 inline-block w-max rounded mt-5 font-medium" href="/">I understand</a>
      </div>
    </div>
  </div>
  <% } %>
</main>
</body>
</html>

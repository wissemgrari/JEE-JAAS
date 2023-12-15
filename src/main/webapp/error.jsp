<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Error</title>
  <link rel="stylesheet" href="style/main.css">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
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

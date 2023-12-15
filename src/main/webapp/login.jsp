<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sign in</title>
  <link rel="stylesheet" href="css/styles.css">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<%
  if (session.getAttribute("user") != null) {
    response.sendRedirect(request.getContextPath() + "/");
  }
%>
<body>
<main class="wrapper">
  <%-- Check for the error message and display it --%>
  <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
  <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
  <div class="max-w-[480px] flex items-center p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-100" role="alert">
    <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
      <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
    </svg>
    <div>
      <span class="font-medium">FAILED!</span> <%= errorMessage %>
    </div>
  </div>
  <% } %>
    <%-- Check for the error message and display it --%>
    <% String successMessage = (String) request.getAttribute("successMessage"); %>
    <% if (successMessage != null && !successMessage.isEmpty()) { %>
    <div class="max-w-[480px] flex items-center p-4 mb-4 text-sm text-green-800 rounded-lg bg-green-100" role="alert">
      <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
        <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
      </svg>
      <div>
        <span class="font-medium">SUCCESS!</span> <%= successMessage %>
      </div>
    </div>
    <% } %>
  <form action="${pageContext.request.contextPath}/login" method="POST" class="card">

    <h1 class="text-2xl font-bold text-center mb-5">Sign in</h1>

    <div class="space-y-3">
      <input type="text" placeholder="Enter your email" name="email" class="w-full">
      <input type="password" placeholder="Enter your password" name="password" class="w-full">
    </div>

    <div class="mt-5 space-y-3">
      <button class="btn w-full btn-dark" type="submit">Login</button>
      <button class="btn w-full btn-white" type="button">Forget password ?</button>
    </div>

    <p class="text-center text-black/70 text-sm mt-5">Don't have an account ? <a
        class="!text-[#1D9BF0] cursor-pointer font-medium" href="register.jsp">Sign up</a></p>

    <div class="relative py-5">
      <div class="absolute inset-0 flex items-center">
        <div class="w-full border-b border-gray-300"></div>
      </div>
      <div class="relative flex justify-center">
        <span class="bg-white px-4 text-xs text-gray-600">OR</span>
      </div>
    </div>

    <div class="space-y-2">
      <button id="google-btn" class="btn btn-white w-full socials-btn" type="button">Sign in with Google</button>
      <button id="apple-btn" class="btn btn-white w-full socials-btn" type="button">Sign in with Apple</button>
    </div>

  </form>
</main>
</body>
</html>

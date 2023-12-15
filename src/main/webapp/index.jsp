<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Home</title>
  <link rel="stylesheet" href="css/styles.css">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
  }
%>
<body>
<main class="wrapper">
  <!-- post form -->
  <form action="#" class="card">
    <div class="flex items-center gap-5">
      <img
          class="w-14 h-14 rounded-full object-cover border border-[#1D9BF0] self-start"
          src="./assets/user.jpg"
          alt="user"/>
      <textarea
          class="w-full pt-2 pr-4 bg-transparent outline-none placeholder-gray-400 text-gray-700 resize-none overflow-hidden"
          rows="3" placeholder="What's happening?"></textarea>
    </div>
    <div class="mt-5 flex items-center border-t border-[#1D9BF0]/20 pt-2">
      <div class="flex">
        <svg xmlns="http://www.w3.org/2000/svg"
             class="h-6 w-6 mr-2 text-[#1D9BF0] hover:text-[#1D9BF0]/70 cursor-pointer" fill="none" viewBox="0 0 24 24"
             stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/>
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg"
             class="h-6 w-6 mr-2 text-[#1D9BF0] hover:text-[#1D9BF0]/70 cursor-pointer" fill="none" viewBox="0 0 24 24"
             stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg"
             class="h-6 w-6 mr-2 text-[#1D9BF0] hover:text-[#1D9BF0]/70 cursor-pointer" fill="none" viewBox="0 0 24 24"
             stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
        </svg>
      </div>
      <button class="btn py-2 px-8 ml-auto">POST</button>
    </div>
  </form>

  <%--    divider --%>
  <div class="relative py-5">
    <div class="absolute inset-0 flex items-center max-w-[480px]">
      <div class="w-full border-b border-gray-300"></div>
    </div>
  </div>

  <div class="card">
    <img
        class="w-4 absolute top-3 right-5 opacity-60 cursor-pointer"
        src="https://img.icons8.com/material-rounded/24/more.png"
        alt="more"/>
    <div class="flex items-center gap-3">
      <img
          class="w-14 h-14 rounded-full object-cover border border-[#1D9BF0]"
          src="./assets/user.jpg"
          alt="avatar"/>
      <div class="flex flex-col">
        <h1 class="font-medium text-black/80">@djo_hidouri</h1>
        <h2 class="text-xs text-black/60">•<span class="pl-1">2min ago</span></h2>
      </div>
    </div>
    <div class="mt-5">
      <p>
        Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vel,
        molestiae.
        <span class="block text-[#1D9BF0]">#djo_1920</span>
      </p>
    </div>
    <div class="mt-5 border-t border-[#9ca3af52] flex items-center justify-end gap-5 pt-3">
      <img class="w-5 cursor-pointer"
           src="./assets/heart.svg"
           alt="heart">
      <img class="w-5 cursor-pointer"
           src="./assets/comment.svg"
           alt="comment">
      <img class="w-5 cursor-pointer"
           src="./assets/share.svg"
           alt="share">
    </div>
  </div>
</main>
</body>
</html>

<%@ page import="java.util.List" %>
<%@ page import="com.wissem.business.entities.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wissem.business.entities.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Home</title>
  <link rel="stylesheet" href="style/main.css"/>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
</head>
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
  }
%>
<body>
<!-- Navbar -->
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
    <p class="captiliaze font-medium text-base">
      <%
        if (user1 != null) { %>
      <%= user1.getFullname() %>
      <% } %>
    </p>
      <button class="btn btn-white hover:opacity-75" type="submit">Log out</button>
    </div>
  </form>
</nav>

<main class="wrapper">
  <!-- post form -->
  <form action="${pageContext.request.contextPath}/posts" method="POST" class="card">
    <div class="flex gap-5">
      <div class="!w-10 !h-10 !rounded-full !grid !place-items-center p-[10px] bg-[#1472b19c] text-white">
        <p class="uppercase font-medium text-xs">
          <%
            if (user1 != null) { %>
          <%= user1.getInitials() %>
          <% } %>
        </p>
      </div>
      <textarea
        name="post-content"
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
      <button class="btn py-2 px-8 ml-auto hover:opacity-75">POST</button>
    </div>
  </form>

  <!-- divider -->
  <div class="relative py-5">
    <div class="absolute inset-0 flex items-center max-w-[480px]">
      <div class="w-full border-b border-gray-300"></div>
    </div>
  </div>

  <div class="space-y-3" id="posts-container">
    <!-- Posts will be displayed here using JavaScript -->
  </div>

  <script>
      // Fetch and display posts when the page loads
      $(document).ready(function () {
          fetchAndDisplayPosts();
      });

      // Function to fetch and display posts using AJAX
      function fetchAndDisplayPosts() {
          $.ajax({
              url: '${pageContext.request.contextPath}/posts',
              type: 'GET',
              dataType: 'json',
              success: function (posts) {
                  displayPosts(posts);
              },
              error: function (error) {
                  console.error('Error fetching posts:', error);
              },
          });
      }

      // Function to display posts in the postsContainer
      function displayPosts(posts) {
          var postsContainer = $('#posts-container');

          function getInitials(fullName) {
              // Split the full name into an array of words
              const words = fullName.split(" ");

              // Extract the first letter from each word and concatenate them
              const initials = words.map(word => word.charAt(0)).join("");

              // Convert the initials to uppercase
              return initials.toUpperCase();
          }

          // Iterate through the posts and append them to the container
          $.each(posts, function (index, post) {
              // Create a new card element for each post
              var cardHtml =
                  '<div class="card">' +
                  '<img class="w-4 absolute top-3 right-5 opacity-60 cursor-pointer" src="https://img.icons8.com/material-rounded/24/more.png" alt="more"/>' +
                  '<div class="flex items-center gap-3">' +
                  '<div class="w-10 h-10 rounded-full grid place-items-center bg-[#1472b19c] text-white">' +
                  '<p class="uppercase font-medium !text-xs">' +
                  getInitials(post.creator) +
                  '</p>' +
                  '</div>' +
                  '<div class="flex flex-col">' +
                  '<h1 class="font-medium text-black/80">' +
                  post.creator +
                  '</h1>' +
                  '<h2 class="text-xs text-black/60">•<span class="pl-1">' +
                  moment(post.createdAt).fromNow() +
                  '</span></h2>' +
                  '</div>' +
                  '</div>' +
                  '<div class="mt-5">' +
                  '<p>' +
                  post.content +
                  '</p>' +
                  '</div>' +
                  '<div class="mt-5 border-t border-[#9ca3af52] flex items-center justify-end gap-5 pt-3">' +
                  '<img class="w-5 cursor-pointer hover:scale-125 transition duration-300" src="./assets/heart.svg" alt="heart">' +
                  '<img class="w-5 cursor-pointer hover:scale-125 transition duration-300" src="./assets/comment.svg" alt="comment">' +
                  '<img class="w-5 cursor-pointer hover:scale-125 transition duration-300" src="./assets/share.svg" alt="share">' +
                  '</div>' +
                  '</div>';

              // Append the cardHtml to the postsContainer
              postsContainer.append(cardHtml);
          });
      }
  </script>

</main>
</body>
</html>

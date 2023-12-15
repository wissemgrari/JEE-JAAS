<%@ page import="java.util.List" %>
<%@ page import="com.wissem.business.entities.Post" %>
<%@ page import="java.util.ArrayList" %>

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
<main class="wrapper">
  <!-- post form -->
  <form action="${pageContext.request.contextPath}/posts" method="POST" class="card">
    <div class="flex items-center gap-5">
      <img class="w-14 h-14 rounded-full object-cover border border-[#1D9BF0] self-start"
           src="./assets/user.jpg" alt="user"/>
      <textarea name="post-content"
                class="w-full pt-2 pr-4 bg-transparent outline-none placeholder-gray-400 text-gray-700 resize-none overflow-hidden"
                rows="3" placeholder="What's happening?"></textarea>
    </div>
    <div class="mt-5 flex items-center border-t border-[#1D9BF0]/20 pt-2">
      <div class="flex">
        <svg xmlns="http://www.w3.org/2000/svg"
             class="h-6 w-6 mr-2 text-[#1D9BF0] hover:text-[#1D9BF0]/70 cursor-pointer"
             fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <!-- ... (your SVG path) -->
        </svg>
        <!-- Add other SVG icons as needed -->
      </div>
      <button class="btn py-2 px-8 ml-auto">POST</button>
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

          // Iterate through the posts and append them to the container
          $.each(posts, function (index, post) {
              // Create a new card element for each post
              var cardHtml =
                  '<div class="card">' +
                  '<img class="w-4 absolute top-3 right-5 opacity-60 cursor-pointer" src="https://img.icons8.com/material-rounded/24/more.png" alt="more"/>' +
                  '<div class="flex items-center gap-3">' +
                  '<img class="w-14 h-14 rounded-full object-cover border border-[#1D9BF0]" src="./assets/user.jpg" alt="avatar"/>' +
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
                  '<img class="w-5 cursor-pointer" src="./assets/heart.svg" alt="heart">' +
                  '<img class="w-5 cursor-pointer" src="./assets/comment.svg" alt="comment">' +
                  '<img class="w-5 cursor-pointer" src="./assets/share.svg" alt="share">' +
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

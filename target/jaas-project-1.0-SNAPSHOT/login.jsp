<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sign in</title>
  <link rel="stylesheet" href="css/styles.css">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<main class="wrapper">
  <form action=LoginServlet method=post class="card login">
    <div class="space-y-2">
      <button id="google-btn" class="btn btn-white w-full socials-btn" type="button">Sign in with Google</button>
      <button id="apple-btn" class="btn btn-white w-full socials-btn" type="button">Sign in with Apple</button>
    </div>
    <div class="relative py-5">
      <div class="absolute inset-0 flex items-center">
        <div class="w-full border-b border-gray-300"></div>
      </div>
      <div class="relative flex justify-center">
        <span class="bg-white px-4 text-sm text-gray-600">OR</span>
      </div>
    </div>
    <div class="space-y-3">
      <input type="text" placeholder="Enter your email" name="username" class="w-full">
      <input type="password" placeholder="Enter your password" name="password" class="w-full">
    </div>
    <div class="mt-5 space-y-3">
      <button class="btn w-full btn-dark" type="submit">Login</button>
      <button class="btn w-full btn-white" type="button">Forget password ?</button>
    </div>
    <p class="text-center text-black/70 text-sm mt-5">Don't have an account ? <span class="!text-[#1D9BF0] cursor-pointer">Sign up</span> </p>
  </form>
</main>
</body>
</html>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>??ng nh?p - Spa Relax</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>
    <style>
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }
        .floating { animation: float 3s ease-in-out infinite; }
    </style>
</head>
<body class="bg-gradient-to-br from-pink-100 to-white min-h-screen font-['Poppins']">
    <div class="flex h-screen">
        <!-- Left side - Image -->
        <div class="hidden lg:flex w-1/2 bg-cover bg-center items-center justify-center" style="background-image: url('https://images.unsplash.com/photo-1415754487370-cecde644f097?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');">
            <div class="p-12 bg-white bg-opacity-80 rounded-xl shadow-lg floating">
                <h2 class="text-4xl font-bold text-pink-600 mb-4">Welcome to Our Spa</h2>
                <p class="text-gray-700">Relax, Renew, Rejuvenate</p>
            </div>
        </div>
        
        <!-- Right side - Login Form -->
        <div class="w-full lg:w-1/2 flex items-center justify-center p-12">
            <div class="max-w-md w-full space-y-8">
                <div>
                    <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">Welcome Back</h2>
                </div>
                <form class="mt-8 space-y-6" action="MainController" method="POST">
                    <input type="hidden" name="remember" value="true">
                    <div class="rounded-md shadow-sm -space-y-px">
                        <div>
                            <label for="userId" class="sr-only">User ID</label>
                            <input id="userId" name="userId" type="text" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-pink-500 focus:border-pink-500 focus:z-10 sm:text-sm" placeholder="User ID">
                        </div>
                        <div>
                            <label for="password" class="sr-only">Password</label>
                            <input id="password" name="password" type="password" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-pink-500 focus:border-pink-500 focus:z-10 sm:text-sm" placeholder="Password">
                        </div>
                    </div>

                    <div>
                        <input type="hidden" name="action" value="Login">
                        <input type="hidden" name="function" value="login">
                        <button type="submit" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-pink-600 hover:bg-pink-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-pink-500 transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-105">
                            Sign In
                        </button>
                    </div>
                </form>
                <p class="mt-2 text-center text-sm text-gray-600">
                    Don't have an account?
                    <a href="register.jsp" class="font-medium text-pink-600 hover:text-pink-500">Create one</a>
                </p>
                <% String error = request.getParameter("error");
                   if ("invalid".equals(error)) { %>
                    <p class="mt-2 text-center text-sm text-red-600 bg-red-100 p-2 rounded">Invalid username or password</p>
                <% } %>
            </div>
        </div>
    </div>

    <script>
        gsap.from(".floating", {duration: 2, y: 50, opacity: 0, ease: "power3.out"});
        gsap.from("form", {duration: 1, x: 50, opacity: 0, delay: 0.5, ease: "power3.out"});
    </script>
</body>
</html>
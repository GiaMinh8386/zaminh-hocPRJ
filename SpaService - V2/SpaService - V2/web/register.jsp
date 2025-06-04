<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>??ng ký - Spa Relax</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Nunito', 'sans-serif'],
                    },
                    colors: {
                        primary: '#FF69B4',
                        secondary: '#FFC0CB',
                    },
                }
            }
        }
    </script>
</head>
<body class="bg-gradient-to-r from-pink-100 to-white min-h-screen flex items-center justify-center p-4">
    <div class="bg-white w-full max-w-4xl rounded-2xl shadow-xl overflow-hidden flex">
        <!-- Left side - Image -->
        <div class="hidden lg:block w-1/2 bg-cover bg-center" style="background-image: url('https://plus.unsplash.com/premium_photo-1676272629211-f0d78b2344ae?q=80&w=2788&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');">
            <div class="h-full w-full bg-black bg-opacity-25 flex items-center justify-center">
                <h2 class="text-4xl font-bold text-white mb-4 transform transition duration-500 hover:scale-110">Join Our Spa Family</h2>
            </div>
        </div>
        
        <!-- Right side - Register Form -->
        <div class="w-full lg:w-1/2 p-8">
            <h2 class="text-3xl font-bold text-center mb-8 text-primary">Create Account</h2>
            <form action="MainController" method="post" class="space-y-4">
                <div>
                    <label for="userId" class="text-sm font-medium text-gray-600 block mb-1">User ID</label>
                    <input type="text" id="userId" name="userId" required
                           class="w-full px-4 py-3 rounded-lg bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300">
                </div>
                <div>
                    <label for="fullName" class="text-sm font-medium text-gray-600 block mb-1">Full Name</label>
                    <input type="text" id="fullName" name="fullName" required
                           class="w-full px-4 py-3 rounded-lg bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300">
                </div>
                <div>
                    <label for="email" class="text-sm font-medium text-gray-600 block mb-1">Email</label>
                    <input type="email" id="email" name="email" required
                           class="w-full px-4 py-3 rounded-lg bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300">
                </div>
                <div>
                    <label for="phoneNumber" class="text-sm font-medium text-gray-600 block mb-1">Phone Number</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" required
                           class="w-full px-4 py-3 rounded-lg bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300">
                </div>
                <div>
                    <label for="password" class="text-sm font-medium text-gray-600 block mb-1">Password</label>
                    <input type="password" id="password" name="password" required
                           class="w-full px-4 py-3 rounded-lg bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300">
                </div>
                <input type="hidden" name="action" value="Login">
                <input type="hidden" name="function" value="register">
                <button type="submit" 
                        class="w-full py-3 font-semibold rounded-lg bg-primary text-white hover:bg-secondary transition duration-300 transform hover:scale-105">
                    Create Account
                </button>
            </form>
            <p class="text-center mt-6 text-sm text-gray-600">
                Already have an account? <a href="login.jsp" class="font-semibold text-primary hover:text-secondary transition duration-300">Sign In</a>
            </p>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>
    <script>
        gsap.from(".bg-cover", {duration: 1.5, opacity: 0, scale: 1.1, ease: "power3.out"});
        gsap.from("form", {duration: 1, x: 50, opacity: 0, delay: 0.5, ease: "power3.out"});
    </script>
</body>
</html>
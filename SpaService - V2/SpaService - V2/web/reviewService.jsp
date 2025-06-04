<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review a Service - Your App Name</title>
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
<body class="bg-gradient-to-br from-pink-100 via-white to-pink-200 min-h-screen flex items-center justify-center p-4">
    <div class="bg-white bg-opacity-80 backdrop-filter backdrop-blur-lg rounded-3xl shadow-2xl overflow-hidden w-full max-w-md">
        <div class="p-8 relative">
            <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-primary to-secondary opacity-20 rounded-full transform translate-x-1/4 -translate-y-1/4"></div>
            <h2 class="text-3xl font-bold text-center mb-8 text-primary relative z-10">Review a Service</h2>
            <form action="MainController" method="post" class="space-y-6 relative z-10">
                <input type="hidden" name="action" value="ReviewService">
                <div>
                    <label for="serviceID" class="text-sm font-medium text-gray-600 block mb-1">Select Service:</label>
                    <select name="serviceID" required
                            class="w-full px-4 py-3 rounded-xl bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300 transform hover:scale-105 hover:shadow-lg">
                        <c:forEach var="service" items="${services}">
                            <option value="${service.serviceID}">${service.serviceName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label for="rating" class="text-sm font-medium text-gray-600 block mb-1">Rating (1-5):</label>
                    <input type="number" name="rating" min="1" max="5" required
                           class="w-full px-4 py-3 rounded-xl bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300 transform hover:scale-105 hover:shadow-lg">
                </div>
                <div>
                    <label for="comments" class="text-sm font-medium text-gray-600 block mb-1">Comments:</label>
                    <textarea name="comments" rows="4"
                              class="w-full px-4 py-3 rounded-xl bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300 transform hover:scale-105 hover:shadow-lg"></textarea>
                </div>
                <button type="submit" 
                        class="w-full py-3 font-semibold rounded-xl bg-gradient-to-r from-primary to-secondary text-white hover:shadow-lg transition duration-300 transform hover:scale-105">
                    Submit Review
                </button>
            </form>
            <c:if test="${not empty ERROR}">
                <p class="mt-4 text-red-500 text-center text-sm font-medium bg-red-100 py-2 rounded-xl">${ERROR}</p>
            </c:if>
        </div>
    </div>
</body>
</html>

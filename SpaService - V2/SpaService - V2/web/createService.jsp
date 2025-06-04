<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Service</title>
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
    <c:choose>
        <c:when test="${empty sessionScope.userID || sessionScope.roleID != 'ADM'}">
            <c:redirect url="login.jsp"/>
        </c:when>
        <c:otherwise>
            <div class="bg-white w-full max-w-lg rounded-3xl shadow-2xl p-8 relative">
                <div class="absolute top-0 right-0 w-40 h-40 bg-gradient-to-br from-primary to-secondary opacity-20 rounded-full transform translate-x-1/3 -translate-y-1/3"></div>
                <h2 class="text-3xl font-bold text-center mb-8 text-primary relative z-10">Create a New Spa Service</h2>

                <form action="MainController" method="post" class="space-y-6 relative z-10">
                    <input type="hidden" name="action" value="CreateService">

                    <div>
                        <label for="serviceName" class="text-sm font-medium text-gray-600 block mb-1">Service Name:</label>
                        <input type="text" name="serviceName" required
                               class="w-full px-4 py-3 rounded-xl bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300 transform hover:scale-105 hover:shadow-lg">
                    </div>

                    <div>
                        <label for="description" class="text-sm font-medium text-gray-600 block mb-1">Description:</label>
                        <textarea name="description" rows="5" required
                                  class="w-full px-4 py-3 rounded-xl bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300 transform hover:scale-105 hover:shadow-lg"></textarea>
                    </div>

                    <div>
                        <label for="price" class="text-sm font-medium text-gray-600 block mb-1">Price:</label>
                        <input type="number" step="0.01" name="price" required
                               class="w-full px-4 py-3 rounded-xl bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300 transform hover:scale-105 hover:shadow-lg">
                    </div>

                    <button type="submit" 
                            class="w-full py-3 font-semibold rounded-xl bg-gradient-to-r from-primary to-secondary text-white hover:shadow-lg transition duration-300 transform hover:scale-105">
                        Create Service
                    </button>
                </form>

                <c:if test="${not empty ERROR}">
                    <p class="mt-4 text-red-500 text-center text-sm font-medium bg-red-100 py-2 rounded-xl">${ERROR}</p>
                </c:if>
            </div>
        </c:otherwise>
    </c:choose>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service List</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>
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

        // GSAP animation for table rows
        window.onload = function() {
            gsap.from(".table-row", {
                opacity: 0,
                y: 30,
                duration: 0.8,
                stagger: 0.1,
                ease: "power3.out"
            });
        };
    </script>
</head>
<body class="bg-gradient-to-br from-pink-100 via-white to-pink-200 min-h-screen flex items-center justify-center p-4">
    <div class="bg-white w-full max-w-5xl rounded-2xl shadow-xl p-8 relative">
        <div class="absolute top-0 left-0 w-40 h-40 bg-gradient-to-br from-primary to-secondary opacity-20 rounded-full transform translate-x-1/3 -translate-y-1/3"></div>
        <h2 class="text-3xl font-bold text-center mb-8 text-primary relative z-10">Spa Services</h2>

        <div class="overflow-x-auto relative z-10">
            <table class="min-w-full bg-white shadow-lg rounded-lg">
                <thead>
                    <tr class="bg-primary text-white text-sm">
                        <th class="py-3 px-4 text-left">Service ID</th>
                        <th class="py-3 px-4 text-left">Service Name</th>
                        <th class="py-3 px-4 text-left">Description</th>
                        <th class="py-3 px-4 text-left">Price</th>
                        <th class="py-3 px-4 text-left">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="service" items="${services}">
                        <tr class="table-row border-b border-gray-200 hover:bg-pink-50 transition duration-300">
                            <td class="py-3 px-4">${service.serviceID}</td>
                            <td class="py-3 px-4">${service.serviceName}</td>
                            <td class="py-3 px-4">${service.description}</td>
                            <td class="py-3 px-4">${service.price}</td>
                            <td class="py-3 px-4">
                                <form action="UpdateServiceController" method="get" style="display:inline;">
                                    <input type="hidden" name="serviceID" value="${service.serviceID}">
                                    <input type="submit" value="Edit" class="px-4 py-2 rounded-lg bg-primary text-white hover:bg-secondary transition duration-300 transform hover:scale-105 cursor-pointer">
                                </form>
                                <form action="DeleteServiceController" method="get" style="display:inline;">
                                    <input type="hidden" name="serviceID" value="${service.serviceID}">
                                    <input type="submit" value="Delete" class="px-4 py-2 rounded-lg bg-red-600 text-white hover:bg-red-700 transition duration-300 transform hover:scale-105 cursor-pointer">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="mt-6 text-center">
            <a href="dashboard.jsp" class="text-primary hover:underline">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

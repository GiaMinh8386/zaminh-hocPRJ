<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lịch hẹn - Spa Relax</title>
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
    </script>
</head>
<body class="bg-gradient-to-br from-pink-100 via-white to-pink-200 min-h-screen flex items-center justify-center p-4">
    <div class="bg-white bg-opacity-80 backdrop-filter backdrop-blur-lg w-full max-w-lg rounded-3xl shadow-2xl overflow-hidden">
        <div class="p-8 relative">
            <div class="absolute top-0 right-0 w-40 h-40 bg-gradient-to-br from-primary to-secondary opacity-20 rounded-full transform translate-x-1/3 -translate-y-1/3"></div>
            <h2 class="text-3xl font-bold text-center mb-8 text-primary relative z-10">Đặt lịch hẹn</h2>
            <form action="MainController" method="post" class="space-y-6 relative z-10">
                <input type="hidden" name="action" value="BookAppointment">
                <div class="booking-item">
                    <label for="serviceID" class="text-sm font-medium text-gray-600 block mb-2">Chọn dịch vụ:</label>
                    <select name="serviceID" required
                            class="w-full px-4 py-3 rounded-xl bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300">
                        <c:forEach var="service" items="${services}">
                            <option value="${service.serviceID}">${service.serviceName} - ${service.price}đ</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="booking-item">
                    <label for="appointmentDate" class="text-sm font-medium text-gray-600 block mb-2">Ngày và giờ hẹn:</label>
                    <input type="datetime-local" name="appointmentDate" required
                           class="w-full px-4 py-3 rounded-xl bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300">
                </div>
                <button type="submit" 
                        class="w-full py-4 font-semibold rounded-xl bg-gradient-to-r from-primary to-secondary text-white hover:shadow-lg transition duration-300 transform hover:-translate-y-1">
                    Xác nhận đặt lịch
                </button>
            </form>
            <c:if test="${not empty ERROR}">
                <p class="mt-6 text-red-500 text-center text-sm font-medium bg-red-100 py-3 px-4 rounded-xl">${ERROR}</p>
            </c:if>
        </div>
    </div>
    <script>
        gsap.from(".booking-item", {
            duration: 0.8,
            opacity: 0,
            y: 30,
            stagger: 0.2,
            ease: "power3.out"
        });
    </script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng điều khiển - Spa Relax</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/ScrollTrigger.min.js"></script>
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

        // GSAP animation
        window.onload = function() {
            gsap.from(".dashboard-item", {
                opacity: 0,
                y: 50,
                duration: 0.8,
                stagger: 0.3,
                ease: "power3.out",
            });

            // Light effect on hover
            document.querySelectorAll(".dashboard-item a").forEach(item => {
                item.addEventListener("mouseenter", () => {
                    gsap.to(item, { 
                        backgroundPosition: "200% 0%", 
                        duration: 0.5, 
                        ease: "power2.inOut" 
                    });
                });
                item.addEventListener("mouseleave", () => {
                    gsap.to(item, { 
                        backgroundPosition: "0% 0%", 
                        duration: 0.5, 
                        ease: "power2.inOut" 
                    });
                });
            });

            // Background circle animation
            gsap.to(".bg-circle", {
                duration: 10,
                x: 50,
                y: 50,
                repeat: -1,
                yoyo: true,
                ease: "power1.inOut"
            });
        };
    </script>
</head>
<body class="bg-gradient-to-br from-pink-100 via-white to-pink-200 min-h-screen">
    <c:choose>
        <c:when test="${empty sessionScope.userID}">
            <c:redirect url="login.jsp" />
        </c:when>
        <c:otherwise>
            <div class="container mx-auto px-4 py-12 relative">
                <!-- Background circles for decoration -->
                <div class="absolute top-0 left-0 w-64 h-64 bg-gradient-to-br from-primary to-secondary opacity-20 rounded-full bg-circle"></div>
                <div class="absolute bottom-0 right-0 w-48 h-48 bg-gradient-to-br from-primary to-secondary opacity-20 rounded-full bg-circle"></div>

                <div class="bg-white bg-opacity-80 backdrop-filter backdrop-blur-lg rounded-3xl shadow-2xl overflow-hidden max-w-5xl mx-auto">
                    <div class="p-8 relative">
                        <div class="absolute top-0 right-0 w-64 h-64 bg-gradient-to-br from-primary to-secondary opacity-20 rounded-full transform translate-x-1/3 -translate-y-1/3"></div>
                        <h2 class="text-4xl font-bold text-primary mb-8 relative z-10">Chào mừng, ${sessionScope.fullName}!</h2>
                        <nav class="mb-8 relative z-10">
                            <ul class="space-y-4 grid grid-cols-1 md:grid-cols-2 gap-4">
                                <c:choose>
                                    <c:when test="${sessionScope.roleID == 'ADM'}">
                                        <li class="dashboard-item"><a href="createService.jsp" class="block px-6 py-4 rounded-xl bg-gradient-to-r from-primary to-secondary text-white hover:shadow-lg transition-all duration-300 transform hover:scale-105">Tạo dịch vụ mới</a></li>
                                        <li class="dashboard-item"><a href="ViewServicesController" class="block px-6 py-4 rounded-xl bg-gradient-to-r from-primary to-secondary text-white hover:shadow-lg transition-all duration-300 transform hover:scale-105">Quản lý dịch vụ</a></li>
                                    </c:when>
                                    <c:when test="${sessionScope.roleID == 'STF'}">
                                        <li class="dashboard-item"><a href="MainController?action=ViewConsultation" class="block px-6 py-4 rounded-xl bg-gradient-to-r from-primary to-secondary text-white hover:shadow-lg transition-all duration-300 transform hover:scale-105">Xem tư vấn</a></li>
                                    </c:when>
                                    <c:when test="${sessionScope.roleID == 'USR'}">
                                        <li class="dashboard-item"><a href="MainController?action=BookAppointment" class="block px-6 py-4 rounded-xl bg-gradient-to-r from-primary to-secondary text-white hover:shadow-lg transition-all duration-300 transform hover:scale-105">Đặt lịch hẹn</a></li>
                                        <li class="dashboard-item"><a href="ViewAppointmentsController" class="block px-6 py-4 rounded-xl bg-gradient-to-r from-primary to-secondary text-white hover:shadow-lg transition-all duration-300 transform hover:scale-105">Xem lịch hẹn</a></li>
                                        <li class="dashboard-item"><a href="MainController?action=ReviewService" class="block px-6 py-4 rounded-xl bg-gradient-to-r from-primary to-secondary text-white hover:shadow-lg transition-all duration-300 transform hover:scale-105">Đánh giá dịch vụ</a></li>
                                    </c:when>
                                </c:choose>
                                <li class="dashboard-item md:col-span-2"><a href="MainController?action=Login&function=logout" class="block px-6 py-4 rounded-xl bg-gradient-to-r from-red-400 to-red-600 text-white hover:shadow-lg transition-all duration-300 transform hover:scale-105">Đăng xuất</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</body>
</html>

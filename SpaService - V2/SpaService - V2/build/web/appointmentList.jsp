<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Appointments - Your App Name</title>
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
<body class="bg-gradient-to-br from-pink-100 via-white to-pink-200 min-h-screen p-4 flex items-center justify-center">
    <div class="bg-white bg-opacity-80 backdrop-filter backdrop-blur-lg rounded-2xl shadow-2xl overflow-hidden w-full max-w-4xl">
        <div class="p-8 relative">
            <div class="absolute top-0 right-0 w-40 h-40 bg-gradient-to-br from-primary to-secondary opacity-20 rounded-full transform translate-x-1/3 -translate-y-1/3"></div>
            <h2 class="text-3xl font-bold text-center mb-8 text-primary relative z-10">Your Appointments</h2>
            <div class="overflow-x-auto relative z-10">
                <table class="min-w-full divide-y divide-gray-200 rounded-xl bg-pink-50">
                    <thead class="bg-gradient-to-r from-primary to-secondary">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Appointment ID</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Service</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Date</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Status</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <c:forEach var="appointment" items="${appointments}">
                            <tr class="booking-item">
                                <td class="px-6 py-4 whitespace-nowrap">${appointment.appointmentID}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${appointment.serviceID}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${appointment.appointmentDate}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${appointment.status}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <form action="CancelAppointmentController" method="post">
                                        <input type="hidden" name="appointmentID" value="${appointment.appointmentID}">
                                        <button type="submit" class="text-red-600 hover:text-red-900 font-medium hover:shadow-lg transition duration-300 transform hover:-translate-y-1">Cancel</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="mt-8 text-center">
                <a href="dashboard.jsp" class="inline-block bg-gradient-to-r from-primary to-secondary text-white font-semibold py-2 px-4 rounded-lg hover:shadow-lg transition duration-300 transform hover:-translate-y-1">Back to Dashboard</a>
            </div>
        </div>
    </div>
    <script>
        gsap.from(".booking-item", {
            duration: 0.8,
            opacity: 0,
            y: 30,
            stagger: 0.1,
            ease: "power3.out"
        });
    </script>
</body>
</html>

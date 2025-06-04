<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation and Service Tracking</title>
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
    <div class="bg-white bg-opacity-80 backdrop-filter backdrop-blur-lg rounded-3xl shadow-2xl overflow-hidden w-full max-w-5xl">
        <div class="p-8 relative">
            <h2 class="text-3xl font-bold text-center mb-8 text-primary relative z-10">Consultation and Service Tracking</h2>

            <div class="overflow-x-auto relative z-10">
                <table class="min-w-full bg-white shadow-lg rounded-lg">
                    <thead>
                        <tr class="bg-primary text-white text-sm">
                            <th class="py-3 px-4">Appointment ID</th>
                            <th class="py-3 px-4">User</th>
                            <th class="py-3 px-4">Service</th>
                            <th class="py-3 px-4">Date</th>
                            <th class="py-3 px-4">Status</th>
                            <th class="py-3 px-4">Consultation Notes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="consultation" items="${consultations}">
                            <tr class="border-b border-gray-200 hover:bg-pink-50 transition duration-300">
                                <td class="py-3 px-4 text-center">${consultation.appointmentID}</td>
                                <td class="py-3 px-4 text-center">${consultation.userID}</td>
                                <td class="py-3 px-4 text-center">${consultation.serviceID}</td>
                                <td class="py-3 px-4 text-center">${consultation.appointmentDate}</td>
                                <td class="py-3 px-4 text-center">
                                    <span class="px-2 py-1 rounded-full text-white bg-primary">${consultation.status}</span>
                                </td>
                                <td class="py-3 px-4">
                                    <form action="CompletedAppointmentController" method="post" class="space-y-2">
                                        <input type="hidden" name="appointmentID" value="${consultation.appointmentID}">
                                        <textarea name="notes" rows="3" class="w-full px-4 py-2 rounded-lg bg-pink-50 border-transparent focus:border-primary focus:ring-2 focus:ring-primary focus:bg-white text-sm transition duration-300 transform hover:scale-105 hover:shadow-lg" placeholder="Add notes..."></textarea>
                                        <input type="submit" value="Mark as Completed" class="w-full py-2 font-semibold rounded-lg bg-primary text-white hover:bg-secondary transition duration-300 transform hover:scale-105 cursor-pointer">
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
    </div>
</body>
</html>

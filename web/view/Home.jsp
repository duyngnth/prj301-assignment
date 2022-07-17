<%-- 
    Document   : Home
    Created on : 17-Jul-2022, 11:03:02
    Author     : duyng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Academic Portal</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <br>
        <div class="container text-center">
            <h1>Schedule</h1>
            <a href="WeeklySchedule" style="text-decoration: none; color: #e95601">
                <h3>Weekly schedule</h3>
            </a>
            <br><br><br>
            <h1>Attendance</h1>
            <a href="AttendanceTaking" style="text-decoration: none; color: #e95601">
                <h3>Attendance taking</h3>
            </a>
        </div>
    </body>
</html>

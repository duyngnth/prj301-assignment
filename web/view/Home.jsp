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
            <table style="margin-left: auto; margin-right: auto;" cellpadding="8" cellpadding="10">
                <tr>
                    <td colspan="3">
                        <h1 style="margin-bottom: 80px">Academic portal</h1>
                    </td>
                </tr>
                <tr>
                    <td><h2 style="margin-right: 40px; margin-left: 40px">Schedule</h2></td>
                    <td><div style="margin-left: 40px; margin-right: 40px;"></div></td>
                    <td><h2 style="margin-right: 40px; margin-left: 40px">Attendance</h2></td>
                </tr>
                <tr>
                    <td>
                        <a href="WeeklySchedule" style="text-decoration: none; color: #e95601">
                            <h3>Weekly schedule</h3>
                        </a>
                    </td>
                    <td><div></div></td>
                    <td>
                        <a href="AttendanceTaking" style="text-decoration: none; color: #e95601">
                            <h3>Attendance taking</h3>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><div></div></td>
                    <td>
                        <a href="AttendanceReport" style="text-decoration: none; color: #e95601">
                            <h3>Attendance reports</h3>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

<%-- 
    Document   : SessionDetail
    Created on : 17-Jul-2022, 09:55:54
    Author     : duyng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session detail</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <div style="margin-left: 20px;">
            <p style="font-size: 20pt">Session detail</p>
            <table>
                <tr>
                    <td>Date</td>
                    <td>${requestScope.dayOfWeek} ${requestScope.session.date.toString()}</td>
                </tr>
                <tr>
                    <td>Slot</td>
                    <td>${session.timeslot.id.charAt(session.timeslot.id.length() - 1)}</td>
                </tr>
                <tr>
                    <td>Student group</td>
                    <td>
                        <a href="Group?ID=${session.group.id}" style="text-decoration: none; color: #e95601">
                            ${session.group.name}
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>Lecturer:</td>
                    <td>${session.group.lecturer.name}</td>
                </tr>
                <tr>
                    <td>Course</td>
                    <td>${session.group.course.name}</td>
                </tr>
                <tr>
                    <td>Course session number:</td>
                    <td>${session.sessionNumber}</td>
                </tr>
                <tr>
                    <td>Course session description:</td>
                    <td>${session.sessionDescription}</td>
                </tr>
            </table>
        </div>
    </body>
</html>

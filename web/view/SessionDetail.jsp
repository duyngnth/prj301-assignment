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
    </head>
    <body>
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
    </body>
</html>

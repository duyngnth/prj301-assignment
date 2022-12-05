<%-- 
    Document   : TakeAttendance
    Created on : 17-Jul-2022, 13:40:42
    Author     : duyng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take attendance</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <br>
        <div class="container">
            <p>Attendance for <b>${session.group.course.id}</b> with lecture <b>${session.group.lecturer.name}</b> at ${session.timeslot.id.toLowerCase()} 
                on ${session.date}, ${session.semester}, in room ${session.room.id} at FU-HL</p>
            <form action="AttendanceTaking" method="POST">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-orange">
                                <th class="text-uppercase text-white text-center">NO</th>
                                <th class="text-uppercase text-white text-center">GROUP</th>
                                <th class="text-uppercase text-white text-center">CODE</th>
                                <th class="text-uppercase text-white text-center">NAME</th>
                                <th class="text-uppercase text-white text-center">IMAGE</th>
                                <th class="text-uppercase text-white text-center">STATUS</th>
                                <th class="text-uppercase text-white text-center">COMMENT</th>
                            </tr>
                        </thead>
                        <tbody>
                        <input type="hidden" name="action" value="Take">
                        <input type="hidden" name="SessionID" value="${session.id}">
                        <c:forEach items="${session.group.students}" var="st" varStatus="st_loop">
                            <tr>
                                <td class="text-center">${st_loop.count}</td>
                                <td class="text-center">${session.group.name}</td>
                                <td class="text-center">${st.id}</td>
                                <td class="text-center">${st.getFullname()}</td>
                                <td class="text-center">
                                    <img src="${pageContext.request.contextPath}/view/Image/${st.id}.jpg" style="height:146px;width:111px"/>
                                </td>
                                <td class="text-left">
                                    <input required type="radio" name="status${st.id}" value="Attended">Present<br>
                                    <input required type="radio" name="status${st.id}" value="Absent" checked="checked">Absent
                                </td>
                                <td class="text-center">
                                    <input type="text" name="comment${st.id}">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <input type="submit" value="Submit">
            </form>
        </div>
        <br><br>
    </body>
</html>

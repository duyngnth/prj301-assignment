<%-- 
    Document   : WeeklySchedule
    Created on : 16-Jul-2022, 20:41:34
    Author     : duyng
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Weekly schedule</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <br/>
        <div class="container">
            <div class="timetable-img text-center">
                <img src="img/content/timetable.png" alt="">
            </div>
            <div class="table-responsive">
                <form id="scheduleForm" action="WeeklySchedule" method="POST">
                    <table class="table table-bordered text-center">
                        <thead>
                            <tr class="bg-orange">
                                <th rowspan="2" class="text-uppercase text-white">
                                    Year
                                    <select name="year">
                                        <option
                                            <c:if test="${requestScope.year eq 2022}">
                                                selected="selected"
                                            </c:if>
                                            >2022</option>
                                        <option
                                            <c:if test="${requestScope.year eq 2023}">
                                                selected="selected"
                                            </c:if>
                                            >2023</option>
                                    </select><br>
                                    Week
                                    <select name="index" onchange="document.getElementById('scheduleForm').submit()">
                                        <c:forEach items="${requestScope.weeks}" var="w" varStatus="loop">
                                            <option value="${loop.index}" 
                                                    <c:if test="${loop.index eq requestScope.index}">
                                                        selected="selected"
                                                    </c:if>
                                                    >${w.toString()}</option>
                                        </c:forEach>
                                    </select>
                                </th>
                                <th class="text-uppercase text-white">Monday</th>
                                <th class="text-uppercase text-white">Tuesday</th>
                                <th class="text-uppercase text-white">Wednesday</th>
                                <th class="text-uppercase text-white">Thursday</th>
                                <th class="text-uppercase text-white">Friday</th>
                                <th class="text-uppercase text-white">Saturday</th>
                                <th class="text-uppercase text-white">Sunday</th>
                            </tr>
                            <tr class="bg-orange">
                                <c:forEach var="sw" items="${requestScope.selectedWeek}" varStatus="sw_loop">
                                    <th class="text-uppercase text-white">
                                        <fmt:formatDate pattern = "dd-MM" value = "${sw}" />
                                    </th>
                                </c:forEach>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.slots}" var="sl" varStatus="sl_loop">
                                <tr>
                                    <td class="align-middle">${sl.id}</td>
                                    <c:forEach items="${requestScope.selectedWeek}" var="sw" varStatus="sw_loop">
                                        <td>
                                            <c:forEach items="${requestScope.sessions}" var="ss" varStatus="ss_loop">
                                                <c:if test="${ss.date.toString() eq sw.toString()}">
                                                    <c:if test="${ss.timeslot.id eq sl.id}">
                                                        <a href="SessionDetail?ID=${ss.id}" style="text-decoration: none">
                                                            <div class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${ss.group.course.id}</div>
                                                        </a>
                                                        <div class="margin-10px-top font-size14 text-gray">${ss.group.name}</div>
                                                        <div class="font-size14">${ss.timeslot.toString()}</div>
                                                        <div class="font-size14 text-gray">at ${ss.room.id}</div>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                    </c:forEach>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>

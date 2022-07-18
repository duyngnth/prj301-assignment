<%-- 
    Document   : GroupAttendance
    Created on : 18-Jul-2022, 09:08:29
    Author     : duyng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Group attendance reports</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <br>
        <div class="container text-center">
            <h4>Attendance reports of ${group.name}</h4>
            <table style="margin-left: auto; margin-right: auto" cellpadding="4">
                <c:forEach items="${sessions}" var="ss" varStatus="ss_loop">
                    <tr>
                        <td style="text-align: left">
                            <a style="text-decoration: none; color: #e95601" href="AttendanceReport?GroupID=${group.id}&Session=${ss.id}">
                                <fmt:formatDate pattern="EEEE, dd/MM/yyyy" value="${ss.date}"/>
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                <tr>
                    <td style="text-align: left">
                        <a style="text-decoration: none; color: #e95601" href="AttendanceReport?GroupID=${group.id}&Session=All">
                            Full course report
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

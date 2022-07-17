<%-- 
    Document   : ViewGroup
    Created on : 17-Jul-2022, 10:39:38
    Author     : duyng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View group</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <br>
        <div class="container">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr class="bg-orange text-center">
                            <th class="text-uppercase text-white">NO</th>
                            <th class="text-uppercase text-white">IMAGE</th>
                            <th class="text-uppercase text-white">MEMBER</th>
                            <th class="text-uppercase text-white">ID</th>
                            <th class="text-uppercase text-white">SURNAME</th>
                            <th class="text-uppercase text-white">MIDDLE NAME</th>
                            <th class="text-uppercase text-white">GIVEN NAME</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${group.students}" var="gs" varStatus="gs_loop">
                            <tr>
                                <td class="text-center">${(gs_loop.count)}</td>
                                <td class="text-center">
                                    <img src="${pageContext.request.contextPath}/view/Image/${gs.id}.jpg" style="height:146px;width:111px"/>
                                </td>
                                <td class="text-center">${gs.memberCode}</td>
                                <td class="text-center">${gs.id}</td>
                                <td>${gs.surname}</td>
                                <td>${gs.middleName}</td>
                                <td>${gs.givenName}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
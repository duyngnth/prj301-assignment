<%-- 
    Document   : SessionAttendance
    Created on : 29-Jun-2022, 15:03:46
    Author     : duyng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session attendance</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <br>
        <p>Attendance for <b>PRJ301</b> with lecture <b>DuyNT5</b> at slot 4 on Wednesday 29/06/2022, Spring 2022, in room DE-C202 at FU-HL</p>
        <div class="container">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr class="bg-orange text-center">
                            <th class="text-uppercase text-white">NO</th>
                            <th class="text-uppercase text-white">GROUP</th>
                            <th class="text-uppercase text-white">CODE</th>
                            <th class="text-uppercase text-white">NAME</th>
                            <th class="text-uppercase text-white">IMAGE</th>
                            <th class="text-uppercase text-white">STATUS</th>
                            <th class="text-uppercase text-white">COMMENT</th>
                            <th class="text-uppercase text-white">TAKER</th>
                            <th class="text-uppercase text-white">RECORD TIME</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">SE1623</td>
                            <td class="text-center">HE163585</td>
                            <td>Nguyễn Trung Vũ</td>
                            <td>
                                <img src="Image/HE163585.jpg" style="height:146px;width:111px"/>
                            </td>
                            <td style="color: green">Present</td>
                            <td></td>
                            <td class="text-center">sonnt5</td>
                            <td class="text-center">29/06/2022 - 15:55</td>
                        </tr>
                        <tr>
                            <td class="text-center">2</td>
                            <td class="text-center">SE1623</td>
                            <td class="text-center">HE163884</td>
                            <td>Nguyễn Minh Hoàng</td>
                            <td>
                                <img src="Image/leminho.png" style="height:146px;width:111px"/>
                            </td>
                            <td style="color: green">Present</td>
                            <td></td>
                            <td class="text-center">sonnt5</td>
                            <td class="text-center">29/06/2022 - 15:55</td>
                        </tr>
<!--                        <tr>
                            <td>3</td>
                            <td>SE1623</td>
                            <td>HE163937</td>
                            <td>Nguyễn Hoàng Minh</td>
                            <td>
                                <img src="Image/HE163937.jpg" style="height:146px;width:111px"/>
                            </td>
                            <td style="color: green">Present</td>
                            <td></td>
                            <td>sonnt5</td>
                            <td>29/06/2022 - 15:55</td>
                        </tr>-->
                        <tr>
                            <td class="text-center">3</td>
                            <td class="text-center">SE1623</td>
                            <td class="text-center">HE164001</td>
                            <td>Nguyễn Thế Duy</td>
                            <td>
                                <img src="Image/HE164001.jpg" style="height:146px;width:111px"/>
                            </td>
                            <td style="color: red">Absent</td>
                            <td>Đéo thích đi học</td>
                            <td class="text-center">sonnt5</td>
                            <td class="text-center">29/06/2022 - 15:55</td>
                        </tr>
                        <tr>
                            <td class="text-center">4</td>
                            <td class="text-center">SE1623</td>
                            <td class="text-center">HE164016</td>
                            <td>Phạm Danh Trung Nguyên</td>
                            <td>
                                <img src="Image/HE164016.jpg" style="height:146px;width:111px"/>
                            </td>
                            <td style="color: green">Present</td>
                            <td></td>
                            <td class="text-center">sonnt5</td>
                            <td class="text-center">29/06/2022 - 15:55</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
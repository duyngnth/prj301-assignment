<%-- 
    Document   : WeeklyTimetable
    Created on : 22-Jun-2022, 10:09:01
    Author     : duyng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Weekly timetable</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <br/>
        <div class="text-center">
            Campus: <select class="text-center" disabled="disabled">
            <option>FU-HL</option>
            </select>
        </div>
        <div class="text-center">
            Lecture: <input type="text" value="duynt5">
            <button>View</button>
        </div>
        <div class="container">
            <div class="timetable-img text-center">
                <img src="img/content/timetable.png" alt="">
            </div>
            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr class="bg-orange">
                            <th rowspan="2" class="text-uppercase text-white">
                                Year
                                <select>
                                    <option>2022</option>
                                    <option>2023</option>
                                </select><br>
                                Week
                                <select>
                                    <option>27/06 to 03/07</option>
                                    <option>04/07 to 10/07</option>
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
                            <th class="text-uppercase text-white">20/06</th>
                            <th class="text-uppercase text-white">21/06</th>
                            <th class="text-uppercase text-white">22/06</th>
                            <th class="text-uppercase text-white">23/06</th>
                            <th class="text-uppercase text-white">24/06</th>
                            <th class="text-uppercase text-white">25/06</th>
                            <th class="text-uppercase text-white">26/06</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="align-middle">Slot 1</td>
                            <td>-</td>
                            <td>
                                <span class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">MAS-291</span>
                                <div class="margin-10px-top font-size14 text-gray">SE-1630</div>
                                <div class="font-size14">07:30-09:00</div>
                                <div class="font-size14 text-gray">at DE-C203</div>
                            </td>
                            <td>-</td>
                            <td>
                                <span class="bg-gray padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">MAS-291</span>
                                <div class="margin-10px-top font-size14 text-gray">SE-1630</div>
                                <div class="font-size14">07:30-09:00</div>
                                <div class="font-size14 text-gray">at DE-C203</div>
                            </td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="align-middle">Slot 2</td>
                            <td>-</td>
                            <td>
                                <span class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">MAS-291</span>
                                <div class="margin-10px-top font-size14 text-gray">SE-1630</div>
                                <div class="font-size14">09:10-10:40</div>
                                <div class="font-size14 text-gray">at DE-C203</div>
                            </td>
                            <td>-</td>
                            <td>
                                <span class="bg-gray padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">JPD-123</span>
                                <div class="margin-10px-top font-size14 text-gray">SE-1623</div>
                                <div class="font-size14">09:10-10:40</div>
                                <div class="font-size14 text-gray">at DE-C225</div>
                            </td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="align-middle">Slot 3</td>
                            <td>-</td>
                            <td>
                                <span class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">JPD-123</span>
                                <div class="margin-10px-top font-size14 text-gray">SE-1623</div>
                                <div class="font-size14">10:50-12:20</div>
                                <div class="font-size14 text-gray">at DE-C225</div>
                            </td>
                            <td>-</td>
                            <td>
                                <span class="bg-gray padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">JPD-123</span>
                                <div class="margin-10px-top font-size14 text-gray">SE-1623</div>
                                <div class="font-size14">10:50-12:20</div>
                                <div class="font-size14 text-gray">at DE-C225</div>
                            </td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="align-middle">Slot 4</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="align-middle">Slot 5</td>
                            <td>
                                <span class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">PRJ-301</span>
                                <div class="margin-10px-top font-size14 text-gray">SE-1623</div>
                                <div class="font-size14">14:30-16:00</div>
                                <div class="font-size14 text-gray">at DE-C202</div>
                            </td>
                            <td>-</td>
                            <td>
                                <span class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">PRJ-301</span>
                                <div class="margin-10px-top font-size14 text-gray">SE-1623</div>
                                <div class="font-size14">14:30-16:00</div>
                                <div class="font-size14 text-gray">at DE-C202</div>
                            </td>
                            <td>-</td>
                            <td>
                               <span class="bg-gray padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">PRJ-301</span>
                                <div class="margin-10px-top font-size14 text-gray">SE-1623</div>
                                <div class="font-size14">14:30-16:00</div>
                                <div class="font-size14 text-gray">at DE-C202</div>
                            </td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="align-middle">Slot 6</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="align-middle">Slot 7</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="align-middle">Slot 8</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

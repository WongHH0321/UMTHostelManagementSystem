<%-- 
    Document   : studApplicationPage
    Created on : 6 Jun 2023, 11:01:26 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="room.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UMT Hostel Management System</title>
        <!-- font awesome cdn link-->
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="s2.css">

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <style>
            h1 {
                background-color: #461B7E;
                height: 80px;
                background: cover;
                padding: 20px;
                text-align: center;
                color: white;
            }
        </style>
    </head>
    <body>
        <header class="header">
            <!-- As a heading -->
            <div class="hero" style="background:white;">
                <nav class="navbar1">
                    <div class="left flex">
                        <div class="email">
                            <i class="fa fa-envelope"></i>
                            <span>kolej.kediaman@umt.edu.my</span>
                        </div>
                        <div class="call">
                            <i class="fa fa-phone-alt"></i>
                            <span>+609-662 2084</span>
                        </div>
                    </div>
                    <div class="right flex">
                        <ul>
                            <li><a href="studHostelPage.jsp">HOME</a></li>
                            <li><a href="studRoomPage.jsp">ROOM</a></li>
                            <li><a href="involvementListByStudID?studID=<%=session.getAttribute("user")%>">MERIT</a></li>
                            <li><a href="#">APPLICATION</a>
                                <ul class="dropdown">                                   
                                        <%if (session.getAttribute("count").equals(0)) {%>
                                        <li><a href="studHostelApplication.jsp">APPLY HOSTEL</a></li>
                                        <li><a href="studRoomApplication.jsp" onclick="return false;">APPLY ROOM</a></li>  
                                        <li><a href="showHostelApplicationStatus?studID=<%=session.getAttribute("user")%>" onclick="return false;">STATUS</a></li> 
                                        <%} else { %>
                                        <li><a href="studHostelApplication.jsp" onclick="return false;">APPLY HOSTEL</a></li>
                                            <%if (session.getAttribute("action").equals("Reject")) { %>
                                        <li><a href="studRoomApplication.jsp" onclick="return false;">APPLY ROOM</a></li>
                                            <%} else { %>
                                                <%if(session.getAttribute("roomApplication").equals(0)){ %>
                                        <li><a href="studRoomApplication.jsp">APPLY ROOM</a></li>  
                                                <%} else { %>
                                        <li><a href="offerLetter?studID=<%=session.getAttribute("user")%>">APPLY ROOM</a></li>
                                                <%}
                                              }%>
                                        <li><a href="showHostelApplicationStatus?studID=<%=session.getAttribute("user")%>">STATUS</a></li> 
                                         <%}%>
                                    </ul>
                            </li>
                        </ul>
                        <img src="images/user.png" class="user-pic" onclick="toggleMenu()">

                        <div class="sub-menu-wrap" id="subMenu">
                            <div class="sub-menu">
                                <div class="user-info">
                                    <img src="images/user.png">
                                    <h3>Student&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <%=session.getAttribute("user")%></h3>
                                </div>
                                <hr>
                                <a href="showStudentProfile?studID=<%=session.getAttribute("user")%>" class="sub-menu-link">
                                    <img src="images/profile.png">
                                    <p>Edit Profile</p>
                                    <span>></span>
                                </a>
                                <a href="loginInterface.jsp" class="sub-menu-link">
                                    <img src="images/logout.png">
                                    <p>Logout</p>
                                    <span>></span>
                                </a>

                            </div>

                        </div>

                    </div>
                </nav>

                <nav class="navbar2">
                    <img src="images/UMT.png" class="logo1">
                    <img src="images/logoUMT.png" class="logo">
                    <ul>

                        <a href="studHostelPage.jsp" class="btn1">Back</a>
                    </ul>
                </nav>




                <!--end header-->

                <h1>ROOM APPLICATION FORM</h1>

                <div class="wrapper">
                    <div class="header">
                        <ul>
                            <li class="active form_1_progessbar">
                                <div>
                                    <p>1</p>
                                </div>
                            </li>
                            <li class="form_2_progessbar">
                                <div>
                                    <p>2</p>
                                </div>
                            </li>
                            <li class="form_3_progessbar">
                                <div>
                                    <p>3</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="form_wrap">
                        <div class="form_1 data_info">
                            <h2>Room Application Info</h2>
                            <form action="insertApplication" method="post">
                                <input type="hidden" name="user" id="user" value="<%=session.getAttribute("type")%>">
                                <input type="hidden" name="studID" value="<%=session.getAttribute("user")%>">
                                <div class="form_container">
                                    <div class="input_wrap">
                                        <label for="startDate">Start Date</label>
                                        <input type="date" name="startDate" value="<c:out value='${application.getStartDate()}' />"
                                               class="input"id="startDate" required="required">
                                    </div>
                                    <div class="input_wrap">
                                        <label for="endDate">End Date</label>
                                        <input type="date" name="endDate" class="input" id="endDate" value="<c:out value='${application.getEndDate()}' />"
                                               required="required">
                                    </div>
                                    <div class="input_wrap">
                                        <label for="blockChosen">Block Chosen</label>
                                        <select name="block" id="block" class="input" value="<c:out value='${application.getBlock()}' />"
                                                required="required">
                                            <option value="Ibnu Sina">Ibnu Sina(IS)</option>
                                            <option value="Ibnu Hibban">Ibnu Hibban(IH)</option>
                                            <option value="Ibnu Majah">Ibnu Majah(IM)</option>
                                            <option value="Ibnu Abbas">Ibnu Abbas(IA)</option>
                                            <option value="Ibnu Jarir">Ibnu Jarir(IJ)</option>
                                            <option value="An-Nasai">An-Nasai(ANN)</option>
                                            <option value="At-Thabrani">At-Thabrani(ATB)</option>
                                            <option value="At-Tarmidzi">At-Tarmidzi(ATT)</option>
                                        </select>
                                    </div>
                                </div>
                                <!--</form>-->
                        </div>
                        <div class="form_2 data_info" style="display: none;">
                            <h2>Block Details</h2>
                            <!--<form action="insertApplication" method="post">-->
                            <div class="form_container">
                                <div class="input_wrap">
                                    <label for="blockLevel">Block Level
                                        <span style="color: red">*</span></label><p> All block have 4 level except (IS & IH have 5 level)</p>
                                    <select name="blockLevel" id="block" class="input" value="<c:out value='${application.getBlockLevel()}' />"
                                            required="required">>
                                        <option value="1">Level 1</option>
                                        <option value="2">Level 2</option>
                                        <option value="3">Level 3</option>
                                        <option value="4">Level 4</option>
                                        <option value="5">Level 5</option>
                                    </select>
                                </div>
                                <div class="input_wrap">
                                    <label for="roomType">Room Type</label>
                                    <select name="roomType" id="block" class="input" value="<c:out value='${application.getRoomType()}' />"
                                            required="required">
                                        <option value="Double Room">Double Room (2pax)</option>
                                        <option value="Triple Room">Triple Room(3pax)</option>
                                        <option value="Quadruple Room">Quadruple Room(4pax)</option>

                                    </select>
                                </div>

                            </div>
                            <!--</form>-->
                        </div>
                        <div class="form_3 data_info" style="display: none;">
                            <h2>Room Details</h2>
                            <!--<form action="insertApplication" method="post">-->
                            <div class="form_container">
                                <div class="input_wrap">
                                    <label for="roomNo">Room No.</label>
                                    <input type="text" name="roomNo" class="input" id="roomNo" placeholder="e.g. B1-307-1"  value="<c:out value='${application.getRoomNo()}' />"
                                           required="required">
                                </div>
                                <div class="input_wrap">
                                    <label for="stuRequire">Request:</label>
                                    <input type="text" name="stuRequire" class="input" id="stuRequire" size="200" placeholder="For specialize student to put request."  value="<c:out value='${room.getRequest()}' />"
                                           required="required">
                                </div>

                            </div>
                            <!--</form>-->
                        </div>
                    </div>
                    <div class="btns_wrap">
                        <div class="common_btns form_1_btns">
                            <button type="button" class="btn_next">Next <span class="icon"><ion-icon name="arrow-forward-sharp"></ion-icon></span></button>
                        </div>
                        <div class="common_btns form_2_btns" style="display: none;">
                            <button type="button" class="btn_back"><span class="icon"><ion-icon name="arrow-back-sharp"></ion-icon></span>Back</button>
                            <button type="button" class="btn_next">Next <span class="icon"><ion-icon name="arrow-forward-sharp"></ion-icon></span></button>
                        </div>
                        <div class="common_btns form_3_btns" style="display: none;">
                            <button type="button" class="btn_back"><span class="icon"><ion-icon name="arrow-back-sharp"></ion-icon></span>Back</button>
                            <button type="button" class="btn_done">Submit</button>

                            <div class="modal_wrapper">
                                <div class="shadow"></div>
                                <div class="success_wrap">
                                    <span class="modal_icon"><ion-icon name="checkmark-sharp"></ion-icon></span>
                                    <p>You have successfully completed the application.</p>
                                    <input type="submit" class="btn1" value="Review">
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>



                <script type="text/javascript" src="script.js"></script>
                <script type="text/javascript" src="room.js"></script>
                <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
                <script src="script.js"></script>
                <script>
                            let subMenu = document.getElementById("subMenu");
                            function toggleMenu() {
                                subMenu.classList.toggle("open-menu");
                            }
                </script>
                </body>
                </html>

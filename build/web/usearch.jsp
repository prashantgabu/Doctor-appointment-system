<%@page import="java.sql.*" %>
<%

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3360/dbappoint", "root", "root");
%>

<%
    String user_id = "1";
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("ulogin.jsp");
    } else {
        user_id = session.getAttribute("user_id").toString();

 %>

<%@include file="indexheader.jsp" %>
<section class="home-slider owl-carousel">
    <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container" data-scrollax-parent="true">
            <div class="row slider-text align-items-end">
                <div class="col-md-7 col-sm-12 ftco-animate mb-5">
                    <p class="breadcrumbs" data-scrollax=" properties: { translateY: '70%', opacity: 1.6}">
                    <h1 class="mb-3" data-scrollax=" properties: { translateY: '70%', opacity: .9}">Well Experienced Doctors</h1>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-5">
            <div class="col-md-7 text-center heading-section ftco-animate">
                <h2 class="mb-3 ">Search</h2>
                <form method="post">
                    <p><input type="text" name="name" class="form-control" ><br>
                        <input type="submit" name="btn" value="Search"></p>
                </form>
            </div>
        </div>
        <div class="row">
            <%
                String q;
                if (request.getParameter("btn") != null) {
                    String dname = request.getParameter("name");
                    String location = request.getParameter("name");

                    q = "Select d.*,p.*,s.* from doctor_register d, doctor_profile p, schedule s where d.doctor_id=p.doctor_id and d.doctor_id=s.doctor_id and d.fname like'%" + dname + "%' OR  s.location like '%" + location + "%'";
                   /*  q = "Select d.*,p.*,s.* from doctor_register d, doctor_profile p, schedule s where d.doctor_id=p.doctor_id and d.doctor_id=s.doctor_id and d.fname like'%" + dname + "%' OR '%" + dname + "%'  OR s.location like '%" + location + "%'";
               */ } else {
                    q = "Select d.*,p.* from doctor_register d, doctor_profile p where d.doctor_id=p.doctor_id";
                }
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(q);
                while (rs.next()) {
                    String doctor_id = rs.getString("doctor_id");
                    String fname = rs.getString("fname");
                    String lname = rs.getString("lname");
                    String email = rs.getString("email");
                    String contact = rs.getString("contact");
                    String dob = rs.getString("dob");
                    String degree = rs.getString("degree");
                    String gender = rs.getString("gender");
                    String specialist = rs.getString("specialist");
                    String bio = rs.getString("bio");
                    String propic = rs.getString("propic");


            %>
            <div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
                <div class="staff">
                    <div class="img mb-4" style="background-image: url(images/<%=propic%>);"></div>
                    <div class="info text-center">
                        <h3><a href="teacher-single.html"><%=fname%> <%=lname%></a></h3>
                        <span class="position"><%=specialist%></span>
                        <span class="position"><a href="ubook.jsp?doctor_id=<%=doctor_id%>">Book</a></span>
                        <div class="text">
                            <p><%=bio%></p>
                            <ul class="ftco-social">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>

            </section>


<%}%>
            <footer class="ftco-footer ftco-bg-dark ftco-section">
                <div class="container ">
                    <div class="row mb-5">
                        <div class="col-md-3">
                            <div class="ftco-footer-widget mb-4">
                                <h2 class="ftco-heading-2">DentaCare.</h2>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                            </div>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft ">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                        <div class="col-md-2">
                            <div class="ftco-footer-widget mb-4 ml-md-5">
                                <h2 class="ftco-heading-2">Quick Links</h2>
                                <ul class="list-unstyled">
                                    <li><a href="#" class="py-2 d-block">About</a></li>
                                    <li><a href="#" class="py-2 d-block">Features</a></li>
                                    <li><a href="#" class="py-2 d-block">Projects</a></li>
                                    <li><a href="#" class="py-2 d-block">Blog</a></li>
                                    <li><a href="#" class="py-2 d-block">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4 pr-md-4">
                            <div class="ftco-footer-widget mb-4">
                                <h2 class="ftco-heading-2">Recent Blog</h2>
                                <div class="block-21 mb-4 d-flex">
                                    <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                                    <div class="text">
                                        <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                        <div class="meta">
                                            <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                            <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                            <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="block-21 mb-4 d-flex">
                                    <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                                    <div class="text">
                                        <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                        <div class="meta">
                                            <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                            <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                            <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="ftco-footer-widget mb-4">
                                <h2 class="ftco-heading-2">Office</h2>
                                <div class="block-23 mb-3">
                                    <ul>
                                        <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                                        <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                        <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center">

                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                        </div>
                    </div>
                </div>
            </footer>



            <!-- loader -->
            <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

            <!-- Modal -->
            <div class="modal fade" id="modalRequest" tabindex="-1" role="dialog" aria-labelledby="modalRequestLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalRequestLabel">Make an Appointment</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="#">
                                <div class="form-group">
                                    <!-- <label for="appointment_name" class="text-black">Full Name</label> -->
                                    <input type="text" class="form-control" id="appointment_name" placeholder="Full Name">
                                </div>
                                <div class="form-group">
                                    <!-- <label for="appointment_email" class="text-black">Email</label> -->
                                    <input type="text" class="form-control" id="appointment_email" placeholder="Email">
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <!-- <label for="appointment_date" class="text-black">Date</label> -->
                                            <input type="text" class="form-control appointment_date" placeholder="Date">
                                        </div>    
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <!-- <label for="appointment_time" class="text-black">Time</label> -->
                                            <input type="text" class="form-control appointment_time" placeholder="Time">
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <!-- <label for="appointment_message" class="text-black">Message</label> -->
                                    <textarea name="" id="appointment_message" class="form-control" cols="30" rows="10" placeholder="Message"></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Make an Appointment" class="btn btn-primary">
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>


            <script src="js/jquery.min.js"></script>
            <script src="js/jquery-migrate-3.0.1.min.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery.easing.1.3.js"></script>
            <script src="js/jquery.waypoints.min.js"></script>
            <script src="js/jquery.stellar.min.js"></script>
            <script src="js/owl.carousel.min.js"></script>
            <script src="js/jquery.magnific-popup.min.js"></script>
            <script src="js/aos.js"></script>
            <script src="js/jquery.animateNumber.min.js"></script>
            <script src="js/bootstrap-datepicker.js"></script>
            <script src="js/jquery.timepicker.min.js"></script>
            <script src="js/scrollax.min.js"></script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
            <script src="js/google-map.js"></script>
            <script src="js/main.js"></script>

            </body>
            </html>
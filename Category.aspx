<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Category.aspx.cs" Inherits="Benchkart.Category" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer - SubCategory</title>
    <meta charset='utf-8' />
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="description" content="Sign In" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
    <script src="../Scripts/Custom.js"></script>
    <%--<script src="../Scripts/jquery.multifile.js"></script>
    <script src="../Scripts/Skills.js"></script>--%>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <link href="../css/partner.css" rel="stylesheet" />

     <!-- Vendor CSS Files -->
   <%-- <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">--%>
    <link href="assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
    <%--<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
    <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">--%>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet" />
    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
   

    <style>
        .Image {
            height: 500px;
            width: 850px;
            padding: 50px 70px 30px 70px;
        }

        @media only screen and (max-width: 799px) {
            .content {
                width: 90% !important;
            }

            .Image {
                height: 160px;
                width: 220px;
                padding: 0px;
                margin-top: 20px;
            }
        }
    </style>
    <style>
        .content {
            padding: 10px;
            margin: 0 auto;
            position: relative;
            z-index: 0;
            min-height: 350px;
            margin-top: 10px;
            width: 100%;
        }

        .button {
            width: 100%;
            background-color: #18D26E;
            color: White;
            height: 30px;
            border-radius: 5px;
            margin-top: 20px;
        }

        .panel {
            margin: 0 auto;
            /*margin-top: 70px;*/
            padding-top: 10px;
            width: 100%;
            min-height: 300px;
        }

        br {
            display: block; /* makes it have a width */
            content: ""; /* clears default height */
            margin-top: 10px; /* change this to whatever height you want it */
        }
    </style>
    <style>
        .dropbtn {
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

            .dropbtn:hover, .dropbtn:focus {
                background-color: #18D26E;
            }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            left: -100px;
            display: none;
            position: absolute;
            background-color: white;
            min-width: 120px;
            margin-top: 5px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

            .dropdown-content a {
                padding: 10px;
                color: #333;
                transition: 0.3s;
                display: block;
                font-size: 13px;
                text-transform: none;
                font-weight: bold;
            }

        .dropdown a:hover {
            color: #18d26e;
        }

        .show {
            display: block;
        }
    </style>
    <style>
        #header #logo h1 {
            font-size: 28px;
            letter-spacing: 1px;
        }

        @media (max-width: 1024px) {
            #header #logo h1 {
                font-size: 22px;
                letter-spacing: 1px;
            }

            #mobile-nav ul {
                width: 100%;
            }

                #mobile-nav ul li a {
                    padding: 15px 22px 15px 15px;
                }
        }

        @media (min-width: 1024px) {
            #header #logo {
                padding-left: 10px;
            }

            .nav-menu > li {
                margin-left: 15px;
            }
        }

        @media (min-width: 1024px) {
            #nav-menu-container {
                padding-right: 10px;
            }

            .nav-menu ul {
                left: -100px;
            }
        }

        .nav-menu a {
            padding: 0 4px 5px 4px;
        }

        #mobile-nav-toggle {
            right: 30px;
        }
    </style>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-142828286-2');
    </script>
    <script>
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

        window.onclick = function (event) {
            if (!event.target.matches('.dropbtn')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
    </script>
    <style>
        .category {
            padding: 20px 100px;
        }

        .label {
            line-height: 2em;
            font-size: 1em;
        }

        @media (max-width: 799px) {
            .category {
                padding: 5px 10px;
            }
        }
    </style>

</head>
<body style="background-color: white; height: 100%; overflow-x: hidden">
    <form id="form1" runat="server">
        <header id="header" style="padding: 0px;position: relative;">
            <div class="container-fluid" style="background-color: black; min-height: 70px;">
                <div id="logo" class="pull-left" style="margin-top: 15px;">
                    <h1><a href="https://benchkart.com" class="scrollto"><span style="color: #18D26E;">bench</span><span style="color: coral;">kart</span></a></h1>
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <!-- <a href="#intro"><img src="assets/img/logo.png" alt=""></a>-->
                </div>
                <div style="float: right;">


                    <div class="dropdown" style="float: right; margin-top: 5px;">

                        <i onclick="myFunction()" style="font-size: 20px; margin-top: 15px; margin-right: 20px;" class="fa fa-user-circle dropbtn"></i>
                        <div id="myDropdown" class="dropdown-content">
                            <a href="Signin.aspx" class="nav-menu ul li a">Sign in</a>
                            <a href="Signup.aspx" class="nav-menu ul li a">Sign up</a>
                            <a href="../Partner/Signup.aspx" class="nav-menu ul li a">For Partner</a>
                        </div>
                    </div>
                </div>
                <!-- #nav-menu-container -->
            </div>
        </header>

        <div class="category">
            <div class="row">
                <div class="col-md-8 order-md-2" style="text-align: center;">
                    <asp:Image ID="Image1" runat="server" CssClass="Image" />
                </div>

                <div class="col-md-4 order-md-1" style="padding-top: 10px; padding-bottom: 30px;">
                    <h1 style="text-align: center; margin-bottom: 30px;">
                        <asp:Label ID="lblsubcategory" runat="server" Font-Size=".7em" Style="font-weight: bold; font-family: 'Montserrat', sans-serif;"></asp:Label></h1>
                    <asp:Label runat="server" CssClass="label" Style="margin-top: 50px; font-family: 'Montserrat', sans-serif;" ID="lbldescription"></asp:Label>

                    <asp:Button ID="btnpostproject" runat="server" Text="Post a Project" OnClick="btnpostproject_Click"
                        class="button" Style="font-weight: bold; padding-top: 10px; padding-bottom: 35px; font-size: 1.2em; margin-top: 40px;" />
                </div>
            </div>
            <%--<asp:Button ID="btnconsultant" runat="server" Text="Free Consultation" OnClick="btnconsultant_Click"
                            class="button" Style="font-weight: bold; padding-top: 10px; padding-bottom: 35px; font-size: 1.2em; margin-top: 30px;" />--%>
        </div>

         <!-- ======= Facts Section ======= -->
            <section id="facts" class="wow fadeIn">
                <div class="container">

                    <header class="section-header">
                        <h3>Facts</h3>
                        <p>Number of Agencies we are partnering with to help businesses grow digitally</p>
                    </header>

                    <div class="row counters">

                        <div class="col-lg-3 col-6 text-center">
                            <span data-toggle="counter-up">185</span>
                            <p>Website Development</p>
                        </div>

                        <div class="col-lg-3 col-6 text-center">
                            <span data-toggle="counter-up">139</span>
                            <p>Digital Marketing</p>
                        </div>

                        <div class="col-lg-3 col-6 text-center">
                            <span data-toggle="counter-up">116</span>
                            <p>Software Development</p>
                        </div>

                        <div class="col-lg-3 col-6 text-center">
                            <span data-toggle="counter-up">118</span>
                            <p>Cloud Computing</p>
                        </div>

                    </div>

                    <%-- <div class="facts-img">
                    <img src="assets/img/facts-img.png" alt="" class="img-fluid">
                </div>--%>
                </div>
            </section>
            <!-- End Facts Section -->
        <div style="height: 70px;">

        </div>

         <!-- ======= About Us Section ======= -->
            <section id="about">
                <div class="container">
                    <header class="section-header">
                        <h3>HOW IT WORKS</h3>
                        <p>Our platform is powered by strong partner onboarding processes, project matching algorithms and built-in security features.</p>
                    </header>

                    <div class="row about-cols">
                        <div class="col-md-4 wow fadeInUp">
                            <div class="about-col">
                                <div class="img">
                                    <img src="assets/img/about-mission.jpg" alt="mission" class="img-fluid">
                                    <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
                                </div>
                                <h2 class="title"><a href="#">Post Requirement</a></h2>
                                <p>
                                    Post your Project through the link above. Let our algorithms do all the work & get you the best agency proposals.
                                </p>
                            </div>
                        </div>

                        <div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="about-col">
                                <div class="img">
                                    <img src="assets/img/about-plan.jpg" alt="agency" class="img-fluid">
                                    <div class="icon"><i class="ion-ios-list-outline"></i></div>
                                </div>
                                <h2 class="title"><a href="#">Select Agency</a></h2>
                                <p>
                                    Discuss & finalise the agency you want to work with. Record your expectations clearly with the agency & with your relationship manager.
                                </p>
                            </div>
                        </div>

                        <div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s">
                            <div class="about-col">
                                <div class="img">
                                    <img src="assets/img/about-vision.jpg" alt="delivery" class="img-fluid">
                                    <div class="icon"><i class="ion-ios-eye-outline"></i></div>
                                </div>
                                <h2 class="title"><a href="#">Get Work done</a></h2>
                                <p>
                                    Use our secure payment system which ensures 100% security for your payments. Release payment only when you approve the work.
                                </p>
                            </div>
                        </div>

                    </div>

                </div>
            </section>
            <!-- End About Us Section -->

        <div style="background-color: #f5f5f5; position: relative; bottom: 0 !important; width: 100%; color: black; margin-top: 30px;">
            <div class="container text-center">
                <br />
                <h6>Benchkart Services Pvt Ltd</h6>
                <a href="../Policies/Terms-of-use-for-Clients.html" target="_blank" style="font-size: small;">TERMS OF USE FOR CLIENTS</a><br />
                <a href="../Policies/Benchkart-Privacy-Policy.html" target="_blank" style="font-size: small;">PRIVACY POLICY</a>
                <br />
            </div>
        </div>
    </form>
</body>
</html>

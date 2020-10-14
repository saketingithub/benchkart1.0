<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Benchkart.Default" %>

<%@ Register Src="~/ucHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<%@ Register Src="~/ucFooter.ascx" TagPrefix="uc2" TagName="ucFooter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- Required meta tags -->
    <meta charset='utf-8'>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <meta name="description" content="IT Shared Services" />
    <title>IT Talent Sharing - BenchKart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/Custom.js"></script>
    <style>
        h2, h3, h4, h5
        {
            color: #5a5a5a;
        }
        br
        {
            content: "";
            margin: 2em;
            display: block;
            font-size: 24%;
        }
        .btn
        {
            height: 30px;
            border-radius: 3px;
            background-color: #e6e9e7;
        }
        /* Style the active class, and buttons on mouse-over */
        .active, .btn:hover
        {
            background-color: #808080;
            color: white;
            cursor: pointer;
        }
        .background
        {
            background: url(../Images/home_bk.jpg);
            position: relative;
            text-align: center;
            font-size: 50px;
            color: White;
            background-repeat: round;
            height: 600px;
        }
        
        .layer
        {
            background-color: rgba(29, 67, 84, 0.7);
            position: absolute;
            width: 100%;
            height: 100%;
        }
        .service
        {
            background-color: #4CAF50;
            font-size: large;
            color: White;
            padding: 5px 15px 5px 15px;
        }
    </style>
</head>
<body style="background-color: #fdfdfd;">
    <form id="form1" runat="server">
    <div>
        <uc1:ucHeader runat="server" ID="ucHeader" />
    </div>
    <div class="background">
        <%-- <div class="row" style="margin-top: 100px; margin-bottom: 110px;">
            <div class="col-lg-12">--%>
        <div class="layer">
            <h1 style="margin-bottom: 10px; margin-top: 100px; font-size: 1.2em;">
                Get best agencies bid for your work
            </h1>
            <h2 style="color: White; font-size: x-large;">
                B2B solutions for outsourcing services</h2>
            <div style="margin-top: 50px;">
                <a href="Customer/Signup.aspx?value=project" class="service" style="text-decoration: none;">
                    Post a Project</a> <a href="Customer/Signup.aspx?value=talent" class="service" style="text-decoration: none;
                        margin-left: 80px;">Hire Flexi Talent</a>
            </div>
            <div style="margin-top: 50px;">
                <a href="Customer/Signup.aspx?value=define" class="service" style="text-decoration: none;
                    background-color: Orange;">Need help in defining digital need?</a>
            </div>
        </div>
    </div>
    <div class="container" style="margin-top: 20px; width: 100%;">
        <h2 style="text-align: center; margin-top: 30px;">
            How it works</h2>
        <div class="row">
            <div class="col-lg-3">
                <div class="divHowitwork">
                    <i class="fa fa-fw fa-send fa-4x" style="color: White; margin-top: 20px;"></i>
                </div>
                <h4 style="text-align: center;">
                    Post a service (free)</h4>
                <h5 style="text-align: center;">
                    Post your requiement of service or talent. Benchkart will share it with multiple
                    agencies and get free bids from them for you.</h5>
            </div>
            <div class="col-lg-3">
                <div class="divHowitwork">
                    <i class="fa fa-fw fa-envelope fa-4x" style="color: White; margin-top: 20px;"></i>
                </div>
                <h4 style="text-align: center;">
                    Bids come from agencies</h4>
                <h5 style="text-align: center;">
                    Get bids with in 48 hours. Compare them</h5>
            </div>
            <div class="col-lg-3">
                <div class="divHowitwork">
                    <i class="fa fa-fw fa-envelope-open-o fa-4x" style="color: White; margin-top: 20px;">
                    </i>
                </div>
                <h4 style="text-align: center;">
                    Select bid</h4>
                <h5 style="text-align: center;">
                    Select the best and start interviewing them for your needs.</h5>
            </div>
            <div class="col-lg-3">
                <div class="divHowitwork">
                    <i class="fa fa-fw fa-handshake-o fa-4x" style="color: White; margin-top: 20px;">
                    </i>
                </div>
                <h4 style="text-align: center;">
                    Contract</h4>
                <h5 style="text-align: center;">
                    After finalizing start the work with easy and flexible payment system.</h5>
            </div>
        </div>
    </div>
    <div class="container" style="margin-top: 20px; width: 100%;">
        <h2 style="text-align: center;">
            Popular Services</h2>
        <div class="row" style="margin-top: 30px; text-align: center;">
            <div class="col-lg-3">
                <img src="Images/imgWebsite.jpg" alt="Avatar" width="260px" height="280px" style="border-radius: 10px;" />
                <h4 style="text-align: center;">
                    Websites</h4>
            </div>
            <div class="col-lg-3">
                <img src="Images/imgMobileApp.jpg" alt="Avatar" width="260px" height="280px" style="border-radius: 10px;" />
                <h4 style="text-align: center;">
                    Mobile Apps</h4>
            </div>
            <div class="col-lg-3">
                <img src="Images/imgTalent.jpg" alt="Avatar" width="260px" height="280px" style="border-radius: 10px;" />
                <h4 style="text-align: center;">
                    Flexi Talent Hire</h4>
            </div>
            <div class="col-lg-3">
                <img src="Images/imgDigital.jpg" alt="Avatar" width="260px" height="280px" style="border-radius: 10px;" />
                <h4 style="text-align: center;">
                    Digital Marketing</h4>
            </div>
        </div>
    </div>
    <div style="margin: 0 auto; margin-top: 50px; width: 60%;">
        <h2 style="text-align: center;">
            Why us?</h2>
        <h4>
            <i class="fa fa-fw fa-check-circle fa-2x" style="color: #4CAF50; margin-top: 20px;
                vertical-align: sub;"></i><span style="font-weight: bold; vertical-align: middle;">Work
                    done by reliable agencies</span></h4>
        <h4 style="margin-left: 50px;">
            A new shared dashboard allows you to track your team's activity, so that everyone
            is always in sync. A new shared dashboard allows you to track your team's activity,
            so that everyone is always in sync. A new shared dashboard allows you to track your
            team's activity, so that everyone is always in sync.
        </h4>
        <h4>
            <i class="fa fa-fw fa-check-circle fa-2x" style="color: #4CAF50; margin-top: 20px;
                vertical-align: sub;"></i><span style="font-weight: bold; vertical-align: middle;">Work
                    done by reliable agencies</span></h4>
        <h4 style="margin-left: 50px;">
            A new shared dashboard allows you to track your team's activity, so that everyone
            is always in sync. A new shared dashboard allows you to track your team's activity,
            so that everyone is always in sync. A new shared dashboard allows you to track your
            team's activity, so that everyone is always in sync.
        </h4>
        <h4>
            <i class="fa fa-fw fa-check-circle fa-2x" style="color: #4CAF50; margin-top: 20px;
                vertical-align: sub;"></i><span style="font-weight: bold; vertical-align: middle;">Work
                    done by reliable agencies</span></h4>
        <h4 style="margin-left: 50px;">
            A new shared dashboard allows you to track your team's activity, so that everyone
            is always in sync. A new shared dashboard allows you to track your team's activity,
            so that everyone is always in sync. A new shared dashboard allows you to track your
            team's activity, so that everyone is always in sync.
        </h4>
        <h4>
            <i class="fa fa-fw fa-check-circle fa-2x" style="color: #4CAF50; margin-top: 20px;
                vertical-align: sub;"></i><span style="font-weight: bold; vertical-align: middle;">Work
                    done by reliable agencies</span></h4>
        <h4 style="margin-left: 50px;">
            A new shared dashboard allows you to track your team's activity, so that everyone
            is always in sync. A new shared dashboard allows you to track your team's activity,
            so that everyone is always in sync. A new shared dashboard allows you to track your
            team's activity, so that everyone is always in sync.
        </h4>
    </div>
    <%--<div id="Advisors" class="container-fluid" style="margin-top: 50px;">
        <h2>
            Advisory board</h2>
      
    </div>
    <div id="Testimonials" class="container-fluid" style="margin-bottom: 40px; margin-top: 30px;">
        <h1>
            Testimonials</h1>
        TBD
    </div>--%>
    <div>
        <uc2:ucFooter runat="server" ID="ucFooter" />
    </div>
    </form>
</body>
</html>

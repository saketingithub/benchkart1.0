<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Benchkart.About" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta content="About Us" name="description">
    <meta content="benchkart, marketplace for outsourcing, Graphics & Design,Website & Apps,Digital Marketing,Software,Cloud & Infra,Call Center,KPO,Back-Office," name="keywords">
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
    <title>Benchkart - About Us</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <style>
        .bg-overlay {
            background-size: cover;
            background-position: center center;
            color: #fff;
            padding-top: 50px;
            width: 100%;
            height: 430px;
        }

        .aboutus {
            background: linear-gradient(rgba(0,0,0,.5), rgba(0,0,0,.5)), url("Images/AboutUs/About-Us.jpg");
            height: 680px;
        }

        .mission {
            background: linear-gradient(rgba(0,0,0,.2), rgba(0,0,0,.2)), url("Images/AboutUs/Mission.jpg");
            height: 200px;
        }

        .goal {
            background: linear-gradient(rgba(0,0,0,.2), rgba(0,0,0,.2)), url("Images/AboutUs/Goal.jpg");
            height: 200px;
        }

        .values {
            background: linear-gradient(rgba(0,0,0,.2), rgba(0,0,0,.2)), url("Images/AboutUs/Values.jpg");
            height: 200px;
        }

        .excellence {
            background: linear-gradient(rgba(0,0,0,.2), rgba(0,0,0,.2)), url("Images/AboutUs/Excellence.jpg");
        }

        .focus {
            background: linear-gradient(rgba(0,0,0,.2), rgba(0,0,0,.2)), url("Images/AboutUs/Focus.jpg");
        }

        .collaboration {
            background: linear-gradient(rgba(0,0,0,.2), rgba(0,0,0,.2)), url("Images/AboutUs/Collaboration.jpg");
        }

        .integrity {
            background: linear-gradient(rgba(0,0,0,.2), rgba(0,0,0,.2)), url("Images/AboutUs/Integrity.jpg");
        }

        .founders {
            background: linear-gradient(rgba(0,0,0,.2), rgba(0,0,0,.2)), url("Images/AboutUs/Founders.jpg");
        }
        /* Centered text */
        .text-center {
            margin-top: 10%;
        }

        h1 {
            font-size: 5em;
            font-weight: bold;
        }

        .container {
            position: relative;
            text-align: center;
            color: white;
        }

        /* Top left text */
        .top-left {
            position: absolute;
            top: 8px;
            left: 20px;
        }


        h2 span {
            color: white;
            font: bold 24px/45px Helvetica, Sans-Serif;
            letter-spacing: -1px;
            background: rgb(0, 0, 0); /* fallback color */
            background: rgba(36,165,78, 0.7);
            padding: 20px;
            margin-left: 15px;
        }

        .text {
            background-color: black;
            width: 100%;
        }

        .para {
            font-family: pt-serif,sans-serif;
            font-size: 20px;
            font-style: normal;
            font-weight: 400;
            text-transform: none;
            line-height: 1.8;
            letter-spacing: normal;
            color: rgba(255,255,255,1);
            width: 60%;
            margin: 0 auto;
            text-align: left;
            margin-top: 10%;
            margin-bottom: 10%;
        }
       
    </style>

</head>
<body style="background-color: black;">
    <div class="container bg-overlay aboutus">
        <div class="row text-center">
            <h1>About Us</h1>
            <br />
            <h4>and what we are up to!</h4>
            <%--<br><br>
        <button type="button" class="btn btn-primary btn-lg">Get Started</button>--%>
        </div>
    </div>
    <div class="container bg-overlay mission" style="margin-top: 100px;">
        <div class="row text-left">

            <h2><span>Our mission : To shape the future of B2B outsourcing</span></h2>
            <%--<br><br>
        <button type="button" class="btn btn-primary btn-lg">Get Started</button>--%>
        </div>
    </div>
    <div class="container text">
        <p class="para">We are a new age digital marketplace for businesses across the globe.<br />
        Benchkart provides a digital platform where users can compare and procure digital services from reputed agencies. A secure platform mitigates issues related to trust and provides complete peace of mind to the users. Insights &amp; feedback help us improve all the time.</p>
    </div>
    <div class="container bg-overlay goal">
        <div class="row text-left">
            <h2><span>Our Goal : Simplify search, discovery & engagement</span></h2>

        </div>
    </div>
    <div class="container text">
        <p class="para">
            Finding & getting the work done with the right B2B partner should not be so difficult!<br />
            <br />
            The biggest problem is faced by start-ups & SMEs, as they often lack access to high quality internal IT & digital teams. They depend the most on outsourcing for their key projects. Connecting them to high quality mid-size partners, would accelerate their digital transformation like never before!
        </p>
    </div>
    <div class="container bg-overlay values">
        <div class="row text-left">
            <h2><span>Our Values define our journey</span></h2>

        </div>
    </div>
    <div class="container text">
        <p class="para">
            The journey is as important as the destination!<br />
            <br />
            As we work towards our mission, we are conscious that digital transformation is the heart of a modern enterprise. Being a platform of choice for companies to outsource their IT Services & Digital Marketing projects requires us to be focused on our core values!
        </p>
        Our core values are Excellence, Focus, Collaboration & Integrity
        </p>
    </div>
    <div class="container bg-overlay excellence">
        <div class="row text-left">
            <h2 style="margin-top: 10%;"><span>Excellence - Always moving, always improving</span></h2>

        </div>
    </div>
    <div class="container bg-overlay focus">
        <div class="row text-left">
            <h2 style="margin-top: 10%;"><span>Focus - Ensuring our clients get the results they want</span></h2>

        </div>
    </div>
    <div class="container bg-overlay collaboration">
        <div class="row text-left">
            <h2 style="margin-top: 10%;"><span>Collaboration - With clients, partners, teams & our ecosystem</span></h2>

        </div>
    </div>
    <div class="container bg-overlay integrity">
        <div class="row text-left">
            <h2 style="margin-top: 10%;"><span>Integrity & Compliance - As a foundation for every thing we do</span></h2>

        </div>
    </div>
    <div class="container bg-overlay founders" style="margin-top: 300px;">
        <div class="row text-left">
            <h2 style="margin-top: 10%;"><span>Our Founder</span></h2>

        </div>
    </div>
    <div class="container text">
        <p class="para">
            Kislay Kumar, our CEO, has spent 21 years post his MBA from IIM Calcutta being part of organizations like Unilever, Asian Paints, Nokia & Microsoft. As part of the leadership team of 3 MNCs and as advisor to many start-ups, he has gained valuable lessons on what it takes to drive business success with a transparent, compliant & customer centric organization.<br />
            <br />
                        
            He is just a mail away at kislay.kumar@benchkart.com<br />
        </p>
    </div>
    <footer style="background-color: #252121;">
        <div class="container">
            <div class="row" style="margin-top: 40px; margin-bottom: 20px;">
                <div class="col-lg-6">
                    <ul style="list-style: none;">
                        <li style="text-align: left;"><a href="About" target="_blank" style="color: white;">About Us</a></li>
                        <li style="text-align: left; margin-top: 7px;"><a href="Html/Faq.html" target="_blank" style="color: white;">FAQs</a></li>
                        <li style="text-align: left; margin-top: 7px;"><a href="Partner/Signup" style="color: white;">Become a Partner</a></li>
                    </ul>
                </div>
                <div class="col-lg-6" style="text-align: right;">
                    <ul style="list-style: none;">
                        <li><i class="icon-mail"></i><a href="mailto:outsource@benchkart.com" style="color: white;">outsource@benchkart.com</a></li>
                        <li style="margin-right: 0px; margin-top: 10px;"><a href="https://twitter.com/benchkart?ref_src=twsrc%5Etfw" class="twitter-follow-button" data-show-count="false">Follow @benchkart</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script></li>
                    </ul>
                </div>
                <div class="col-sm-12">
                    <p style="color: grey;">© 2020 Copyright: www.benchkart.com</p>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>

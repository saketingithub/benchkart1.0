<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="Test.aspx.cs" Inherits="Benchkart.Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
        window.setInterval(function () {
            myFunction()
        }, 7000);
        function myFunction() {

            var i = Math.floor(Math.random() * 28) + 1;
            var snackbar = "snackbar" + i;
            // Get the snackbar DIV
            var x = document.getElementById(snackbar);

            // Add the "show" class to DIV
            x.className = "show";

            // After 3 seconds, remove the show class from DIV
            setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);           

        }
    </script>
    <style>
        body {
            display: flex; /* Center according to the main axis */
            justify-content: center; /* Center according to the secondary axis */
            align-items: center;
        }


        /* The snackbar - position it at the bottom and in the middle of the screen */
        #snackbar1,#snackbar2, #snackbar3, #snackbar4, #snackbar5,#snackbar6,#snackbar7, #snackbar8, #snackbar9, #snackbar10,
        #snackbar11,#snackbar12, #snackbar13, #snackbar14, #snackbar15, #snackbar16,#snackbar17, #snackbar18, #snackbar19, #snackbar20,
        #snackbar21,#snackbar22, #snackbar23, #snackbar24, #snackbar25, #snackbar26,#snackbar27, #snackbar28, #snackbar29, #snackbar30{
            visibility: hidden; /* Hidden by default. Visible on click */
            min-width: 250px; /* Set a default minimum width */
            margin-left: -125px; /* Divide value of min-width by 2 */
            background-color: #f5f5f5; /* Black background color */
            color: 	black; /* White text color */
            text-align: center; /* Centered text */
            border-radius: 2px; /* Rounded borders */
            padding: 16px; /* Padding */
            position: fixed; /* Sit on top of the screen */
            z-index: 1; /* Add a z-index if needed */
            left: 10%; /* Center the snackbar */
            bottom: 30px; /* 30px from the bottom */
        }

        /* Show the snackbar when clicking on a button (class added with JavaScript) */
        .show {
            visibility: visible !important; /* Show the snackbar */
            /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
However, delay the fade out process for 2.5 seconds */
            -webkit-animation: fadein 0.8s, fadeout 0.8s 2.5s;
            animation: fadein 0.8s, fadeout 0.8s 2.5s;
        }

        /* Animations to fade the snackbar in and out */
        @-webkit-keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }

        @keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Clicked" />
        <!-- The actual snackbar -->
        <div id="snackbar1">A project on is posted by VELOCITY BRAND SERVER PVT. LTD. 18 hours ago</div>
        <div id="snackbar2">A project is posted by INCREDIBLE MANAGEMENT SERVICES PVT. LTD. 6 hours ago</div>
        <div id="snackbar3">A project is posted by TAXSMOOTH 20 hours ago</div>
        <div id="snackbar4">A project is posted by REFRENS.COM 12 hours ago</div>
        <div id="snackbar5">A project is posted by LEAD SYNC 10 hours ago</div>
        <div id="snackbar6">A project is posted by CLAT ESSENTIALS 9 hours ago</div>
        <div id="snackbar7">A project is posted by ACADEMY OF RETAIL EXCELLENCE 8 hours ago</div>
        <div id="snackbar8">A project is posted by DOLLAR INDUSTRIES 7 hours ago</div>
        <div id="snackbar9">A project is posted by MASCOT METAL MANUFACTURES 15 hours ago</div>
        <div id="snackbar10">A project is posted by ABLECOLD LOGISTICS 16 hours ago</div>
        <div id="snackbar11">A project is posted by SHYPLITE 17 hours ago</div>
        <div id="snackbar12">A project is posted by SERVICE CLAP 18 hours ago</div>
        <div id="snackbar13">A project is posted by EVERNVENTURES 19 hours ago</div>
        <div id="snackbar14">A project is posted by DREAM TO ACHIEVE FOUNDATION 13 hours back..</div>
        <div id="snackbar15">A project is posted by EVERNVENTURES 21 hours ago</div>
        <div id="snackbar16">A project is posted by URBAN GEENS 10 hours ago</div>
        <div id="snackbar17">A project is posted by MECHANIC BEE 9 hours ago</div>
        <div id="snackbar18">A project is posted by SHODROBE 12 hours ago</div>
        <div id="snackbar19">A project is posted by POSSIBLEWORKS 11 hours ago</div>
        <div id="snackbar20">A project is posted by MEDI 17 hours ago</div>
        <div id="snackbar21">A project is posted by AANCHAL 10 hours ago</div>
        <div id="snackbar22">A project is posted by MORPHOGENESIS 18 hours ago</div>
        <div id="snackbar23">A project is posted by YESTOLEARN  17 hours ago</div>
        <div id="snackbar24">A project is posted by GOALISB 5 hours ago</div>
        <div id="snackbar25">A project is posted by SUPREME INFOTRADE PVT LTD 4 hours ago</div>
        <div id="snackbar26">A project is posted by THE MENTROSCLUN 6 hours ago</div>
        <div id="snackbar27">A project is posted by GREEVIO TECHNO SOLUTIONS 7 hours ago</div>
        <div id="snackbar28">A project is posted by SOPAN 8 hours ago</div>      

        
    </form>
</body>
</html>

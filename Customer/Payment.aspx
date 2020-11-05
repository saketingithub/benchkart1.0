<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Benchkart.Customer.Payment" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport' />

    <meta name="description" content="IT Shared Services" />
    <title>benchkart - marketplace for outsourcing</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/Custom.js"></script>

    <link href="../css/partner.css" rel="stylesheet" />

    <%--<link href="../css/style.css" rel="stylesheet" />--%>
    <%-- <link href="../css/style2.css" rel="stylesheet" />--%>
    <link href="../Styles/style4.css" rel="stylesheet" />
    <style>
        #lblMessages, #lblNotifications {
            font-size: 14px;
            font-weight: normal;
            background: #F79507;
            color: #fff;
            padding: 0 5px;
            vertical-align: top;
            margin-left: -12px;
        }

        .badge {
            padding-left: 9px;
            padding-right: 9px;
            -webkit-border-radius: 9px;
            -moz-border-radius: 9px;
            border-radius: 9px;
        }

        .social {
            margin-left: 15px;
            margin-right: 10px;
            margin-bottom: 15px;
        }
        /*.label-warning[href],
        .badge-warning[href] {
            background-color: #c67605;
        }*/
        .logo {
            height: 30px;
        }
    </style>

    <style>
        /* Style the active class, and buttons on mouse-over */
        .select {
            background-color: White;
            color: #F79507;
        }
    </style>

    <%-- Commenting this as project dashboard pills click not working--%>
    <%--<script>
        $(document).ready(function () {
            $("li").click(function () {
                $("li").removeClass("active");
               
                $(this).addClass("active");
            });
            $("li a").click(function () {
                $("li a").removeClass("active");
                
                $(this).addClass("active");
            });
        });
    </script>--%>

    <style>
        .navbar a {
            float: none;
            padding: 0px;
        }
    </style>
    <style>
        .dropbtn {
            color: gray;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin-left: 10px;
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
                padding: 5px 10px;
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
    <script>
        /* When the user clicks on the button, 
          toggle between hiding and showing the dropdown content */
          function myFunction() {
              document.getElementById("myDropdown").classList.toggle("show");
          }

          // Close the dropdown if the user clicks outside of it
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
    <script src="../Scripts/jquery.multifile.js"></script>

    <style>
        h1, h2, h3, h4, h5, h6 {
            text-transform: none;
            margin-top: 0;
        }

        /*.label {
            font-size: medium;
            font-weight: normal;
            margin-top: 0px;
            line-height: 1.5;
            color: gray;
            margin-left: 0px;
            word-break: break-all;
            display: inline-flex;
            white-space: pre-wrap;
            text-align: left;
        }*/
        .label {
            font-size: medium;
            font-weight: normal;
            margin-top: 0px;
            line-height: 2;
            color: black;
            margin-left: 0px;
            text-align: left;
            padding: 0px;
        }


        h4 {
            font-size: medium;
            font-weight: normal;
            margin-top: 0px;
            line-height: 1;
        }

        h5 {
            font-weight: bold;
            color: gray;
            line-height: 1;
            margin-top: 15px;
        }

        body .razorpay-payment-button {
            display: none;
        }

        .divPay .razorpay-payment-button {
            display: block;
            height: 40px;
            padding: 0px 20px;
            width: 200px;
            float: left;
            margin-top: 30px;
        }
    </style>
    <%--<script>
        $(function () {
            $("#txtPotentialPayDate").datepicker();
        });
    </script>--%>
</head>
<body>
    <form id="form1" runat="server" action="Payment.aspx?action=paymentcapture" method="post">
        <script id="payButton" style="display: none; margin-bottom: 200px !important;"
            src="https://checkout.razorpay.com/v1/checkout.js"
            data-key="<%=razor_payment_key %>"
            data-amount="1"
            data-name="Razorpay"
            data-description="Purchase Description"
            data-order_id="<%=orderId%>"
            data-image="https://razorpay.com/favicon.png"
            data-prefill.name=""
            data-prefill.email=""
            data-prefill.contact=""
            data-theme.color="#F37254"></script>

        <div class="wrapper">
            <nav id="sidebar">
                <div class="sidebar-header">
                    <div style="height: 30px; border-bottom: 1px solid #4b545c;">
                        <div id="logo" style="float: left;">
                            <div class="header" style="font-size: 20px; padding: 0px;"><a href="https://www.benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 28px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></div>
                        </div>
                    </div>
                    <br />
                    <%-- <asp:Image runat="server" ID="imgPartner" Height="60px" Width="60px" Style="border-radius: 50%; background-color: #f8f8f8; margin-top: 20px;" />--%>
                    <h3 style="color: white;">
                        <asp:Label ID="Label1" runat="server" ForeColor="#C2C7D0" Style="font-size: 18px;"></asp:Label>
                    </h3>

                </div>
                <ul class="list-unstyled components" id="navlist">
                    <li>
                        <a href='Projects_Dashboard'><i class="fa fa-bullseye"></i><span>Dashboard</span></a>
                    </li>
                    <li>
                        <a href='Signin_Post_Project'><i class="fa fa-paper-plane"></i>&nbsp;<span>Post Project</span></a>
                    </li>
                    <%--<li>
                        <a href='Signin_Post_Talent'><i class="fa fa-user"></i>&nbsp;<span>Hire Developer</span></a>
                    </li>--%>

                    <li>
                        <a href="#msgSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                            <i class="fa fa-envelope"></i><span>Messages</span>
                        </a>
                        <ul class="collapse list-unstyled" id="msgSubmenu">
                            <li>
                                <a href='Messages?action=inbox'><i class="fa fa-inbox"></i><span>Inbox</span></a>
                            </li>
                            <li>
                                <a href='Messages?action=sent'><i class="fa fa-reply"></i><span>Sent</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href='CustomerProfile'><i class="fa fa-tags"></i>&nbsp;<span>Profile </span></a>

                    </li>
                </ul>

                <div class="footer">
                    <%-- <div style="margin-bottom: 20px;">
                        <a href="#" target="_blank" class="social"><i class="fa fa-facebook-official" style="background: white; color: #3b5998; font-size: 1.8em; line-height: .9;"></i></a>
                        <a href="#" target="_blank" class="social"><i class="fa fa-twitter-square" style="background: white; color: #55acee; font-size: 1.8em; line-height: .7;"></i></a>
                        <a href="#" target="_blank" class="social"><i class="fa fa-linkedin-square" style="background: white; color: #0976b4; font-size: 1.8em; line-height: .7;"></i></a>
                    </div>--%>
                    <%--<div style="margin-left: 10px;">
                        <p>
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved 
                        </p>
                    </div>--%>
                </div>
            </nav>

            <!-- Page Content  -->
            <div id="content" style="padding: 0px;">
                <nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-bottom: 0px; padding: 10px 0px 0px 0px;">
                    <div class="container-fluid">

                        <button type="button" id="sidebarCollapse" class="btn btn-info" style="float: left; padding: 3px 12px 5px 15px; font-size: 13px; margin-top: 5px; background-color: #212529;">
                            <i class="fa fa-align-left"></i>
                        </button>

                        <%-- <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
                        <div id="navbarSupportedContent">

                            <div style="float: right; display: inline-flex; margin-top: 6px;">
                                <a href='Messages?action=inbox' title="New Messages"><i class="fa fa-envelope-o" style="font-size: 15px; color: gray;"></i>
                                    <asp:Label ID="lblMessages" runat="server" class='badge badge-warning'></asp:Label></a>
                                <a href='Notifications' title="Notifications"><i class="fa fa-bell-o" style="margin-left: 10px; font-size: 15px; color: gray;"></i>
                                    <asp:Label ID="lblNotifications" runat="server" class='badge badge-warning'></asp:Label></a>
                                <a href='Support' title="Support"><i class="fa fa-question-circle-o" style="margin-left: 10px; font-size: 15px; color: gray;"></i></a>

                                <asp:LinkButton runat="server" Font-Size="Small" ID="lnkSignout" ForeColor="Gray" Text="Sign out" Font-Underline="false"
                                    Style="margin-left: 10px; text-decoration: underline; vertical-align: top;" OnClick="lnkSignOut_Click"></asp:LinkButton>
                                <%-- <div class="dropdown" style="margin-left: 12px; font-size: 18px;">

                                    <i onclick="myFunction()" class="fa fa-user-circle-o dropbtn"></i>
                                    <div id="myDropdown" class="dropdown-content">
                                      
                                        <asp:HyperLink runat="server"  ID="HyperLink1"  class="nav-menu ul li a"  Text="Reset password" style="text-decoration: underline; color: gray; font-size: small; font-weight: normal;"
                                           NavigateUrl="ResetPassword"></asp:HyperLink>
                                        <asp:LinkButton runat="server" Font-Size="Small" Font-Bold="false" ID="LinkButton1" ForeColor="Gray" Text="Sign out" Font-Underline="false"
                                    Style="margin-left: 15px; text-decoration: underline;" OnClick="lnkSignOut_Click"></asp:LinkButton>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </nav>
                <div id="content" style="padding: 0px;">
                    <!-- Card -->
                    <div class="card" style="margin: 0 auto; background-color: White;">
                        <div class="container" style="background-color: White; border-radius: 5px; width: 90%; margin: 0 auto; margin-top: 30px; padding: 20px 0px;">
                            <asp:HiddenField runat="server" ID="hfPaymentRequestId" />
                            <h3>Payment Details</h3>
                            <div class="bidfield" style="margin-left: 20px;">
                                <h5>Amount (INR)</h5>

                                <asp:Label runat="server" ID="lblPaymentAmount" Style="width: 200px; float: left;"></asp:Label><br />

                            </div>
                            <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                                <h5>Date</h5>
                                <asp:Label runat="server" ID="lblDate" Style="float: left"></asp:Label>
                                <br />
                            </div>
                            <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                                <h5>Agency Name</h5>
                                <asp:Label runat="server" ID="lblCompanyName" Style="float: left"></asp:Label>
                                <br />
                            </div>
                            <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                                <h5>Delivery Remarks</h5>
                                <asp:Label runat="server" ID="lblRemarks" Style="float: left" CssClass="label"></asp:Label>
                                <br />
                            </div>
                            <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                                <h5>Comments (Optional)</h5>
                                <asp:TextBox runat="server" ID="txtCustomerRemarks" TextMode="MultiLine" class="form-control" Style="float: left;"></asp:TextBox>
                                <br />
                            </div>
                            <div class="divPay" style="margin-bottom: 200px !important;">

                                <script style="display: none;"
                                    src="https://checkout.razorpay.com/v1/checkout.js"
                                    data-key="<%=razor_payment_key %>"
                                    data-amount="1"
                                    data-name="Razorpay"
                                    data-description="Purchase Description"
                                    data-order_id="<%=orderId%>"
                                    data-image="https://razorpay.com/favicon.png"
                                    data-prefill.name="Anurag Rawat"
                                    data-prefill.email="anurag.rawat@benchkart.com"
                                    data-prefill.contact="9911780051"
                                    data-theme.color="#F37254"></script>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- jQuery CDN - Slim version (=without AJAX) -->
        <%--  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>--%>
        <!-- Popper.JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" crossorigin="anonymous"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <!-- jQuery Custom Scroller CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>


        <script type="text/javascript">
              $(document).ready(function () {
                  $("#sidebar").mCustomScrollbar({
                      theme: "minimal"
                  });

                  $('#sidebarCollapse').on('click', function () {
                      $('#sidebar, #content').toggleClass('active');
                      $('.collapse.in').toggleClass('in');
                      $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                  });
              });
        </script>
    </form>
</body>
</html>



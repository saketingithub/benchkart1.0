<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin_Post_Talent.aspx.cs" Inherits="Benchkart.Customer.Signin_Post_Talent" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="IT Shared Services" />
    <title>benchkart - marketplace for outsourcing</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/Custom.js"></script>

    <link href="../css/dashboard.css" rel="stylesheet" />

    <%--<link href="../css/style.css" rel="stylesheet" />--%>
    <%-- <link href="../css/style4.css" rel="stylesheet" />--%>
    <link href="../css/partner.css" rel="stylesheet" />

    <script src="../Scripts/jquery.multifile.js"></script>
    <script src="../Scripts/Skills.js"></script>
    <link href="../Styles/style4.css" rel="stylesheet" />
     <style>
        #ddlBasic, #ddlIntermediate, #ddlExpert, #ddlBasicPartTime,
        #ddlIntermediatePartTime, #ddlExpertPartTime, #ddlBasicHoursperWeek,
        #ddlIntermediateHoursperWeek, #ddlExpertHoursperWeek {
            width: 60%;
        }

        @media (max-width: 767px) {
            #ddlBasic, #ddlIntermediate, #ddlExpert, #ddlBasicPartTime,
            #ddlIntermediatePartTime, #ddlExpertPartTime, #ddlBasicHoursperWeek,
            #ddlIntermediateHoursperWeek, #ddlExpertHoursperWeek {
                width: 100%;
                padding: 0px;
            }

            .container {
                 width: 90% !important;
                padding: 0px !important; 
            }
        }

         .container {
                 width: 80%;
                padding: 30px; 
            }
    </style>
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
    <style>
        @media (max-width: 767px) {
            .divField {
                width: 95%;
            }
        }
    </style>


    <script>
        $(document).ready(function () {
            $("li").click(function () {
                $("li").removeClass("active");
                // $(".tab").addClass("active"); // instead of this do the below 
                $(this).addClass("active");
            });
            $("li a").click(function () {
                $("li a").removeClass("active");
                // $(".tab").addClass("active"); // instead of this do the below 
                $(this).addClass("active");
            });
        });
    </script>


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
    <style>
        a.disabled {
            pointer-events: none;
            cursor: default;
        }

        .fieldtitle {
            margin-top: 18px;
            text-align: left;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: small;
            color: gray;
        }
    </style>
    <script>
        function selectLocation() {
            if (document.getElementById("ddlWorkMode").value != "1") {
                $('#ddlStatesFullTime').show();
                $('#ddlCitiesFullTime').show();
            }
            else {
                $('#ddlStatesFullTime').hide();
                $('#ddlCitiesFullTime').hide();
            }
        }

        function selectLocationPartTime(radioButtonList) {
            for (var i = 0; i < radioButtonList.rows.length; ++i) {

                if (radioButtonList.rows[i].cells[0].firstChild.checked) {
                    $('#ddlStatesPartTime').hide();
                    $('#ddlCitiesPartTime').hide();
                }
                else {
                    $('#ddlStatesPartTime').show();
                    $('#ddlCitiesPartTime').show();
                }
            }
        }


        function pnlSelect() {

            if (document.getElementById('rblNoSelect').checked) {
                $("#divFullTime").hide();
                $("#divPartTime").show();
            }
            else {
                $("#divPartTime").hide();
                $("#divFullTime").show();
            }


            $("#pnlSelect").hide();
            $("#pnlSecond").show();

            //return false;
            $('#myTab li:nth-child(2) a').tab('show') // Select third tab
        }


        function displaypnlThird() {
            var roleproject = document.getElementById("txtProjectTitle").value;
            if (roleproject == "") {
                alert("Please fill the project title!");
                document.getElementById("txtProjectTitle").focus;
                return false;
            }

            var projectdescription = document.getElementById("txtProjectDescription").value;
            if (projectdescription == "") {
                alert("Please fill the project description!");
                document.getElementById("txtProjectDescription").focus;
                return false;
            }
            var skill = document.getElementById("txtSkills").value;
            if (skill == "") {
                alert("Please fill the skill!");
                document.getElementById("txtSkills").focus;
                return false;
            }

            $("#pnlSecond").hide();
            $("#pnlThird").show();


            $('#myTab li:nth-child(3) a').tab('show') // Select third tab




        }
        function progressHandler(event) {
            $("#loaded_n_total").html("Uploaded " + event.loaded + " bytes of " + event.total);
            var percent = (event.loaded / event.total) * 100;
            $("#progressBar").val(Math.round(percent));
            $("#status").html(Math.round(percent) + "% uploaded... please wait");
        }

        function completeHandler(event) {
            counter++
            $("#status").html(counter + " " + event.target.responseText);
        }

        function errorHandler(event) {
            $("#status").html("Upload Failed");
        }

        function abortHandler(event) {
            $("#status").html("Upload Aborted");
        }
        function ddlbasic_count() {
            var ddlbas = document.getElementById("ddlBasic");
            var ddlinter = document.getElementById("ddlIntermediate");
            var ddlexper = document.getElementById("ddlExpert");
            var ddlcount = ddlbas.options[ddlbas.selectedIndex].value;
            var ddlintercount = ddlinter.options[ddlinter.selectedIndex].value;
            var ddlexpertcount = ddlexper.options[ddlexper.selectedIndex].value;
            document.getElementById("txtTotalCount").innerText = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));



        }
        function ddlintermediate_count() {
            var ddlbas = document.getElementById("ddlBasic");
            var ddlinter = document.getElementById("ddlIntermediate");
            var ddlexper = document.getElementById("ddlExpert");
            var ddlcount = ddlbas.options[ddlbas.selectedIndex].value;
            var ddlintercount = ddlinter.options[ddlinter.selectedIndex].value;
            var ddlexpertcount = ddlexper.options[ddlexper.selectedIndex].value;
            document.getElementById("txtTotalCount").innerText = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));


        }
        function ddlexpert_count() {
            var ddlbas = document.getElementById("ddlBasic");
            var ddlinter = document.getElementById("ddlIntermediate");
            var ddlexper = document.getElementById("ddlExpert");
            var ddlcount = ddlbas.options[ddlbas.selectedIndex].value;
            var ddlintercount = ddlinter.options[ddlinter.selectedIndex].value;
            var ddlexpertcount = ddlexper.options[ddlexper.selectedIndex].value;
            document.getElementById("txtTotalCount").innerText = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));

        }
        function ddlbasicparttime_count() {
            var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlintermediateprt = document.getElementById("ddlIntermediatePartTime");
            var ddlexpertprt = document.getElementById("ddlExpertPartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            var ddlintermediateprttime = ddlintermediateprt.options[ddlintermediateprt.selectedIndex].value;
            var ddlexpertprttime = ddlexpertprt.options[ddlexpertprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));


        }
        function ddlintermediateparttime_count() {
            var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlintermediateprt = document.getElementById("ddlIntermediatePartTime");
            var ddlexpertprt = document.getElementById("ddlExpertPartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            var ddlintermediateprttime = ddlintermediateprt.options[ddlintermediateprt.selectedIndex].value;
            var ddlexpertprttime = ddlexpertprt.options[ddlexpertprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));

        }
        function ddlexpertpartime_count() {
            var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlintermediateprt = document.getElementById("ddlIntermediatePartTime");
            var ddlexpertprt = document.getElementById("ddlExpertPartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            var ddlintermediateprttime = ddlintermediateprt.options[ddlintermediateprt.selectedIndex].value;
            var ddlexpertprttime = ddlexpertprt.options[ddlexpertprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));

        }
        function displaypnlForth() {





            $("#pnlThird").hide();
            $("#pnlForth").show();

            $('#myTab li:nth-child(4) a').tab('show') // Select third tab

        }

        function displayFive() {
            
            var num = document.getElementById('<%=txtBudgetOpional.ClientID %>').value;
            if (isNaN(num)) {
                alert("Budget must be a number!");
                document.getElementById('<%=txtBudgetOpional.ClientID %>').focus();
                return false;
            }
            $("#pnlForth").hide();
            $("#pnlFive").show();

            $('#myTab li:nth-child(5) a').tab('show') // Select third tab

        }

        function displayAllValidation() {
            var companyindustry = document.getElementById("ddlIndustry").value;
            if (companyindustry == "0") {
                alert("Please select the Company industry!");
                document.getElementById("ddlIndustry").focus;
                return false;
            }
            var companytype = document.getElementById("ddlTypeofCompany").value;
            if (companytype == "0") {
                alert("Please select company type!");
                document.getElementById("ddlTypeofCompany").focus;
                return false;
            }
            var companyname = document.getElementById("txtCompanyName").value;
            if (companyname == "") {
                alert("Please fill the company name!");
                document.getElementById("txtCompanyName").focus;
                return false;
            }
            var contactnumber = document.getElementById("txtContactNumber").value;
            if (contactnumber == "") {
                alert("Please fill the contactnumber");
                document.getElementById("txtContactNumber").focus;
                return false;
            }

            true;

        }

        function displaypnlSelectback() {

            $("#pnlSelect").show();
            $("#pnlSecond").hide();

            $('#myTab li:nth-child(1) a').tab('show') // Select third tab
        }
        function displaypnlSeconndback() {

            $("#pnlSecond").show();
            $("#pnlThird").hide();

            $('#myTab li:nth-child(2) a').tab('show') // Select third tab
        }
        function displaypnlThirdback() {

            $("#pnlThird").show();
            $("#pnlForth").hide();

            $('#myTab li:nth-child(3) a').tab('show') // Select third tab
        }

        function displaypnlForthback() {

            $("#pnlForth").show();
            $("#pnlFive").hide();

            $('#myTab li:nth-child(4) a').tab('show') // Select third tab
        }


    </script>
    <style>
        .fade {
            opacity: 1;
        }
    </style>
    <script type="text/javascript">
          $(document).ready(function () {
              $("#txtBudgetOpional").attr("maxlength", 8);
              $("#txtContactNumber").attr("maxlength", 20);
          });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
        </asp:ScriptManager>

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
                        <asp:Label ID="lblCompanyName" runat="server" ForeColor="#C2C7D0" Style="font-size: 18px;"></asp:Label>
                    </h3>

                </div>
                <ul class="list-unstyled components" id="navlist">
                    <li>
                        <a href='Projects_Dashboard'><i class="fa fa-bullseye"></i><span>Dashboard</span></a>
                    </li>
                    <li>
                        <a href='Signin_Post_Project'><i class="fa fa-paper-plane"></i>&nbsp;<span>Post Project</span></a>
                    </li>
                    <li>
                        <a href='Signin_Post_Talent'><i class="fa fa-user"></i>&nbsp;<span>Hire Developer</span></a>
                    </li>

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
                <div class="card" style="margin: 0 auto; background-color: White; margin-top: 40px;">
                    <div class="container">
                        <div class="row">
                            <asp:Panel ID="divMenu1" runat="server">
                                <div id="divmenu" class="container" style="text-align: center; width: 100%; background-color: White;">
                                    <%-- <ul class="nav nav-tabs" id="myTab">
                                        <li class="active"><a data-toggle="tab" class="disabled" href="#pnlSelect">Select</a></li>
                                        <li><a data-toggle="tab" class="disabled" href="#pnlSecond">Basic details</a></li>
                                        <li><a data-toggle="tab" class="disabled" href="#pnlThird">Talent info</a></li>
                                        <li><a data-toggle="tab" class="disabled" href="#pnlForth">Budget</a></li>
                                        <li><a data-toggle="tab" class="disabled" href="#pnlFive">Company info</a></li>
                                    </ul>--%>
                                    <div class="
                                tab-content">
                                        <asp:Panel ID="pnlSelect" runat="server" CssClass="tab-pane fade in active" DefaultButton="btnselect" Style="text-align: left;">
                                            <h2 style="font-size: large; color: Gray; font-weight: bold">Select Talent Type</h2>
                                            <br />
                                            <div class="divField">
                                                <asp:RadioButton ID="rblNoSelect" runat="server" Checked="true" GroupName="times"
                                                    value="Parttime" />&nbsp;<h3 style="font-size: medium; display: inline; margin-left: 10px; font-weight: bold;">Part Time</h3>
                                                <br />
                                                <h5 style="margin-left: 20px;">Remote working only regardless of length of engagement</h5>
                                                <br />
                                                <br />
                                                <asp:RadioButton ID="rblYesSelect" runat="server" GroupName="times"
                                                    value="Fulltime" />&nbsp;<h3 style="font-size: medium; display: inline; margin-left: 10px; font-weight: bold;">Full Time</h3>
                                                <br />
                                                <h5 style="margin-left: 20px;">On-site or Remote; better availability of remote talent</h5>
                                            </div>
                                            <div class="divField">
                                                <asp:Button ID="btnselect" runat="server" class="form-control" OnClientClick="pnlSelect();return false;"
                                                    Style="margin-top: 20px; margin-bottom: 30px;" Text="Next" />
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlSecond" runat="server" CssClass="tab-pane fade " Style="display: none;"
                                            DefaultButton="btnNext2">
                                            <div>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="fieldtitle">
                                                                    Project Category
                                                                </div>
                                                                <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"
                                                                    Width="100%" Style="margin: 0 auto;">
                                                                    <asp:ListItem Value="2">Website & Apps</asp:ListItem>
                                                                    <asp:ListItem Value="1">Graphics & Design</asp:ListItem>
                                                                    <asp:ListItem Value="3">Digital Marketing</asp:ListItem>
                                                                    <asp:ListItem Value="4">Software</asp:ListItem>
                                                                    <asp:ListItem Value="5">Cloud & Infra</asp:ListItem>
                                                                    <asp:ListItem Value="6">Call Center</asp:ListItem>
                                                                    <asp:ListItem Value="7">KPO</asp:ListItem>
                                                                    <asp:ListItem Value="8">Back-Office</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="fieldtitle">
                                                                    Sub-Category
                                                                </div>
                                                                <asp:DropDownList ID="ddlSubCategory" class="form-control" runat="server" Style="margin: 0 auto;">
                                                                   <asp:ListItem Value="18">Website Development</asp:ListItem>
                                                            <asp:ListItem Value="19">Website Designing - UI/UX</asp:ListItem>
                                                            <asp:ListItem Value="20">Website Maintenance</asp:ListItem>
                                                            <asp:ListItem Value="21">Mobile Applications</asp:ListItem>
                                                            <asp:ListItem Value="22">Any Other</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="fieldtitle">
                                                Project/ Role Title
                                            </div>
                                            <asp:TextBox ID="txtProjectTitle" class="form-control" placeholder="Role Title" runat="server"></asp:TextBox>
                                            <div class="fieldtitle">
                                                Project/ Role Description
                                            </div>
                                            <asp:TextBox ID="txtProjectDescription" runat="server" TextMode="MultiLine" Height="150"
                                                class="form-control"></asp:TextBox>
                                            <div class="fieldtitle">
                                                Skills
                                            </div>
                                            <asp:TextBox runat="server" ID="txtSkills" class="form-control" TextMode="MultiLine" Placeholder="Any specific technical skills required - eg: java, .net"></asp:TextBox>
                                            <div class="fieldtitle">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <asp:Button ID="btnbackpnlselect" runat="server" Text="Back" class="form-control"
                                                            Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;"
                                                            OnClientClick="displaypnlSelectback(); return false;" />
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <asp:Button ID="btnNext2" runat="server" class="form-control" OnClientClick="displaypnlThird(); return false;"
                                                            Style="margin-top: 20px; margin-bottom: 30px;" Text="Next" />
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlThird" runat="server" Style="display: none;" CssClass="tab-pane fade"
                                            DefaultButton="btnNext3">
                                            <div id="divFullTime" style="text-align: center; display: none;">
                                                <div class="fieldtitle" style="font-size: medium;">
                                                    Number of people required
                                                </div>
                                                <table style="font-size: small; width: 78%; text-align: center; margin-left: 9%;">
                                                    <tr>
                                                        <td style="text-align: left; font-weight: bold;">Expertise (Experience)
                                                        </td>
                                                        <td style="font-weight: bold;">Talent count
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">Basic (1-3 yrs)
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlBasic" Style="margin: 0 auto; margin-top: 5px;"
                                                                onchange="ddlbasic_count()" runat="server" class="form-control">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">Intermediate (3-6 yrs)
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlIntermediate" onchange="ddlintermediate_count()"
                                                                Style="margin: 0 auto; margin-top: 5px;" runat="server" class="form-control">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">Expert (>6 yrs)
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlExpert" Style="margin: 0 auto; margin-top: 5px;"
                                                                onchange="ddlexpert_count()" runat="server" class="form-control">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; font-weight: bold;">Total talent count
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="txtTotalCount" runat="server" Width="50%" Style="margin: 0 auto; font-weight: bold; margin-top: 5px;"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="fieldtitle">
                                                    Mode of Work
                                                </div>
                                                <asp:DropDownList runat="server" ID="ddlWorkMode" Width="100%" Style="margin: 0 auto;"
                                                    class="form-control" onchange="selectLocation()">
                                                    <asp:ListItem Value="1" Selected="True">Remote</asp:ListItem>
                                                    <asp:ListItem Value="2">Onsite</asp:ListItem>
                                                    <asp:ListItem Value="3">Periodic Onsite</asp:ListItem>
                                                </asp:DropDownList>
                                                <%-- <asp:TextBox runat="server" ID="txtLocation" class="form-control" Style="margin-top: 20px;
                                            display: none;" Placeholder="Location"></asp:TextBox>--%>
                                                <asp:UpdatePanel ID="UpdatePanelState" runat="server">
                                                    <ContentTemplate>
                                                        <div class="fieldtitle">
                                                            <div class="row">
                                                                <div class="col-lg-6">


                                                                    <asp:DropDownList ID="ddlStatesFullTime" runat="server" class="form-control" Style="margin-right: 20px; margin-bottom: 20px; display: none;"
                                                                        AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlStatesFullTime_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <asp:DropDownList ID="ddlCitiesFullTime" runat="server" Style="display: none;" class="form-control">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <div class="fieldtitle">
                                                    Role Duration
                                                </div>
                                                <asp:TextBox runat="server" ID="txtRoleDurationfulltime" class="form-control" Placeholder="eg: 4 months"></asp:TextBox>
                                            </div>
                                            <div id="divPartTime" style="text-align: center; display: none;">
                                                <div class="fieldtitle" style="font-size: medium;">
                                                    Number of people required
                                                </div>
                                                <table style="font-size: small;width: 78%; text-align: center; border: medium; margin-left: 9%;">
                                                    <tr>
                                                        <td style="text-align: left; font-weight: bold;">Expertise (Experience)
                                                        </td>
                                                        <td style="font-weight: bold;">Talent count
                                                        </td>
                                                        <td style="font-weight: bold;">Hours per week
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">Basic (1-3 yrs)
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlBasicPartTime" onchange="ddlbasicparttime_count()"
                                                                Style="margin: 0 auto; margin-top: 5px;" runat="server" class="form-control">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlBasicHoursperWeek" Style="margin: 0 auto; margin-top: 5px;"
                                                                runat="server" class="form-control">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">Intermediate (3-6 yrs)
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlIntermediatePartTime" onchange="ddlintermediateparttime_count()"
                                                                Style="margin: 0 auto; margin-top: 5px;" runat="server" class="form-control">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlIntermediateHoursperWeek" Style="margin: 0 auto; margin-top: 5px;"
                                                                runat="server" class="form-control">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">Expert (>6 yrs)
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlExpertPartTime" onchange="ddlexpertpartime_count()"
                                                                Style="margin: 0 auto; margin-top: 5px;" runat="server" class="form-control">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlExpertHoursperWeek" Style="margin: 0 auto; margin-top: 5px;"
                                                                runat="server" class="form-control">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; font-weight: bold;">Total talent count
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPartTimeCount" runat="server" Width="30%" Style="margin: 0 auto; font-weight: bold; margin-top: 5px;"></asp:Label>
                                                            <asp:HiddenField ID="hidden" runat="server" Value="0" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="fieldtitle">
                                                    Role Duration
                                                </div>
                                                <asp:TextBox runat="server" ID="txtDurationPartTime" class="form-control" Placeholder="eg: 4 months"></asp:TextBox>
                                                <div class="fieldtitle">
                                                    Location preference (Optional)
                                                </div>

                                                <asp:RadioButtonList ID="rblLocation" runat="server" onclick=" return selectLocationPartTime(this); return false;" Width="30%"
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="1" Selected="True">No</asp:ListItem>
                                                    <asp:ListItem Value="2">Yes</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <%--  <asp:TextBox ID="txtOnsiteLoaction" class="form-control" runat="server" placeholder="Location"
                                            Style="display: none;">
                                        </asp:TextBox>--%>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <div class="divField">
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <asp:DropDownList ID="ddlStatesPartTime" runat="server" class="form-control" Style="margin-right: 20px; margin-bottom: 20px; display: none;"
                                                                        AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlStatesPartTime_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <asp:DropDownList ID="ddlCitiesPartTime" runat="server" Style="display: none;" class="form-control">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>

                                            </div>
                                            <div class="fieldtitle">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <asp:Button ID="btnScondBack" runat="server" Text="Back" class="form-control"
                                                            Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;"
                                                            OnClientClick="displaypnlSeconndback(); return false;" />
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <asp:Button ID="btnNext3" runat="server" class="form-control" Style="margin-top: 20px; margin-bottom: 30px;"
                                                            OnClientClick="displaypnlForth(); return false;" Text="Next" />
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlForth" runat="server" CssClass="tab-pane fade" Style="display: none;"
                                            DefaultButton="btnNext4">
                                            <div class="fieldtitle">
                                                Budget (INR) (Optional)
                                            </div>
                                            <asp:TextBox ID="txtBudgetOpional" runat="server" Width="30%" class="form-control" MaxLength="8" oncopy="return false"
                                                onpaste="return false" oncute="return false" Style="float: left;"></asp:TextBox>
                                            <asp:RadioButtonList ID="rblBudgetType" Width="40%" runat="server" RepeatLayout="flow"
                                                RepeatDirection="Horizontal" data-toggle="buttons" class="btn-group">
                                                <asp:ListItem class="btn active" Value="1" Selected="True">Fixed Price</asp:ListItem>
                                                <asp:ListItem class="btn" Value="2" style="margin-left: 5%;">Per Hour</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <%--<div class="fieldtitle">
                                                <asp:CheckBox ID="checkbox1" runat="server" Text="Do not show my budget to the agencies" />
                                            </div>--%>
                                            <div class="fieldtitle">
                                                Any Attachment (Options)
                                            </div>
                                            <asp:FileUpload ID="File1" runat="server" Width="80%" AllowMultiple="true"
                                                class="form-control" />
                                            <%--  <progress id="progressBar" value="0" max="100" style="width: 300px;"></progress>--%>
                                            <p id="loaded_n_total">
                                            </p>
                                            <div class="fieldtitle">
                                                Instructions & Questions for Agencies (Optional)
                                            </div>
                                            <asp:TextBox runat="server" ID="txtInstructions" Height="80px" TextMode="MultiLine"
                                                class="form-control" Placeholder="Any questions or instructions for service provider"
                                                Style="margin: 0 auto;"></asp:TextBox>
                                            <div class="fieldtitle">
                                                Planning to Start
                                            </div>
                                            <div id="myurgency" class="btn-group" style="width: 80%;">
                                                <asp:RadioButtonList ID="rblUrgency" runat="server" RepeatLayout="flow" Width="100%"
                                                    RepeatDirection="Horizontal" data-toggle="buttons" class="btn-group">
                                                    <asp:ListItem class="btn active" Value="1" Selected="True" style="padding: 6px 4px;">Immediate</asp:ListItem>
                                                    <asp:ListItem class="btn" Value="2" style="padding: 6px 4px;">In 30 days</asp:ListItem>
                                                    <asp:ListItem class="btn" Value="3" style="padding: 6px 4px;">>30 days</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="fieldtitle">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <asp:Button ID="btnthirdback" runat="server" Text="Back" class="form-control"
                                                            Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;"
                                                            OnClientClick="displaypnlThirdback(); return false;" />
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <asp:Button ID="btnNext4" runat="server" Text="Next" class="form-control"
                                                            Style="margin-bottom: 30px; margin-top: 20px;" OnClientClick="displayFive(); return false;" />
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlFive" runat="server" CssClass="tab-pane fade" Style="display: none;"
                                            DefaultButton="btnsubmit">
                                            <div class="fieldtitle">
                                                Your company industry
                                            </div>
                                            <asp:DropDownList runat="server" ID="ddlIndustry" class="form-control" Style="margin: 0 auto;">
                                                <asp:ListItem Value="0">Select Company Industry</asp:ListItem>
                                                <asp:ListItem Value="advertising-and-pr">Advertising & PR</asp:ListItem>
                                                <asp:ListItem Value="construction-renovation">Construction Renovation</asp:ListItem>
                                                <asp:ListItem Value="digital-marketing">Digital Marketing</asp:ListItem>
                                                <asp:ListItem Value="ecommerce">Ecommerce</asp:ListItem>
                                                <asp:ListItem Value="education">Education</asp:ListItem>
                                                <asp:ListItem Value="energy">Energy</asp:ListItem>
                                                <asp:ListItem Value="entertainment">Entertainment</asp:ListItem>
                                                <asp:ListItem Value="financial-services">Financial Services</asp:ListItem>
                                                <asp:ListItem Value="food-beverage">Food &amp; Beverage</asp:ListItem>
                                                <asp:ListItem Value="game-dev-support">Game Dev & Support</asp:ListItem>
                                                <asp:ListItem Value="government">Government</asp:ListItem>
                                                <asp:ListItem Value="hardware-tech-it">Hardware Tech/IT</asp:ListItem>
                                                <asp:ListItem Value="health-care">Healthcare</asp:ListItem>
                                                <asp:ListItem Value="hospitality">Hospitality</asp:ListItem>
                                                <asp:ListItem Value="legal">Legal</asp:ListItem>
                                                <asp:ListItem Value="manufacturing">Manufacturing</asp:ListItem>
                                                <asp:ListItem Value="media-publishing">Media Publishing</asp:ListItem>
                                                <asp:ListItem Value="non-profit">Non Profit</asp:ListItem>
                                                <asp:ListItem Value="pharmaceutical">Pharmaceutical</asp:ListItem>
                                                <asp:ListItem Value="public-utilities">Public Utilities</asp:ListItem>
                                                <asp:ListItem Value="real-estate">Real Estate</asp:ListItem>
                                                <asp:ListItem Value="recruiting-staffing">Recruiting Staffing</asp:ListItem>
                                                <asp:ListItem Value="retail">Retail</asp:ListItem>
                                                <asp:ListItem Value="software-tech-it">Software Tech/IT</asp:ListItem>
                                                <asp:ListItem Value="telecoms">Telecoms</asp:ListItem>
                                                <asp:ListItem Value="transportation">Transportation</asp:ListItem>
                                                <asp:ListItem Value="travel">Travel</asp:ListItem>
                                                <asp:ListItem Value="other">Other sector</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="fieldtitle">
                                                Type of company
                                            </div>
                                            <asp:DropDownList runat="server" ID="ddlTypeofCompany" class="form-control" Style="margin: 0 auto;">
                                                <asp:ListItem Value="0">Select CompanyType</asp:ListItem>
                                                <asp:ListItem Value="1">MNC</asp:ListItem>
                                                <asp:ListItem Value="2">Medium</asp:ListItem>
                                                <asp:ListItem Value="3">Large</asp:ListItem>
                                                <asp:ListItem Value="4">Small</asp:ListItem>
                                                <asp:ListItem Value="5">Startup</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="fieldtitle">
                                                Your Company Name
                                            </div>
                                            <asp:TextBox runat="server" ID="txtCompanyName" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                            <div class="fieldtitle">
                                                About company (Optional)
                                            </div>
                                            <asp:TextBox runat="server" ID="txtCompanyIntroduce" class="form-control"></asp:TextBox>
                                            <div class="fieldtitle">
                                                Contact Number
                                            </div>
                                            <asp:TextBox runat="server" ID="txtContactNumber" MaxLength="20" class="form-control"></asp:TextBox>
                                            <div class="fieldtitle">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <asp:Button ID="btnBack4" runat="server" Text="Back" class="form-control"
                                                            Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;"
                                                            OnClientClick="displaypnlForthback(); return false;" />
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="form-control"
                                                            OnClientClick=" return displayAllValidation()" OnClick="btnsubmit_Click" Style="margin-bottom: 30px; margin-top: 20px;" />
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </asp:Panel>
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


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_Default.aspx.cs" Inherits="Benchkart._Default" %>

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
    </style>
    <script>
        window.onload = function () {
            // Add active class to the current button (highlight it)
            var header = document.getElementById("myDIV");
            var btns = header.getElementsByClassName("btn");
            for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener("click", function () {
                    var current = document.getElementsByClassName("active");
                    current[0].className = current[0].className.replace(" active", "");
                    this.className += " active";
                });
            }
        };
    </script>
    <script>
        $(function () {
            $("#divContactDetails input").keypress(function (e) {
                if (e.keyCode == 13) {
                    //alert('You pressed enter!');
                    document.getElementById("<%=btnSubmit.ClientID %>").click();
                }
            });
        });
    </script>
    <script>
        function ddlGetSupplierNumber() {
            var service = document.getElementById("ddlService").value;
            document.getElementById('lblSupplierNumber').innerHTML = service;
            $('.CountService').each(function () {
                var $this = $(this);
                jQuery({ Counter: 0 }).animate({ Counter: $this.text() }, {
                    duration: 3000,
                    easing: 'swing',
                    step: function () {
                        $this.text(Math.ceil(this.Counter));
                    }
                });
            });
        }
        function displayContactDetails() {

            var service = document.getElementById("ddlService").value;
            //var industry = document.getElementById("ddlIndustry").value;
            //document.getElementById("hdnIndustryService").value = industry + '+' + service;
            $('#divContactDetails').show();
            //            $('#pnlCheck').hide();
            $('#divCheck').hide();
            $('#btnNext').hide();
            document.getElementById("lblSupplierNumber").style.display = "block";
            document.getElementById("lblSupplier").style.display = "block";

            if (service > 100) {
                document.getElementById('lblSupplierNumber').innerHTML = service;
                $('.CountService').each(function () {
                    var $this = $(this);
                    jQuery({ Counter: 0 }).animate({ Counter: $this.text() }, {
                        duration: 3000,
                        easing: 'swing',
                        step: function () {
                            $this.text(Math.ceil(this.Counter));
                        }
                    });
                });


                //$('#imgLoader').show();
                //setTimeout(function () { $('#imgLoader').hide(); $('#lblEstimate').show(); $('#lblEstimate').html(service + " suppliers available"); }, 3000);
                //alert(service);

                //alert(service);
            }
            return false;
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.Count').each(function () {
                var $this = $(this);
                jQuery({ Counter: 0 }).animate({ Counter: $this.text() }, {
                    duration: 3000,
                    easing: 'swing',
                    step: function () {
                        $this.text(Math.ceil(this.Counter));
                    }
                });
            });
        });
    </script>
</head>
<body style="background-color: #fdfdfd;">
    <form id="form1" runat="server">
    <div>
        <uc1:ucHeader runat="server" ID="ucHeader" />
    </div>
    <div class="container-fluid" style="background-color: #1d4354; text-align: center;
        font-size: 50px; color: White; background-repeat: round;">
        <%-- <div class="row" style="margin-top: 100px; margin-bottom: 110px;">
            <div class="col-lg-12">--%>
        <h1 style="margin-bottom: 10px; margin-top: 100px;">
            Get reputed agencies bid for your work
        </h1>
        <h2 style="font-size: 20px; color: White;">
            India first B2B platform for services bidding
        </h2>
        <div>
            <div class="row">
                <div class="col-sm-8">
                    <div class="notebook" style="float: left;">
                        <h2 class="Count" style="color: Black; font-size: 35px; line-height: 80px; margin: 0px;">
                            150</h2>
                        <h2 style="line-height: 30px; color: Black; font-size: 20px; margin: 0px;">
                            IT & Digital Agencies Partners</h2>
                    </div>
                    <div class="notebook" style="float: left;">
                        <h2 class="Count" style="color: Black; font-size: 35px; line-height: 80px; margin: 0px;">
                            12000</h2>
                        <h2 style="line-height: 30px; color: Black; font-size: 20px; margin: 0px;">
                            IT Talent</h2>
                    </div>
                    <div class="notebook">
                        <h2 style="line-height: 40px; color: Black; font-size: 20px; margin: 20px;">
                            Are Ready to Bid for your project</h2>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="content">
                        <asp:Panel ID="pnlCheck" runat="server" DefaultButton="btnNext">
                            <div id="divCheck">
                                <h5 style="margin-top: 10px; font-weight: bold;">
                                    Select service</h5>
                                <%-- <asp:RadioButtonList runat="server" ID="rblWorkType" class="radiostyle">
                                    <asp:ListItem Value="service" Selected="True">&nbsp;&nbsp;I want to outsource IT project</asp:ListItem>
                                    <asp:ListItem Value="talent">&nbsp;&nbsp;I want to hire flexi IT talent</asp:ListItem>
                                    <asp:ListItem Value="assistance">&nbsp;&nbsp;I need assistance for IT</asp:ListItem>
                                </asp:RadioButtonList>--%>
                                <%--<div id="myDIV" class="btn-group-vertical" style="width: 80%; margin: 0 auto;">
                                    <button type="button" class="btn active">
                                        Outsource Service</button>
                                    <button type="button" class="btn" style="margin-top: 8px;">
                                        Hire Flexi Talent</button>
                                    <button type="button" class="btn" style="margin-top: 8px;">
                                        Consult</button>
                                </div>--%>
                                <div id="myDIV" class="btn-group-vertical" style="width: 80%; margin: 0 auto;">
                                    <asp:RadioButtonList ID="rblWorkType" runat="server" RepeatLayout="flow" RepeatDirection="Vertical"
                                        data-toggle="buttons" class="btn-group">
                                        <asp:ListItem class="btn active" Value="service" Selected="True">Outsource Service</asp:ListItem>
                                        <asp:ListItem class="btn" Value="talent">Hire Flexi Talent</asp:ListItem>
                                        <asp:ListItem class="btn" Value="consult">Consult Requirement</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <asp:Label ID="lblSupplierNumber" runat="server" class="CountService" Style="display: none;
                                color: Blue; font-size: 2em; text-align: center;"></asp:Label>
                            <asp:Label ID="lblSupplier" Text="Agencies are providing this service" runat="server"
                                Style="display: none; color: Blue;"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlService" class="form-control" Style="margin: 0 auto;
                                margin-top: 10px; width: 80%; height: 30px;" onchange="javascript:ddlGetSupplierNumber()"
                                Placeholder="What IT Service you need?">
                                <asp:ListItem Selected="" Value="0">Service category</asp:ListItem>
                                <asp:ListItem Value="1">Website Design & Development</asp:ListItem>
                                <asp:ListItem Value="2">Ecommerce</asp:ListItem>
                                <asp:ListItem Value="4">Software & Apps</asp:ListItem>
                                <asp:ListItem Value="7">Digital Marketing</asp:ListItem>
                                <asp:ListItem Value="10">Business Support Services</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnNext" runat="server" Text="Start" class="form-control" Style="margin-top: 15px;
                                height: 30px;" OnClientClick="displayContactDetails(); return false;" />
                            <div id="divContactDetails" style="display: none;">
                                <%--<asp:Label ID="lblEstimate" runat="server" ForeColor="Blue" Style="display: none;" />--%>
                                <asp:TextBox runat="server" ID="txtFullName" ValidationGroup="Registration" class="form-control"
                                    Style="margin: 0 auto; margin-top: 10px; width: 80%;" Placeholder="Full Name"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ValidationGroup="Registration" ID="reqtxtFullName"
                                    SetFocusOnError="True" ControlToValidate="txtFullName" Display="Dynamic" ForeColor="Red"
                                    Style="display: block !important;">*</asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" ID="txtEmail" ValidationGroup="Registration" class="form-control"
                                    Style="margin: 0 auto; margin-top: 10px; width: 80%;" Placeholder="Email Address"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ValidationGroup="Registration" ID="reqtxtEmail"
                                    SetFocusOnError="True" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter your email!"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Invalid email."
                                    SetFocusOnError="True" ControlToValidate="txtEmail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                    ForeColor="Red" ValidationGroup="Registration" Display="Dynamic" />
                                <asp:TextBox runat="server" ID="txtContactNumber" ValidationGroup="Registration"
                                    class="form-control" Style="margin: 0 auto; margin-top: 10px; width: 80%;" Placeholder="Contact Number"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="reqtxtContactNumber" ValidationGroup="Registration"
                                    SetFocusOnError="True" ControlToValidate="txtContactNumber" Display="Dynamic"
                                    ErrorMessage="Please enter your contact number!" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="form-control" OnClick="btnSubmit_Click"
                                    ValidationGroup="Registration" Style="margin-top: 15px; height: 30px;" />
                                <asp:Label ID="lblError" runat="server" ForeColor="Red" Style="display: none;" />
                            </div>
                        </asp:Panel>
                        <br />
                    </div>
                </div>
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

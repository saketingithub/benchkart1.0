<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bid_Details.aspx.cs" Inherits="Benchkart.Consultant.Bid_Details" %>

<%@ Register Src="~/Consultant/ucConsultantHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="description" content="IT Shared Services" />
    <title>BenchKart - Project</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
     <script src="../Scripts/Custom.js"></script>
    <script>
        function selectComment() {
            if (document.getElementById("ddlRejectionCode").value != "0") {
                $('#txtRejectionComments').show();
            }
            else {
                $('#txtRejectionComments').hide();
            }
        }
    </script>
    <style>
        .divField {
            margin: 0 auto;
            margin-left: 10px;
            margin-top: 10px;
        }

        .bidfield {
            margin-top: 10px;
            text-align: left;
            font-size: small;
            margin-bottom: 5px;
            font-weight: bold;
            color: Black;
        }

        i {
            font-weight: bold;
            font-size: small;
            margin-top: 0px;
            color: Gray;
            float: left;
            margin-right: 10px;
        }

        h3 {
            font-weight: bold;
            font-size: medium;
            color: Black;
            margin: 0 auto;
            margin-bottom: 5px;
        }

        h4 {
            font-weight: bold;
            font-size: small;
            margin-top: 20px;
            color: Black;
        }

        .label {
            color: Black;
            font-size: medium;
            font-weight: normal;
            width: 100%;
            word-break: break-all;
            display: inline-flex;
            white-space: pre-wrap;
            margin-left: 40px;
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
        }

            .card:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            }

        .container {
            padding: 2px 16px;
        }

        @media (max-width: 799px) {
            .card {
                width: 90%;
            }
        }

        @media (min-width: 800px) {
            .card {
                width: 60%;
            }
        }
    </style>
</head>
<body style="background-color: #18D26E;">
    <form id="form1" runat="server">
        <div>
            <uc1:ucHeader runat="server" ID="ucHeader" />
        </div>
        <!-- Card -->
        <div class="card" style="margin: 0 auto; background-color: White; margin-top: 50px; margin-bottom: 50px;">
            <div class="container" style="width: 90%;">
                <div class="row">
                    <div class="col-lg-12">
                        <h3 style="text-align: right; margin-right: 5px; color: currentColor; margin-top: 10px; margin-bottom: 20px;">
                            <asp:LinkButton ID="lkbBackBids" runat="server" Text="Back_Bids" OnClick="lkbBackBids_Click"></asp:LinkButton>

                        </h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <h1 style="font-size: 2em; text-align: center; font-weight: bold; margin-bottom: 20px;">Bid Details
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <div id="divImage" class="divImage" style="text-align: center; margin-bottom: 10px;">
                            <asp:Image ID="Image1" runat="server" Width="80px" Height="80px" ImageUrl="~/Images/company_logo.jpg"
                                Style="border-radius: 50%; margin-right: 10px; vertical-align: middle; border: 1px solid lightgray;" />
                        </div>
                    </div>
                    <div class="col-lg-9" style="margin-top: 10px;">
                        <h3>
                            <i class="fa fa-fw fa-flag fa-x" style="color: #18D26E;"></i><b>Project title</b></h3>
                        <asp:Label ID="lblTitle" runat="server"></asp:Label><br />
                        <h3 style="margin-top: 15px;">
                            <i class="fa fa-fw fa-calendar fa-x" style="color: #18D26E;"></i><b>Date</b></h3>
                        <asp:Label ID="lblCreationDate" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row" style="position: relative;">
                    <div class="col-lg-3">
                        <div class="divField">
                            <h3>Company Representative
                            </h3>
                            <asp:Label ID="lblPocName" runat="server"></asp:Label>
                        </div>
                        <div class="divField">
                            <h3>Company Name
                            </h3>
                            <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <h3 style="margin-top: 15px;">
                            <i class="fa fa-fw fa-pencil-square-o fa-x" style="color: #18D26E;"></i><b>Our Solution</b></h3>
                        <asp:Label ID="lblExecutionRemarks" runat="server"></asp:Label>
                        <h3 style="margin-top: 15px;">
                            <i class="fa fa-fw fa-cog fa-x" style="color: #18D26E;"></i><b>Our Expertise</b></h3>
                        <asp:Label ID="lblExperience" runat="server"></asp:Label>
                        <h3 style="margin-top: 15px;">
                            <i class="fa fa-fw fa-cogs fa-x" style="color: #18D26E;"></i><b>Our Primes Services</b></h3>
                        <asp:Label ID="lblServices" runat="server"></asp:Label>
                        <h3 style="margin-top: 15px;">
                            <i class="fa fa-fw fa-money fa-x" style="color: #18D26E;"></i><b>Price</b></h3>
                        <asp:Label ID="lblBidAmount" runat="server"></asp:Label>
                        <asp:Label ID="lblPaymentType" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                    </div>
                    <div class="col-lg-9">
                        <%--<div class="bidfield">
                        Location</div>
                    <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("Location")%>'></asp:Label>--%>
                        <h3 style="margin-top: 15px;">
                            <i class="fa fa-fw fa-address-card-o fa-x" style="color: #18D26E;"></i><b>About Us</b></h3>
                        <asp:Label ID="lblAbout" runat="server" Text='<%# Eval("CompanyProfile")%>'></asp:Label>
                        <h3 style="margin-top: 15px;">
                            <i class="fa fa-fw fa-user-o fa-x" style="color: #18D26E;"></i><b>Number Of Employees</b></h3>
                        <asp:Label ID="lblEmployeeCount" runat="server" Text='<%# Eval("EmployeeCount")%>'></asp:Label>
                        <asp:HiddenField ID="hidProjectId" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                    </div>
                    <div class="col-lg-9">
                        <h3 style="margin-top: 15px;">
                            <i class="fa fa-fw fa-envelope-o fa-x" style="color: #18D26E;"></i><b>About Us</b></h3>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="50px" ValidationGroup="SubmitMessage"
                            Placeholder="Type Comment Message (Optional)" Width="90%" Style="text-align: left; margin-top: 20px;" class="form-control">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtMessage" Display="Dynamic" ForeColor="Red"
                            ValidationGroup="SubmitMessage" runat="server" SetFocusOnError="True" ControlToValidate="txtMessage"
                            Text="*" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row" style="margin-top: 15px;">
                    <div class="col-lg-3">
                    </div>
                    <div class="col-lg-9" style="margin-top: 25px; margin-bottom: 30px;">

                        <asp:Button ID="btnApprovale" class="form-control" runat="server" Text="Approve" Font-Bold="true"
                            Height="30px" Width="30%" Style="margin-right: 70px; text-align: center; text-decoration: none;"
                            OnClick="btnApprovale_Click" />

                    </div>
                </div>
                <!-- Card -->
            </div>
        </div>
    </form>
</body>
</html>

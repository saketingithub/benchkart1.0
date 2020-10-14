<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book_Consultation.aspx.cs" Inherits="Benchkart.Customer.Book_Consultation" %>

<%@ Register Src="~/Customer/ucCustomerMenu.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<%@ Register Src="~/Customer/ucCustomerFooter.ascx" TagPrefix="uc2" TagName="ucCustomerFooter" %>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport' />

    <meta name="description" content="IT Shared Services" />
    <title>Book Free Consultaion</title>
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
    <%-- <script src="../Scripts/Custom.js"></script>--%>

    <style>
        /* Style the active class, and buttons on mouse-over */
        .select {
            background-color: White;
            color: #F79507;
        }
    </style>



    <style>
        .navbar a {
            float: none;
            padding: 0px;
        }
    </style>

    <style>
        .bidfield {
            margin-top: 10px;
            text-align: left;
            font-size: medium;
            margin-bottom: 5px;
            color: gray;
        }

        i {
            font-size: small;
            margin-top: 0px;
            float: left;
            margin-right: 10px;
        }

        h3 {
            font-weight: bold;
            font-size: small;
            color: Gray;
            margin: 0 auto;
            margin-bottom: 5px;
        }

        h4 {
            font-size: medium;
            margin-top: 5px;
            color: black;
            font-weight: normal;
        }

        h1 {
            margin-top: 10px;
            color: gray;
            font-size: 1.6em;
        }
    </style>
    <style>
        /* Add responsiveness - will automatically display the navbar vertically instead of horizontally on screens less than 500 pixels */
        .consultform {
            margin: 0 auto;
        }

        @media screen and (max-width: 799px) {
            .content {
                width: 90%;
            }

            .card {
                width: 100%;
            }

            .consultform {
                width: 100%;
            }

            .video {
                width: 280px;
                height: 200px;
                margin: 0 auto;
            }

            .videotop {
                margin-top: 20px;
            }
        }

        @media screen and (min-width: 799px) {
            .content {
                width: 100%;
            }

            .card {
                width: 65%;
            }

            .consultform {
                width: 70%;
            }

            .video {
                width: 560px;
                height: 315px;
                margin: 0 auto;
            }

            .videotop {
                margin-top: 100px;
            }
        }

        .row {
            margin-bottom: 7px;
        }
    </style>

</head>
<body style="background-color: white;">
    <form id="form1" runat="server">
        <div>
            <div style="background-color: black; color: Black; display: flow-root; height: 60px;">
                <div>
                    <uc1:ucHeader runat="server" ID="ucHeader" />
                </div>
            </div>
        </div>

        <%--  <div class="card" style="margin: 0 auto; background-color: White; padding-bottom: 10px;">--%>
        <div class="container" style="width: 100%;">
            <div class="row">
                <div class="col-sm-6">
                    <div class="consultform">
                        <div class="row">
                            <div class="col-sm-12">
                                <h1 style="text-align: center; margin-bottom: 10px; margin-top: 20px; font-size: 1.5em; font-weight: bold; color: black;">Request Free Consultation
                                </h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="bidfield">
                                    <h4>
                                        <asp:TextBox ID="txtFullName" runat="server" MaxLength="100" class="form-control" Placeholder="Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqtxtFullName" runat="server" SetFocusOnError="True"
                                            Display="Dynamic" ControlToValidate="txtFullName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill"
                                            ToolTip="Please fill name" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                    </h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="bidfield">
                                    <h4>
                                        <asp:TextBox ID="txtEmailId" runat="server" MaxLength="100" class="form-control" Placeholder="Work Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqtxtEmail" runat="server" SetFocusOnError="True"
                                            Display="Dynamic" ControlToValidate="txtEmailId" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill the email"
                                            ToolTip="E-mail is required." ValidationGroup="Submit"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Invalid email"
                                            SetFocusOnError="True" ControlToValidate="txtEmailId" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                            ForeColor="Red" Font-Size="Small" ValidationGroup="Submit" Display="Dynamic" />
                                    </h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="bidfield ">
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Height="100px" Placeholder="Request Description"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqtxtDescription" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtDescription" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill description"
                                        ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="bidfield">
                                    <h4>
                                        <asp:TextBox ID="txtCompanyName" runat="server" MaxLength="100" class="form-control" Placeholder="Company Name (Optional)"></asp:TextBox>
                                    </h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="bidfield">
                                    <asp:TextBox runat="server" ID="txtContactNumber" class="form-control" Style="text-align: left;"
                                        Placeholder="Mobile Number - 10 digit"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqtxtContactNumber" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtContactNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill contact number"
                                        ToolTip="Contact number is required." ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regtxtContactNumber" runat="server" ErrorMessage="Invalid phone - accept only 10 digit mobile number"
                                        SetFocusOnError="True" ControlToValidate="txtContactNumber" ValidationExpression="^[0-9]{10}$"
                                        ForeColor="Red" Font-Size="Small" ValidationGroup="Submit" Display="Dynamic" />
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 0px;">
                            <div class="col-sm-12">
                                <div class="bidfield">
                                    <h3>Preferred Contact Method</h3>
                                    <asp:RadioButtonList ID="rblContactPreferrence" Width="20%" CssClass="form-group" runat="server"
                                        RepeatDirection="Horizontal" data-toggle="buttons">
                                        <asp:ListItem class="btn active" Value="1" Selected="True">Call</asp:ListItem>
                                        <asp:ListItem class="btn" Value="2" style="margin-left: 5%;">Email</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="bidfield">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="Submit" CausesValidation="true"
                                        Style="margin-top: 0px; margin-bottom: 10px; font-size: 16px;" OnClick="btnSubmit_Click" CssClass="btn btn-success form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 videotop">
                    <h2 style="font-size: 1.2em; font-weight: bold; color: black;">Watch - How It Works</h2>
                    <iframe class="video" src="https://www.youtube.com/embed/awm2p4iTdxc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
        <%--</div>--%>
    </form>
</body>
</html>

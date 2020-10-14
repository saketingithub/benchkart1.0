<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bid-Details.aspx.cs" MasterPageFile="~/Customer/Site1.Master" Inherits="Benchkart.Partner.Bid_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <script>
        function selectComment() {
            if (document.getElementById("ddlRejectionCode").value != "0") {
                $('#txtRejectionComments').show();
            }
            else {
                $('#txtRejectionComments').hide();
            }
        }
    </script>--%>
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
            font-size: 15px;
            margin: 0 auto;
            margin-bottom: 5px;
        }

        h4 {
            font-weight: bold;
            font-size: small;
            margin-top: 20px;
            color: Black;
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

        b {
            color: gray;
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

        .fa-fw {
            font-size: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Card -->
    <div class="card" style="margin: 0 auto; background-color: White; margin-top: 50px; margin-bottom: 50px; width: 90%;">
        <div class="container" style="width: 98%;">
            <div class="row">
                <div class="col-sm-12">
                    <h1 style="font-size: 1.6em; text-align: center; font-weight: bold; margin-bottom: 20px; margin-top: 15px; color: gray;">Bid Details
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div id="divImage" class="divImage" style="text-align: center; margin-bottom: 10px;">
                        <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl="~/Images/company_logo.jpg"
                            Style="border-radius: 50%; margin-right: 10px; vertical-align: middle; border: 1px solid lightgray;" />
                    </div>
                </div>
                <div class="col-sm-9" style="margin-top: 10px;">
                    <h3>
                        <i class="fa fa-fw fa-flag fa-x" style="color: #18D26E;"></i><b>Project Title</b></h3>
                    <asp:Label ID="lblTitle" runat="server" CssClass="label"></asp:Label><br />
                    <h3 style="margin-top: 15px;">
                        <i class="fa fa-fw fa-calendar fa-x" style="color: #18D26E;"></i><b>Date</b></h3>
                    <asp:Label ID="lblCreationDate" runat="server" CssClass="label"></asp:Label>
                </div>
            </div>

            <div class="row" style="position: relative;">
                <div class="col-sm-3">
                    <div class="divField">
                        <h3>Agency Name
                        </h3>
                        <asp:Label ID="lblCompanyName" runat="server" Style="margin-left: 0px;" CssClass="label"></asp:Label>
                    </div>
                    <div class="divField">
                        <h3>Representative Name
                        </h3>
                        <asp:Label ID="lblPocName" runat="server" Style="margin-left: 0px;" CssClass="label"></asp:Label>
                    </div>

                </div>
                <div class="col-sm-9">
                    <div class="row fields">
                        <div class="col-sm-12">
                            <h3 style="margin-top: 15px;">
                                <i class="fa fa-fw fa-money fa-x" style="color: #18D26E;"></i><b>Bidding Amount (INR)*</b></h3>
                            <asp:Label ID="lblBidAmount" runat="server" CssClass="label"></asp:Label>
                            <asp:Label ID="lblPaymentType" runat="server" CssClass="label"></asp:Label>
                        </div>
                    </div>
                    <div class="row fields">
                        <div class="col-sm-12">
                            <h3>* Bidding is based on description of project and may vary after discussing detailed requirement and scope of work</h3>
                        </div>
                    </div>
                    <div class="row fields" style="padding-top: 0px;">
                        <div class="col-sm-12">
                            <h3 style="margin-top: 15px;">
                                <i class="fa fa-fw fa-pencil-square-o fa-x" style="color: #18D26E;"></i><b>Estimation Details</b></h3>
                            <asp:Label ID="lblExecutionRemarks" runat="server" CssClass="label"></asp:Label>
                        </div>
                    </div>
                    
                    <div class="row fields">
                        <div class="col-sm-12">
                            <h3 style="margin-top: 15px;">
                                <i class="fa fa-fw fa-cog fa-x" style="color: #18D26E;"></i><b>Expertise</b></h3>
                            <asp:Label ID="lblExperience" runat="server" CssClass="label"></asp:Label>
                        </div>
                    </div>
                    <div class="row fields">
                        <div class="col-sm-12">
                            <h3 style="margin-top: 15px;">
                                <i class="fa fa-fw fa-cogs fa-x" style="color: #18D26E;"></i><b>Services</b></h3>
                            <asp:Label ID="lblServices" runat="server" CssClass="label"></asp:Label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                </div>
                <div class="col-sm-9">
                    <%--<div class="bidfield">
                        Location</div>
                    <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("Location")%>'></asp:Label>--%>
                    <h3 style="margin-top: 15px;">
                        <i class="fa fa-fw fa-address-card-o fa-x" style="color: #18D26E;"></i><b>About Agency</b></h3>
                    <asp:Label ID="lblAbout" runat="server" Text='<%# Eval("CompanyProfile")%>' CssClass="label"></asp:Label>
                    <h3 style="margin-top: 15px;">
                        <i class="fa fa-fw fa-user-o fa-x" style="color: #18D26E;"></i><b>Number Of Employees</b></h3>
                    <asp:Label ID="lblEmployeeCount" runat="server" Text='<%# Eval("EmployeeCount")%>' CssClass="label"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                </div>

                <div class="col-sm-9">

                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="SubmitMessage" Placeholder="Type Message (Optional)"
                        Width="90%" Style="text-align: left; margin-top: 40px;" class="form-control">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtxtMessage" Display="Dynamic" ForeColor="Red"
                        ValidationGroup="SubmitMessage" runat="server" SetFocusOnError="True" ControlToValidate="txtMessage"
                        Text="*" ErrorMessage="*"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row" style="margin-top: 15px;">
                <div class="col-sm-3">
                </div>
                <div class="col-sm-9" style="margin-top: 25px; margin-bottom: 30px;">
                    <div class="row">
                        <div class="col-lg-4">
                            <asp:Button ID="btnMessage" runat="server" ValidationGroup="SubmitMessage" Text="Send Message" Style="margin-bottom: 20px;"
                                class="form-control" Height="30px"
                                OnClick="btnMessage_Click"></asp:Button>
                        </div>
                        <div class="col-lg-4">
                            <asp:Button ID="btnAccept" class="form-control" runat="server" Text="Accept Bid" Font-Bold="true" Font-Size="Medium" Style="margin-bottom: 20px; background-color: #F79507;"
                                OnClick="btnAccept_Click" Height="30px" />
                        </div>
                        <div class="col-lg-4">
                            <asp:Label ID="lblBidAccepted" runat="server" Visible="false" Text="Status - Bid Accepted"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Card -->
        </div>
    </div>
</asp:Content>

<%@ Page Language="C#" Title="Partner Bid Details" AutoEventWireup="true" CodeBehind="Bid-Details.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Customer.Bid_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .row {
            margin-bottom: 25px;
        }

        i {
            color: #F79507;
        }

        .fa-fw {
            font-size: 18px;
        }

        h4 {
            color: #212529;
            font-size: 15px;
            font-weight: bold;
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
        .container {
                width: 90%;
            }
        @media (max-width: 799px) {
             .container {
                width: 100%;
            }
            .col-sm-4, .col-sm-8, .col-sm-6, .col-sm-9 {
                padding-top: 15px;
            }
        }

    </style>

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField runat="server" ID="hdnPartnerId" />
    <!-- Card -->
    <div class="card" style="margin: 0 auto; background-color: White; margin-top: 40px; margin-bottom: 50px; padding: 20px 0px;">
        <div class="container">
            <div class="row" style="margin-bottom: 0px;">
                <div class="col-sm-12">
                    <h1 style="font-size: x-large; text-align: center; color: gray;">
                        <b>Bid Details</b>
                    </h1>
                </div>
            </div>
            <div class="row fields">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-flag fa-x"></i><b>Project title</b></h4>
                    <asp:Label ID="lblTitle" runat="server" class="label">
                    </asp:Label>
                </div>

            </div>
            <asp:Panel runat="server" ID="pnlCustomerDetails" Visible="false">
                <div class="row fields">
                <div class="col-sm-4">
                    <h4>
                    <i class="fa fa-fw fa-Name fa-x"></i><b>Customer Name</b></h4>
                    <asp:Label ID="lblFullName" runat="server" CssClass="label"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <h4>
                        <i class="fa fa-fw fa-Company fa-x"></i><b>Company Name</b> </h4>
                        <asp:Label ID="lblCompanyName" runat ="server" CssClass ="label"></asp:Label>
                   
                </div>
                <div class="col-sm-4">
                    <h4>
                        <i class="fa fa-fw fa-Contact fa-x"></i><b>Contact Number</b>

                    </h4>
                    <asp:Label ID="lblContactNumber" runat ="server" CssClass ="label"></asp:Label>
                </div>
            </div>
            </asp:Panel>
            <div class="row fields">
                <div class="col-sm-4">
                    <h4>
                        <i class="fa fa-fw fa-calendar fa-x"></i><b>Date</b></h4>
                    <asp:Label ID="lblCreationDate" runat="server" class="label">
                    </asp:Label>
                </div>
                <div class="col-sm-8">
                    <h4>
                        <i class="fa fa-fw fa-money fa-x"></i><b>Budget (INR)</b></h4>
                    <asp:Label ID="lblBudget" runat="server" class="label">
                    </asp:Label>
                </div>
            </div>

            <div class="row fields">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-clipboard fa-x"></i><b>Description</b></h4>
                    <asp:Label ID="lblDescription" runat="server" class="label" Style="line-height: 1.7; text-align: left;">
                    </asp:Label>
                </div>

            </div>

            <div class="row fields">
                <div class="col-sm-4">
                    <h4>
                        <i class="fa fa-fw fa-cog fa-x"></i><b>Project Category</b></h4>
                    <asp:Label ID="lblCategory" runat="server" class="label">
                    </asp:Label>
                </div>
                <div class="col-sm-4">
                    <h4>
                        <i class="fa fa-fw fa-cogs fa-x"></i><b>Project SubCategory</b></h4>
                    <asp:Label ID="lblSubCategory" runat="server" class="label">
                    </asp:Label>
                </div>
                <div class="col-sm-4">
                    <h4>
                        <i class="fa fa-fw fa-wrench fa-x"></i><b>Project Type</b></h4>
                    <asp:Label ID="lblTypeofWork" runat="server" class="label">
                    </asp:Label>
                </div>
            </div>

            <div class="row">
                <asp:Panel runat="server" ID="pnlTalent">
                    <div class="col-sm-3">
                        <h4>
                            <i class="fa fa-fw fa-user fa-x"></i><b>Talent Count</b></h4>
                        <asp:Label ID="lblTalentCount" runat="server" class="label">
                        </asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <h4>
                            <i class="fa fa-fw fa-user fa-x"></i><b>Work Mode</b></h4>
                        <asp:Label ID="lblWorkMode" runat="server" class="label">
                        </asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <h4>
                            <i class="fa fa-fw fa-user fa-x"></i><b>Onsite Location</b></h4>
                        <asp:Label ID="lblOnsiteLocation" runat="server" class="label">
                        </asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <h4>
                            <i class="fa fa-fw fa-binoculars fa-x"></i><b>Talent Proficiency</b></h4>
                        <asp:Label ID="lblTalentProficiency" runat="server" class="label">
                        </asp:Label>
                        <h4>
                            <i class="fa fa-fw fa-calendar fa-x"></i><b>Duration</b></h4>
                        <asp:Label ID="lblDuration" runat="server" class="label">
                        </asp:Label>
                    </div>
                </asp:Panel>
            </div>

            <div class="row fields">
                <div class="col-sm-4">
                    <h4>
                        <i class="fa fa-fw fa-paperclip fa-x"></i><b>Attachments</b></h4>
                    <asp:Panel ID="pnlDownloads" runat="server" Style="padding-left: 50px;"></asp:Panel>
                </div>

                <div class="col-sm-8">
                    <h4>
                        <i class="fa fa-fw fa-thumb-tack fa-x"></i><b>Skills Required</b></h4>
                    <asp:Label ID="lblSkill" runat="server" class="label">
                    </asp:Label>
                </div>

            </div>

            <div class="row fields">

                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-question-circle fa-x"></i><b>QueryForPartner</b></h4>
                    <asp:Label ID="lblQuery" runat="server" class="label" Style="line-height: 1.7; text-align: left;">
                    </asp:Label>
                </div>
            </div>

            <div class="row fields">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-industry fa-x"></i><b>Customer Industry</b></h4>
                    <asp:Label ID="lblIndustry" runat="server" class="label">
                    </asp:Label>
                </div>

            </div>

            <%--<div class="row fields">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-info-circle fa-x"></i><b>About Customer
                                Company</b></h4>
                    <asp:Label ID="lblAboutCompany" runat="server" class="label">
                    </asp:Label>
                </div>
            </div>--%>

            <div class="row fields">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-bullseye fa-x"></i><b>Bid Amount (INR)</b></h4>
                    <asp:Label ID="txtBid" runat="server" MaxLength="8" Width="30%" Style="margin-left: 40px;">
                    </asp:Label>

                </div>
            </div>

            <div class="row fields">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-pencil-square-o fa-x"></i><b>Estimation Details</b></h4>
                    <asp:Label ID="txtExecution" runat="server" CssClass="label"
                        Width="90%" Style="margin-left: 40px;">
                    </asp:Label>

                </div>
            </div>
            <div class="row fields">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-arrows-alt fa-x"></i><b>Any Experience or Expertise details</b></h4>
                    <asp:Label ID="txtExperience" runat="server" Style="margin-left: 40px;" CssClass="label"
                        Width="90%">
                    </asp:Label>
                </div>
            </div>
            <%--<div class="row">
                    <div class="col-sm-12">
                        <h4 style="margin-left: 30px;">
                            <b>If not interested in this project! select the reason</b></h4>
                        <asp:DropDownList ID="ddlRejectionCode" runat="server" class="form-control" Width="50%"
                            ValidationGroup="NextProject" onchange="selectComment()" Style="margin-left: 30px;">
                            <asp:ListItem Selected="" Value="0">-Select Reason-</asp:ListItem>
                            <asp:ListItem Value="1">Requirement not clear</asp:ListItem>
                            <asp:ListItem Value="2">Requiremnt is incomplete</asp:ListItem>
                            <asp:ListItem Value="3">Don't have expertise </asp:ListItem>
                            <asp:ListItem Value="4">Don't have bandwidth</asp:ListItem>
                            <asp:ListItem Value="5">Other</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator InitialValue="0" ID="reqddlRejectionCode" Display="Dynamic"
                            ValidationGroup="NextProject" runat="server" ControlToValidate="ddlRejectionCode"
                            ForeColor="Red" Text="Select bid rejection reason" ErrorMessage="Select bid rejection reason"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:TextBox ID="txtRejectionComments" Placeholder="Other Comments" runat="server"
                            class="form-control" Style="margin-left: 30px; margin-top: 20px; display: none;"
                            Width="70%"></asp:TextBox>
                    </div>
                </div>--%>
            <div class="row">
                <%-- <div class="col-sm-6">
                        <asp:LinkButton ID="btnSkipProject" runat="server" ValidationGroup="NextProject"
                            Text="Next Project" class="form-control" Style="background: #18D26E; display: block; color: White; margin: 0 auto; margin-top: 30px; margin-bottom: 30px; height: 35px; font-size: medium; text-align: center; text-decoration: none;"
                            OnClick="btnSkipProject_Click">
                                                        <span class="fa fa-fw fa-repeat"></span>&nbsp;&nbsp;Skip Project</asp:LinkButton><br />
                    </div>--%>
            </div>
            <!-- Card -->
        </div>
    </div>
</asp:Content>


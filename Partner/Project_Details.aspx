<%@ Page Language="C#" Title="Partner Project Details" AutoEventWireup="True" MasterPageFile="~/Partner/Site1.Master" CodeBehind="Project_Details.aspx.cs"
    Inherits="Benchkart.Partner.Project_Details" %>

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

        .label {
            font-size: medium;
            line-height: 1.5;
            margin-left: 25px;
            text-align: left;
        }

        .container {
            width: 90%;
        }

        .bids {
            margin-left: 40px;
            width: 90%;
        }

        @media (max-width: 799px) {
            .bids {
                margin-left: 0px;
                width: 100%;
            }

            .container {
                width: 95%;
            }

            .label {
                font-size: 15px;
                margin-left: 5px;
                margin-bottom: 10px;
            }

            .row {
                margin-bottom: 0px;
            }

            h4 {
                margin-top: 15px;
            }
        }
    </style>
    <script>
        $(document).ready(function () {
            document.getElementById('<%=txtBid.ClientID %>').maxLength = "8";

        });
    </script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField runat="server" ID="hdnPartnerId" />
    <!-- Card -->
    <div class="card" style="margin: 0 auto; background-color: White; margin-top: 40px; margin-bottom: 50px; padding: 20px 0px;">
        <div class="container">
            <div class="row" style="margin-bottom: 0px;">
                <div class="col-sm-12">
                    <h1 style="font-size: x-large; text-align: center; color: gray;">
                        <b>Project Details</b>
                    </h1>
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
            <div class="row fields">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-flag fa-x"></i><b>Project title</b></h4>
                    <asp:Label ID="lblTitle" runat="server" class="label" Style="text-align: left;">
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

            <div class="row">
                <asp:Panel runat="server" ID="pnlFullTime" Visible="false">
                    <div class="divField" style="font-size: medium;">
                        <h4>Number of People Required</h4>
                        <table style="font-size: small; width: 100%; text-align: center; margin-left: 5%; font-size: 14px; margin-top: 20px; margin-bottom: 30px;">
                            <tr>
                                <td style="text-align: left; font-weight: bold;">Expertise (Experience)
                                </td>
                                <td style="font-weight: bold;">Talent Count
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">Basic (1-3 yrs)
                                </td>
                                <td>
                                    <asp:Label ID="lblBasic" Style="margin: 0 auto; margin-top: 5px;"
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">Intermediate (3-6 yrs)
                                </td>
                                <td>
                                    <asp:Label ID="lblIntermediate"
                                        Style="margin: 0 auto; margin-top: 5px;" runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">Expert (>6 yrs)
                                </td>
                                <td>
                                    <asp:Label ID="lblExpert" Style="margin: 0 auto; margin-top: 5px;"
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left; font-weight: bold;">Total talent Count
                                </td>
                                <td>
                                    <asp:Label ID="txtTotalCount" runat="server" Width="50%" Style="margin: 0 auto; font-weight: bold; margin-top: 5px;"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="divField">
                        <h4>Mode of Work</h4>
                        <asp:Label runat="server" ID="lblWorkMode" Style="margin: 0 auto;">                                        
                        </asp:Label>
                        <%--  <asp:TextBox runat="server" ID="txtLocation" class="form-control" Style="margin-top: 20px;
                                            display: none;" Placeholder="Location"></asp:TextBox>--%>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlPartTime" runat="server" Visible="false">
                    <div class="divField" style="font-size: medium;">
                        <h4>Number of People Required</h4>
                        <table style="font-size: small; width: 100%; text-align: center; border: medium; margin-left: 5%;">
                            <tr>
                                <td style="text-align: left; font-weight: bold;">Expertise (Experience)
                                </td>
                                <td style="font-weight: bold;">Talent Count
                                </td>
                                <td style="font-weight: bold;">Hours per Week
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">Basic (1-3 yrs)
                                </td>
                                <td>
                                    <asp:Label ID="lblBasicPartTime" Style="margin: 0 auto; margin-top: 5px;" runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblBasicHoursperWeek" Style="margin: 0 auto; margin-top: 5px;"
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">Intermediate (3-6 yrs)
                                </td>
                                <td>
                                    <asp:Label ID="lblIntermediatePartTime"
                                        Style="margin: 0 auto; margin-top: 5px;" runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblIntermediateHoursperWeek" Style="margin: 0 auto; margin-top: 5px;"
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">Expert (>6 yrs)
                                </td>
                                <td>
                                    <asp:Label ID="lblExpertPartTime"
                                        Style="margin: 0 auto; margin-top: 5px;" runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblExpertHoursperWeek" Style="margin: 0 auto; margin-top: 5px;"
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left; font-weight: bold;">Total  talent Count
                                </td>
                                <td>
                                    <asp:Label ID="lblPartTimeCount" runat="server" Width="30%" Style="margin: 0 auto; font-weight: bold; margin-top: 5px;"></asp:Label>

                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>

            </div>

            <div class="row fields">
                <div class="col-sm-4">
                    <h4>
                        <b>Location Preference</b></h4>
                    <asp:Label ID="lblCity" runat="server" class="label" Style="line-height: 1.7; text-align: left;">
                    </asp:Label>
                </div>
                <div class="col-sm-4">
                    <h4>
                        <b>Planning to Start</b></h4>
                    <asp:Label ID="lblUrgency" runat="server" class="label" Style="line-height: 1.7; text-align: left;">
                    </asp:Label>
                </div>

                <div class="col-sm-4">
                    <h4>
                        <b>Duration</b></h4>
                    <asp:Label ID="lblDurationProject" runat="server" class="label" Style="line-height: 1.7; text-align: left;">
                    </asp:Label>
                </div>

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
                    <asp:Label ID="lblSkill" runat="server" class="label" Style="text-align: left;">
                    </asp:Label>
                </div>

            </div>

            <div class="row fields">

                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-question-circle fa-x"></i><b>Query For Partner</b></h4>
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
                        <i class="fa fa-fw fa-lightbulb-o fa-x"></i><b>Benchkart Remarks
                        </b></h4>
                    <h5 style="font-weight: normal;">(100% Benchkart point of view based on discussion with customer and may differ)</h5>
                    <asp:Label ID="lblRemarks" runat="server" class="label">
                    </asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h1 style="font-size: large; text-align: center; color: gray;">
                        <b>Submit Bid</b>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h5 style="font-weight: normal; line-height: 1.5;">For any queries on this project write an email to: <a href="mailto:outsource@benchkart.com" style="color: blue;">outsource@benchkart.com</a> with project title in subject.</h5>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-bullseye fa-x"></i><b>Bid Amount (INR)</b></h4>
                    <asp:TextBox ID="txtBid" runat="server" class="form-control" Style="margin-left: 40px;" MaxLength="8" ValidationGroup="SubmitBid" Width="40%">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtxtBid" Display="Dynamic" ForeColor="Red" ValidationGroup="SubmitBid"
                        runat="server" ControlToValidate="txtBid" Text="Please fill bid amount" ErrorMessage="Bid amount empty"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regtxtBid" ControlToValidate="txtBid" runat="server" ForeColor="Red"
                        Display="Dynamic" ValidationGroup="SubmitBid" ErrorMessage="Only numbers allowed"
                        ValidationExpression="\d+">
                    </asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-pencil-square-o fa-x"></i><b>Estimation(Solution Approach, Timeframe, Cost Breakup etc)</b></h4>
                    <asp:TextBox ID="txtExecution" runat="server" TextMode="MultiLine" Height="250px" Placeholder="Do not share CONTACT DETAILS here"
                        ValidationGroup="SubmitBid" class="form-control bids" MaxLength="1000">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtxtExecution" Display="Dynamic" ForeColor="Red"
                        ValidationGroup="SubmitBid" runat="server" ControlToValidate="txtExecution" Text="Estimation Required"
                        ErrorMessage="Estimation Required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h4>
                        <i class="fa fa-fw fa-arrows-alt fa-x"></i><b>Any Similar Experience or Expertise details</b></h4>
                    <asp:TextBox ID="txtExperience" runat="server" TextMode="MultiLine" Height="120px"
                        class="form-control bids">
                    </asp:TextBox>
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
                <div class="col-sm-12">
                    <asp:Button ID="btnPostBid" runat="server" ValidationGroup="SubmitBid" Text="SUBMIT"
                        class="form-control" Style="width: 80%; background: #18D26E; display: block; color: White; margin: 0 auto; margin-top: 30px; margin-bottom: 30px; height: 35px; font-size: medium; text-align: center; text-decoration: none; font-weight: bold;"
                        OnClick="btnPostBid_Click"></asp:Button><br />
                </div>
            </div>
            <!-- Card -->
        </div>
    </div>

</asp:Content>

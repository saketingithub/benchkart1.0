<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project_Details.aspx.cs" MasterPageFile="~/Customer/Site1.Master" Inherits="Benchkart.Customer.Project_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<script>
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
            font-weight: normal;
            margin-top: 0px;
            line-height: 1.5;
            color: gray;
            margin-left: 25px;
        }
        .container {
            width: 90%;
        }

        @media (max-width: 799px) {
            .container {
                width: 95%;
            }
            .label {
                font-size: 15px;
                /*margin-left: 5px;
                margin-bottom: 10px;*/
            }
            .row {
                margin-bottom: 0px;
            }
            .col-sm-4, .col-sm-8, .col-sm-6, .col-sm-9
            {
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
                    <asp:Label ID="lblTitle" runat="server" class="label">
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
                        <i class="fa fa-fw fa-money fa-x"></i><b>Budget (INR) & (USD)</b></h4>
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
                    <asp:Label ID="lblUrgency" runat="server" class="label" Style="line-height: 1.7; text-align: left; margin-left: 0px;">
                    </asp:Label>
                </div>

                <div class="col-sm-4">
                    <h4>
                        <b>Duration</b></h4>
                    <asp:Label ID="lblDurationProject" runat="server" class="label" Style="line-height: 1.7; text-align: left; margin-left: 0px;">
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
                    <asp:Label ID="lblSkill" runat="server" class="label" style="text-align: left;">
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

          
            <!-- Card -->
        </div>
    </div>

</asp:Content>

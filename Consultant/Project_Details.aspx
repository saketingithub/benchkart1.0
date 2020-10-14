<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project_Details.aspx.cs" Inherits="Benchkart.Consultant.Project_Details" %>

<%@ Register Src="~/Consultant/ucConsultantHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- Required meta tags -->
    <meta charset='utf-8'>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="IT Shared Services" />
    <title>benchkart - marketplace for outsourcing</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
    <script src="../Scripts/Custom.js"></script>
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
            margin-left: 0px;
            word-break: break-all;
            display: inline-flex;
            white-space: pre-wrap;
            text-align: left;
        }

        .label2 {
            font-size: medium;
            font-weight: normal;
            margin-top: 0px;
            line-height: 1;
            color: gray;
            margin-left: 25px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server" height="none" style="margin-bottom: 5px;">

        <asp:HiddenField runat="server" ID="hdnPartnerId" />

        <!-- Card -->
        <div class="card" style="margin: 0 auto; background-color: White; margin-bottom: 50px; padding: 20px 0px;">
            <div class="container" style="width: 90%;">
                <div class="row fields">
                    <asp:HyperLink runat="server" ID="hplBack" NavigateUrl="~/Consultant/Projects.aspx" Text="Back to Projects" Style="text-decoration: underline; text-align: center;"></asp:HyperLink>
                </div>
                <div class="row" style="margin-bottom: 0px;">
                    <div class="col-sm-12">
                        <h1 style="font-size: x-large; text-align: center; color: gray;">
                            <b>Project Details</b>
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
                <div class="row fields">
                    <div class="col-sm-4">
                        <h4>
                            <i class="fa fa-fw fa-calendar fa-x"></i><b>Date</b></h4>
                        <asp:Label ID="lblCreationDate" runat="server" class="label">
                        </asp:Label>
                    </div>
                    <div class="col-sm-8">
                        <h4>
                            <i class="fa fa-fw fa-money fa-x"></i><b>Budget (INR) &(USD)</b></h4>
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
                            <i class="fa fa-fw fa-question-circle fa-x"></i><b>Benchkart comments</b></h4>
                        <asp:Label ID="lblBenchkartComments" runat="server" class="label" Style="line-height: 1.7; text-align: left;">
                        </asp:Label>
                    </div>
                </div>
                <div class="row fields">

                    <div class="col-sm-12">
                        <h4>
                            <i class="fa fa-fw fa-question-circle fa-x"></i><b>Consultant comments history</b></h4>
                        <asp:Label ID="lblConsultantComment" runat="server" class="label" Style="line-height: 1.7; text-align: left;">
                        </asp:Label>
                    </div>
                </div>
                 <div class="row fields">

                    <div class="col-sm-12">
                        <h4>
                            <i class="fa fa-fw fa-question-circle fa-x"></i><b>Consultant comments</b></h4>
                        <asp:TextBox ID="txtconsultantcomments" runat="server" TextMode="MultiLine" CssClass="form-control" style="height:100px;" >
                        </asp:TextBox>
                    </div>
                </div>
                <div class="row fields">

                    <div class="col-sm-12">
                        
                           <asp:Button ID="btnsubmit" runat ="server" Text ="Submit Comments" OnClick="btnsubmit_Click" CssClass="btn btn-success btn-lg form-control" />
                       
                           
                        
                    </div>
                </div>

                <!-- Card -->
            </div>
        </div>

    </form>
</body>
</html>

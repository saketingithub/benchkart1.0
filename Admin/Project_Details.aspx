<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project_Details.aspx.cs" Inherits="Benchkart.Admin.Project_Details" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
     <script src="../Scripts/Custom.js"></script>
    <style>
        i
        {
            font-weight: bold;
            font-size: small;
            margin-top: 0px;
            color: Gray;
            float: left;
            margin-right: 10px;
        }
        h4
        {
            font-weight: bold;
            font-size: small;
            margin-top: 20px;
            color: Black;
        }
        .label
        {
            color: Black;
            font-size: medium;
            font-weight: normal;
            width: 100%;
            word-break: break-all;
            display: inline-flex;
            white-space: pre-wrap;
            margin-left: 40px;
        }
        
        .card
        {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
        }
        
        .card:hover
        {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }
        
        .container
        {
            padding: 2px 16px;
        }
        
        @media (max-width: 799px)
        {
            .card
            {
                width: 90%;
            }
        }
        @media (min-width: 800px)
        {
            .card
            {
                width: 60%;
            }
        }
    </style>
    
</head>
<body style="background-color: #18D26E;">
    <form id="form1" runat="server">
    
    <div>
        <!-- Card -->
        <div class="card" style="margin: 0 auto; background-color: White; margin-bottom: 50px;">
            <div class="container" style="width: 90%;">
                <div class="row">
                    <div class="col-lg-12">
                       <asp:Label ID="lblNextProject" runat="server" Visible="false" ForeColor="#18D26E" Text="Congratulations! Your bid successfully submitted. Here is a new project for bidding."></asp:Label>
                        <h1 style="font-size: x-large; margin-left: 30%;">
                            <i class="fa fa-fw fa-send fa-x" style="color: #F79507;"></i><b>Project Details</b>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-flag fa-2x" style="color: #18D26E;"></i><b>Project title</b></h4>
                        <asp:Label ID="lblTitle" runat="server" CssClass="label">
                        </asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-flag fa-2x" style="color: #18D26E;"></i><b>Date</b></h4>
                        <asp:Label ID="lblCreationDate" runat="server" class="label" >
                        </asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-cog fa-2x" style="color: #18D26E;"></i><b>Service Category</b></h4>
                        <asp:Label ID="lblCategory" runat="server" class="label">
                        </asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-cogs fa-2x" style="color: #18D26E;"></i><b>Service SubCategory</b></h4>
                        <asp:Label ID="lblSubCategory" runat="server" class="label">
                        </asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-industry fa-2x" style="color: #18D26E;"></i><b>Industry</b></h4>
                        <asp:Label ID="lblIndustry" runat="server" class="label">
                        </asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-info-circle fa-2x" style="color: #18D26E;"></i><b>About Customer
                                Company</b></h4>
                        <asp:Label ID="lblAboutCompany" runat="server" class="label">
                        </asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-clipboard fa-2x" style="color: #18D26E;"></i><b>Description</b></h4>
                        <asp:Label ID="lblDescription" runat="server" class="label">
                        </asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-thumb-tack fa-2x" style="color: #18D26E;"></i><b>SkillRequired</b></h4>
                        <asp:Label ID="lblSkill" runat="server" class="label">
                        </asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-wrench fa-2x" style="color: #18D26E;"></i><b>Type Of Work</b></h4>
                        <asp:Label ID="lblTypeofWork" runat="server" class="label">
                        </asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-question-circle fa-2x" style="color: #18D26E;"></i><b>QueryForPartner</b></h4>
                        <asp:Label ID="lblQuery" runat="server" class="label">
                        </asp:Label>
                    </div>
                </div>
                <div class="row">
                    <asp:Panel runat="server" ID="pnlTalent">
                        <div class="col-lg-3">
                            <h4>
                                <i class="fa fa-fw fa-user fa-2x" style="color: #18D26E;"></i><b>Talent Count</b></h4>
                            <asp:Label ID="lblTalentCount" runat="server" class="label">
                            </asp:Label>
                        </div>
                        <div class="col-lg-3">
                            <h4>
                                <i class="fa fa-fw fa-user fa-2x" style="color: #18D26E;"></i><b>Work Mode</b></h4>
                            <asp:Label ID="lblWorkMode" runat="server" class="label">
                            </asp:Label>
                        </div>
                        <div class="col-lg-3">
                            <h4>
                                <i class="fa fa-fw fa-user fa-2x" style="color: #18D26E;"></i><b>Onsite Location</b></h4>
                            <asp:Label ID="lblOnsiteLocation" runat="server" class="label">
                            </asp:Label>
                        </div>
                        <div class="col-lg-3">
                            <h4>
                                <i class="fa fa-fw fa-binoculars fa-2x" style="color: #18D26E;"></i><b>Talent Proficiency</b></h4>
                            <asp:Label ID="lblTalentProficiency" runat="server" class="label">
                            </asp:Label>
                            <h4>
                                <i class="fa fa-fw fa-calendar fa-2x" style="color: #18D26E;"></i><b>Duration</b></h4>
                            <asp:Label ID="lblDuration" runat="server" class="label">
                            </asp:Label>
                        </div>
                    </asp:Panel>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <h4>
                            <i class="fa fa-fw fa-money fa-2x" style="color: #18D26E;"></i><b>Budget</b></h4>
                        <asp:Label ID="lblBudget" runat="server" class="label">
                        </asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <h4>
                            <b>Budget Type</b></h4>
                        <asp:Label ID="lblBudgetType" class="label" Text='<%# Eval("BudgetType").ToString() == "1" ? "Fixed" : "Per Hour" %>'
                                                    runat="server" />
                    </div>
                </div>
            
                <div class="row">
                    
                    <div class="col-lg-12">
                        <asp:LinkButton ID="btnPostBid" runat="server"  Text="Back"
                            class="form-control" Style="background: Green; display: block; color: White;
                            margin: 0 auto; margin-top: 30px; margin-bottom: 30px; height: 35px; font-size: medium;
                            text-align: center; text-decoration: none;" OnClick="btnPostBid_Click" >
                                                        <span class="fa fa-fw fa-send"></span>&nbsp;&nbsp;Back</asp:LinkButton><br />
                    </div>
                </div>
                <!-- Card -->
            </div>
        </div>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Partner_Details.aspx.cs" Inherits="Benchkart.Admin.Partner_Details" %>

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
        h4 {
            margin-top: 25px;
            font-size: small;
            font-weight: bold;
        }

        td {
            padding-left: 20px;
        }

        .label {
            font-size: medium;
            color: Black;
            font-weight: normal;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        li {
            float: left;
        }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

                li a:hover:not(.active) {
                    background-color: #111;
                }

        .active {
            background-color: #4CAF50;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server" height="none" style="margin-bottom:5px;">
       
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div style="font-size: 20px; font-weight: bold; color: Black; height: 60px; background-color: #1d4354; margin-top: 0px;">
            <div style="color: White; float: left; padding: 20px;">
                BenchKart
            </div>
            <div style="float: right;">
                <asp:Label runat="server" ID="lblConsultantEmail" CssClass="label" ForeColor="White"
                    styel="padding: 20px;"></asp:Label>
            </div>
        </div>
        <div class="container">
            <div class ="row" style="text-align:center;">
                <div class ="form-group">
                    <h3>Partner Details</h3>
                </div>
            </div>
          
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class="col-lg-3">
                       <b> PartnerId</b>
                        <br />
                        <asp:Label ID="lblPartnerId" runat ="server"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                       
                           <b> Full Name</b>
                           <br />
                                <asp:Label ID="lblFullName"  runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                          <b>  Email</b>
                           <br />
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                         <b>   Contact Number</b>
                           <br />
                                <asp:Label ID="lblContactNumber" runat="server"></asp:Label>

                       
                    </div>
                   

                </div>
            </div>
              <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class ="col-lg-3">
                        <b>  Company Name</b>
                            <br />
                                <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                       
                           <b> Password</b>
                           <br />
                                <asp:Label ID="lblPassword"  runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                           <b> CompanyIndustry</b>
                           <br />
                                <asp:Label ID="lblCompanyIndustry" runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                         <b>   Company Profile</b>
                           <br />
                                <asp:Label ID="lblCompanyProfile" runat="server"></asp:Label>

                       
                    </div>
                  
                </div>
            </div>  
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class ="col-lg-3">
                         <b> Company Address</b>
                            <br />
                                <asp:Label ID="lblAddress"  runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                       
                         <b>   Company GST Number</b>
                           <br />
                                <asp:Label ID="lblCompanyGSTNumber"  runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                         <b>   Employee Count</b>
                           <br />
                                <asp:Label ID="lblEmployeeCount" runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                          <b>  Company Website</b>
                           <br />
                                <asp:Label ID="lblWebsite" runat="server"></asp:Label>

                       
                    </div>
                  
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class ="col-lg-3">
                         <b> Company LogoName</b>
                            <br />
                                <asp:Label ID="lblLogoName" runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                       
                         <b>   CreationDate</b>
                           <br />
                                <asp:Label ID="lblCreationDate"  runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                        <b>    Other Services</b>
                           <br />
                                <asp:Label ID="lblOtherServices" runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                          <b>  Other Technologies</b>
                           <br />
                                <asp:Label ID="lblOtherTechnologies" runat="server"></asp:Label>

                       
                    </div>
                  
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class ="col-lg-3">
                         <b> Bench Talent</b>
                            <br />
                                <asp:Label ID="lblBenchTalent" runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                       
                          <b>  Reviewed</b>
                           <br />
                                <asp:Label ID="lblReviewed"  runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                         <b>   Company Title</b>
                           <br />
                                <asp:Label ID="lblCompanyTitle" runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                         <b>   IsTalentAvailable</b>
                           <br />
                                <asp:Label ID="lblIsTalentAvailable" runat="server"></asp:Label>

                       
                    </div>
                  
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class ="col-lg-3">
                         <b> Services</b>
                            <br />
                                <asp:Label ID="lblServices" runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                       
                          <b>  Location</b>
                           <br />
                                <asp:Label ID="lblLocation"  runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                           <b> Company Started</b>
                           <br />
                                <asp:Label ID="lblCompanyStarted" runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                        <b>    DescribedAs</b>
                           <br />
                                <asp:Label ID="lblDescribedAs" runat="server"></asp:Label>

                       
                    </div>
                  
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class ="col-lg-3">
                         <b>  Company Type</b>
                           <br />
                                <asp:Label ID="lblCompanyType" runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                       
                          <b>  ClientFrom</b>
                           <br />
                                <asp:Label ID="lblClientFrom"  runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                          <b>  PricePositioning</b>
                           <br />
                                <asp:Label ID="lblPricePositioning" runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                           <b> Customer Segment</b>
                           <br />
                                <asp:Label ID="lblCustomerSegment" runat="server"></asp:Label>

                       
                    </div>
                  
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class ="col-lg-3">
                        <b>  PrimarySourceOfRevenue</b>
                            <br />
                                <asp:Label ID="lblPrimarySourceOfRevenue" runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                       
                        <b>    MinimumProjectValue</b>
                           <br />
                                <asp:Label ID="lblMinimumProjectValue"  runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                         <b>   RepresentativeName</b>
                           <br />
                                <asp:Label ID="lblRepresentativeName" runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                          <b>  RepresentativeContact</b>
                           <br />
                                <asp:Label ID="lblRepresentativeContact" runat="server"></asp:Label>

                       
                    </div>
                  
                </div>
            </div>
              <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class ="col-lg-3">
                       <b>   RepresentativeLoginEmail</b>
                            <br />
                                <asp:Label ID="lblRepresentativeLoginEmail" runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                       
                         <b>   CompanyCity</b>
                           <br />
                                <asp:Label ID="lblCompanyCity"  runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                           <b> Status</b>
                           <br />
                                <asp:DropDownList ID="ddlStatus" Enabled="false"  runat="server">
                                    <asp:ListItem Value ="0">InComplete</asp:ListItem>
                                     <asp:ListItem Value="1" > Pending</asp:ListItem>
                        <asp:ListItem Value="2">Approved</asp:ListItem>
                       
                                </asp:DropDownList>

                        
                    </div>
                   
                  
                </div>
            </div>
            
          
         
            
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class="col-lg-12">
                      <b>  Status Comment</b>
                       
                            <asp:TextBox ID="txtStatusComment" ReadOnly ="true" runat="server"  TextMode="MultiLine" Width="100%"></asp:TextBox>

                    </div>
                </div>
            </div>
            <div class ="row" style ="text-align :center; margin-top :10px;">
                <div class ="form-group ">
                    <div class ="col-lg-12">
                        <asp:Button ID="btncancel" runat ="server" Text ="Cancel" OnClick="btncancel_Click" CssClass="btn btn-warning btn-lg form-control" />
                    </div>
                   
                </div>
            </div>
        </div>
         
    </form>
</body>
</html>

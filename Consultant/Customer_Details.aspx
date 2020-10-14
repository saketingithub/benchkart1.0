<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Details.aspx.cs" Inherits="Benchkart.Consultant.Customer_Details" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="IT Shared Services" />
    <title>benchkart - Customer Details</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
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

    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/style4.css" rel="stylesheet" />
    
    <style>
        .bidfield
        {
            margin-top: 10px;
            text-align: left;
            font-size: medium;
            margin-bottom: 5px;
            font-weight: bold;
            color: Black;
        }
        i
        {
            font-weight: bold;
            font-size: small;
            margin-top: 0px;
            float: left;
            margin-right: 10px;
        }
        h3
        {
            font-weight: bold;
            font-size: medium;
            color: Gray;
            margin: 0 auto;
            margin-bottom: 5px;
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
        h4
        {
            font-size: large;
            margin-top: 10px;
            color: Black;
        }
    </style>
    <style>
        /* Add responsiveness - will automatically display the navbar vertically instead of horizontally on screens less than 500 pixels */
        @media screen and (max-width: 800px)
        {
            .navbar a
            {
                float: none;
                display: block;
            }
            
            #divAccept
            {
                margin-top: 40px;
            }
        }
    </style>
    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#tblProjects').footable();
        });
    </script>--%>
</head>
<body style="background-color: #ededed;">
    <form id="form1" runat="server">
          
          

            <!-- Page Content  -->
            <div id="content" style="padding: 0px;">
              

    <!-- Card -->
    <div class="card" style="margin: 0 auto; background-color: White; padding-bottom: 50px; width: 75%;">
        <div class="container" style="width: 80%;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 style="font-size: 2em; text-align: center; font-weight: bold; margin-bottom: 20px;">
                        Profile Details
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class ="bidfield">
                    <h3>Full Name</h3>
                    <h4>
                        <asp:Label ID="lblFullName" runat ="server" ></asp:Label>
                    </h4>
                </div>
                    </div>
                <div class ="col-lg-6">
                    <div class ="bidfield">
                        <h3>
                            EmailID
                        </h3>
                        <h4>
                            <asp:Label ID="lblEmailId" runat ="server" ></asp:Label>
                        </h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class ="col-lg-6">
                    <div class ="bidfield">
                        <h3>
                            Contact Number
                        </h3>
                        <h4>
                            <asp:Label ID="lblContactNumber" runat ="server" ></asp:Label>
                        </h4>
                    </div>
                </div>
                <div class ="col-lg-6">
                    <div class ="bidfield">
                      <h3>
                            Creation Date</h3>
                        <h4>
                            <asp:Label ID="lblCreationDate" runat ="server" ></asp:Label>

                        </h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="bidfield">
                        <h3>
                            Company Name</h3>
                        <h4>
                            <asp:Label ID="lblCompanyName" runat ="server"></asp:Label>
                            </h4>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="bidfield">
                        <h3>
                            Company Industry</h3>
                        <h4>
                           <%-- <asp:DropDownList ID="ddlCompanyIndustry" runat ="server" >
                                 <asp:ListItem Value="0">Select Company Industry</asp:ListItem>
                                            <asp:ListItem Value="advertising-and-pr">Advertising & PR</asp:ListItem>
                                            <asp:ListItem Value="construction-renovation">Construction Renovation</asp:ListItem>
                                            <asp:ListItem Value="digital-marketing">Digital Marketing</asp:ListItem>
                                            <asp:ListItem Value="ecommerce">Ecommerce</asp:ListItem>
                                            <asp:ListItem Value="education">Education</asp:ListItem>
                                            <asp:ListItem Value="energy">Energy</asp:ListItem>
                                            <asp:ListItem Value="entertainment">Entertainment</asp:ListItem>
                                            <asp:ListItem Value="financial-services">Financial Services</asp:ListItem>
                                            <asp:ListItem Value="food-beverage">Food &amp; Beverage</asp:ListItem>
                                            <asp:ListItem Value="game-dev-support">Game Dev & Support</asp:ListItem>
                                            <asp:ListItem Value="government">Government</asp:ListItem>
                                            <asp:ListItem Value="hardware-tech-it">Hardware Tech/IT</asp:ListItem>
                                            <asp:ListItem Value="health-care">Healthcare</asp:ListItem>
                                            <asp:ListItem Value="hospitality">Hospitality</asp:ListItem>
                                            <asp:ListItem Value="legal">Legal</asp:ListItem>
                                            <asp:ListItem Value="manufacturing">Manufacturing</asp:ListItem>
                                            <asp:ListItem Value="media-publishing">Media Publishing</asp:ListItem>
                                            <asp:ListItem Value="non-profit">Non Profit</asp:ListItem>
                                            <asp:ListItem Value="pharmaceutical">Pharmaceutical</asp:ListItem>
                                            <asp:ListItem Value="public-utilities">Public Utilities</asp:ListItem>
                                            <asp:ListItem Value="real-estate">Real Estate</asp:ListItem>
                                            <asp:ListItem Value="recruiting-staffing">Recruiting Staffing</asp:ListItem>
                                            <asp:ListItem Value="retail">Retail</asp:ListItem>
                                            <asp:ListItem Value="software-tech-it">Software Tech/IT</asp:ListItem>
                                            <asp:ListItem Value="telecoms">Telecoms</asp:ListItem>
                                            <asp:ListItem Value="transportation">Transportation</asp:ListItem>
                                            <asp:ListItem Value="travel">Travel</asp:ListItem>
                                            <asp:ListItem Value="other">Other sector</asp:ListItem>
                            </asp:DropDownList>--%>
                            <asp:Label ID="lblCompanyIndustry" runat ="server" ></asp:Label>
                           </h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class ="col-lg-6">
                <div class ="bidfield ">
                    <h3>
                        Company Profile
                    </h3>
                    <h4>
                        <asp:Label ID="lblCompanyProfile" runat ="server" CssClass="label" ></asp:Label>
                    </h4>
                </div>
                    </div>
                <div class ="col-lg-6">
                    <div class ="bidfield">
                        <h3>
                            Company Address
                        </h3>
                        <h4>
                            <asp:Label ID="lblCompanyAddress" runat ="server" ></asp:Label>
                        </h4>
                    </div>
                </div>
            </div>
            <div class ="row">
                <div class ="col-lg-6">
                    <div class="bidfield">
                        <h3>
                            Company GST Number
                        </h3>
                        <h4>
                            <asp:Label ID="lblCompanyGSTNumber" runat ="server" ></asp:Label>
                        </h4>
                    </div>
                </div>
                <div class ="col-lg-6">
                    <div class ="bidfield">
                        <h3>
                            EmployeeCount
                        </h3>
                        <h4>
                            <asp:Label ID="lblEmployeeCount" runat ="server" ></asp:Label>
                        </h4>
                    </div>
                </div>
            </div>
            <div class ="row">
                <div class ="col-lg-6">
                    <div class ="bidfield">
                        <h3>
                            Website
                        </h3>
                        <h4>
                            <asp:Label ID="lblWebsite" runat ="server" >
                            </asp:Label>
                        </h4>
                    </div>
                </div>
                <div class ="col-lg-6">
                    <div class ="bidfield">
                     <h3>
                            Modification Date</h3>
                        <h4>
                            <asp:Label ID="lblModificationDate" runat ="server" ></asp:Label>
                        </h4>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-6">
                    <div class="bidfield">
                        <h3>
                             Company Link</h3>
                        <h4>
                        <asp:Label ID="lblCompanyLink" runat ="server" ></asp:Label>   
                        </h4>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="bidfield">
                        <h3>
                            Company Type

                        </h3>
                        <h4>
                      <%--  <asp:DropDownList ID="ddlCompanyType" runat ="server" >
                              <asp:ListItem Value="0">Select CompanyType</asp:ListItem>
                                            <asp:ListItem Value="1">MNC</asp:ListItem>
                                            <asp:ListItem Value="2">Medium</asp:ListItem>
                                            <asp:ListItem Value="3">Large</asp:ListItem>
                                            <asp:ListItem Value="4">Small</asp:ListItem>
                                            <asp:ListItem Value="5">Startup</asp:ListItem>
                        </asp:DropDownList> --%> 
                            <asp:Label ID="lblCompanyType" runat ="server" ></asp:Label>
                            
                        </h4>
                    </div>
                </div>
            </div>
         
            <div class="row">
                <div class ="col-lg-12">
              <asp:Button ID="btnBack" runat ="server" Text ="Back" OnClick="btnBack_Click" CssClass="btn btn-primary btn-lg form-control "  />
                    </div>
               
            </div>
            
        </div>
    </div>
    <!-- Card -->
 </div>
      
        <script src="../Scripts/popper.js"></script>
        <script src="../Scripts/main.js"></script>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>

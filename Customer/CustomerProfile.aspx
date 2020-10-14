<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="CustomerProfile.aspx.cs" MasterPageFile="~/Customer/Site1.Master" Inherits="Benchkart.Customer.CustomerProfile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
            margin-top: 30px;
            color: gray;
            font-size: 1.6em;
        }
    </style>
    <style>
        /* Add responsiveness - will automatically display the navbar vertically instead of horizontally on screens less than 500 pixels */
        @media screen and (max-width: 900px) {
            .navbar a {
                float: none;
                display: block;
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
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Content  -->
    <div id="content" style="padding: 0px;">

        <asp:Panel ID="pnlSearchingProjects" runat="server" Visible="false" Style="text-align: center; height: 200px; margin: 0 auto; padding: 20px;">
            <h2 style="margin-top: 100px;">We are searching for projects as per your company services.
                    <br />
                Please update your all services if not already done.</h2>
        </asp:Panel>

        <!-- Card -->
        <div class="card" style="margin: 0 auto; background-color: White; padding-bottom: 50px; width: 90%;">
            <div class="container" style="width: 80%; margin-top: 20px;">
                <div class="row">
                    <div class="col-sm-12">
                        <h1 style="text-align: center; font-weight: bold; margin-bottom: 0px; margin-top: 30px;">Profile Details
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:HyperLink ID="hplResetPassword" runat="server" Text="Reset Password" NavigateUrl="~/Customer/ResetPassword" style="float: right; color: blue; text-decoration: underline;"></asp:HyperLink>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="bidfield">
                            <h3>Full Name</h3>
                            <h4>
                                <asp:TextBox ID="txtFullName" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtFullName" runat="server" SetFocusOnError="True"
                                    Display="Dynamic" ControlToValidate="txtFullName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill"
                                    ToolTip="Please fill" ValidationGroup="Profile"></asp:RequiredFieldValidator>
                            </h4>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="bidfield">
                            <h3>Email
                            </h3>
                            <h4>
                                <asp:TextBox ID="txtEmailId" runat="server" class="form-control"></asp:TextBox>
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="bidfield">
                            <h3>Contact Number
                            </h3>
                            <h4>
                                <asp:TextBox ID="txtContactNumber" MaxLength="20" oncopye="return false" onpaste="return false" class="form-control"
                                    oncute="return false" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtContactNumber" runat="server" SetFocusOnError="True"
                                    Display="Dynamic" ControlToValidate="txtContactNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill"
                                    ToolTip="Please fill" ValidationGroup="Profile"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regtxtContactNumber" runat="server" ErrorMessage="Invalid phone - accept only 10 digit mobile number"
                                SetFocusOnError="True" ControlToValidate="txtContactNumber" ValidationExpression="^[0-9]{10}$"
                                ForeColor="Red" Font-Size="Small" ValidationGroup="Profile" Display="Dynamic" />
                            </h4>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="bidfield">
                            <h3>Company Name</h3>
                            <h4>
                                <asp:TextBox ID="txtCompanyName" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtCompanyName" runat="server" SetFocusOnError="True"
                                    Display="Dynamic" ControlToValidate="txtCompanyName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill"
                                    ToolTip="Please fill" ValidationGroup="Profile"></asp:RequiredFieldValidator>
                            </h4>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="bidfield">
                            <h3>Company Industry</h3>
                            <h4>
                                <asp:DropDownList ID="ddlCompanyIndustry" runat="server" class="form-control">
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
                                </asp:DropDownList>
                                <%-- <asp:TextBox ID="txtCompanyIndustry" runat ="server" ></asp:TextBox>--%>
                            </h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="bidfield ">
                                <h3>Company Profile
                                </h3>
                                <h4>
                                    <asp:TextBox ID="txtCompanyProfile" runat="server" CssClass="form-control" TextMode="MultiLine" Height="100px"></asp:TextBox>
                                </h4>
                            </div>
                        </div>
                    </div>

                </div>
                <%--   <div class="row">
              
                <div class ="col-sm-6">
                    <div class ="bidfield">
                        <h3>
                            State
                        </h3>
                        <h4>
                            <asp:DropDownList ID="ddlState" runat ="server" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" ></asp:DropDownList>
                        </h4>
                    </div>
                </div>
                <div class ="col-sm-6">
                    <div class ="bidfield">
                        <h3>
                            Cities
                        </h3>
                        <h4>
                            <asp:DropDownList ID="ddlCities" runat ="server" ></asp:DropDownList>
                        </h4>
                    </div>
                </div>
            </div>--%>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="bidfield">
                            <h3>Company GST Number
                            </h3>
                            <h4>
                                <asp:TextBox ID="txtCompanyGSTNumber" class="form-control" runat="server"></asp:TextBox>
                            </h4>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="bidfield">
                            <h3>Employee Count
                            </h3>
                            <h4>
                                <asp:TextBox ID="txtEmployeeCount" class="form-control" oncopye="return false" onpaste="return false" MaxLength="10"
                                    oncute="return false" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer value')" runat="server"></asp:TextBox>
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="bidfield">
                            <h3>Website
                            </h3>
                            <h4>
                                <asp:TextBox ID="txtWebsite" CssClass="form-control" runat="server">
                                </asp:TextBox>
                            </h4>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="bidfield">
                            <h3>Company Link</h3>
                            <h4>
                                <asp:TextBox ID="txtCompanyLink" runat="server" class="form-control"></asp:TextBox>
                            </h4>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="bidfield">
                            <h3>Company Type

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
                                <asp:TextBox ID="txtCompanyType" runat="server" class="form-control"></asp:TextBox>

                            </h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="fieldtitle">
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary " Width="100%" OnClick="btnEdit_Click" />
                        </div>
                    </div>
                    <div class="fieldtitle">
                        <div class="col-sm-6">
                            <asp:Button ID="btnsave" runat="server" Text="Submit" ValidationGroup="Profile" Width="100%" CssClass="btn btn-success " OnClick="btnsave_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Card -->
    </div>

</asp:Content>

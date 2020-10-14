<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project_Bids.aspx.cs" Inherits="Benchkart.Consultant.Project_Bids" %>

<%@ Register Src="~/Consultant/ucConsultantHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="IT Shared Services" />
    <title>benchkart - marketplace for outsourcing</title>
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
    <link href="../css/partner.css" rel="stylesheet" />

    <style>
        h4 {
            font-size: medium;
            font-weight: normal;
            margin-top: 0px;
            line-height: 1;
        }

        h5 {
            font-weight: bold;
            color: gray;
            line-height: 1;
        }

        .label {
            font-size: medium;
            font-weight: normal;
            margin-top: 0px;
            line-height: 2;
            color: black;
            margin-left: 0px;
            text-align: left;
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
        <div>
            <uc1:ucHeader runat="server" ID="ucHeader" />
        </div>
        <!-- Page Content  -->
        <div id="content" style="padding: 0px;">
            <div class="col-lg-12">
                <h3 style="text-align: right; color: #F79507; margin-right: 15%; margin-bottom: 20px;">
                    <asp:HyperLink ID="lkbBackBids" runat="server" Text="Back to Projects" NavigateUrl="~/Consultant/Projects.aspx"></asp:HyperLink>

                </h3>
            </div>
            <asp:Panel ID="pnlSearchingProjects" runat="server" Visible="false" Style="text-align: center; height: 200px; margin: 0 auto; padding: 20px;">
                <h2 style="margin-top: 100px;">We are searching for projects as per your company services.
                    <br />
                    Please update your all services if not already done.</h2>
            </asp:Panel>

            <div style="margin-bottom: 70px; margin-top: 70px;">
                <asp:ListView ID="lstBids" runat="server">
                    <ItemTemplate>
                        <div class="container" style="padding: 15px; background-color: White; border-radius: 5px; width: 70%; margin: 0 auto; margin-top: 30px;">
                            <div class="row">
                                <div class="col-sm-3">
                                </div>
                                <div class="col-sm-7">
                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title")%>' Style="font-weight: bold; color: #F79507; font-size: large;"></asp:Label>
                                </div>
                                <div class="col-sm-2">
                                </div>
                            </div>
                            <div class="row" style="position: relative;">
                                <div class="col-sm-3">
                                    <div id="divImage" class="divImage" style="text-align: center; margin-bottom: 10px;">
                                        <asp:Image runat="server" Width="80px" Height="80px" ImageUrl="~/Images/company_logo.jpg"
                                            Style="border-radius: 50%; margin-right: 10px; border: 1px solid lightgray;" />
                                    </div>
                                    <div class="divField">
                                        <h3>Company Representative
                                        </h3>
                                        <asp:Label ID="lblPocName" runat="server" Text='<%# Eval("PocFullName")%>'></asp:Label>
                                    </div>
                                    <div class="divField">
                                        <h3>Company Name
                                        </h3>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("CompanyName")%>'></asp:Label>
                                    </div>
                                </div>
                                <div class="col-sm-7">
                                    <div class="fieldtitle">
                                    </div>
                                    <div class="bidfield">
                                        Our execution approach
                                    </div>
                                    <asp:Label ID="Label4" CssClass="label" runat="server" Text='<%# Eval("ExecutionRemarks")%>'></asp:Label>
                                    <div class="bidfield">
                                        Our similar experience
                                    </div>
                                    <asp:Label ID="lblExperience" runat="server" Text='<%# Eval("Experience")%>'></asp:Label>

                                    <div class="bidfield">
                                        Price
                                    </div>
                                    INR&nbsp;<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("BidAmount")%>'></asp:Label>
                                    <%-- <asp:Label ID="Label1" runat="server" Text='<%# Eval("PaymentType")%>'></asp:Label>--%>
                                    <div class="bidfield">
                                        Approved Status
                                    </div>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Convert.ToInt32(Eval("BidStatus").ToString())==0 ? "Default(New)":Convert.ToInt32(Eval("BidStatus").ToString())==1 ? "Approved":"Accepted" %>'></asp:Label>
                             <div class="bidfield">
                                 Call Back
                             </div>
                                    <asp:Label ID="lblGetCallBack" runat ="server" Text='<%# Eval("GetCallBack") %>'></asp:Label>
                                    </div>
                                <%-- <div class="col-sm-2">
                                   <div class="bidfield">
                                About us</div>
                            <asp:Label ID="lblAbout" runat="server" Text='<%# Eval("CompanyProfile")%>'></asp:Label>
                            <div class="bidfield">
                                Number of employees</div>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("EmployeeCount")%>'></asp:Label>
                                </div>--%>
                            </div>
                            <div class="row" style="margin-top: 30px; margin-bottom: 10px;">
                                <div class="col-sm-3">
                                </div>
                                <div class="col-sm-7">
                                    <div style="text-align: center;">
                                        <asp:HyperLink ID="hplViewDetail" class="form-control" Text="View Detail" runat="server"
                                            Visible='<%#Convert.ToInt32(Eval("BidStatus").ToString())== 2 ? false:true %>'
                                            Height="30px" Width="25%" Style="float: left; margin-right: 20px; text-align: center; text-decoration: none;"
                                            NavigateUrl='<%# String.Format("~/Consultant/Bid_Details.aspx?BidId={0}&action=ApprovaleStatus", Eval("BidId")) %>'>           
                                        </asp:HyperLink>


                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <%--<div id="divAccept">
                                <asp:Button ID="btnAccept" class="form-control" runat="server" Text="Accept Bid"
                                    OnClick="btnAccept_Click" Height="30px" />
                            </div>--%>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

                <div style="text-align: center;">
                    <asp:Label ID="lblNobids" runat="server" Visible="false" Text="Currently there are no bids"
                        Style="font-weight: bold; color: Gray; font-size: xx-large;"></asp:Label>
                </div>
            </div>
        </div>

    </form>
</body>
</html>

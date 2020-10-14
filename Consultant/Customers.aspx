<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="Benchkart.Consultant.Customers" %>

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
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#tblProjects').footable();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div style="font-size: 20px; font-weight: bold; color: Black; height: 60px; background-color: White; margin-top: 0px;">
             <div id="logo" style="float: left;">
                <h1 class="header"><a href="https://benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
            </div>
            <div style="float: right; margin-top: 20px;">
                <asp:Label runat="server" ID="lblConsultantEmail" CssClass="label" ForeColor="Gray"
                    Style="padding: 20px;"></asp:Label>
            </div>
        </div>
        <%--<div class="container">
        <asp:HiddenField runat="server" ID="ConsultantId" />
        <div class="navbar">
            <ul>
                <li><a class="active" href="Requests.aspx">Requests</a></li>
                <li><a href="ConsultantRequestList.aspx">Request List</a></li>
                <li><a href="Search.aspx">Search</a></li>
            </ul>
        </div>
    </div>--%>
        <div style="background-color: #1d4354;">
            <div style="padding: 30px;">
                <table width="90%" >
                    <tr>
                        <td>
                            <asp:HyperLink ID="hplBacktoRequests" runat="server" Text="Back to Requests" NavigateUrl="~/Consultant/Requests.aspx" ForeColor="White" style="text-decoration: underline;"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlCompanyType" OnSelectedIndexChanged="ddlCompanyType_SelectedIndexChanged" class="form-control" AutoPostBack="true" Style="width: 60%; margin: 0 auto;">
                                <asp:ListItem Value="0">All</asp:ListItem>
                                <asp:ListItem Value="1">MNC</asp:ListItem>
                                <asp:ListItem Value="2">Medium</asp:ListItem>
                                <asp:ListItem Value="3">Large</asp:ListItem>
                                <asp:ListItem Value="4">Small</asp:ListItem>
                                <asp:ListItem Value="5">Startup</asp:ListItem>

                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox runat="server" class="form-control" ID="txtContactNumber" ValidationGroup="Search"
                                Placeholder="Contact Number" Style="width: 60%; margin: 0 auto; float: right;"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ValidationGroup="Search" ID="reqtxtContactNumber"
                                ControlToValidate="txtContactNumber" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" class="form-control" ValidationGroup="Search" Text="Search" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div>
            <asp:Repeater ID="rptRequests" runat="server">
                <HeaderTemplate>
                    <table id="tblRequests"  width="90%" class="footable" border="0">
                        <thead>
                            <tr>
                                <th>Customer Id
                                </th>
                                <th style="display: table-cell;">Full Name
                                </th>
                                <th style="display: table-cell;">Email
                                </th>
                                <th style="display: table-cell;">Contact Number
                                </th>
                                <th style="display: table-cell;">Company Name
                                </th>
                                <%--<th style="display: table-cell;">Company Profile
                                </th>

                                <th style="display: table-cell;">Company Industry
                                </th>
                                <th style="display: table-cell;" data-hide="tablet">WebSite
                                </th>
                                <th>Company GST Number
                                </th>--%>
                                <th style="display: table-cell;" data-hide="tablet">CreationDate
                                </th>
                                <th style="display: table-cell;">Details
                                </th>
                            </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tbody>
                        <tr>
                            <td>
                                <%#Eval("CustomerId")%>
                            </td>
                            <td>
                                <%#Eval("FullName")%>
                            </td>
                            <td>
                                <%#Eval("Email")%>
                            </td>
                            <td>
                                <%#Eval("ContactNumber")%>
                            </td>
                            <td>
                                <%#Eval("CompanyName")%>
                            </td>
                            <%--<td>
                                <%#Eval("CompanyProfile") %>
                            </td>
                            <td>
                                <%#Eval("CompanyIndustry")%>
                            </td>
                            <td>
                                <%#Eval("Website") %>
                            </td>
                            <td>
                                <%#Eval("CompanyGSTNumber") %>
                            </td>--%>
                            <td>
                                <%#Eval("CreationDate")%>
                            </td>
                            <td>
                                <asp:HyperLink ID="hplViewDetail" Text="View Detail..." runat="server" NavigateUrl='<%# String.Format("~/Consultant/Customer_Details.aspx?id={0}", DataBinder.Eval(Container.DataItem, "CustomerId")) %>'>           
                                </asp:HyperLink>
                            </td>
                        </tr>
                    </tbody>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>

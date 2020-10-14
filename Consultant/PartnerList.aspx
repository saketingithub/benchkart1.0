<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerList.aspx.cs" Inherits="Benchkart.Consultant.PartnerList" %>

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
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
     <script src="../Scripts/Custom.js"></script>
    <style>
        h4
        {
            margin-top: 25px;
            font-size: small;
            font-weight: bold;
        }
        td
        {
            padding-left: 20px;
        }
        .label
        {
            font-size: medium;
            color: Black;
            font-weight: normal;
        }
        
        ul
        {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }
        
        li
        {
            float: left;
        }
        
        li a
        {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        
        li a:hover:not(.active)
        {
            background-color: #111;
        }
        
        .active
        {
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
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
    </asp:ScriptManager>
        <div>
            <uc1:ucHeader runat="server" ID="ucHeader" />
        </div>
    <div style="font-size: 20px; font-weight: bold; color: Black; height: 15px; background-color: White;
        margin-top: 0px;">
        
        <div>
            <asp:Label runat="server" ID="lblConsultantEmail" CssClass="label" ForeColor="Gray"
                Style="padding: 20px; display: block;"></asp:Label></div>
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
            <table width="100%">
                <tr>
                    <td style="width: 30%;">
                        <asp:DropDownList runat="server" ID="ddlRequestStatus" OnSelectedIndexChanged="ddlRequestStatus_SelectedIndexChanged"
                            class="form-control" AutoPostBack="true" Style="width: 60%; margin: 0 auto;">
                             <asp:ListItem Value="0">InComplete</asp:ListItem>
                            <asp:ListItem Value="1" Selected="True" >Pending</asp:ListItem>
                            
                            <asp:ListItem Value="2">Approved</asp:ListItem>
                            <asp:ListItem Value="3">All List</asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox runat="server" class="form-control" ID="txtContactNumber" ValidationGroup="Search" oncopy="return false;"
                                    onpaste="return false" oncut="return false;"
                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');"
                            Placeholder="Contact Number" Style="width: 60%; margin: 0 auto; float: right;"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Search" ID="reqtxtContactNumber"
                            ControlToValidate="txtContactNumber" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Button ID="btnSearch" runat="server" class="form-control" ValidationGroup="Search"
                            Text="Search" OnClick="btnSearch_Click" />
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat ="server" NavigateUrl="~/Consultant/Requests.aspx" style="font-size :large; font-weight:bold;color:white;" >Back Request</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div>
        <asp:Repeater ID="rptRequests" runat="server">
            <HeaderTemplate>
                <table id="tblRequests" class="footable" border="0">
                    <thead>
                        <tr>
                            <th>
                                Partner Id
                            </th>
                            <th style="display: table-cell;">
                                Company Name
                            </th>
                            <th style="display: table-cell;">
                                Contact Number
                            </th>
                            <th style="display: table-cell;">
                                Email
                            </th>
                            <th style="display: table-cell;">
                                Full Name
                            </th>
                           
                            <th style="display: table-cell;" data-hide="tablet">
                                WebSite
                            </th>
                            <th>
                                Company GST Number
                            </th>
                            <th style="display: table-cell;" data-hide="tablet">
                                CreationDate
                            </th>
                             <th style="display: table-cell;">
                                Status
                            </th>
                            <th style="display: table-cell;">
                                Details
                            </th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tbody>
                    <tr>
                        <td>
                            <%#Eval("PartnerId")%>
                        </td>
                        <td>
                            <%#Eval("CompanyName")%>
                        </td>
                        <td>
                            <%#Eval("ContactNumber")%>
                        </td>
                        <td>
                            <%#Eval("Email")%>
                        </td>
                        <td>
                            <%#Eval("PocFullName")%>
                        </td>
                       
                        <td>
                            <%#Eval("Website") %>
                        </td>
                        <td>
                            <%#Eval("CompanyGSTNumber") %>
                        </td>
                        <td>
                            <%#Eval("CreationDate")%>
                        </td>
                         <td>
                            <%# Eval("IsActive").ToString() == "2" ? "Approved" : "Not Approved" %>
                        </td>
                        <td>
                            <asp:HyperLink ID="hplViewDetail" Text="View Detail..." runat="server" NavigateUrl='<%# String.Format("~/Consultant/Partner_Details.aspx?id={0}", DataBinder.Eval(Container.DataItem, "PartnerId")) %>'>           
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

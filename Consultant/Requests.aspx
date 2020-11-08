<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="Benchkart.Consultant.Requests" %>

<%@ Register Src="~/Consultant/ucConsultantHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                    <td >
                        <asp:DropDownList runat="server" ID="ddlRequestStatus" OnSelectedIndexChanged="ddlRequestStatus_SelectedIndexChanged"
                            class="form-control" AutoPostBack="true" Style=" margin: 0 auto;">
                           <asp:ListItem Value="0" >New Request</asp:ListItem>
                            <asp:ListItem Value="1" >Not Reachable</asp:ListItem>
                            <asp:ListItem Value="2" >Rescheduled</asp:ListItem>
                            <asp:ListItem Value="3" >Requirement Not Clear</asp:ListItem>
                            <asp:ListItem Value="4" >Escalate</asp:ListItem>
                            <asp:ListItem Value="5" >Requirement Closed</asp:ListItem>
                            <asp:ListItem Value="6" >Approved</asp:ListItem>
                             <asp:ListItem Value="7" >Sent for Customer Approved</asp:ListItem>
                            <asp:ListItem Value="8">All Requests</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox runat="server" class="form-control" ID="txtContactNumber" ValidationGroup="Search" oncopy="return false;"
                                    onpaste="return false" oncut="return false;"
                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');"
                            Placeholder="Contact Number" Style=" margin: 0 auto; float: right;"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Search" ID="reqtxtContactNumber"
                            ControlToValidate="txtContactNumber" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Button ID="btnSearch" runat="server" class="form-control" ValidationGroup="Search"
                            Text="Search" OnClick="btnSearch_Click" /></td>
                    <td>
                        <asp:HyperLink ID="hplCustomerList" runat="server" Style="font-size:large;color:white; text-decoration: underline;" NavigateUrl="~/Consultant/Customers.aspx">Customers</asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLinkProjectList" runat="server" Style="font-size:large;color:white; text-decoration: underline;" NavigateUrl="~/Consultant/Projects.aspx">Project List</asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Style="font-size:large;color:white; text-decoration: underline;" NavigateUrl="~/Consultant/PartnerList.aspx">Partner Approval</asp:HyperLink>
                    </td>
                    <td>
                      <asp:HyperLink ID="hylQuickPackage" runat ="server" Style="font-size:large;color:white; text-decoration: underline;" NavigateUrl="~/Consultant/PartnerQuickProjectList.aspx" >Qik Project</asp:HyperLink>
                    </td>
                    <td>
                      <asp:HyperLink ID="hplConsult" runat ="server" Style="font-size:large;color:white; text-decoration: underline;" NavigateUrl="~/Consultant/Consultation_Request.aspx" >Consultation</asp:HyperLink>
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
                                Request Id
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
                            <th style="display: table-cell;">
                                Title
                            </th>
                            <th style="display: table-cell;" data-hide="tablet">
                                Description
                            </th>
                            <th>
                                OutSource Type
                            </th>
                            <th style="display: table-cell;" data-hide="tablet">
                                CreationDate
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
                            <%#Eval("RequestId")%>
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
                            <%#Eval("FullName")%>
                        </td>
                        <td>
                            <%#Eval("Title")%>
                        </td>
                        <td>
                            <%# Eval("Description").ToString().Length <= 50 ? Eval("Description") : Eval("Description").ToString().Substring(0,50)+"..." %>
                        </td>
                        <td>
                            <%#(Eval("OutsourceType").ToString() == "1") ?"Consult" : (Eval("OutsourceType").ToString() == "2") ? "Outsource Project" :(Eval("OutsourceType").ToString() == "3") ? "Hire Developer":"" %>
                        </td>
                        <td>
                            <%#Eval("CreationDate")%>
                        </td>
                        <td>
                            <asp:HyperLink ID="hplViewDetail" Text="View Detail..." runat="server" NavigateUrl='<%# String.Format("~/Consultant/Request-Details.aspx?id={0}", DataBinder.Eval(Container.DataItem, "RequestId")) %>'
                                >           
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

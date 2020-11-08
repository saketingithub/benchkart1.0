<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerQuickProjectList.aspx.cs" Inherits="Benchkart.Consultant.PartnerQuickProjectList" %>
<%@ Register Src="~/Consultant/ucConsultantHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <script src="../Scripts/jquery.multifile.js"></script>
    <script src="../Scripts/Skills.js"></script>
    <style>
        h4 {
            margin-top: 25px;
            font-size: medium;
            font-weight: bold;
        }

        h5 {
            font-size: small;
            font-weight: bold;
            margin-bottom: 3px;
            margin-top: 0px;
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
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
    </asp:ScriptManager>
         <div class="container-fluid">
             <div class="row">
            <uc1:ucHeader runat="server" ID="ucHeader" />
                 </div>
             <div class="row">
             <div class="col-lg-4" style="margin-left:20px; margin-top:30px;margin-bottom:10px;"> 
                 <asp:HyperLink ID="hylQuickPackage" runat ="server" Style="font-size:large;color:forestgreen; text-decoration: underline;" NavigateUrl="~/Consultant/Requests.aspx" >Back</asp:HyperLink>
             </div>
             </div>
             <div class="row">
                 <div class="col-lg-2">
                     
                 </div>
                 <div class="col-lg-3">
                       <asp:TextBox ID="txtsearch" CssClass="form-control" placeholder="Please fill partner name or companyname" runat ="server" ></asp:TextBox>  
                 </div>
                 <div class="col-lg-2">
                     <asp:Button ID="btnsearch" runat ="server" CssClass="form-control btn btn-primary" Text ="Search Partner" OnClick="btnsearch_Click" />
                 </div>
                 
             </div>
             <div class="row" style="margin-top:30px; ">
                 <div class="col-lg-12" style="margin:20px;overflow:scroll;">
                     <asp:GridView ID="grdpartnerQuickdetails" runat ="server"   Width="90%" AutoGenerateColumns ="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" CssClass="table-bordered">
                         <Columns>
                             <asp:TemplateField HeaderText="Partner Name" >
                                 <ItemTemplate>
                                     <%#Eval("CompanyName") %>
                                 </ItemTemplate>
                             </asp:TemplateField>
                              <asp:TemplateField HeaderText="PartnerType">
                                 <ItemTemplate>
                                     <%#Eval("PartnerType").ToString()=="1"? "Economy":Eval("PartnerType").ToString()=="2"?"Standard":"Premium" %>
                                 </ItemTemplate>
                             </asp:TemplateField>
                              <asp:TemplateField HeaderText="PrimarySourceOfRevenue">
                                 <ItemTemplate>
                                     <%#Eval("PrimarySourceOfRevenue") %>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="AllPkg">
                                 <ItemTemplate>
                                     <%#Eval("AllPackages") %>
                                      <asp:HyperLink ID="hylall" runat ="server" Text="ViewDetails" NavigateUrl='<%# String.Format("~/Consultant/QuickProjectList.aspx?PartnerIdAll={0}", Eval("PartnerId")) %>' ></asp:HyperLink>
                                   
                                 </ItemTemplate>
                             </asp:TemplateField>
                               <asp:TemplateField HeaderText="Active">

                                 <ItemTemplate>
                                     <%#Eval("ActivePkg") %>
                                      <asp:HyperLink ID="hylactive" runat ="server" Text="ViewDetails" NavigateUrl='<%# String.Format("~/Consultant/QuickProjectList.aspx?PartnerIdActive={0}", Eval("PartnerId")) %>' ></asp:HyperLink>
                                   
                                 </ItemTemplate>
                             </asp:TemplateField>
                               <asp:TemplateField HeaderText="InActive">
                                 <ItemTemplate>
                                     <%#Eval("InActivePkg") %>
                                      <asp:HyperLink ID="hylinactive" runat ="server" Text="ViewDetails" NavigateUrl='<%# String.Format("~/Consultant/QuickProjectList.aspx?PartnerIdInActive={0}", Eval("PartnerId")) %>' ></asp:HyperLink>
                                   
                                 </ItemTemplate>
                             </asp:TemplateField>
                               <asp:TemplateField HeaderText="Reject">
                                 <ItemTemplate>
                                     <%#Eval("RejectPkg") %>
                                      <asp:HyperLink ID="hylreject" runat ="server" Text="ViewDetails" NavigateUrl='<%# String.Format("~/Consultant/QuickProjectList.aspx?PartnerIdReject={0}", Eval("PartnerId")) %>' ></asp:HyperLink>
                                   
                                 </ItemTemplate>
                             </asp:TemplateField>
                             
                         </Columns>
                         <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                         <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                         <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                         <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                         <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                         <SortedAscendingCellStyle BackColor="#FFF1D4" />
                         <SortedAscendingHeaderStyle BackColor="#B95C30" />
                         <SortedDescendingCellStyle BackColor="#F1E5CE" />
                         <SortedDescendingHeaderStyle BackColor="#93451F" />
                     </asp:GridView>
                 </div>
             </div>
        </div>
        
    </form>
</body>
</html>

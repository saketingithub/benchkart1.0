<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="Benchkart.Consultant.Projects" %>

<%@ Register Src="~/Consultant/ucConsultantHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="IT Shared Services" />
    <title>benchkart - marketplace for outsourcing</title>
    <%-- <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>--%>

    <link rel="stylesheet" href="css/Custom.css" />
    <%-- <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />--%>
     <script src="../Scripts/Custom.js"></script>

    <%-- <link href="../css/style.css" rel="stylesheet" />--%>
    <link href="../css/style4.css" rel="stylesheet" />
    <link href="../css/partner.css" rel="stylesheet" />

    <style>
        h1, h2, h3, h4, h5, h6 {
            text-transform: none;
            margin-top: 0;
        }

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
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <%--<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">--%>
        <!-- Page Content  -->
         <div>
            <uc1:ucHeader runat="server" ID="ucHeader" />
        </div>
        <div style="background-color: #1d4354;">
        <div style="padding: 10px;">
            <table width="100%">
                <tr>
                    <td >
                        <asp:DropDownList runat="server" ID="ddlRequestStatus" OnSelectedIndexChanged="ddlRequestStatus_SelectedIndexChanged"
                            class="form-control" AutoPostBack="true" Style=" margin: 0 auto; height:20px;">
                           <asp:ListItem Value="0" >Approved Pending</asp:ListItem>
                            <asp:ListItem Value="1" >Bidding In Progress</asp:ListItem>
                            <asp:ListItem Value="2" >Bidding Completed</asp:ListItem>
                            <asp:ListItem Value="3" >Bidding Accepted</asp:ListItem>
                            <asp:ListItem Value="4" >Contract Created</asp:ListItem>
                            <asp:ListItem Value="5" >Contract Approved</asp:ListItem>
                            <asp:ListItem Value="6" >Payment Started</asp:ListItem>
                             <asp:ListItem Value="7" >Project Closed Riased by Partner</asp:ListItem>
                            <asp:ListItem Value="8">Project Closed by Customer</asp:ListItem>
                            <asp:ListItem Value="9">Reviewed by Customer</asp:ListItem>
                            <asp:ListItem Value="10">Reviewed by Partner</asp:ListItem>
                            <asp:ListItem Value="11">Contract Rejected</asp:ListItem>
							<asp:ListItem Value="12">Premature Closed</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                  
                    
                    <td>
                    
                      <asp:HyperLink ID="lkbBackBids" runat ="server" Style="font-size:large;color:white; text-decoration: underline;" Text="Back to Requests" NavigateUrl="~/Consultant/Requests.aspx" ></asp:HyperLink>
                    </td>
                    <td style ="text-align:right">
                       <asp:Label runat="server" ID="lblConsultantEmail" Style="font-size:large;color:white; padding: 20px;" CssClass="label" ForeColor="Gray"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
       
        <div id="content" style="padding: 4px; ">
           
          <%--  <asp:Panel ID="pnlSearchingProjects" runat="server" Visible="false" Style="text-align: center; height: 200px; margin: 0 auto; padding: 20px;">
                <h2 style="margin-top: 100px;">We are searching for projects as per your company services.
                    <br />
                    Please update your all services if not already done.</h2>
            </asp:Panel>--%>
            <div style="text-align: center; margin-top: 20px; margin-left: auto; margin-right: auto;">
                <asp:GridView ID="grdProject" runat="server" AutoGenerateColumns="False" AllowSorting="True" 
                    OnRowCommand="grdProject_RowCommand" OnRowDataBound="grdProject_RowDataBound" CellPadding="10" BackColor="White"
                    BorderColor="Gray" BorderStyle="None" BorderWidth="1px" HorizontalAlign="Center">
                    <AlternatingRowStyle Wrap="True" />
                    <Columns >
                        <%-- <asp:TemplateField HeaderText="CompanyIndustry">
                    <ItemTemplate>
                        <%#Eval("CompanyIndustry") %>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                        <%-- <asp:TemplateField HeaderText="Duration">
                    <ItemTemplate>
                        <%#Eval("Duration") %>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                       <%-- <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <%# Eval("Description").ToString().Length <= 200 ? Eval("Description") : Eval("Description").ToString().Substring(0,200)+"..." %>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Title">
                            <ItemTemplate>
                                <%#Eval("Title") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Full Name">
                            <ItemTemplate>
                                <%#Eval("FullName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Contact Number, Email">
                            <ItemTemplate>
                                <%#Eval("ContactNumber") + ", " +Eval("Email") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Name">
                            <ItemTemplate>
                                <%#Eval("CompanyName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Creation Date">
                            <ItemTemplate>
                                <%#Eval("CreationDate") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Service">
                            <ItemTemplate>
                                <%#Eval("ServiceTitle") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="OutsourceType">
                            <ItemTemplate>
                                <%# Eval("OutsourceType").ToString() == "2" ? "Outsource Project" : "Hire Developer" %>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                       <%-- <asp:TemplateField HeaderText="Budget">
                            <ItemTemplate>
                                <%#Eval("Budget") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="BudgetType">
                            <ItemTemplate>
                                <%# Eval("BudgetType").ToString() == "1" ? "Fixed" : "Per Hour" %>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <%# SetProjectStatus(Convert.ToInt32(Eval("Status"))) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Project Details">
                            <ItemTemplate>
                                <asp:HyperLink ID="lkbProjectDetails" runat="server" Style="color: blue; text-decoration: underline; font-size: small;" Text="View Details" NavigateUrl='<%# String.Format("~/Consultant/Project_Details.aspx?ProjectId={0}", Eval("ProjectId")) %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:HyperLink ID="lkbProjectBids" runat="server" Style="color: blue; text-decoration: underline; font-size: small;" Text="View Bids" NavigateUrl='<%# String.Format("~/Consultant/Project_Bids.aspx?ProjectId={0}", Eval("ProjectId")) %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bids Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lkbCompleteBids" runat="server" Style="color: blue; text-decoration: underline; font-size: small;" Visible='<%#  Convert.ToInt32(Eval("Status"))  == 1 ? true:false %>' Text="Bid Completed" CommandArgument='<%#Eval("ProjectId") %>' CommandName="Accept"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <EditRowStyle Font-Underline="true" Wrap="True" />

                    <EmptyDataRowStyle Wrap="True" />

                   <%-- <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#9999FF" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#330099" Wrap="True" />
                    <SelectedRowStyle BackColor="#FFCC66"  ForeColor="#663399" Wrap="True" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" Wrap="True" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" Wrap="True" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" Wrap="True" />--%>

                </asp:GridView>
                <%--<asp:ListView ID="lstProjects" runat="server">
                    <ItemTemplate>
                        <!-- Card -->
                        <div class="card" style="margin: 0 auto; background-color: White;">
                            <div class="container" style="padding: 15px; background-color: White; border-radius: 5px; width: 90%; margin: 0 auto; margin-top: 30px; padding: 20px;">
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-sm-9" style="text-align: left;">
                                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title")%>' Style="font-weight: bold; font-size: large; margin-left: 20px; color: gray;"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Eval("CreationDate")%>'></asp:Label>
                                    </div>
                                </div>
                                <div class="row" style="position: relative;">
                                    <div class="col-sm-4">
                                        <div class="bidfield" style="margin-left: 20px;">
                                            <h5>Service</h5>
                                        </div>
                                        <div style="margin-left: 20px;">
                                            <h4>
                                                <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("ServiceTitle")%>'></asp:Label></h4>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="bidfield" style="margin-left: 20px;">
                                            <h5>Service Type</h5>
                                        </div>
                                        <div style="margin-left: 20px;">
                                            <h4>
                                                <asp:Label ID="lblServiceType" Text='<%# Eval("OutsourceType").ToString() == "1" ? "Service" : "Talent" %>'
                                                    runat="server" /></h4>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="bidfield" style="margin-left: 20px;">
                                            <h5>Customer Industry</h5>
                                        </div>
                                        <div style="margin-left: 20px;">
                                            <h4>
                                                <asp:Label ID="lblCompanyIndustry" Text='<%# Eval("CompanyIndustry")%>' runat="server" /></h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="position: relative;">
                                    <div class="col-sm-4">
                                        <div class="bidfield" style="margin-left: 20px;">
                                            <h5>Duration</h5>
                                        </div>
                                        <div style="margin-left: 20px;">
                                            <h4>
                                                <asp:Label ID="lblDuration" runat="server" Text='<%# Eval("Duration")%>'></asp:Label></h4>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="bidfield" style="margin-left: 20px;">
                                            <h5>Budget</h5>
                                        </div>
                                        <div style="margin-left: 20px;">
                                            <h4>
                                                <asp:Label ID="lblBudget" Text='<%# Eval("Budget").ToString() %>' runat="server" />
                                            </h4>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="bidfield" style="margin-left: 20px;">
                                            <h5>Budget Type</h5>
                                        </div>
                                        <div style="margin-left: 20px;">

                                            <h4>
                                                <asp:Label ID="lblBudgetType" Text='<%# Eval("BudgetType").ToString() == "1" ? "Fixed" : "Per Hour" %>'
                                                    runat="server" /></h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="position: relative;">
                                    <div class="col-sm-12">
                                        <div class="bidfield" style="margin-left: 20px;">
                                            <h5>Description</h5>
                                        </div>
                                        <div style="margin-left: 20px; width: 85%;">
                                            <h4>
                                                <asp:Label ID="lblDescription" runat="server" Style="line-height: 1.7;" Text='<%# Eval("Description").ToString().Length <= 200 ? Eval("Description") : Eval("Description").ToString().Substring(0,
                        200)+"..." %>'></asp:Label></h4>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row" style="margin-top: 30px;">
                                    <div class="col-sm-4 hidden-xs">
                                    </div>
                                    <div class="col-xs-6 col-sm-4" style="text-align: center;">
                                        <asp:Button ID="btnViewDetail" Text="View Bids Details" runat="server" Style="background-color: #4CAF50; padding: 5px; padding-right: 15px; padding-left: 15px;" Font-Size="Medium"
                                            PostBackUrl='<%# String.Format("~/Consultant/Project_Bids.aspx?id={0}", DataBinder.Eval(Container.DataItem, "ProjectId")) %>'></asp:Button>
                                    </div>
                                    <div class="col-xs-6 col-sm-4">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>--%>
            </div>
        </div>
        <%--</asp:content>--%>
    </form>
</body>
</html>

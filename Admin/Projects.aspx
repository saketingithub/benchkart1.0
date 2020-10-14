<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="Benchkart.Admin.Projects" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<body >
    <form id="form1" runat="server">
            
            <div id="content" style="padding: 0px; text-align :center;">
                <div class="row">
                    <div class ="form-group">
<div style="text-align :center; margin-left:5%;">
    <center>
                    <asp:GridView ID="grd" runat ="server" AutoGenerateColumns="False" AllowSorting="true" OnPageIndexChanging="grd_PageIndexChanging"  OnSorting="grd_Sorting" OnRowCreated="grd_RowCreated" >
                        <Columns>
                             <asp:TemplateField HeaderText="ProjectId" SortExpression="ProjectId"  >
                                <ItemTemplate>
                                    <%#Eval("ProjectId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="ServiceId" SortExpression="ServiceId" >
                                <ItemTemplate>
                                    <%#Eval("ServiceId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                <ItemTemplate>
                                    <%#Eval("Title") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="ServiceTitle" SortExpression="ServiceTitle">
                                <ItemTemplate>
                                    <%#Eval("ServiceTitle") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                <ItemTemplate>
                                    <%#Eval("Description") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                                <ItemTemplate>
                                    <%#Eval("Duration") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="QueryForPartner" SortExpression="QueryForPartner">
                                <ItemTemplate>
                                    <%#Eval("QueryForPartner") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                <ItemTemplate>
                                    <%#Eval("Status") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="OutSourceType" SortExpression="OutSourceType">
                                <ItemTemplate>
                                    <%#Eval("OutSourceType") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="WorkMode" SortExpression="WorkMode">
                                <ItemTemplate>
                                    <%#Eval("WorkMode") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="OnsiteLocation" SortExpression="OnsiteLocation">
                                <ItemTemplate>
                                    <%#Eval("OnsiteLocation") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="CreationDate" SortExpression="CreationDate">
                                <ItemTemplate>
                                    <%#Eval("CreationDate") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="CompanyIndustry" SortExpression="CompanyIndustry">
                                <ItemTemplate>
                                    <%#Eval("CompanyIndustry") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action Details">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hplViewDetail" class="form-control" Text="ViewDetails" runat="server"
                                            NavigateUrl='<%# String.Format("~/Admin/Project_Details.aspx?id={0}", DataBinder.Eval(Container.DataItem, "ProjectId")) %>'
                                            Target="_blank">           
                                        </asp:HyperLink>
                                  
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
        </center>
                
                </div>
                    </div>
                </div>
                
                
            </div>
        
        <script src="../Scripts/popper.js"></script>
        <script src="../Scripts/main.js"></script>
    </form>
</body>
</html>

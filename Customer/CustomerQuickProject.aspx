<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerQuickProject.aspx.cs" Inherits="Benchkart.Customer.CustomerQuickProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CustomerQuick Project</title>
    <meta charset='utf-8' />
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport' />

    <meta name="description" content="CustomerQuick Project" />

    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.min.js"></script>ipt>
    <script type="text/javascript">
        function showmodal() {
            
            $("#myModal").show();
            
        }
        function hidemodal() {
            $("#myModal").hide();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


        <div class="container-fluid">
            <div>
                <div style="background-color: black; color: Black; display: flow-root; height: 60px;">
                    <div id="logo" style="float: left;">
                        <h1 class="header"><a href="https://www.benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
                    </div>
                    <div style="float: right; margin-top: 20px;">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.benchkart.com" Text="Home" ForeColor="Blue" Style="color: white; font-size: small; margin-right: 10px; text-decoration: underline;"></asp:HyperLink>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 30px;">

                <div class="col-md-10" style="margin-bottom: 20px;">
                    <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" style="border-radius:10px;"></asp:TextBox>
                </div>
                <div class="col-md-2" style="margin-bottom: 20px;">
                    <asp:Button ID="btnSearch" runat="server" Width="60%" style="border-radius:10px;" Text="Search" CssClass="btn btn-success" OnClick="btnSearch_Click" />
                </div>

            </div>
           
                    <div class="row" style="margin-top: 30px;">


                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-12">
                                    <h3>Filter & Refilter</h3>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12" style ="margin-top:10px;">
                                 <b>   Category </b>
                                <asp:DropDownList ID="ddlCategoryIdRefilter" runat="server" Width="60%"  CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryIdRefilter_SelectedIndexChanged">
                                    <asp:ListItem Value="">Select Project Category</asp:ListItem>
                                    <asp:ListItem Value="2">Website & Apps</asp:ListItem>
                                    <asp:ListItem Value="1">Graphics & Design</asp:ListItem>
                                    <asp:ListItem Value="3">Digital Marketing</asp:ListItem>
                                    <asp:ListItem Value="4">Software</asp:ListItem>
                                    <asp:ListItem Value="5">Cloud & Infra</asp:ListItem>
                                    <asp:ListItem Value="6">Call Center</asp:ListItem>
                                    <asp:ListItem Value="7">KPO</asp:ListItem>
                                    <asp:ListItem Value="8">Back-Office</asp:ListItem>
                                </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" style ="margin-top:10px;">
                                <div class="col-md-12">
                                   <b> SubCategory</b>
                                <asp:DropDownList ID="ddlSubCategoryIdRefilter"  runat="server" Width="60%" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" style ="margin-top:10px;">
                                <div class="col-md-12">
                                  <b>  PackageType</b>
                                <asp:DropDownList ID="ddlPackageTypeRefilter" runat="server"  Width="60%" CssClass="form-control">
                                    <asp:ListItem Value="">Select Package</asp:ListItem>
                                    <asp:ListItem Value="1">Economy</asp:ListItem>
                                    <asp:ListItem Value="2">Standard</asp:ListItem>
                                    <asp:ListItem Value="3">Premium</asp:ListItem>
                                </asp:DropDownList>
                                </div>
                            </div>


                            <div class="row" style="margin-bottom: 20px; margin-top: 20px;">
                                <div class="col-md-12">
                                    <asp:Button ID="btnSearchRefilter" runat="server" Width="30%" Text="Search" OnClick="btnSearchRefilter_Click"
                                        CssClass="btn btn-success " style="border-radius:10px;"></asp:Button>
                                </div>
                            </div>
                        </div>
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                        <div class="col-md-7">
                            <b style="font-size: large;">Package count :</b>
                            <asp:Label ID="lblcount" Font-Bold="true" Font-Size="Large" runat="server" Text="Package Count"></asp:Label>
                            <div class="row" style="margin-top: 20px;">
                                <div class=" card col-md-12">

                                    <asp:DataList ID="dlQuickProjects" runat="server" CellSpacing="5" CellPadding ="4" border-raduis="10" Font-Bold="True" 
                                        RepeatColumns="1" OnItemCommand="dlQuickProjects_ItemCommand" Width="736px" BorderStyle="Solid" BorderWidth="2px" ForeColor="#333333" GridLines="Both">
                                        <AlternatingItemStyle BackColor="White" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemStyle BackColor="#EFF3FB" />
                                        <ItemTemplate>
                                            <table style="margin-top:20px;">
                                                <tr style="margin-top: 20px; margin-bottom: 20px;">
                                                    <td style="width: 300px; text-align: center; margin-top: 20px; margin-bottom: 20px;">
                                                        <b style="margin: 50px; margin-top: 20px; margin-bottom: 20px; color: lightgray;"><%#Eval("PackageName")%></b>
                                                        <br />
                                                        <br />
                                                        <b style="margin: 50px; margin-top: 20px; margin-bottom: 20px; color: lightgray;"><%#Eval("PackageDescription")%></b>
                                                    </td>
                                                    <td style="width: 400px; text-align: center; margin-top: 20px; margin-bottom: 20px;">
                                                        <b style="margin: 50px; margin-top: 20px; margin-bottom: 20px; color: darkgrey;"><%#Eval("Description1") %></b>
                                                        <br />
                                                        <b style="margin: 50px; margin-top: 20px; margin-bottom: 20px; color: darkgrey;"><%#Eval("Description2") %></b>
                                                        <br />
                                                        <b style="margin: 50px; margin-top: 20px; margin-bottom: 20px; color: darkgrey;"><%#Eval("Description3") %> </b>
                                                    </td>
                                                    <td style="width: 200px; text-align: center; margin-top: 20px; margin-bottom: 20px;">
                                                        <br />
                                                        <b style="margin: 50px; margin-top: 40px; margin-bottom: 20px; color: gray;"><%#Eval("BasicPackageCost") %> </b>
                                                        <br />
                                                        <br />
                                                        <b style="margin: 50px;">
                                                          
                                                            <asp:Button ID="lkbViewPackage" CommandArgument='<%#Eval("PartnerPackageId")%>' OnClientClick=" showmodal()" CommandName="Edt" runat="server"
                                                                Text="ViewPackage"  CssClass="btn btn-success btn-md" Style="margin-bottom: 20px; border-radius:10px;"></asp:Button>
                                                        </b>
                                                    </td>

                                                </tr>
                                            </table>


                                        </ItemTemplate>

                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                   </asp:DataList>
                                </div>
                            </div>
                        </div>

                     </ContentTemplate>

            </asp:UpdatePanel>
                    </div>

               
        </div>
       
        <div class="modal " id="myModal" tabindex="-1" role="dialog"  style="background-color: #f8f8f8; display:none; border: 1px solid green; border-radius: 10px;">
            <div class="modal-dialog" style="width: 80%; border: 1px solid green; border-radius: 10px;">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Button ID="btnhidemodal" class="close" aria-hidden="true" runat ="server" OnClientClick=" return hidemodal();" Text="x" />
                        
                        <h4 class="modal-title">Package Details</h4>
                    </div>
                    <div class="modal-body" style="background-color: #f8f8f8; border: 1px solid green;">



                        <div class="row" style="margin: 10px; padding: 10px;">
                            <div class="form-group">
                                <b>Category &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  : &nbsp;</b><asp:Label ID="lbltitle" runat ="server" ></asp:Label>
                              <%--  <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"
                                    Style="border-radius: 10px;">
                                    <asp:ListItem Value="">Select Project Category</asp:ListItem>
                                    <asp:ListItem Value="2">Website & Apps</asp:ListItem>
                                    <asp:ListItem Value="1">Graphics & Design</asp:ListItem>
                                    <asp:ListItem Value="3">Digital Marketing</asp:ListItem>
                                    <asp:ListItem Value="4">Software</asp:ListItem>
                                    <asp:ListItem Value="5">Cloud & Infra</asp:ListItem>
                                    <asp:ListItem Value="6">Call Center</asp:ListItem>
                                    <asp:ListItem Value="7">KPO</asp:ListItem>
                                    <asp:ListItem Value="8">Back-Office</asp:ListItem>

                                </asp:DropDownList>--%>

                            </div>
                        </div>
                        <div class="row" style="margin: 10px; padding: 10px;">
                            <div class="form-group">
                             <b>  SubCategory &nbsp;&nbsp; : &nbsp;</b> <asp:Label ID="lblsubtitle" runat ="server" ></asp:Label>
                               <%-- <asp:DropDownList ID="ddlSubCategory" AutoPostBack="true" class="form-control" runat="server"
                                    Style="border-radius: 10px;">
                                </asp:DropDownList>--%>

                            </div>
                        </div>
                         
                        <div class="row" style="margin: 10px; padding: 10px;">
                            <div class="form-group">
                             <b>  Package Type &nbsp; : &nbsp;</b> <asp:Label ID="lblpackagetypename" runat ="server" ></asp:Label>
                               <%-- <asp:DropDownList ID="ddlPackageType" class="form-control" runat="server"
                                    Style="border-radius: 10px;">
                                    <asp:ListItem Value="">Select Package</asp:ListItem>
                                    <asp:ListItem Value="1">Economy</asp:ListItem>
                                    <asp:ListItem Value="2">Standard</asp:ListItem>
                                    <asp:ListItem Value="3">Premium</asp:ListItem>
                                </asp:DropDownList>--%>


                            </div>
                        </div>

                        <div class="row" style="margin: 10px; padding: 10px;">
                            <div class="form-group">
                             <b>  PackageName &nbsp; :&nbsp;</b> <asp:Label ID="lblPackageName" runat="server" ></asp:Label>
                            </div>
                        </div>



                        <div class="row" style="margin: 10px; width: 80%; padding: 10px;">
                            <div class="form-group">
                                <asp:Repeater ID="rptCustomers" runat="server" >
                                    <HeaderTemplate>
                                        <table cellspacing="0" rules="all" border="1" style="width:100%;">
                                            <tr>
                                                <th scope="col" style="width: 80px">Parameter
                                                </th>
                                                <th scope="col" style="width: 80px">Basic
                                                </th>
                                                <th scope="col" style="width: 120px">Standard
                                                </th>
                                                <th scope="col" style="width: 100px">Premium
                                                </th>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("Parameter") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("BasicDisplayText") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("StandardDisplayText") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("PremiumDisplayText") %>' />
                                            </td>
                                        </tr>
                                        
                                    </ItemTemplate>
                                    <FooterTemplate>
                                       
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>


                            </div>
                        </div>


                                <div class="row" style="margin: 10px; width:80%; padding: 10px;">
                            <div class="form-group">
                            <table style="width:100%;">
                                <tr>
                                            <td>
                                                  PackageCost
                                            </td>
                                            <td style="margin-left:200px;">
                                                <asp:Label ID="lblbasiccost" runat ="server" ></asp:Label>
                                            </td>
                                            <td style="margin-left:200px;">
                                                 <asp:Label ID="lblstandatrdcost" runat ="server" ></asp:Label>
                                            </td>
                                            <td style="margin-left:200px;">
                                                 <asp:Label ID="lblpremiumcost" runat ="server" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:Button ID="btnbasiclink" runat ="server" OnClick="btnbasiclink_Click" Text ="Basic" CssClass ="btn btn-success" />
                                                                                            
                                            </td>
                                            <td>
                                                <asp:Button ID="btnstandardlink" runat ="server" Text ="Standard" CssClass ="btn btn-success " OnClick="btnstandardlink_Click" />
                                                
                                                
                                            </td>
                                            <td>
                                                <asp:Button ID="btnpremium" runat ="server" Text ="Premium" CssClass ="btn btn-success " OnClick ="btnpremium_Click" />
                                               
                                                 
                                            </td>
                                        </tr>
                            </table>
                            </div>
                        </div>


                    </div>

                </div>
                </ContentTemplate>
                    </asp:UpdatePanel>
            </div>
        </div>
               
    </form>
</body>
</html>

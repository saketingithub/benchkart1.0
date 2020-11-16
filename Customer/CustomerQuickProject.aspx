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
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="../css/quick-projects.css" rel="stylesheet" />
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
        <header id="header" style="padding: 0px; position: relative; height: 70px;">
            <div class="container-fluid" style="background-color: black; min-height: 70px;">
                <div id="logo" class="pull-left" style="margin-top: 15px;">
                    <h1>
                        <a href="https://benchkart.com" class="scrollto"><span style="color: #18D26E;">bench</span><span style="color: coral;">kart</span></a>
                    </h1>
                </div>
                <div style="float: right;">
                    <div class="dropdown" style="float: right; margin-top: 5px;">
                        <i onclick="myFunction()" style="font-size: 20px; margin-top: 15px; margin-right: 20px;" class="fa fa-user-circle dropbtn"></i>
                        <div id="myDropdown" class="dropdown-content">
                            <a href="Signin.aspx" class="nav-menu ul li a">Sign in</a>
                            <a href="Signup.aspx" class="nav-menu ul li a">Sign up</a>
                            <a href="../Partner/Signup.aspx" class="nav-menu ul li a">For Partner</a>
                        </div>
                    </div>
                </div>
                <!-- #nav-menu-container -->
            </div>
        </header>

        <div class="container-fluid" style="">
            <div class="row" style="">
                <img src="../assets/img/banner/banner1.jpg" style="width:100%;height: 150px;" />

            </div>

            <div class="row" style="margin: 30px 0px 0px 0px;">


                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Filter </h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12" style="margin-top: 10px;">
                            <b>Category </b>
                            <asp:DropDownList ID="ddlCategoryIdRefilter" runat="server" Width="60%" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryIdRefilter_SelectedIndexChanged">
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
                    <div class="row" style="margin-top: 10px;">
                        <div class="col-md-12">
                            <b>SubCategory</b>
                            <asp:DropDownList ID="ddlSubCategoryIdRefilter" runat="server" Width="60%" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px;">
                        <div class="col-md-12">
                            <b>PackageType</b>
                            <asp:DropDownList ID="ddlPackageTypeRefilter" runat="server" Width="60%" CssClass="form-control">
                                <asp:ListItem Value="">Select Package</asp:ListItem>
                                <asp:ListItem Value="1">Economy</asp:ListItem>
                                <asp:ListItem Value="2">Standard</asp:ListItem>
                                <asp:ListItem Value="3">Premium</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>


                    <div class="row" style="margin-bottom: 20px; margin-top: 20px;">
                        <div class="col-md-12">
                            <asp:Button ID="btnSearchRefilter" runat="server" Width="30%" Text="Filter" OnClick="btnSearchRefilter_Click"
                                CssClass="btn btn-info "></asp:Button>
                        </div>
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                    <ContentTemplate>
                        <div class="col-md-8 packageListing">
                            <div class="row">
                                <div class="col-md-3" style="padding-left: 0px;">
                                    <span style="font-size: 14px;">Package count :</span>
                                    <asp:Label ID="lblcount" Font-Bold="true" Style="font-size: 14px;" runat="server" Text="Package Count"></asp:Label>
                                </div>
                                <div class="col-md-9" style="padding-right: 0px;">
                                    <div class="" style="float: right;">
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-info btn-search" OnClick="btnSearch_Click" />
                                    </div>
                                    <div class="" style="float: right; width: 63%;">
                                        <asp:TextBox ID="txtsearch" runat="server" placeholder="Search Projects, Packages.." CssClass="form-control btn-searchtext"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="row" style="margin-top: 20px;">
                                    <div class="col-md-12">
                                        <asp:Repeater ID="rptr" runat="server" OnItemCommand="rptr_ItemCommand">
                                            <ItemTemplate>
                                                <div class="card">
                                                    <div class="row row-no-gutters p-0">
                                                        <div class="col-md-5 section leftsection shadow">
                                                            <div style="" class="col-md-12 pkgName">
                                                                <%# DataBinder.Eval(Container.DataItem, "PackageName") %>
                                                            </div>
                                                            <div class="col-md-12 pkgDescription">
                                                                <%# DataBinder.Eval(Container.DataItem, "PackageDescription") %>
                                                            </div>
                                                        </div>
                                                        <div class=" col-md-5 section sectionSeperator midsection">
                                                            <div  class="col-md-12 pkgDescription" style="color:#969696;font-style:italic;" runat="server" Visible='<%# DataBinder.Eval(Container.DataItem, "Description1").ToString().Trim() != "" %>'>
                                                                Brief
                                                            </div>
                                                            <div class="col-md-12 pkgDescription" style="color:#18AA23;" >
                                                                <%# DataBinder.Eval(Container.DataItem, "Description1") %>
                                                            </div>
                                                             <div class="col-md-12 pkgDescription" style="margin-top:15px;color:#969696;font-style:italic;" runat="server" Visible='<%# DataBinder.Eval(Container.DataItem, "Description2").ToString().Trim() != "" %>'>
                                                                Why us ?
                                                            </div>
                                                            <div class="col-md-12 pkgDescription" style="color:#007a9e;">
                                                                <%# DataBinder.Eval(Container.DataItem, "Description2") %>
                                                            </div>
                                                            <div class="col-md-12 pkgDescription" style="margin-top:15px;color:#969696;font-style:italic;"  runat="server" Visible='<%# DataBinder.Eval(Container.DataItem, "Description3").ToString().Trim() != "" %>'>
                                                                Who chose us...
                                                            </div>
                                                            <div class="col-md-12 pkgDescription" style="color:#FF6B22;">
                                                                <%# DataBinder.Eval(Container.DataItem, "Description3") %>
                                                            </div>
                                                        </div>
                                                        <div class=" col-md-2 section sectionSeperator rightsection">
                                                            <div class="col-md-12 pkgAmountText">
                                                                Starting from:
                                                            </div>
                                                            <div class="col-md-12 pkgAmount">
                                                                <div class="pkgAmtSym">₹</div>
                                                                <div class="pkgAmtCost"><%# string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}",  decimal.Parse(DataBinder.Eval(Container.DataItem, "BasicPackageCost").ToString(), System.Globalization.CultureInfo.InvariantCulture)) %></div>
                                                            </div>
                                                            <div class="col-md-12 pkgAction">
                                                                <asp:Button ID="lkbViewPackage" CommandArgument='<%#Eval("PartnerPackageId")%>' OnClientClick=" showmodal()" CommandName="Edt" runat="server"
                                                                    Text="ViewPackage" CssClass="btn btn-success btn-md btn-package"></asp:Button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <%-- <asp:DataList ID="dlQuickProjects" runat="server" RepeatColumns="1" OnItemCommand="dlQuickProjects_ItemCommand" GridLines="Both">
                                        <AlternatingItemStyle CssClass="rowAlternateStyle" />
                                        <FooterStyle  />
                                        <HeaderStyle  />
                                        <ItemStyle  CssClass="rowStyle"  />
                                        <ItemTemplate>
                                            <table style="margin-top: 20px;">
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
                                                                Text="ViewPackage" CssClass="btn btn-success btn-md" Style="margin-bottom: 20px; border-radius: 10px;"></asp:Button>
                                                        </b>
                                                    </td>

                                                </tr>
                                            </table>


                                        </ItemTemplate>

                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                    </asp:DataList>--%>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>


        </div>

        <div class='modal fade' id='myModal' tabindex='-1' role='dialog' aria-hidden='true'>
            <div class="modal-dialog" style="width: 70%;">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Package Details</h4>
                            </div>
                        



                            <div class="modal-body package-details" style="">
                                <div class="">
                                    <div class="row col-md-12" style="">
                                        <div class="category arrow">
                                            <asp:Label ID="lbltitle" runat="server"></asp:Label>
                                        </div>
                                        <div class="subcategory banner">
                                            <asp:Label ID="lblsubtitle" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                     <div class="row col-md-12" style="text-align:center;padding:0px;margin:0px;">
                                         <div class="banner-packagename">
                                             <asp:Label ID="lblPackageName" CssClass="pkgNameModal" runat="server"></asp:Label> 
                                             ( <asp:Label ID="lblpackagetypename" CssClass="pkgTypeModal" runat="server"></asp:Label> )
                                         </div>
                                    </div>
                                    
                                </div>


                              <%--  <div class="">
                                    <div class="packageContainer">
                                        <div class="package">
                                            <div class="packageLeftBar">
                                                <ul>
                                                    <li>Individual Package Details</li>
                                                    <li><i class="fa fa-tags"></i>Price</li>
                                                    <li><i class="fa xxfa-check"></i>Validity</li>
                                                    <li><i class="fa xxfa-search"></i>Visibility in Search</li>
                                                    <li><i class="fa xxfa-camera"></i>Upload Photo</li>
                                                    <li><i class="fa xxfa-phone"></i>Call User for Free</li>
                                                    <li><i class="fa xxfa-envelope"></i>SMS Blast</li>
                                                    <li><i class="fa xxfa-list"></i>Free Listing</li>
                                                    <li><i class="fa xxfa-home"></i>Hot Properties</li>
                                                    <li></li>
                                                </ul>
                                            </div>
                                            <div class="packageDetails yellow">
                                                <ul>
                                                    <li><span>Basic</span></li>
                                                    <li>Free</li>
                                                    <li>30 Days</li>
                                                    <li>Standard</li>
                                                    <li>5 Only</li>
                                                    <li><i class="fa fa-times"></i></li>
                                                    <li><i class="fa fa-times"></i></li>
                                                    <li><i class="fa fa-times"></i></li>
                                                    <li><i class="fa fa-times"></i></li>
                                                    <li><a class="signUp">Sign Up</a></li>
                                                </ul>
                                            </div>
                                           <div class="packageDetails orange">
                                                <ul>
                                                    <li><span>STANDARD</span></li>
                                                    <li>Free</li>
                                                    <li>30 Days</li>
                                                    <li>Standard</li>
                                                    <li>5 Only</li>
                                                    <li><i class="fa fa-times"></i></li>
                                                    <li><i class="fa fa-times"></i></li>
                                                    <li><i class="fa fa-times"></i></li>
                                                    <li><i class="fa fa-times"></i></li>
                                                    <li><a class="signUp">Sign Up</a></li>
                                                </ul>
                                            </div>
                                            <div class="packageDetails red">
                                                <ul>
                                                    <li><span>Premium</span></li>
                                                    <li>Rs.1750/-</li>
                                                    <li>60 Days</li>
                                                    <li>Standard</li>
                                                    <li>5 Only</li>
                                                    <li><i class="fa fa-check"></i></li>
                                                    <li><i class="fa fa-times"></i></li>
                                                    <li><i class="fa fa-times"></i></li>
                                                    <li><i class="fa fa-check"></i></li>
                                                    <li><a class="signUp">Sign Up</a></li>
                                                </ul>
                                            </div>
                                        </div>

                                    </div>
                                </div>--%>


                                <div class="">
                                    <div class="packageContainer containerRepeater">
                                        <asp:Repeater ID="rptCustomers" runat="server">
                                            <HeaderTemplate>
                                                <div class="package">
                                                    <div class="packageLeftBar">
                                                        <ul>
                                                            <li>Individual Package Details</li>
                                                            <li class="dataCellHeader"><i class="fa fa-tags"></i>Price</li>
                                                        </ul>
                                                    </div>
                                                    <div class="packageDetails yellow">
                                                        <ul>
                                                            <li><span>Basic</span></li>
                                                            <li>
                                                                ₹<%# string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}",  decimal.Parse(_packageCostBasic.ToString(), System.Globalization.CultureInfo.InvariantCulture)) %>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="packageDetails orange">
                                                        <ul>
                                                            <li><span>Standard</span></li>
                                                            <li> 
                                                                ₹<%# string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}",  decimal.Parse(_packageCostStandard.ToString(), System.Globalization.CultureInfo.InvariantCulture)) %>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="packageDetails red">
                                                        <ul>
                                                            <li><span>Premium</span></li>
                                                            <li>
                                                                ₹<%# string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}",  decimal.Parse(_packageCostPremium.ToString(), System.Globalization.CultureInfo.InvariantCulture)) %>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <div class="row col-md-12 itemRow" style="padding:0px;margin:0px;">
                                                    <div class="packageLeftBar dataCell rowHeader">
                                                        <%# Eval("Parameter") %>
                                                    </div>
                                                    <div class="packageDetails dataCell yellow" >
                                                        <div>
                                                           <%# Eval("BasicDisplayText") %>
                                                        </div>
                                                    </div>
                                                    <div class="packageDetails dataCell yellow">
                                                        <div>
                                                            <%# Eval("StandardDisplayText") %>
                                                        </div>
                                                    </div>
                                                     <div class="packageDetails dataCell yellow">
                                                       <div>
                                                           <%# Eval("PremiumDisplayText") %>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                 <div class="row col-md-12 item footer" style="padding:0px;margin:0px;">
                                                    <div class="packageLeftBar dataCell rowHeader">
                                                        <li class="blankCell"></li>    
                                                    </div>
                                                    <div class="packageDetails dataCell yellow">
                                                        <div>
                                                            <asp:Button ID="btnbasiclink" runat="server" OnClick="btnbasiclink_Click" Text="Basic" CssClass=" signUp" />
                                                        </div>
                                                    </div>
                                                    <div class="packageDetails dataCell orange">
                                                        <div>
                                                            <asp:Button ID="btnstandardlink" runat="server" Text="Standard" CssClass=" signUp" OnClick="btnstandardlink_Click" />
                                                        </div>
                                                    </div>
                                                     <div class="packageDetails dataCell red">
                                                       <div>
                                                           <asp:Button ID="btnpremium" runat="server" Text="Premium" CssClass=" signUp" OnClick="btnpremium_Click " />
                                                        </div>
                                                    </div>
                                                </div>

                                                </div>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        

                                    </div>
                                </div>
                            

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

    </form>
</body>
<script>
    $("#myModal").on("hidden.bs.modal", function () {
        //console.log('removex');
        //setTimeout(function () {
        //    $(".modal-backdrop.fade.in").remove();
        //}, 5000);
    });

    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }

   
</script>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerQuickProject.aspx.cs" Inherits="Benchkart.Customer.CustomerQuickProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CustomerQuick Project</title>
    <meta charset='utf-8' />
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport' />

    <meta name="description" content="CustomerQuick Project" />

    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>--%>


   <%-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


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

        <main>
            <div class="container-fluid" style="xxheight:100%;position:relative;">
                <div class="row" style="">
                    <img src="../assets/img/banner/banner1.jpg" style="width: 100%" />
                </div>
                <div class="row" style="margin: 30px 0px 0px 0px;">
                    <div class="col-md-4 filterSection pl-0" style="xxposition: fixed; max-height: 100%;">
                        <div class="container-fluid card shadow-custom d-flex flex-column sticky p-2">
                            <div class="xxd-flex flex-column">
                                <div class="col-md-12 pl-0" style="font-size: 14px;">
                                    <b>Filter </b>
                                </div>
                                <div class="col-sm-12 col-md-6 pl-0  float-left">Category</div>
                                <div class="col-sm-12 col-md-6 pl-0  float-left">
                                    <asp:DropDownList ID="ddlCategoryIdRefilter" runat="server" CssClass="form-control ddlFilter" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryIdRefilter_SelectedIndexChanged">
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
                                <div class="col-sm-12 col-md-6 pl-0 float-left ">
                                    Sub Category
                                </div>
                                <div class="col-sm-12 col-md-6 pl-0  float-left">
                                    <asp:DropDownList ID="ddlSubCategoryIdRefilter" runat="server" CssClass="form-control ddlFilter"></asp:DropDownList>
                                </div>
                                <div class="col-sm-12 col-md-6 pl-0  float-left">
                                    Package Type
                                </div>
                                <div class="col-sm-12 col-md-6 pl-0 float-left ">
                                    <asp:DropDownList ID="ddlPackageTypeRefilter" runat="server" CssClass="form-control ddlFilter">
                                        <asp:ListItem Value="">Select Package</asp:ListItem>
                                        <asp:ListItem Value="1">Economy</asp:ListItem>
                                        <asp:ListItem Value="2">Standard</asp:ListItem>
                                        <asp:ListItem Value="3">Premium</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                               
                                <div class="col-md-12 pl-0">
                                    <div class="col-md-12 p-0">
                                        <asp:Button ID="btnSearchRefilter" runat="server" Width="30%" Text="Filter" OnClick="btnSearchRefilter_Click" CssClass="btn btn-info "></asp:Button>
                                    </div>
                                </div>
                            </div>
                            <div class="" style="padding: 0em 5em 0em 0em; margin-top: 2em;">
                                <h5 style="color: #18d26f;">How it works..</h5>
                                Rarely have we seen a person fail who has thoroughly followed our path. 
                            Those who do not recover are people who cannot or will not completely give themselves to this simple program, usually men and women who are constitutionally incapable of being honest with themselves. There are such unfortunates. They are not at fault; they seem to have been born that way. They are naturally incapable of grasping and developing a manner of living which demands rigorous honesty. 
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8  packageListing pl-0 pr-0" style="xxposition: absolute; right: 0;">
                        <div class="container-fluid pl-0">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="col-12 col-md-4 pl-0 float-left">
                                        <span style="font-size: 14px;">Package count :</span>
                                        <asp:Label ID="lblcount" Font-Bold="true" Style="font-size: 14px;" runat="server" Text="Package Count"></asp:Label>
                                    </div>
                                    <div class="col-12 col-md-8 float-md-right pl-0 pr-0">
                                        <div class="d-flex flex-row float-right text-right w-100">
                                            <div class="w-100 w-md-75">                                                <asp:TextBox ID="txtsearch" runat="server" placeholder="Search Packages.." CssClass="form-control btn-searchtext"></asp:TextBox>
                                            </div>
                                             <div>
                                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-info btn-search" OnClick="btnSearch_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="row no-gutters">
                                        <div class="row no-gutters col-md-12" style="margin-top: 20px;">
                                            <div class="col-md-12">
                                                <asp:Repeater ID="rptr" runat="server" OnItemCommand="rptr_ItemCommand">
                                                    <ItemTemplate>
                                                        <div class="card">
                                                            <div class="row no-gutters col-12 p-0">
                                                                <div class="section leftsection shadow col-12 col-sm-4 float-left">
                                                                    <div style="" class="pkgName">
                                                                        <%# DataBinder.Eval(Container.DataItem, "PackageName") %>
                                                                    </div>
                                                                    <div class="pkgDescription mb-auto">
                                                                        <%# DataBinder.Eval(Container.DataItem, "PackageDescription") %>
                                                                    </div>
                                                                    <div class="pkgDescription">
                                                                        <ul>
                                                                            <li>
                                                                                <span class="pkgDescriptionLabel">Category</span>
                                                                                <span></span>
                                                                            </li>
                                                                            <li>
                                                                                <span class="pkgDescriptionLabel">Sub Category</span>
                                                                                <span></span>
                                                                            </li>
                                                                            <li>
                                                                                <span class="pkgDescriptionLabel">Package Type</span>
                                                                                <span></span>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="section sectionSeperator midsection col-12  col-sm-4 float-left">
                                                                    <div>
                                                                        <div class="pkgDescriptionLabel" style="" runat="server" visible='<%# DataBinder.Eval(Container.DataItem, "Description1").ToString().Trim() != "" %>'>
                                                                            About us
                                                                        </div>
                                                                        <div class="pkgDescription" style="color: #8c8c8c;">
                                                                            <%# DataBinder.Eval(Container.DataItem, "Description1") %>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mb-auto">
                                                                        <div class="pkgDescriptionLabel" style="margin-top: 15px;" runat="server" visible='<%# DataBinder.Eval(Container.DataItem, "Description2").ToString().Trim() != "" %>'>
                                                                            Why us ?
                                                                        </div>
                                                                        <div class="pkgDescription" style="color: #8c8c8c;">
                                                                            <%# DataBinder.Eval(Container.DataItem, "Description2") %>
                                                                        </div>
                                                                    </div>
                                                                    <div class="">
                                                                        <div class="pkgDescriptionLabel" style="margin-top: 15px;" runat="server" visible='<%# DataBinder.Eval(Container.DataItem, "Description3").ToString().Trim() != "" %>'>
                                                                            Who chose us...
                                                                        </div>
                                                                        <div class="pkgDescription" style="color: #8c8c8c;">
                                                                            <%# DataBinder.Eval(Container.DataItem, "Description3") %>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="section sectionSeperator rightsection col-12  col-sm-4 float-left" text-align: center;">
                                                                    <div class="pkgAmountText">
                                                                        Starting from:
                                                                    </div>
                                                                    <div class="pkgAmount">
                                                                        <span class="pkgAmtSym">₹</span>
                                                                        <span class="pkgAmtCost"><%# string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}",  decimal.Parse(DataBinder.Eval(Container.DataItem, "BasicPackageCost").ToString(), System.Globalization.CultureInfo.InvariantCulture)) %></span>
                                                                    </div>
                                                                    <div class="pkgAction">
                                                                        <asp:Button ID="lkbViewPackage" CommandArgument='<%#Eval("PartnerPackageId")%>' OnClientClick=" showmodal()" CommandName="Edt" runat="server"
                                                                            Text="See Details" CssClass="btn btn-success btn-md btn-package"></asp:Button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer id="footer" style="position:relative;">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-info">
                            <h1>benchkart</h1>
                            <p>Benchkart is a new age digital marketplace for procurement of digital B2B services. Founded by an erstwhile member of Microsoft India Leadership, we are committed to solving the challenges in procurement of services, especially for start-ups and small businesses across the world.</p>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><i class="ion-ios-arrow-right"></i><a href="#">Home</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="About" target="_blank">About us</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="Html/Faq.html" target="_blank">FAQs</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="Partner/Signup">Become a Partner</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="Policies/Terms-of-use-for-Clients.html" target="_blank">TERMS OF USE FOR CLIENTS</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="Policies/Terms-of-use-for-Partners.html" target="_blank">TERMS OF USE FOR PARTNERS</a></li>
                                <li><i class="ion-ios-arrow-right"></i><a href="Policies/Benchkart-Privacy-Policy.html" target="_blank">PRIVACY POLICY</a></li>

                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h4>Contact Us</h4>
                            <p>
                                DW 254, Nirvana Country
                            <br>
                                Gurgaon, Haryana  122018<br>
                                India
                            <br>
                                <strong>Phone:</strong> +91 9911780051<br>
                                <strong>Email:</strong> outsource@benchkart.com<br>
                            </p>

                            <div class="social-links">
                                <a href="https://twitter.com/benchkart?ref_src=twsrc%5Etfw" target="_blank" class="twitter"><i class="fa fa-twitter"></i></a>
                                <a href="https://facebook.com/benchkart-111486960437160" target="_blank" class="facebook"><i class="fa fa-facebook"></i></a>
                                <%--<a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                            <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>--%>
                                <a href="https://linkedin.com/company/benchkart" class="linkedin" target="_blank"><i class="fa fa-linkedin"></i></a>
                            </div>

                        </div>

                        <div class="col-lg-3 col-md-6 footer-newsletter">
                            <h4>BECOME A PARTNER</h4>
                            <p>We are inviting only a few of India's top rated (mid-sized) agencies to join the benchkart platform. If you feel your domain expertise & innovation can add value to our customers, please let our assessment team know.</p>
                            <%--<form action="" method="post">
                            <input type="email" name="email"><input type="submit" value="Subscribe">
                        </form>--%>
                        </div>

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong><%=DateTime.Now.Year %> Benchkart Services Pvt Ltd</strong>. All Rights Reserved
                </div>
                <div class="credits">
                </div>
            </div>
        </footer>

        

       

        <div class='modal fade' id='myModal' tabindex='-1' role='dialog' aria-hidden='true'>
            <div class="modal-dialog modal-lg" style="max-width: 75em;">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">
                                    <asp:Label ID="lblPackageName" CssClass="pkgNameModal" runat="server"></asp:Label>
                                </h5>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body package-details" style="">
                                <div class="">
                                    <div class="row col-md-12" style="">
                                        <div class="category arrow">
                                            <asp:Label ID="lbltitle" runat="server"></asp:Label>
                                        </div>
                                        <div class="category arrow" style="margin-left: 15px;">
                                            <asp:Label ID="lblsubtitle" runat="server"></asp:Label>
                                        </div>
                                        <div class="subcategory banner">
                                            <asp:Label ID="lblpackagetypename" CssClass="pkgTypeModal" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row col-md-12" style="text-align: left; padding: 0px; margin: 0px; display: flex; font-size: 14px; padding-top: 5px">
                                        <div class="">
                                            <asp:Label ID="lblPackageDescription" CssClass="pkgTypeModal" runat="server"></asp:Label>
                                        </div>
                                    </div>

                                </div>

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
                                                            <li>₹<%# string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}",  decimal.Parse(_packageCostBasic.ToString(), System.Globalization.CultureInfo.InvariantCulture)) %>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="packageDetails orange">
                                                        <ul>
                                                            <li><span>Standard</span></li>
                                                            <li>₹<%# string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}",  decimal.Parse(_packageCostStandard.ToString(), System.Globalization.CultureInfo.InvariantCulture)) %>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="packageDetails red">
                                                        <ul>
                                                            <li><span>Premium</span></li>
                                                            <li>₹<%# string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}",  decimal.Parse(_packageCostPremium.ToString(), System.Globalization.CultureInfo.InvariantCulture)) %>
                                                            </li>
                                                        </ul>
                                                    </div>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <div class="row col-md-12 itemRow" style="padding: 0px; margin: 0px;">
                                                    <div class="packageLeftBar dataCell rowHeader">
                                                        <%# Eval("Parameter") %>
                                                    </div>
                                                    <div class="packageDetails dataCell yellow">
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
                                                <div class="row col-md-12 item footer" style="padding: 0px; margin: 0px;">
                                                    <div class="packageLeftBar dataCell rowHeader">
                                                        <li class="blankCell"></li>
                                                    </div>
                                                    <div class="packageDetails dataCell yellow">
                                                        <div>
                                                            <asp:Button ID="btnbasiclink" runat="server" OnClick="btnbasiclink_Click" Text="Book" CssClass=" signUp" />
                                                        </div>
                                                    </div>
                                                    <div class="packageDetails dataCell orange">
                                                        <div>
                                                            <asp:Button ID="btnstandardlink" runat="server" Text="Book" CssClass=" signUp" OnClick="btnstandardlink_Click" />
                                                        </div>
                                                    </div>
                                                    <div class="packageDetails dataCell red">
                                                        <div>
                                                            <asp:Button ID="btnpremium" runat="server" Text="Book" CssClass=" signUp" OnClick="btnpremium_Click " />
                                                        </div>
                                                    </div>
                                                </div>

                                                </div>
                                            </FooterTemplate>
                                        </asp:Repeater>


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

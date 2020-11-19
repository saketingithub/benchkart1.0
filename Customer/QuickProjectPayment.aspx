<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuickProjectPayment.aspx.cs" Inherits="Benchkart.Customer.QuickProjectPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Customer - QuickProjectPayment</title>
    <meta charset='utf-8' />
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="description" content="Sign Up" />

    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <%--<script src="../Scripts/bootstrap.min.js"></script>--%>
    <%--<script src="../Scripts/jquery.min.js"></script>--%>
    <link href="../css/quick-projects.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet">

    <style>
        @media only screen and (max-width: 799px) {
            .content {
                width: 90% !important;
            }

            .divfield {
                margin-bottom: 20px !important;
                width: 95% !important;
            }
        }
    </style>
    <style>
        .content {
            padding: 10px;
            margin: 0 auto;
            position: relative;
            z-index: 0;
            min-height: 400px;
            width: 50%;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .button {
            width: 70%;
            background-color: #18D26E;
            color: White;
            height: 30px;
            border-radius: 5px;
            margin-top: 20px;
        }

        .panel {
            margin: 0 auto;
            margin-top: 70px;
            padding: 20px;
            width: 100%;
            min-height: 300px;
        }

        br {
            display: block; /* makes it have a width */
            content: ""; /* clears default height */
            margin-top: 0; /* change this to whatever height you want it */
        }

        .divfield {
            margin: 0 auto;
            margin-bottom: 20px;
            width: 70%;
        }
    </style>
    <script type="text/javascript">
        function ValidateCheckBox(sender, args) {
            if (document.getElementById("<%=chkTerms.ClientID %>").checked == true) {
                args.IsValid = true;
            } else {
                document.getElementById("lblTerms").style.display = "block";
                args.IsValid = false;
                return false;
            }
        }
    </script>

</head>
<body style="background-color: #f8f8f8;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <div style="background-color: black; color: Black; display: flow-root; height: 60px;">
                <div id="logo" style="float: left;">
                    <h1 class="header"><a href="https://www.benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
                </div>
                <div style="float: right; margin-top: 20px;">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default" Text="Home" ForeColor="Blue" Style="color: white; font-size: small; margin-right: 10px; text-decoration: underline;"></asp:HyperLink>
                </div>
            </div>
        </div>


        <div class="container-fluid ribbon-container" style="margin-top: 30px;">

            <div class="col-md-4">
                <div class="container-fluid card shadow-custom d-flex flex-column">
                    <div class="" style="padding: 2em;">
                        <h4 style="color: #18d26f;">Assurance Text..</h4>
                        Rarely have we seen a person fail who has thoroughly followed our path. 
                                Those who do not recover are people who cannot or will not completely give themselves to this simple program, usually men and women who are constitutionally incapable of being honest with themselves. There are such unfortunates. They are not at fault; they seem to have been born that way. They are naturally incapable of grasping and developing a manner of living which demands rigorous honesty. 
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <section>
                    <div class="ribbon">
                        <div class="ribbon5">
                            <span>
                                <asp:Label ID="lblpackagenamepay" runat="server" Text=""></asp:Label>
                                @ ₹<%= ViewState["packageDisplayCost"]%>
                                <asp:Label ID="lblpackagecost" runat="server" Visible="false"></asp:Label>
                                <%-- <%# string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}",  decimal.Parse(_packageCost.ToString(), System.Globalization.CultureInfo.InvariantCulture)) %>--%>
                            </span>
                            <span class="agency-info">Agency Code : 
                           <asp:Label ID="lblagencycode" runat="server" Text="AgencyCode"></asp:Label>
                            </span>
                        </div>
                        <asp:Panel ID="pnlSignup" DefaultButton="btnPay" runat="server" class="panel" Style="">
                            <asp:HiddenField runat="server" ID="hfPaymentRequestId" />
                            <div class="divfield">
                                <asp:TextBox runat="server" ID="txtFullName" class="form-control"
                                    PlaceHolder="Full Name" Style="margin-left: 0px;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtFullName" runat="server" SetFocusOnError="True"
                                    Display="Dynamic" ControlToValidate="txtFullName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your full name"
                                    ToolTip="Full Name is required." ValidationGroup="Pay"></asp:RequiredFieldValidator>
                            </div>
                            <div class="divfield">
                                <asp:TextBox runat="server" ID="txtEmailid" class="form-control"
                                    PlaceHolder="Email" Style="margin-top: 10px; margin-left: 0px;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtEmail" runat="server" SetFocusOnError="True"
                                    Display="Dynamic" ControlToValidate="txtEmailid" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill email"
                                    ToolTip="E-mail is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Invalid email"
                                    SetFocusOnError="True" ControlToValidate="txtEmailid" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                    ForeColor="Red" Font-Size="Small" ValidationGroup="Pay" Display="Dynamic" />
                            </div>
                            <div class="divfield">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Style="margin-top: 20px;"
                                    CssClass="form-control fa-step-forward" placeholder="Set Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtPassword" runat="server" SetFocusOnError="True"
                                    Display="Dynamic" ControlToValidate="txtPassword" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill password"
                                    ToolTip="Password is required." ValidationGroup="Pay">Please fill password</asp:RequiredFieldValidator>
                            </div>

                            <div class="divfield">
                                <asp:TextBox runat="server" ID="txtCompanyName" class="form-control"
                                    PlaceHolder="Company Name" Style="margin-top: 10px; margin-left: 0px;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtCompanyName" runat="server" SetFocusOnError="True"
                                    Display="Dynamic" ControlToValidate="txtCompanyName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your company name"
                                    ToolTip="Company Name is required." ValidationGroup="Pay"></asp:RequiredFieldValidator>
                            </div>
                            <div class="divfield">
                                <asp:TextBox runat="server" ID="txtContactNumber" class="form-control"
                                    PlaceHolder="Contact Number" Style="margin-top: 10px; margin-left: 0px;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtContactNumber" runat="server" SetFocusOnError="True"
                                    Display="Dynamic" ControlToValidate="txtContactNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill contact number"
                                    ToolTip="Contact number is required." ValidationGroup="Pay"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regtxtContactNumber" runat="server" ErrorMessage="Invalid phone - accept only 10 digit mobile number"
                                    SetFocusOnError="True" ControlToValidate="txtContactNumber" ValidationExpression="^[0-9]{10}$"
                                    ForeColor="Red" Font-Size="Small" ValidationGroup="Pay" Display="Dynamic" />

                            </div>
                            <div class="divfield">
                                <asp:TextBox runat="server" ID="tbPaymentAmount" class="form-control"
                                    PlaceHolder="" Style="margin-top: 10px; margin-left: 0px; width: 50%; display: inline-block;"></asp:TextBox>
                                <span style="color: #808080">@ <%=ViewState["paymentPercentage"] %>% of ₹<%= ViewState["packageDisplayCost"]%>
                                </span>

                            </div>


                            <div class="divfield">
                                <h5 class="TermsnCond">
                                    <asp:CheckBox runat="server" ID="chkTerms" ValidationGroup="Pay" />&nbsp;&nbsp;I Agree to the 
                                    <a href="../Policies/Terms-of-use-for-Clients.html" target="_blank">Terms of use for Clients</a>&nbsp;&&nbsp;<a href="../Policies/Benchkart-Privacy-Policy.html" target="_blank">Privacy Policy</a>
                                </h5>
                                <asp:Label runat="server" ID="lblTerms" Style="display: none; font-size: small;" ForeColor="Red" Text="Please check and agree to the Terms & Conditions"></asp:Label>
                                <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Pay" runat="server" Display="Dynamic" ClientValidationFunction="ValidateCheckBox"></asp:CustomValidator>
                            </div>
                            <div class="formindent divfield TermsnCond" style="font-size: small;">
                                Already user? &nbsp;
                            <button type="button" data-toggle="modal" class="btn btn-info" data-target="#myModal">Sign in</button>

                            </div>
                            <div class="formindent divfield">
                                <asp:Button ID="btnPay" runat="server" Width="100%" ValidationGroup="Pay" CssClass="button" Text="Pay" OnClick="btnPay_Click" />
                            </div>

                            <div class="formindent divfield contactusform">
                                <span>Still not sure? <a href="javscscript:void(0);" onclick="openContactForm();">Contact us</a> and we will be happy to assist.</span>
                            </div>

                        </asp:Panel>
                    </div>

                </section>
            </div>


        </div>

        <%--<div>

            <div class="row" style="width: 100%;">

                <div id="divsignup" class="content">

                    <asp:Panel ID="pnlSignup" DefaultButton="btnPay" runat="server" class="panel" Style="margin: 0 auto; padding: 20px;">

                        <asp:HiddenField runat="server" ID="hfPaymentRequestId" />
                        <div class="divfield">
                            <table style="background-color: antiquewhite; width: 100%;">
                                <tr>
                                    <td>PackageName 
                                    </td>
                                    <td>
                                       <asp:Label ID="lblpackagenamepay" runat="server" Text="PackageName"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>AgencyCode
                                    </td>
                                    <td>
                                        <asp:Label ID="lblagencycode" runat="server" Text="AgencyCode"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>PackageCost 
                                    </td>
                                    <td>
                                        <asp:Label ID="lblpackagecost" runat="server" Text="PackageCost"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div class="divfield">
                            <asp:TextBox runat="server" ID="txtFullName" class="form-control"
                                PlaceHolder="Full Name" Style="margin-left: 0px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqtxtFullName" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="txtFullName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your full name"
                                ToolTip="Full Name is required." ValidationGroup="Pay"></asp:RequiredFieldValidator>
                        </div>
                        <div class="divfield">
                            <asp:TextBox runat="server" ID="txtEmailid" class="form-control"
                                PlaceHolder="Email" Style="margin-top: 10px; margin-left: 0px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqtxtEmail" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="txtEmailid" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill email"
                                ToolTip="E-mail is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Invalid email"
                                SetFocusOnError="True" ControlToValidate="txtEmailid" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                ForeColor="Red" Font-Size="Small" ValidationGroup="Pay" Display="Dynamic" />
                        </div>
                        <div class="divfield">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Style="margin-top: 20px;"
                                CssClass="form-control fa-step-forward" placeholder="Set Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqtxtPassword" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="txtPassword" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill password"
                                ToolTip="Password is required." ValidationGroup="Pay">Please fill password</asp:RequiredFieldValidator>
                        </div>

                        <div class="divfield">
                            <asp:TextBox runat="server" ID="txtCompanyName" class="form-control"
                                PlaceHolder="Company Name" Style="margin-top: 10px; margin-left: 0px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqtxtCompanyName" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="txtCompanyName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your company name"
                                ToolTip="Company Name is required." ValidationGroup="Pay"></asp:RequiredFieldValidator>
                        </div>
                        <div class="divfield">
                            <asp:TextBox runat="server" ID="txtContactNumber" class="form-control"
                                PlaceHolder="Contact Number" Style="margin-top: 10px; margin-left: 0px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqtxtContactNumber" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="txtContactNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill contact number"
                                ToolTip="Contact number is required." ValidationGroup="Pay"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regtxtContactNumber" runat="server" ErrorMessage="Invalid phone - accept only 10 digit mobile number"
                                SetFocusOnError="True" ControlToValidate="txtContactNumber" ValidationExpression="^[0-9]{10}$"
                                ForeColor="Red" Font-Size="Small" ValidationGroup="Pay" Display="Dynamic" />

                        </div>

                        <div class="divfield">
                            <h5>
                                <asp:CheckBox runat="server" ID="chkTerms" ValidationGroup="Pay" />&nbsp;&nbsp;I Agree to the 
                                    <a href="../Policies/Terms-of-use-for-Clients.html" target="_blank">Terms of use for Clients</a>&nbsp;&&nbsp;<a href="../Policies/Benchkart-Privacy-Policy.html" target="_blank">Privacy Policy</a>
                            </h5>
                            <asp:Label runat="server" ID="lblTerms" Style="display: none; font-size: small;" ForeColor="Red" Text="Please check and agree to the Terms & Conditions"></asp:Label>
                            <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Pay" runat="server" Display="Dynamic" ClientValidationFunction="ValidateCheckBox"></asp:CustomValidator>
                        </div>
                        <div class="formindent divfield" style="font-size: small;">
                            Already user? &nbsp;
                            <button type="button" data-toggle="modal" data-target="#myModal">Signin</button>

                        </div>
                        <div class="formindent divfield">
                            <asp:Button ID="btnPay" runat="server" Width="100%" ValidationGroup="Pay" CssClass="button" Text="Pay" OnClick="btnPay_Click" />
                        </div>

                    </asp:Panel>
                </div>
            </div>
        </div>--%>
       
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="" aria-hidden="true">
            <div class="modal-dialog" style="width: 50%;">

                <asp:UpdatePanel ID="upModal" runat="server">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                                <h4 class="modal-title">Sign In</h4>
                            </div>
                            <div class="modal-body" style="">
                                <div class="container-fluid">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="txtLogin" ValidationGroup="Signin" class="form-control"
                                                Width="90%" PlaceHolder="Email" Style="margin-top: 20px; margin-left: 0px;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqtxtLogin" ValidationGroup="Signin" runat="server" Display="Dynamic" Font-Size="Small"
                                                SetFocusOnError="True" ControlToValidate="txtLogin" ForeColor="Red" ErrorMessage="E-mail is required."
                                                ToolTip="E-mail is required.">Please fill Email</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="regtxtLogin" runat="server" ErrorMessage="Invalid email." Display="Dynamic" Font-Size="Small"
                                                SetFocusOnError="True" ControlToValidate="txtLogin" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                                ForeColor="Red" ValidationGroup="Signin" />
                                        </div>
                                    </div>
                                    <div class="col-md-12" style="">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="Password" Style="margin-top: 20px;" ID="txtLoginpassword" ValidationGroup="Signin"
                                                class="form-control " Width="90%" PlaceHolder="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqtxtLoginpassword" runat="server" SetFocusOnError="True" Font-Size="Small"
                                                ControlToValidate="txtLoginpassword" ForeColor="Red" ErrorMessage="Password is required."
                                                ToolTip="Password is required." ValidationGroup="Signin">Please fill Password</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-3" style="">
                                        <div class="form-group">
                                            <asp:Button ID="btnSigninPay" runat="server" Text="Pay" CssClass="button" />
                                            <br />
                                            <asp:HyperLink ID="hyplforgetpassword" runat="server" NavigateUrl="../">Forgot Password</asp:HyperLink>
                                            <br />
                                            <asp:HyperLink ID="hyplnewuser" runat="server" NavigateUrl="../">New User</asp:HyperLink>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
    <div class='modal fade' id='modalpayresp' tabindex='-1' data-backdrop="static" role='dialog' aria-labelledby='modalpayrespLabel' aria-hidden='true'>
        <div class='modal-dialog' role='document'>
            <div class='modal-content'>
                <div class='modal-header'>
                    <h5 class='modal-title' id='exampleModalLabel'>Payment response</h5>
                </div>
                <div class='modal-body'>
                    <div id='dvSuccessMessage' class='alert alert-success'>
                        <strong>Success!</strong> Your payment was successful...redirecting to home page
                    </div>
                </div>
                <div class='modal-footer'>
                </div>
            </div>
        </div>
    </div>

    <footer id="footer">
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
</body>
</html>

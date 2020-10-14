<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="Benchkart.Customer.Signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer - Sign in</title>
    <meta charset='utf-8' />
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="description" content="Sign In" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
    <script src="../Scripts/Custom.js"></script>
    <script src="../Scripts/jquery.multifile.js"></script>
    <script src="../Scripts/Skills.js"></script>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <link href="../css/partner.css" rel="stylesheet" type="text/css" />

    <style>
        @media only screen and (max-width: 799px) {
            .content {
                width: 90% !important;
            }
        }
    </style>
    <style>
        .content {
            padding: 10px;
            margin: 0 auto;
            position: relative;
            z-index: 0;
            min-height: 350px;
            margin-top: 40px;
            width: 40%;
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
            /*margin-top: 70px;*/
            padding-top: 20px;
            width: 90%;
            min-height: 300px;
        }

        br {
            display: block; /* makes it have a width */
            content: ""; /* clears default height */
            margin-top: 0; /* change this to whatever height you want it */
        }
    </style>
</head>
<body style="background-color: #f8f8f8; height: 100%;">
    <form id="form1" runat="server">
        <div>
            <div style="background-color: black; color: Black; display: flow-root; height: 60px;">
                <div id="logo" style="float: left;">
                    <h1 class="header"><a href="https://www.benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
                </div>
            </div>
        </div>
        <div id="divlogin" class="content">
            <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnLogin" class="panel">
                <h4>Sign in</h4>
                <div>
                    <asp:TextBox runat="server" ID="txtLogin" ValidationGroup="Signin" class="form-control"
                        Width="90%" PlaceHolder="Email" Style="margin-top: 20px; margin-left: 0px;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtxtLogin" ValidationGroup="Signin" runat="server" Display="Dynamic" Font-Size="Small"
                        SetFocusOnError="True" ControlToValidate="txtLogin" ForeColor="Red" ErrorMessage="E-mail is required."
                        ToolTip="E-mail is required.">Please fill Email</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regtxtLogin" runat="server" ErrorMessage="Invalid email." Display="Dynamic" Font-Size="Small"
                        SetFocusOnError="True" ControlToValidate="txtLogin" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                        ForeColor="Red" ValidationGroup="Signin" />
                </div>
                <div>
                    <asp:TextBox runat="server" TextMode="Password" Style="margin-top: 20px;" ID="txtLoginpassword" ValidationGroup="Signin"
                        class="form-control " Width="90%" PlaceHolder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtxtLoginpassword" runat="server" SetFocusOnError="True" Font-Size="Small"
                        ControlToValidate="txtLoginpassword" ForeColor="Red" ErrorMessage="Password is required."
                        ToolTip="Password is required." ValidationGroup="Signin">Please fill Password</asp:RequiredFieldValidator>
                </div>
                <%-- <div class="formindent"> <div class="checkbox"> <input id="RememberMe"
            name="RememberMe" type="checkbox" value="true"><input name="RememberMe" type="hidden"
            value="false"> <label for="RememberMe"> Remember me?</label> </div> </div>--%>
                <div class="formindent">
                    <%--<input type="submit" class="common-btn" value="Sign in">--%>
                   
                    <div>
                        <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="check" Checked="true" Text="Remember me" style="font-size: small;font-weight: normal;" />
                    </div>
                    <asp:Button ID="btnLogin" runat="server" Text="Sign in" ValidationGroup="Signin"
                        OnClick="btnLogin_Click" class="button" Style="margin-top: 20px;" />
                </div>
                <div class="formindent" style="margin-top: 20px;">
                    <asp:HyperLink ID="hplForgotPassword" runat="server" NavigateUrl="~/Customer/ForgetPassword" Text="Forgot Password" Style="text-decoration: underline; font-size: small;"></asp:HyperLink>
                </div>
                 <div class="formindent divfield" style="font-size: small;">
                        New user?
                            <asp:HyperLink ID="hplLogin" runat="server" NavigateUrl="~/Customer/Signup" Text="Signup" ForeColor="Blue" Style="text-decoration: underline;"></asp:HyperLink>
                    </div>
                <asp:Label ID="lblLoginError" runat="server" ForeColor="Red" Text="Email Id or password is not correct"
                    Visible="false"></asp:Label>
                <%-- <asp:ImageButton runat="server" ImageUrl="~/Images/linkedin.png" class="button" />--%>
                <%--<div class="formindent short"> <a href="/account/forgotpassword">Forgot your
            password?</a> </div>--%>
            </asp:Panel>

        </div>
        <div style="background-color: white; position: relative; bottom: 0 !important; width: 100%; color: black; margin-top: 100px;">
            <div class="container text-center" style="">
                <br />
                <h5>Benchkart Services Pvt Ltd</h5>
                <a href="../Policies/Terms-of-use-for-Clients.html" target="_blank">TERMS OF USE FOR CLIENTS</a><br />
                <a href="../Policies/Benchkart-Privacy-Policy.html" target="_blank">PRIVACY POLICY</a>
                <br />
            </div>
        </div>
    </form>
</body>
</html>

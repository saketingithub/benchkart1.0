<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultantLogin.aspx.cs"
    Inherits="Benchkart.Consultant.ConsultantLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Consultant Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
     <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <style>
        .content
        {
            padding: 10px;
            max-width: 1180px;
            margin: 0 auto;
            position: relative;
            z-index: 0;
            min-height: 400px;
        }
        .button
        {
            width: 40%;
            background-color: Green;
            color: White;
            height: 30px;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
</head>
<body style="background-color: #f8f8f8; margin: 0;">
    <form id="form1" runat="server">
    <div style="background-color: black; color: white; display: flow-root; height: 70px;
        margin: 0; padding: 0; width: 100%;">
         <div id="logo" style="float: left;">
                <h1 class="header"><a href="https://benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
            </div>
    </div>
    <div>
        <div style="background-color: white; color: Black; display: flow-root; margin: 0 auto; margin-top: 70px; width: 50%; padding: 50px;">
            <h3>
                Sign in</h3>
            <div>
                <asp:TextBox runat="server" ID="txtLogin" ValidationGroup="Signin" class="form-control"
                     PlaceHolder="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqtxtLogin" ValidationGroup="Signin" runat="server"
                    SetFocusOnError="True" ControlToValidate="txtLogin" ForeColor="Red" ErrorMessage="E-mail is required."
                    ToolTip="E-mail is required.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regtxtLogin" runat="server" ErrorMessage="Invalid email."
                    SetFocusOnError="True" ControlToValidate="txtLogin" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                    ForeColor="Red" ValidationGroup="Signin" Display="Dynamic" />
            </div>
            <div>
                <asp:TextBox runat="server" TextMode="Password" ID="txtLoginpassword" ValidationGroup="Signin"
                    class="form-control"  PlaceHolder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqtxtLoginpassword" runat="server" SetFocusOnError="True"
                    ControlToValidate="txtLoginpassword" ForeColor="Red" ErrorMessage="Password is required."
                    Display="Dynamic" ToolTip="Password is required." ValidationGroup="Signin">*</asp:RequiredFieldValidator>
            </div>
            <%-- <div class="formindent"> <div class="checkbox"> <input id="RememberMe"
            name="RememberMe" type="checkbox" value="true"><input name="RememberMe" type="hidden"
            value="false"> <label for="RememberMe"> Remember me?</label> </div> </div>--%>
            <div class="formindent">
                <%--<input type="submit" class="common-btn" value="Sign in">--%>
                <asp:Button ID="btnLogin" runat="server" Text="Sign in" ValidationGroup="Signin"
                    OnClick="btnLogin_Click" class="button" style="margin-top: 20px;" />
            </div>
            <asp:Label ID="lblLoginError" runat="server" ForeColor="Red" Text="Email Id or password is not correct"
                Visible="false"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>

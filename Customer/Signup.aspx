<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Benchkart.Customer.Signup" %>

<%@ Register Src="~/Customer/ucCustomerFooter.ascx" TagPrefix="uc1" TagName="ucCustomerFooter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Customer - Signup</title>
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
        <div>
            <div style="background-color: black; color: Black; display: flow-root; height: 60px;">
                <div id="logo" style="float: left;">
                    <h1 class="header"><a href="https://www.benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
                </div>
                <div style="float: right; margin-top: 20px;">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Partner/Signup.aspx" Text="Partner Signup" ForeColor="Blue" style="color: white; font-size: small; margin-right: 10px; text-decoration: underline;"></asp:HyperLink>
                </div>
            </div>
        </div>
        <div>

            <div class="row" style="width: 100%;">
                <div id="divsignup" class="content">

                    <asp:Panel ID="pnlSignup" runat="server" DefaultButton="btnSignup" class="panel" Style="margin: 0 auto; padding: 20px;">

                        <h3 style="font-size: 20px; color: gray; margin-bottom: 20px; margin-top: 0px; text-align: center;">Sign up</h3>
                        <div class="divfield">
                            <asp:TextBox runat="server" ID="txtFullName" class="form-control"
                                PlaceHolder="Full Name" Style="margin-left: 0px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqtxtFullName" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="txtFullName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your full name"
                                ToolTip="Full Name is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                        </div>
                        <div class="divfield">
                            <asp:TextBox runat="server" ID="txtEmailid" class="form-control"
                                PlaceHolder="Email" Style="margin-top: 10px; margin-left: 0px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqtxtEmail" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="txtEmailid" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill email"
                                ToolTip="E-mail is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Invalid email"
                                SetFocusOnError="True" ControlToValidate="txtEmailid" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />
                        </div>
                        <div class="divfield">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Style="margin-top: 20px;"
                                CssClass="form-control fa-step-forward" placeholder="Set Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqtxtPassword" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="txtPassword" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill password"
                                ToolTip="Password is required." ValidationGroup="Signup">Please fill password</asp:RequiredFieldValidator>
                        </div>

                        <div class="divfield">
                            <asp:TextBox runat="server" ID="txtCompanyName" class="form-control"
                                PlaceHolder="Company Name" Style="margin-top: 10px; margin-left: 0px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqtxtCompanyName" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="txtCompanyName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your company name"
                                ToolTip="Company Name is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                        </div>
                        <div class="divfield">
                            <asp:TextBox runat="server" ID="txtContactNumber" class="form-control"
                                PlaceHolder="Contact Number" Style="margin-top: 10px; margin-left: 0px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqtxtContactNumber" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="txtContactNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill contact number"
                                ToolTip="Contact number is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regtxtContactNumber" runat="server" ErrorMessage="Invalid phone - accept only 10 digit mobile number"
                                SetFocusOnError="True" ControlToValidate="txtContactNumber" ValidationExpression="^[0-9]{10}$"
                                ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />

                        </div>
                        <div class="divfield">
                            <asp:DropDownList ID="ddlservices" runat="server" CssClass="form-control" >
                               <asp:ListItem Value="">--Select--</asp:ListItem>
                                <asp:ListItem Value="0" >I need a service</asp:ListItem>
                                <asp:ListItem Value="1">I am a service provider</asp:ListItem>
                            </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="reqddlservices" runat="server" SetFocusOnError="True"
                                Display="Dynamic" ControlToValidate="ddlservices" ForeColor="Red" Font-Size="Small" ErrorMessage="Please select service"
                                ToolTip="Please select service." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                        </div>
                        <div class="divfield">
                            <h5>
                                <asp:CheckBox runat="server" ID="chkTerms" ValidationGroup="Signup" />&nbsp;&nbsp;I Agree to the 
                                    <a href="../Policies/Terms-of-use-for-Clients.html" target="_blank">Terms of use for Clients</a>&nbsp;&&nbsp;<a href="../Policies/Benchkart-Privacy-Policy.html" target="_blank">Privacy Policy</a>
                            </h5>
                            <asp:Label runat="server" ID="lblTerms" Style="display: none; font-size: small;" ForeColor="Red" Text="Please check and agree to the Terms & Conditions"></asp:Label>
                            <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Signup" runat="server" Display="Dynamic" ClientValidationFunction="ValidateCheckBox"></asp:CustomValidator>
                        </div>
                        <div class="formindent divfield" style="font-size: small;">
                            Already user?
                            <asp:HyperLink ID="hplLogin" runat="server" NavigateUrl="~/Customer/Signin" Text="Signin" ForeColor="Blue" style="text-decoration: underline;"></asp:HyperLink>
                        </div>
                        <div class="formindent divfield">
                            <asp:Button ID="btnSignup" runat="server" Width="100%" ValidationGroup="Signup" CssClass="button" Text="Submit"
                                OnClick="btnSignup_Click" />
                        </div>

                    </asp:Panel>

                </div>

            </div>

        </div>
        <div class="modal-footer" style="background-color: white; position: relative; bottom: 0; width: 100%; color: black;">
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

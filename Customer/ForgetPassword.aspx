<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Benchkart.Customer.ForgetPassword" %>

<%@ Register Src="~/Customer/ucCustomerFooter.ascx" TagPrefix="uc1" TagName="ucCustomerFooter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Customer - Forget Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <style>
        .content {
            margin-left: auto;
            margin-right: auto;
            position: relative;
            z-index: 0;
            min-width: 500px;
            min-height: 600px;
        }

        .button {
            width: 70%;
            background-color: Green;
            color: White;
            height: 30px;
            border-radius: 5px;
            margin-top: 20px;
        }

        .panel {
            padding: 20px;
            width: 50%;
            margin: 0 auto;
            margin-top: 30px;
        }

        br {
            display: block; /* makes it have a width */
            content: ""; /* clears default height */
            margin-top: 0; /* change this to whatever height you want it */
        }
    </style>
    <script type="text/javascript">
        function checkemail() {
            var emailid = document.getElementById("txtEmailidForgetPassword").value;
            if (emailid == "") {
                alert("Please fill the email id");
                document.getElementById("txtEmailidForgetPassword").focus;
                return false;
            }

            var emailpat = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            // var emailpat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
            var matcharray = emailid.match(emailpat);
            if (matcharray == null) {
                alert("Your email address seems incorrect. Please try again.");
                document.getElementById("txtEmailidForgetPassword").focus;
                return false;
            }

        }
        function checkpassword() {
            var password = document.getElementById("txtForgetPassword").value;
            if (password == "") {
                alert("Please fill password");
                document.getElementById("").focus();
            }
            var Cpassword = document.getElementById("txtCForgetPassword").value;

            if (Cpassword == "") {
                alert("Please fill confirm password")
                document.getElementById("txtCForgetPassword").focus;
                return false;
            }
            if (password == Cpassword) {
                return true;
            }
            else {
                alert("Confirmation password does not match. Please retry");
                document.getElementById("txtCForgetPassword").focus;
                return false;
            }
        }

    </script>
</head>
<body style="background-color: #f8f8f8;">
    <form id="form1" runat="server">
        <div style="background-color: black; color: white; display: flow-root;">

             <div id="logo" style="float: left;">
                <h1 class="header"><a href="https://www.benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
            </div>
        </div>
        <div>
            <div class="content " style="margin-left: auto; margin-right: auto; margin-top: 50px;">
                <div class="row">

                    <div id="divlogin" class="col-sm-12">


                        <asp:Panel ID="pnlOtp" runat="server" DefaultButton="btnEmailIdGenrateOtp" class="panel" Style="margin: 0 auto; width: 50%;">

                            <h3 style="font-size: 20px; color: gray;">Forgot Password</h3>
                            <div>
                                <asp:TextBox runat="server" ID="txtEmailidForgetPassword" class="form-control"
                                    Width="70%" PlaceHolder="Email" Style="margin-top: 10px; margin-left: 0px;"></asp:TextBox>

                            </div>
                            <div class="formindent">
                                <asp:Button ID="btnEmailIdGenrateOtp" style="margin-top: 20px;" runat="server" OnClientClick="return checkemail()" OnClick="btnEmailIdGenrateOtp_Click" CssClass="button" Text="Generate OTP" />
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlForgetPassword" Style="display: none;"
                            runat="server" DefaultButton="btnSave" CssClass="panel">
                            <div>
                                <asp:TextBox runat="server" ID="txtOtp" class="form-control"
                                    Width="70%" PlaceHolder="Verify otp code" style="margin-left: 0px;"></asp:TextBox>
                            </div>
                            <div>
                                <asp:TextBox ID="txtForgetPassword" runat="server" TextMode="Password" Width="70%" Style="margin-top: 20px;"
                                    CssClass="form-control fa-step-forward" placeholder="New Password"></asp:TextBox>
                            </div>
                            <div>
                                <asp:TextBox ID="txtCForgetPassword" runat="server" TextMode="Password" Width="70%" Style="margin-top: 20px;"
                                    CssClass="form-control " placeholder="Confirm password"></asp:TextBox>
                            </div>
                            <div class="formindent">
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" OnClientClick="return checkpassword();" Style="margin-top: 20px;" CssClass="button" Text="Submit" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>

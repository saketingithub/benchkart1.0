<%@ Page Language="C#" AutoEventWireup="true" Inherits="Benchkart.Partner.Signup" EnableEventValidation="false" CodeBehind="Signup.aspx.cs" %>

<%@ Register Src="~/Partner/ucPartnerFooter.ascx" TagPrefix="uc1" TagName="ucPartnerFooter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- Required meta tags -->
    <meta charset='utf-8'>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="Partner sign up" />
    <title>Partner sign up</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/Custom.js"></script>
    <link href="../css/partner.css" rel="stylesheet" type="text/css" />

    <%-- <script src="../Scripts/cities.js"></script>--%>
    <script src="../Scripts/Skills.js"></script>
    <script src="../Scripts/Cities.js"></script>
    <script>
        function countChar(val) {
            var len = val.value.length;
            if (len >= 1000) {
                val.value = val.value.substring(0, 1000);
            } else {
                $('#charNum').text(1000 - len);
            }
        };
    </script>
    <style>
        label {
            font-weight: normal;
        }

        h6 {
            text-align: left;
            line-height: 1px;
        }

        input[type=text] {
            width: 100%;
        }

        .divField {
            width: 70%;
            margin: 0 auto;
            margin-top: 25px;
        }

        tr {
            padding-right: 10px;
        }

        td {
            padding-right: 10px;
        }
    </style>
    <style>
        @media (max-width: 767px) {
            #divPanel {
                width: 95%;
            }

            .divField {
                width: 90%;
            }
        }

        @media (min-width: 768px) {
            #divPanel {
                width: 70%;
            }

            .btn-group > .btn:first-child {
                margin-left: 0;
                min-width: 500px;
            }
        }
    </style>
    <style>
        a.disabled {
            pointer-events: none;
            cursor: default;
        }
    </style>
    <style>
        .nav > li {
            padding: 5px;
        }

            .nav > li > a {
                color: Black;
                background-color: #f5f5f5;
            }

        .nav-pills > li.active > a, .nav-pills > li.active > a:focus, .nav-pills > li.active > a:hover {
            color: #fff;
            background-color: #F79507;
        }
    </style>

    <script>

        function displaypnlBasicback() {
            $('#pnlSignup').show();
            $('#pnlBasic').hide();
            return false;
        }
        function displaypnlBasicNext() {

            var x = document.getElementById("ddlCompanyStarted").value;
            if (x == "") {
                alert("Please select incorporation date!");
                document.getElementById("ddlCompanyStarted").focus();
                return false;
            }

            var x = document.getElementById("ddlEmployeeNumber").value;
            if (x == "") {
                alert("Please select number of employees!");
                document.getElementById("ddlEmployeeNumber").focus();
                return false;
            }

            var x = document.getElementById("ddlDescribedAs").value;
            if (x == "") {
                alert("Please select company best described as!");
                document.getElementById("ddlDescribedAs").focus();
                return false;
            }

            var x = document.getElementById("ddlCompanyType").value;
            if (x == "") {
                alert("Please select company type!");
                document.getElementById("ddlCompanyType").focus();
                return false;
            }

            var x = validate_option("chkClientFrom")
            if (x == false) {
                alert("Please select atleast 1 'Clients Primarily from' item(s)");
                document.getElementById("chkClientFrom").focus();
                return false;
            }
            var x = validate_option("rdoPricePositioning")
            if (x == false) {
                alert("Please select your company price positioning");
                document.getElementById("rdoPricePositioning").focus();
                return false;
            }
            var x = validate_option("chkCustomerSegment")
            if (x == false) {
                alert("Please select atleast 1 'Primary Customer Segments' item(s)");
                document.getElementById("chkCustomerSegment").focus();
                return false;
            }
            var x = document.getElementById("ddlPrimarySourceofRevenue").value;
            if (x == "") {
                alert("Please select your company primary source of revenue");
                document.getElementById("ddlPrimarySourceofRevenue").focus();
                return false;
            }

            $('#myTab li:nth-child(2) a').tab('show');
            $('#pnlDetails').show();
            $('#pnlBasic').hide();
        }
        function validate_option(clientID) {
            var atLeast = 1
            var opt = document.getElementById(clientID);
            var select = opt.getElementsByTagName("input");
            var counter = 0;
            for (var i = 0; i < select.length; i++) {
                if (select[i].checked) {
                    counter++;
                }
            }
            if (atLeast > counter) {
                return false;
            }
            return true;
        }
        function displaypnlDetailsback() {
            $('#myTab li:nth-child(1) a').tab('show');
            $('#pnlBasic').show();
            $('#pnlDetails').hide();
            return false;
        }
        function displaypnlDetailsNext() {

            var x = document.getElementById("txtCompanyAbout").value;
            if (x == "") {
                alert("Please fill something about company!");
                document.getElementById("txtCompanyAbout").focus();
                return false;
            }

            var x = document.getElementById("txtCompanyAddress").value;
            if (x == "") {
                alert("Please fill company address!");
                document.getElementById("txtCompanyAddress").focus();
                return false;
            }

            var x = document.getElementById("ddlStates").value;
            if (x == "") {
                alert("Please select state!");
                document.getElementById("ddlStates").focus();
                return false;
            }

            var x = document.getElementById("ddlCities").value;
            if (x == "") {
                alert("Please select city!");
                document.getElementById("ddlCities").focus();
                return false;
            }

            var x = document.getElementById("txtPincode").value;
            if (x == "") {
                alert("Please fill Pincode!");
                document.getElementById("txtPincode").focus();
                return false;
            }
            var CheckZipCode = /(^\d{6}$)/;
            if (!CheckZipCode.test(x)) {
                alert("Pincode must be in 6 digit valid format!");
                document.getElementById("txtPincode").focus();
                return false;
            }

            var x = document.getElementById("txtGSTNumber").value;
            if (x == "") {
                alert("Please fill company GST number!");
                document.getElementById("txtGSTNumber").focus();
                return false;
            }
            $('#myTab li:nth-child(3) a').tab('show');
            $('#pnlDetails').hide();
            $('#pnlServices').show();

            return false;
        }
        function displaypnlServicesback() {
            $('#myTab li:nth-child(2) a').tab('show');
            $('#pnlDetails').show();
            $('#pnlServices').hide();
            return false;
        }


        function displaypnlServicesNext() {
            var x = document.getElementById("ddlGraphics").value;
            if (x == "") {
                x = document.getElementById("ddlWeb").value;
                if (x == "") {
                    //x = document.getElementById("ddlEcommerce").value;
                    //if (x == "") {
                    x = document.getElementById("ddlDigital").value;
                    if (x == "") {
                        x = document.getElementById("ddlApps").value;
                        if (x == "") {
                            x = document.getElementById("ddlCloud").value;
                            if (x == "") {
                                x = document.getElementById("ddlVoice").value;
                                if (x == "") {
                                    x = document.getElementById("ddlKnowledge").value;
                                    if (x == "") {
                                        x = document.getElementById("ddlBackoffice").value;
                                        if (x == "") {
                                            alert("Please select atleast one sub-category!");
                                            return false;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

            }

            $('#myTab li:nth-child(4) a').tab('show');
            $('#pnlServices').hide();
            $('#pnlSkillsTalent').show();
            return false;
        }

        function displaypnlSkillsTalentback() {
            $('#myTab li:nth-child(3) a').tab('show');
            $('#pnlServices').show();
            $('#pnlSkillsTalent').hide();
            return false;
        }
        function displaypnlSkillsTalentNext() {
            $('#myTab li:nth-child(5) a').tab('show');
            $('#pnlSkillsTalent').hide();
            $('#pnlRepresentative').show();
            return false;
        }

        //function displaypnlFreeTrialback() {
        //    $('#myTab li:nth-child(4) a').tab('show');
        //    $('#pnlFreeTrial').hide();
        //    $('#pnlSkillsTalent').show();
        //    return false;
        //}
        //function displaypnlFreeTrialNext() {
        //    $('#myTab li:nth-child(6) a').tab('show');
        //    $('#pnlAccount').show();
        //    $('#pnlFreeTrial').hide();
        //    return false;
        //}

        function displaypnlRepresentativeback() {
            $('#pnlRepresentative').hide();
            $('#pnlSkillsTalent').show();
            $('#myTab li:nth-child(4) a').tab('show');
            return false;
        }
        //function displaypnlAccountback() {
        //    $('#myTab li:nth-child(5) a').tab('show');
        //    $('#pnlFreeTrial').show();
        //    $('#pnlAccount').hide();
        //    return false;
        //}
        //function displaypnlAccountNext() {

        //    var x = document.getElementById("txtAccountHoldername").value;
        //    if (x == "") {
        //        alert("Please fill Account Holder name");
        //        return false;
        //    }

        //    x = document.getElementById("txtAccountNumber").value;
        //    if (x == "") {
        //        alert("Please fill Account Number");
        //        return false;
        //    }

        //    var y = document.getElementById("txtConfAccountNumber").value;
        //    if (x != y) {
        //        alert("Account Number is not matching");
        //        return false;
        //    }

        //    x = document.getElementById("txtBeneficiaryBank").value;
        //    if (x == "") {
        //        alert("Please fill Beneficiary Bank");
        //        return false;
        //    }

        //    x = document.getElementById("txtIfsccode").value;
        //    if (x == "") {
        //        alert("Please fill bank IFSC code");
        //        return false;
        //    }


        //    $('#pnlAccount').hide();
        //    $('#pnlRepresentative').show();
        //    $('#myTab li:nth-child(7) a').tab('show');
        //    return false;

        //}
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ddlGraphics').multiselect({
                includeSelectAllOption: true,
            });
            $('#ddlWeb').multiselect({
                includeSelectAllOption: true,
            });
            //$('#ddlEcommerce').multiselect({
            //    includeSelectAllOption: true,
            //});
            $('#ddlDigital').multiselect({
                includeSelectAllOption: true,
            });
            $('#ddlApps').multiselect({
                includeSelectAllOption: true,
            });
            $('#ddlCloud').multiselect({
                includeSelectAllOption: true,
            });
            $('#ddlVoice').multiselect({
                includeSelectAllOption: true,
            });

            $('#ddlKnowledge').multiselect({
                includeSelectAllOption: true,
            });
            $('#ddlBackoffice').multiselect({
                includeSelectAllOption: true,
            });
        });
    </script>
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
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#txtContactNumber").attr("maxlength", 20)
            $("#txtMinimumProjectValue").attr("maxlength", 8)
            $("#txtRepresentativeContactNumber").attr("maxlength", 20)
            $("#txtLandline").attr("maxlength", 20)
            $("#txtCompanyAddress").attr("maxlength", 255)
            $("#txtGSTNumber").attr("maxlength", 20)
            $("#txtCities").attr("maxlength", 255)
            //$("#txtAccountNumber").attr("maxlength", 30)
            //$("#txtBeneficiaryBank").attr("maxlength", 50)
            //$("#txtSwiftcode").attr("maxlength", 20)
            //$("#txtIfsccode").attr("maxlength", 20)

        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptmanager1" runat="server" EnableCdn="true">
        </asp:ScriptManager>
        <div style="background-color: black; color: Black; display: flow-root;">
            <div id="logo" style="float: left;">
                <h1 class="header"><a href="https://www.benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
            </div>
            <div style="float: right; margin-right: 20px; font-size: 15px; margin-top: 5px; margin-bottom: 5px;">
                <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnLogin" Style="margin-left: 50px;">
                    <div style="float: left; margin-top: 15px;">
                        <asp:TextBox runat="server" ID="txtLogin" ValidationGroup="Signin" class="form-control"
                            PlaceHolder="Partner Email"></asp:TextBox>
                         <asp:CheckBox ID="chkRememberMeSignIn" runat="server" Checked="true" CssClass="check" ForeColor="White" Text="Remember me"  />
                        
                        <asp:RequiredFieldValidator ID="reqtxtLogin" ValidationGroup="Signin" runat="server"
                            SetFocusOnError="True" ControlToValidate="txtLogin" ForeColor="Red" Font-Size="Small" ErrorMessage="E-mail is required."
                            Display="Dynamic" ToolTip="E-mail is required.">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regtxtLogin" runat="server" ErrorMessage="Invalid email."
                            Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtLogin" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                            ForeColor="Red" Font-Size="Small" ValidationGroup="Signin" />
                    </div>
                    <div style="float: left; margin-left: 20px; margin-top: 15px;">
                        <asp:TextBox runat="server" TextMode="Password" ID="txtLoginpassword" ValidationGroup="Signin"
                            class="form-control" PlaceHolder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtLoginpassword" runat="server" SetFocusOnError="True"
                            ControlToValidate="txtLoginpassword" Display="Dynamic" ForeColor="Red" Font-Size="Small" ErrorMessage="Password is required."
                            ToolTip="Password is required." ValidationGroup="Signin">*</asp:RequiredFieldValidator>
                        <asp:HyperLink ID="hplForgotPasswrod" runat="server" Font-Size="Small" Style="text-decoration: underline; color: white;" Text="Forgot Password" NavigateUrl="~/Partner/ForgetPassword" />
                    </div>
                    <div style="margin-left: 20px; float: left; margin-top: 15px;">
                        <asp:Button ID="btnLogin" runat="server" Text="Log In" ValidationGroup="Signin" OnClick="btnLogin_Click"
                            class="form-control" />

                    </div>

                    <div>
                        <asp:Label ID="lblLoginError" Style="float: left;" runat="server" ForeColor="Red" Font-Size="Small"
                            Text="Email Id or password is not correct" Visible="false"></asp:Label>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="container-fluid" style="background-color: #f1f1f1;">

            <div class="row" style="margin-top: 20px; margin-bottom: 20px;">
                <div class="col-lg-2 hidden-xs">
                    <ul class="nav nav-pills nav-stacked" id="myTab" style="margin-top: 18px;">
                        <%-- <li class="active"><a data-toggle="tab" class="disabled" href="#pnlBasic"><i class="fa fa-hourglass-start icon" aria-hidden="true"></i>&nbsp;&nbsp;Start</a></li>--%>
                        <li class="active"><a data-toggle="tab" class="disabled" href="#pnlBasic"><i class="fa fa-tags icon" aria-hidden="true"></i>&nbsp;&nbsp;Basic Information</a></li>
                        <li><a data-toggle="tab" class="disabled" href="#pnlDetails"><i class="fa fa-pencil-square-o icon" aria-hidden="true"></i>&nbsp;&nbsp;Company Details</a></li>
                        <li><a data-toggle="tab" class="disabled" href="#pnlServices"><i class="fa fa-cog icon" aria-hidden="true"></i>&nbsp;&nbsp;Services Provided</a></li>
                        <li><a data-toggle="tab" class="disabled" href="#pnlSkills"><i class="fa fa-cogs icon" aria-hidden="true"></i>&nbsp;&nbsp;Skills & Awards</a></li>
                       <%-- <li><a data-toggle="tab" class="disabled" href="#pnlFreeTrial"><i class="fa fa-flag icon" aria-hidden="true"></i>&nbsp;&nbsp;Trial Offer</a></li>
                        <li><a data-toggle="tab" class="disabled" href="#pnlAccount"><i class="fa fa-credit-card icon" aria-hidden="true"></i>&nbsp;&nbsp;Bank Details</a></li>--%>
                        <li><a data-toggle="tab" class="disabled" href="#pnlAlternate"><i class="fa fa-user icon" aria-hidden="true"></i>&nbsp;&nbsp;Alternate Contact</a></li>
                    </ul>
                </div>
                <div class="col-lg-9">
                    <div class="card" style="margin: 0 auto; background-color: White; margin-top: 20px; margin-bottom: 50px;">
                        <div class="content" style="width: 100%; margin-top: 0px; border: none;">
                            <div class="tab-content" id="firstrow" runat="server" style="text-align: center; width: 100%; padding: 5px; margin: 0 auto; background-color: White; border: 1px solid gray; color: Black; font-size: medium; min-height: 500px;">
                                <asp:UpdatePanel ID="updatepnl" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="pnlSignup" runat="server" DefaultButton="btnSignup">
                                            <a href="HowItWorks.html" target="_blank" style="float: right; color: blue; text-decoration: underline; text-decoration: underline; margin-right: 20px; font-size: small;">How It Works</a>
                                            <h1 style="font-size: 25px; color: Gray;">Let's Start
                                            </h1>
                                            <h2 style="font-size: 15px; padding-left: 15%; padding-right: 15%; font-weight: bold; color: gray;">Please provide all information as accurately as possible as it would be used by our matching algorithms to match you with client projects.</h2>
                                            <div class="row" style="padding: 0 20px 0 20px;">
                                                <div class="col-lg-6">
                                                    <div class="divField" style="width: 90%;">
                                                        <asp:TextBox runat="server" ID="txtCompanyName" ValidationGroup="Signup" class="form-control"
                                                            Style="text-align: left;" Placeholder="Company Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqtxtCompanyName" runat="server" SetFocusOnError="True"
                                                            Display="Dynamic" ControlToValidate="txtCompanyName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your company name"
                                                            ToolTip="Company Name is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="divField" style="width: 90%;">
                                                        <asp:TextBox runat="server" ID="txtWebsite" Placeholder="Company Website URL" ValidationGroup="Signup" class="form-control" Style="text-align: left;"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqtxtWebsite" runat="server" SetFocusOnError="True"
                                                            Display="Dynamic" ControlToValidate="txtWebsite" ForeColor="Red" Font-Size="Small" ErrorMessage="Please file your company website"
                                                            ToolTip="Company website is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>

                                                        <asp:RegularExpressionValidator ID="regtxtWebsite" runat="server" ErrorMessage="Invalid website."
                                                            SetFocusOnError="True" ControlToValidate="txtWebsite" ValidationExpression="^((http|https)://)?([\w-]+\.)+[\w]+(/[\w- ./?]*)?$"
                                                            ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="padding: 0 20px 0 20px;">
                                                <div class="col-lg-6">
                                                    <div class="divField" style="width: 90%;">
                                                        <asp:TextBox runat="server" ID="txtPocFullName" class="form-control" ValidationGroup="Signup" Style="text-align: left;" Placeholder="Primary Contact Person's Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqtxtPocFullName" runat="server" SetFocusOnError="True"
                                                            Display="Dynamic" ControlToValidate="txtPocFullName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill primary contact person name"
                                                            ToolTip="Primary contact person name is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>

                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="divField" style="width: 90%;">

                                                        <asp:TextBox runat="server" ID="txtContactNumber" ValidationGroup="Signup"
                                                            class="form-control" Style="text-align: left;" Placeholder="Mobile Number - 10 digit"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqtxtContactNumber" runat="server" SetFocusOnError="True"
                                                            Display="Dynamic" ControlToValidate="txtContactNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill contact number"
                                                            ToolTip="Contact number is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="regtxtContactNumber" runat="server" ErrorMessage="Invalid phone - accept only 10 digit mobile number"
                                                            SetFocusOnError="True" ControlToValidate="txtContactNumber" ValidationExpression="^[0-9]{10}$"
                                                            ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="padding: 0 20px 0 20px;">
                                                <div class="col-lg-6">
                                                    <div class="divField" style="width: 90%;">
                                                        <asp:TextBox runat="server" ID="txtEmail" ValidationGroup="Signup" class="form-control"
                                                            Style="text-align: left;" Placeholder="Work Email (Login Email)"></asp:TextBox>
                                                        <asp:Label runat="server" ID="lblEmailExists" Font-Size="Small" Style="display: none;" ForeColor="Red" Text="This Email already present in our database. Please login or change it."></asp:Label>
                                                        <asp:RequiredFieldValidator ID="reqtxtEmail" runat="server" SetFocusOnError="True"
                                                            Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill the email"
                                                            ToolTip="E-mail is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>

                                                        <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Invalid email"
                                                            SetFocusOnError="True" ControlToValidate="txtEmail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                                            ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="row" style="padding: 0 20px 0 20px;">
                                                <div class="col-lg-6">
                                                    <div class="divField" style="width: 90%;">
                                                        <asp:TextBox runat="server" ID="txtPassword" Placeholder="Set Password"
                                                            TextMode="Password" class="form-control" Style="text-align: left;"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqtxtPassword" runat="server" SetFocusOnError="True"
                                                            Display="Dynamic" ControlToValidate="txtPassword" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill password"
                                                            ToolTip="Password is required." ValidationGroup="Signup">Please fill password</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="divField" style="width: 90%;">
                                                        <asp:TextBox runat="server" ID="txtConfPassword"
                                                            Placeholder="Confirm Password" TextMode="Password" class="form-control" Style="text-align: left;"></asp:TextBox>

                                                        <asp:RequiredFieldValidator SetFocusOnError="True" ControlToValidate="txtConfPassword"
                                                            ForeColor="Red" Font-Size="Small" Display="Dynamic" ErrorMessage="Confirm Password is required."
                                                            ID="reqtxtConfPassword" runat="server" ToolTip="Please fill confirm password"
                                                            ValidationGroup="Signup">Please fill confirm password</asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cmptxtConfPassword" runat="server" ControlToCompare="txtPassword"
                                                            Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtConfPassword"
                                                            ForeColor="Red" Font-Size="Small" ErrorMessage="The password and confirmation password must match."
                                                            ValidationGroup="Signup"></asp:CompareValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="divAgree" runat="server" class="divField">
                                                <h5>
                                                    <asp:CheckBox runat="server" ID="chkTerms" ValidationGroup="Signup" />&nbsp;&nbsp;I Agree to the 
                                    <a href="../Policies/Terms-of-use-for-Partners.html" target="_blank">Terms of use for Partners</a>&nbsp;&&nbsp;<a href="../Policies/Benchkart-Privacy-Policy.html" target="_blank">Privacy Policy</a>
                                                </h5>
                                                <asp:Label runat="server" ID="lblTerms" Style="display: none; font-size: small;" ForeColor="Red" Text="Please check and agree to the Terms & Conditions"></asp:Label>
                                                <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Signup" runat="server" Display="Dynamic" ClientValidationFunction="ValidateCheckBox"></asp:CustomValidator>
                                            </div>
                                            <asp:Button ID="btnSignup" runat="server" Text="NEXT" CausesValidation="true"
                                                ValidationGroup="Signup" class="form-control" Width="70%" Style="margin-bottom: 30px; margin-top: 30px;" OnClick="VerifyPartner" />

                                        </asp:Panel>

                                        <asp:Panel ID="pnlBasic" runat="server" DefaultButton="btnBasic" Style="display: none; margin-top: 15px; margin-bottom: 15px;">
                                            <h2 style="font-size: 25px; color: Gray; margin: 5px;">Basic Information
                                            </h2>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="divField">
                                                        <h6>Year of Incorporation</h6>
                                                        <asp:DropDownList runat="server" ID="ddlCompanyStarted" class="form-control" Width="80%"
                                                            Style="text-align: left;">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="divField">
                                                        <h6>No of Employees</h6>
                                                        <asp:DropDownList runat="server" ID="ddlEmployeeNumber" class="form-control" Width="80%"
                                                            Style="text-align: left;">
                                                            <asp:ListItem Selected="" Value="">Select</asp:ListItem>
                                                            <asp:ListItem Value="1-9">1-9</asp:ListItem>
                                                            <asp:ListItem Value="10-49">10-49</asp:ListItem>
                                                            <asp:ListItem Value="50-99">50-99</asp:ListItem>
                                                            <asp:ListItem Value="100-499">100-499</asp:ListItem>
                                                            <asp:ListItem Value="500-999">500-999</asp:ListItem>
                                                            <asp:ListItem Value=">1000">>1000</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="divField">
                                                        <h6>Your Company is Best Described as</h6>
                                                        <asp:DropDownList runat="server" ID="ddlDescribedAs" class="form-control" Width="80%"
                                                            Style="text-align: left;">
                                                            <asp:ListItem Selected="" Value="">Select</asp:ListItem>
                                                            <asp:ListItem Value="Small">Small</asp:ListItem>
                                                            <asp:ListItem Value="Medium">Medium</asp:ListItem>
                                                            <asp:ListItem Value="Large">Large</asp:ListItem>
                                                            <asp:ListItem Value="MNC">MNC</asp:ListItem>
                                                            <asp:ListItem Value="Startup">Startup</asp:ListItem>
                                                            <asp:ListItem Value="Other">Other</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="divField">
                                                        <h6>Your Company Type</h6>
                                                        <asp:DropDownList runat="server" ID="ddlCompanyType" class="form-control" Width="80%"
                                                            Style="text-align: left;">
                                                            <asp:ListItem Selected="" Value="">Select</asp:ListItem>
                                                            <asp:ListItem Value="Private Ltd Company">Private Ltd Company</asp:ListItem>
                                                            <asp:ListItem Value="Public Ltd Company">Public Ltd Company</asp:ListItem>
                                                            <asp:ListItem Value="Unlimited Company">Limited Liability Partnership(LLP)</asp:ListItem>
                                                            <asp:ListItem Value="Sole proprietorship">Sole Proprietorship</asp:ListItem>
                                                            <asp:ListItem Value="Partnership">Partnership</asp:ListItem>
                                                            <asp:ListItem Value="Other">Other</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="divField" style="width: 85%;">
                                                <h6>Primary Source of Revenue</h6>
                                                <asp:DropDownList ID="ddlPrimarySourceofRevenue" runat="server" class="form-control" Style="width: 50%;">
                                                </asp:DropDownList>
                                            </div>

                                            <div class="divField" style="width: 85%;">
                                                <h6>Clients Primarily from</h6>
                                                <asp:CheckBoxList ID="chkClientFrom" runat="server" RepeatDirection="Horizontal"
                                                    Font-Size="Small" Font-Bold="false">
                                                    <asp:ListItem Value="India">&nbsp;India</asp:ListItem>
                                                    <asp:ListItem Value="US">&nbsp;US</asp:ListItem>
                                                    <asp:ListItem Value="Europe">&nbsp;Europe</asp:ListItem>
                                                    <asp:ListItem Value="Europe">&nbsp;Middle East</asp:ListItem>
                                                    <asp:ListItem Value="Europe">&nbsp;Asia Pacific</asp:ListItem>
                                                    <asp:ListItem Value="Others">&nbsp;Others</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </div>
                                            <div class="divField" style="width: 85%;">
                                                <h6>Price Positioning</h6>
                                                <asp:RadioButtonList ID="rdoPricePositioning" runat="server" RepeatDirection="Horizontal"
                                                    Font-Size="Small" Font-Bold="false" CellSpacing="50">
                                                    <asp:ListItem Value="Low Cost">&nbsp;Economy</asp:ListItem>
                                                    <asp:ListItem Value="Value">&nbsp;Value</asp:ListItem>
                                                    <asp:ListItem Value="Premium">&nbsp;Premium</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="divField" style="width: 85%;">
                                                <h6>Primary Customer Segments</h6>
                                                <asp:CheckBoxList ID="chkCustomerSegment" runat="server" RepeatDirection="Horizontal"
                                                    Font-Size="Small" Font-Bold="false" CellPadding="50">
                                                    <asp:ListItem Value="Startup">&nbsp;Startup</asp:ListItem>
                                                    <asp:ListItem Value="Small">&nbsp;Small</asp:ListItem>
                                                    <asp:ListItem Value="Medium">&nbsp;Medium</asp:ListItem>
                                                    <asp:ListItem Value="Large">&nbsp;Large</asp:ListItem>
                                                    <asp:ListItem Value="MNC">&nbsp;MNCs</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </div>
                                            <%-- <div class="divField" style="width: 85%;">
                                <h6>Min. Project Value below which you wouldn't want to work on(INR)?(Optional)</h6>
                                <asp:TextBox runat="server" ID="txtMinimumProjectValue" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');"
                                    class="form-control" Style="text-align: left; margin: initial; width: 40%;"></asp:TextBox>
                                <asp:CompareValidator ID="cmptxtMinimumProjectValue" runat="server" Operator="DataTypeCheck"
                                    Type="Integer" ControlToValidate="txtMinimumProjectValue" ErrorMessage="Value must be a whole number"
                                    Display="Dynamic" />
                            </div>--%>
                                            <div class="divField" style="margin-top: 30px; margin-bottom: 35px;">
                                                <asp:Button ID="Button1" runat="server" Text="BACK" Width="45%" class="form-control"
                                                    Style="background: #18D26E; float: left; color: White;" OnClientClick="displaypnlBasicback(); return false;" />
                                                <asp:Button ID="btnBasic" runat="server" Text="NEXT" class="form-control" Width="45%"
                                                    Style="margin-top: 30px; margin-bottom: 35px;"
                                                    OnClientClick="displaypnlBasicNext(); return false;" />
                                            </div>
                                        </asp:Panel>

                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <asp:Panel ID="pnlDetails" DefaultButton="btnDetails" runat="server" Style="display: none; margin-top: 20px; margin-bottom: 20px;">
                                    <h2 style="font-size: 25px; color: Gray; margin-bottom: 30px;">Company Details
                                    </h2>
                                    <div class="divField">
                                        <h6>About Your Company(visible to customer)</h6>
                                        <asp:TextBox runat="server" ID="txtCompanyAbout" Placeholder="Introduce yourself to your client. This content can be taken from 'About us' in your website, but original content is preferred.(Max 1000 characters)"
                                            TextMode="MultiLine" Height="80px" class="form-control" MaxLength="1000" Style="text-align: left;" onkeyup="countChar(this)"></asp:TextBox>
                                        <div style="display: flex; float: right; color: gray; font-size: small;">
                                            <div id="charNum"></div>
                                            &nbsp;<span>characters left</span>
                                        </div>
                                    </div>

                                    <div class="divField">
                                        <h6>Company Address</h6>
                                        <asp:TextBox runat="server" ID="txtCompanyAddress" class="form-control" Style="text-align: left;"></asp:TextBox>
                                    </div>
                                    <div class="divField" style="display: inline-block;">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <asp:DropDownList ID="ddlStates" runat="server" Width="90%" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="State_Changed">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <asp:DropDownList ID="ddlCities" runat="server" Width="90%" class="form-control">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <%--<asp:DropDownList ID="ddlState" runat="server" onchange="print_city('state', this.selectedIndex);" class="form-control" Style="float: left; margin-right: 20px; width: 40%;"></asp:DropDownList>
                                <asp:DropDownList ID="ddlCity" runat="server" class="form-control" Style="width: 40%;"></asp:DropDownList>--%>
                                    </div>
                                    <div class="row" style="width: 85%; margin: 0 auto;">
                                        <div class="col-lg-6">
                                            <div class="divField">
                                                <h6>Pincode</h6>
                                                <asp:TextBox runat="server" ID="txtPincode" Width="90%" class="form-control" Style="text-align: left; margin: initial;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6" style="margin-top: 20px;">
                                            <h6>Office Landline Number (Optional)</h6>
                                            <asp:TextBox runat="server" ID="txtLandline" Width="90%" class="form-control" Style="text-align: left; margin: initial;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 85%; margin: 0 auto;">
                                        <div class="col-lg-6">
                                            <div class="divField">
                                                <h6>Other Office Locations in India(Optional)</h6>
                                                <h6 style="margin-top: 18px;">Select from the list only</h6>
                                                <asp:TextBox runat="server" ID="txtCities" Width="90%" class="form-control" Style="text-align: left; margin: initial;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6" style="margin-top: 20px;">
                                            <div class="divField">
                                                <h6>Company GST number</h6>
                                                <asp:TextBox runat="server" ID="txtGSTNumber" Width="90%" class="form-control" Style="text-align: left; margin: initial;"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="divField" style="margin-top: 30px; margin-bottom: 35px;">
                                        <asp:Button ID="btnDetailsback" runat="server" Text="BACK" Width="45%" class="form-control"
                                            Style="background: #18D26E; float: left; color: White;" OnClientClick="displaypnlDetailsback(); return false;" />
                                        <asp:Button ID="btnDetails" runat="server" class="form-control" Style="margin-left: 25px; display: inline-block; color: White;"
                                            Width="45%" Text="NEXT"
                                            OnClientClick="displaypnlDetailsNext(); return false;" />
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlServices" DefaultButton="btnServices" runat="server" Style="display: none;">
                                    <h3 style="color: Gray;">Select All Services Offered by Your Company</h3>
                                    <h5 style="color: Gray;">Please select all the services offered by your company. Our algorithms will use this representation to match you to relevant customers.</h5>

                                    <table cellpadding="50px" width="95%" style="text-align: center; margin: 0 auto; margin-top: 20px; margin-bottom: 20px; padding-bottom: 10px;">
                                        <tr style="font-weight: bold; font-size: large; color: Gray;">
                                            <td style="padding: 10px; border: 1px solid gray;">Service Categories
                                            </td>
                                            <td style="padding: 10px; border: 1px solid gray;">Select Sub-categories
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="color: Gray; padding: 10px; border: 1px solid gray;">Graphics & Design
                                            </td>
                                            <td style="padding: 10px; border: 1px solid gray;">
                                                <asp:ListBox runat="server" ID="ddlGraphics" SelectionMode="Multiple" Style="margin-top: 20px; min-width: 200px;"
                                                    class="form-control" Width="70%" Placeholder="Category" multiple="multiple"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="color: Gray; padding: 10px; border: 1px solid gray;">Website & Apps
                                            </td>
                                            <td style="padding: 10px; border: 1px solid gray;">
                                                <asp:ListBox runat="server" ID="ddlWeb" SelectionMode="Multiple" class="form-control"
                                                    Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                                    multiple="multiple"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                    <td style="color: Gray; padding: 10px; border: 1px solid gray;">Ecommerce
                                    </td>
                                    <td style="padding: 10px; border: 1px solid gray;">
                                        <asp:ListBox runat="server" ID="ddlEcommerce" SelectionMode="Multiple" class="form-control"
                                            Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                            multiple="multiple"></asp:ListBox>
                                    </td>
                                </tr>--%>
                                        <tr>
                                            <td style="color: Gray; padding: 10px; border: 1px solid gray;">Digital Marketing
                                            </td>
                                            <td style="padding: 10px; border: 1px solid gray;">
                                                <asp:ListBox runat="server" ID="ddlDigital" SelectionMode="Multiple" class="form-control"
                                                    Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                                    multiple="multiple"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="color: Gray; padding: 10px; border: 1px solid gray;">Software
                                            </td>
                                            <td style="padding: 10px; border: 1px solid gray;">
                                                <asp:ListBox runat="server" ID="ddlApps" SelectionMode="Multiple" class="form-control"
                                                    Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                                    multiple="multiple"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="color: Gray; padding: 10px; border: 1px solid gray;">Cloud & Infra
                                            </td>
                                            <td style="padding: 10px; border: 1px solid gray;">
                                                <asp:ListBox runat="server" ID="ddlCloud" SelectionMode="Multiple" class="form-control"
                                                    Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                                    multiple="multiple"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="color: Gray; padding: 10px; border: 1px solid gray;">Call Center

                                            </td>
                                            <td style="padding: 10px; border: 1px solid gray;">
                                                <asp:ListBox runat="server" ID="ddlVoice" SelectionMode="Multiple" class="form-control"
                                                    Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                                    multiple="multiple"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="color: Gray; padding: 10px; border: 1px solid gray;">KPO
                                            </td>
                                            <td style="padding: 10px; border: 1px solid gray;">
                                                <asp:ListBox runat="server" ID="ddlKnowledge" SelectionMode="Multiple" class="form-control"
                                                    Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                                    multiple="multiple"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="color: Gray; padding: 10px; border: 1px solid gray;">Back-Office
                                            </td>
                                            <td style="padding: 10px; border: 1px solid gray;">
                                                <asp:ListBox runat="server" ID="ddlBackoffice" SelectionMode="Multiple" class="form-control"
                                                    Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                                    multiple="multiple"></asp:ListBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="divField" style="margin-top: 30px; margin-bottom: 35px;">
                                        <asp:Button ID="btnServicesback" runat="server" Text="BACK" Width="45%" class="form-control"
                                            Style="background: #18D26E; float: left; color: White;" OnClientClick="displaypnlServicesback(); return false;" />
                                        <asp:Button ID="btnServices" runat="server" class="form-control" Style="margin-left: 25px; display: inline-block; color: White;"
                                            Width="45%" Text="NEXT"
                                            OnClientClick="displaypnlServicesNext(); return false;" />
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="pnlSkillsTalent" runat="server" DefaultButton="btnSkillsTalentNext"
                                    Style="display: none;">
                                    <h3 style="color: Gray;">Skills & Awards</h3>
                                    <h5 style="margin: 0 auto; margin-top: 15px; margin-bottom: 15px; text-align: left; width: 80%;">Many Clients want to hire talent for short to medium term on an hourly basis. In such an arrangement, Clients would seek an estimate from you for ‘hiring’ your talent for a specified duration for a specified no. of hours. In most cases, your talent would have to work from your facility during this period & deliver work as per the instructions of the hirer. You can provide your proposal basis talent availability & rate/hour.</h5>
                                    <asp:TextBox ID="txtSkills" runat="server" Width="80%" MaxLength="1000" class="form-control" Placeholder="eg: java, salesforce"></asp:TextBox>

                                    <h4>
                                        <asp:CheckBox ID="chkIsTalentShared" runat="server" Checked="true" Style="margin-top: 20px;"></asp:CheckBox>&nbsp;&nbsp;Yes, I want to provide Flexi-talent (not applicable to Certain BPO Services)</h4>
                                    <div class="divField" style="width: 85%;">
                                        <h6>Any Awards / Achievements (Optional)</h6>
                                        <asp:TextBox runat="server" ID="txtAwards" Placeholder="Share your company industry expertise, awards, experience, testimonials, certifications etc"
                                            TextMode="MultiLine" Height="100px" class="form-control" MaxLength="1000" Style="text-align: left;"></asp:TextBox>

                                    </div>
                                    <div class="divField" style="margin-top: 30px; margin-bottom: 35px;">
                                        <asp:Button ID="btnSkillsTalentBack" runat="server" Text="BACK" Width="45%" class="form-control"
                                            Style="background: #18D26E; float: left; color: White;" OnClientClick="displaypnlSkillsTalentback(); return false;" />
                                        <asp:Button ID="btnSkillsTalentNext" runat="server" class="form-control" Style="margin-left: 25px; display: inline-block; color: White;"
                                            Width="45%" Text="NEXT"
                                            OnClientClick="displaypnlSkillsTalentNext(); return false;" />
                                    </div>

                                </asp:Panel>
                               <%-- <asp:Panel ID="pnlFreeTrial" runat="server" DefaultButton="btnFreeTrial"
                                    Style="display: none;">
                                    <h3 style="color: Gray;">Trial Offer</h3>
                                    <h4 style="margin-top: 20px;">
                                        <asp:CheckBox runat="server" ID="chkFreeTrial" />&nbsp;&nbsp;Opt in for 15 Days Trial Offer to Customer</h4>
                                    <h5>Refer <a href="../Html/Free-Trial.html" target="_blank">Trial Offer Terms</a> for further clarifications</h5>
                                    <h5 style="padding: 50px; text-align: left; padding-top: 0px; padding-bottom: 0px;">Benchkart is proposing to offer a 15-day trial offer to Customers from participating Partners. Participation is purely voluntary. Please read through the details provided <a href="../Html/Free-Trial.html" target="_blank" style="color: blue;">here</a> to evaluate your participation. Do reach out to us at partnership@benchkart.com for any queries in this regard.</h5>
                                    <br />
                                    <h4>
                                        <asp:CheckBox runat="server" ID="chkBenchShare" />&nbsp;&nbsp;Opt in for Bench Sharing Program
                                    </h4>
                                    <h5 style="padding: 50px; text-align: left; padding-top: 0px; padding-bottom: 0px;">In this program partner companies with urgent requirement of talent/resources can hire talent for short term from other Benchkart partner companies at lesser prices. And they can also share their bench resources with other companies.</h5>
                                    <div class="divField" style="margin-top: 30px; margin-bottom: 35px;">
                                        <asp:Button ID="btnFreeTrial" runat="server" Text="BACK" Width="45%" class="form-control"
                                            Style="background: #18D26E; float: left; color: White;" OnClientClick="displaypnlFreeTrialback(); return false;" />
                                        <asp:Button ID="btnFreeTrialNext" runat="server" class="form-control" Style="margin-left: 25px; display: inline-block; color: White;"
                                            Width="45%" Text="NEXT"
                                            OnClientClick="displaypnlFreeTrialNext(); return false;" />
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlAccount" runat="server" DefaultButton="btnAccount" Style="display: none;">
                                    <h3 style="color: Gray;">Bank Account Details
                                    </h3>
                                    <h4 style="color: Gray; font-weight: bold;">Benchkart will settle the payments collected from the customer in this partner account
                                    </h4>
                                    <div class="divField">
                                        <h6>Bank Account holder's name</h6>
                                        <asp:TextBox runat="server" ID="txtAccountHoldername" ValidationGroup="Account" class="form-control"
                                            Style="text-align: left;" Placeholder="Must be Same as present in the bank documents"></asp:TextBox>
                                    </div>
                                    <div class="divField">
                                        <h6>Bank Account Number</h6>
                                        <asp:TextBox runat="server" ID="txtAccountNumber" class="form-control" Width="45%" Style="text-align: left; margin: initial; float: left; margin-right: 20px;"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txtConfAccountNumber" ValidationGroup="FirstRegistration"
                                            TextMode="Password" Width="45%" Placeholder="Confirm Account Number" class="form-control"></asp:TextBox>
                                        <%-- <asp:RequiredFieldValidator SetFocusOnError="True" ControlToValidate="txtConfAccountNumber"
                                    ForeColor="Red" Font-Size="Small" Display="Dynamic" ErrorMessage="Confirm Account number is required."
                                    ID="RequiredFieldValidator1" runat="server" ToolTip="Confirm Account number is required."
                                    ValidationGroup="FirstRegistration">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="divField">
                                        <h6>Bank Account Type</h6>
                                        <asp:DropDownList ID="ddlAccountType" runat="server" Width="45%" class="form-control" Style="text-align: left; margin: initial;">
                                            <asp:ListItem Value="1">Current
                                            </asp:ListItem>
                                            <asp:ListItem Value="2">Saving
                                            </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="divField">
                                        <h6>Beneficiary Bank Name</h6>
                                        <asp:TextBox runat="server" ID="txtBeneficiaryBank"
                                            class="form-control" Style="text-align: left;"></asp:TextBox>
                                    </div>
                                    <div class="divField">
                                        <h6>SWIFT Code(Optional)</h6>
                                        <asp:TextBox runat="server" ID="txtSwiftcode" class="form-control"
                                            Style="text-align: left;"></asp:TextBox>
                                    </div>
                                    <div class="divField">
                                        <h6>Bank IFSC Code</h6>
                                        <asp:TextBox runat="server" ID="txtIfsccode" class="form-control" Style="text-align: left;"></asp:TextBox>
                                    </div>

                                    <div class="divField" style="margin-top: 30px; margin-bottom: 35px;">
                                        <asp:Button ID="btnAccountBack" runat="server" Text="BACK" Width="45%" class="form-control"
                                            Style="background: #008000; float: left; color: White;" OnClientClick="displaypnlAccountback(); return false;" />
                                        <asp:Button ID="btnAccount" runat="server" class="form-control" Style="margin-left: 25px; display: inline-block; color: White;"
                                            Width="45%" Text="NEXT"
                                            OnClientClick="displaypnlAccountNext(); return false;" />
                                        <%--<asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" OnClick="btnSubmit_Click" OnClientClick="displaypnlAccountNext() return false;"
                                    class="form-control" Style="margin-left: 25px; display: inline-block; color: White;"
                                    Width="45%" />
                                    </div>
                                </asp:Panel>--%>

                                <asp:Panel ID="pnlRepresentative" runat="server" DefaultButton="btnSubmit" Style="display: none;">
                                    <h3 style="color: Gray;">Alternate Contact</h3>
                                    <div class="divField">
                                        <h6>Alternate Company Representative Name</h6>
                                        <asp:TextBox runat="server" ID="txtRepresentativeName" class="form-control" Style="text-align: left;"
                                            ValidationGroup="Representative"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqtxtRepresentativeName" runat="server" SetFocusOnError="True"
                                            ValidationGroup="Representative" Display="Dynamic" ControlToValidate="txtRepresentativeName"
                                            ForeColor="Red" Font-Size="Small" ErrorMessage="Representative Name is required." ToolTip="Company Representative Name is required.">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="divField">
                                        <h6>Representative Contact Number</h6>
                                        <asp:TextBox runat="server" ID="txtRepresentativeContactNumber" class="form-control"
                                            ValidationGroup="Representative" Style="text-align: left;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqRepresentativeContactNumber" runat="server" SetFocusOnError="True"
                                            ValidationGroup="Representative" Display="Dynamic" ControlToValidate="txtRepresentativeContactNumber"
                                            ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill contact number." ToolTip="Please fill contact number.">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regtxtRepresentativeContactNumber" runat="server" ErrorMessage="Invalid phone"
                                            SetFocusOnError="True" ControlToValidate="txtRepresentativeContactNumber" ValidationExpression="^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$"
                                            ForeColor="Red" Font-Size="Small" ValidationGroup="Representative" Display="Dynamic" />
                                    </div>
                                    <div class="divField">
                                        <h6>Representative Email</h6>
                                        <asp:TextBox runat="server" ID="txtRepresentativeEmail" class="form-control" Style="text-align: left;"
                                            ValidationGroup="Representative"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="True"
                                            ValidationGroup="Representative" ControlToValidate="txtRepresentativeEmail" ForeColor="Red" Font-Size="Small"
                                            ErrorMessage="E-mail is required." Display="Dynamic" ToolTip="E-mail is required.">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email."
                                            ValidationGroup="Representative" SetFocusOnError="True" ControlToValidate="txtRepresentativeEmail"
                                            ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ForeColor="Red" Font-Size="Small"
                                            Display="Dynamic" />
                                        <asp:CompareValidator ID="cmptxtRepresentativeEmail" runat="server" ControlToCompare="txtEmail"
                                            SetFocusOnError="True" ControlToValidate="txtRepresentativeEmail" ForeColor="Red" Display="Dynamic" Font-Size="Small"
                                            Operator="NotEqual" Type="String" ErrorMessage="Representative email must be different from primary contact person email." ValidationGroup="Representative"></asp:CompareValidator>
                                    </div>
                                    <div class="divField">
                                        <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="check" Checked="true" Text="Remember me" />
                                    </div>
                                    <div class="divField" style="margin-top: 30px; margin-bottom: 35px;">
                                        <asp:Button ID="btnRepresentativeBack" runat="server" Text="BACK" Width="45%" class="form-control"
                                            Style="background: #18D26E; float: left; color: White;" OnClientClick="displaypnlRepresentativeback(); return false;" />
                                        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" OnClick="btnSubmit_Click"
                                            ValidationGroup="Representative" class="form-control" Style="margin-left: 25px; display: inline-block; color: White;"
                                            Width="45%" />
                                    </div>
                                    
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-1 hidden-xs">
                </div>

            </div>

        </div>
        <div>
            <uc1:ucPartnerFooter runat="server" ID="ucPartnerFooter" />
        </div>
    </form>
</body>
</html>

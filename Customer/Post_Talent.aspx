<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Post_Talent.aspx.cs"
    Inherits="Benchkart.Customer.Post_Talent" %>

<%@ Register Src="~/Customer/ucCustomerMenu.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<%@ Register Src="~/Customer/ucCustomerFooter.ascx" TagPrefix="uc2" TagName="ucCustomerFooter" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- Required meta tags -->
    <meta charset='utf-8'>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="IT Shared Services" />
    <title>benchkart - hire a developer</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
    <script src="../Scripts/Custom.js"></script>
    <script src="../Scripts/jquery.multifile.js"></script>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/Skills.js"></script>
    <style>
        #ddlBasic, #ddlIntermediate, #ddlExpert, #ddlBasicPartTime,
        #ddlIntermediatePartTime, #ddlExpertPartTime, #ddlBasicHoursperWeek,
        #ddlIntermediateHoursperWeek, #ddlExpertHoursperWeek {
            width: 60%;
        }

        @media (max-width: 767px) {
            #ddlBasic, #ddlIntermediate, #ddlExpert, #ddlBasicPartTime,
            #ddlIntermediatePartTime, #ddlExpertPartTime, #ddlBasicHoursperWeek,
            #ddlIntermediateHoursperWeek, #ddlExpertHoursperWeek {
                width: 100%;
                padding: 0px;
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
        label {
            font-weight: normal;
        }

        h6 {
            text-align: left;
            line-height: 1px;
            font-size: small;
            font-weight: bold;
        }

        input[type=text] {
            width: 100%;
        }

        .divField {
            width: 70%;
            margin: 0 auto;
            margin-top: 25px;
            text-align: left;
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
                width: 95%;
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
        function selectLocation() {
            if (document.getElementById("ddlWorkMode").value != "1") {
                $('#ddlStatesFullTime').show();
                $('#ddlCitiesFullTime').show();
            }
            else {
                $('#ddlStatesFullTime').hide();
                $('#ddlCitiesFullTime').hide();
            }
        }

        function selectLocationPartTime(radioButtonList) {
            for (var i = 0; i < radioButtonList.rows.length; ++i) {

                if (radioButtonList.rows[i].cells[0].firstChild.checked) {
                    $('#ddlStatesPartTime').hide();
                    $('#ddlCitiesPartTime').hide();
                }
                else {
                    $('#ddlStatesPartTime').show();
                    $('#ddlCitiesPartTime').show();
                }
            }
        }

        function displaypnlFirst() {
            var fullname = document.getElementById("txtFullname").value;

            if (fullname == "") {
                alert("Please fill fullname");
                document.getElementById("txtFullname").focus;
                return false;
            }


            var emailid = document.getElementById("txtEmailId").value;
            if (emailid == "") {
                alert("Please fill email id");
                document.getElementById("txtEmailId").focus;
                return false;
            }

            var emailpat = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            //  var emailpat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
            var matcharray = emailid.match(emailpat);
            if (matcharray == null) {
                alert("Your email address seems incorrect.");
                document.getElementById("txtEmailId").focus;
                return false;
            }


        }

        function pnlSelect() {

            if (document.getElementById('rblYesSelect').checked) {
                $("#divFullTime").show();
                $("#divPartTime").hide();
            }
            else {
                $("#divPartTime").show();
                $("#divFullTime").hide();
            }


            $("#pnlSelect").hide();
            $("#pnlSecond").show();

            $('#myTab li:nth-child(2) a').tab('show');
        }


        function displaypnlThird() {
            var roleproject = document.getElementById("txtProjectTitle").value;
            if (roleproject == "") {
                alert("Please fill project title ");
                document.getElementById("txtProjectTitle").focus;
                return false;
            }

            var projectdescription = document.getElementById("txtProjectDescription").value;
            if (projectdescription == "") {
                alert("Please fill  project description ");
                document.getElementById("txtProjectDescription").focus;
                return false;
            }
            var skill = document.getElementById("txtSkills").value;
            if (skill == "") {
                alert("Please fill skill ");
                document.getElementById("txtSkills").focus;
                return false;
            }



            $("#pnlSecond").hide();
            $("#pnlThird").show();

            $('#myTab li:nth-child(3) a').tab('show');




        }
        //function progressHandler(event) {
        //    $("#loaded_n_total").html("Uploaded " + event.loaded + " bytes of " + event.total);
        //    var percent = (event.loaded / event.total) * 100;
        //    $("#progressBar").val(Math.round(percent));
        //    $("#status").html(Math.round(percent) + "% uploaded... please wait");
        //}

        //function completeHandler(event) {
        //    counter++
        //    $("#status").html(counter + " " + event.target.responseText);
        //}

        //function errorHandler(event) {
        //    $("#status").html("Upload Failed");
        //}

        //function abortHandler(event) {
        //    $("#status").html("Upload Aborted");
        //}
        function ddlbasic_count() {
           <%-- var ddlbas = document.getElementById("ddlBasic");

            var ddlcout = ddlbas.options[ddlbas.selectedIndex].value;
            document.getElementById("txtTotalCount").innerText = parseInt(ddlcout);
            document.getElementById('<%=hidden.ClientID %>').value = parseInt(ddlcout);--%>
            var ddlbas = document.getElementById("ddlBasic");
            var ddlinter = document.getElementById("ddlIntermediate");
            var ddlexper = document.getElementById("ddlExpert");
            var ddlcount = ddlbas.options[ddlbas.selectedIndex].value;
            var ddlintercount = ddlinter.options[ddlinter.selectedIndex].value;
            var ddlexpertcount = ddlexper.options[ddlexper.selectedIndex].value;
            document.getElementById("txtTotalCount").innerText = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));



        }
        function ddlintermediate_count() {
           <%-- var ddlbas = document.getElementById("ddlBasic");
            var ddlinter = document.getElementById("ddlIntermediate");
            //  var a = dropdown1.options[dropdown1.selectedIndex].value;
            var ddlcount = ddlbas.options[ddlbas.selectedIndex].value;
            var ddlintercount = ddlinter.options[ddlinter.selectedIndex].value;
            document.getElementById("txtTotalCount").innerText = (parseInt(ddlcount) + parseInt(ddlintercount));
            document.getElementById('<%=hidden.ClientID %>').value = (parseInt(ddlcount) + parseInt(ddlintercount));--%>
            var ddlbas = document.getElementById("ddlBasic");
            var ddlinter = document.getElementById("ddlIntermediate");
            var ddlexper = document.getElementById("ddlExpert");
            var ddlcount = ddlbas.options[ddlbas.selectedIndex].value;
            var ddlintercount = ddlinter.options[ddlinter.selectedIndex].value;
            var ddlexpertcount = ddlexper.options[ddlexper.selectedIndex].value;
            document.getElementById("txtTotalCount").innerText = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));

        }
        function ddlexpert_count() {
            var ddlbas = document.getElementById("ddlBasic");
            var ddlinter = document.getElementById("ddlIntermediate");
            var ddlexper = document.getElementById("ddlExpert");
            var ddlcount = ddlbas.options[ddlbas.selectedIndex].value;
            var ddlintercount = ddlinter.options[ddlinter.selectedIndex].value;
            var ddlexpertcount = ddlexper.options[ddlexper.selectedIndex].value;
            document.getElementById("txtTotalCount").innerText = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));

        }
        function ddlbasicparttime_count() {
          <%--  var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = parseInt(ddlbasicprttime);
            document.getElementById('<%=hidden.ClientID %>').value = parseInt(ddlbasicprttime);--%>
            var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlintermediateprt = document.getElementById("ddlIntermediatePartTime");
            var ddlexpertprt = document.getElementById("ddlExpertPartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            var ddlintermediateprttime = ddlintermediateprt.options[ddlintermediateprt.selectedIndex].value;
            var ddlexpertprttime = ddlexpertprt.options[ddlexpertprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));


        }
        function ddlintermediateparttime_count() {
            <%--var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlintermediateprt = document.getElementById("ddlIntermediatePartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            var ddlintermediateprttime = ddlintermediateprt.options[ddlintermediateprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = (parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime));
            document.getElementById('<%=hidden.ClientID %>').value = (parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime));--%>
            var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlintermediateprt = document.getElementById("ddlIntermediatePartTime");
            var ddlexpertprt = document.getElementById("ddlExpertPartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            var ddlintermediateprttime = ddlintermediateprt.options[ddlintermediateprt.selectedIndex].value;
            var ddlexpertprttime = ddlexpertprt.options[ddlexpertprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));

        }
        function ddlexpertpartime_count() {
            var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlintermediateprt = document.getElementById("ddlIntermediatePartTime");
            var ddlexpertprt = document.getElementById("ddlExpertPartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            var ddlintermediateprttime = ddlintermediateprt.options[ddlintermediateprt.selectedIndex].value;
            var ddlexpertprttime = ddlexpertprt.options[ddlexpertprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));
            document.getElementById('<%=hidden.ClientID %>').value = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));

        }
        function displaypnlForth() {





            $("#pnlThird").hide();
            $("#pnlForth").show();

            $('#myTab li:nth-child(4) a').tab('show');

        }

        function displayFive() {
            var num = document.getElementById("txtBudgetOpional").value;
            if (isNaN(num)) {
                alert("Budget must be a number!");
                document.getElementById("txtBudgetOpional").focus();
                return false;
            }

            $("#pnlForth").hide();
            $("#pnlFive").show();

            $('#myTab li:nth-child(5) a').tab('show') // Select third tab

        }

        function displayAllValidation() {
            var companyindustry = document.getElementById("ddlIndustry").value;
            if (companyindustry == "0") {
                alert("Please select company industry ");
                document.getElementById("ddlIndustry").focus;
                return false;
            }
            var companytype = document.getElementById("ddlTypeofCompany").value;
            if (companytype == "0") {
                alert("Please select company type");
                document.getElementById("ddlTypeofCompany").focus;
                return false;
            }
            var companyname = document.getElementById("txtCompanyName").value;
            if (companyname == "") {
                alert("Please fill company name");
                document.getElementById("txtCompanyName").focus;
                return false;
            }
            var contactnumber = document.getElementById("txtContactNumber").value;
            if (contactnumber == "") {
                alert("Please fill contact number ");
                document.getElementById("txtContactNumber").focus();
                return false;
            }
            $("#pnlFive").hide();
            $("#pnlSix").show();




        }

        function chackpassword() {
            var password = document.getElementById("txtPassword").value;
            if (password == "") {
                alert("Password is required.");
                document.getElementById("txtPassword").focus;
                return false;
            }
            var confirmpassword = document.getElementById("txtConfPassword").value;
            if (confirmpassword == "") {
                alert("Confirm Password is required.")
                document.getElementById("txtConfPassword").focus;
                return false;
            }

            if (password == confirmpassword) {
                //var chkpasswordread = $(':checkbox:checked').length;

                //if (chkpasswordread == 0) {
                //    alert("Please checked checkbox");
                //    document.getElementById("chkpasswordread").focus;
                //    return false;
                //}

                if (document.getElementById("chkpasswordread").checked == true) {
                    return true;
                }
                else {
                    alert('Please agree to the terms & conditions')
                    return false;
                }

            }
            else {
                alert("Confirmation password does not match. Please retry");
                document.getElementById("txtConfPassword").focus;
                return false;
            }


        }
        function displaypnlSelectback() {

            $("#pnlSelect").show();
            $("#pnlSecond").hide();

            $('#myTab li:nth-child(1) a').tab('show') // Select third tab
        }
        function displaypnlSeconndback() {

            $("#pnlSecond").show();
            $("#pnlThird").hide();

            $('#myTab li:nth-child(2) a').tab('show') // Select third tab
        }
        function displaypnlThirdback() {

            $("#pnlThird").show();
            $("#pnlForth").hide();

            $('#myTab li:nth-child(3) a').tab('show') // Select third tab
        }

        function displaypnlForthback() {

            $("#pnlForth").show();
            $("#pnlFive").hide();

            $('#myTab li:nth-child(4) a').tab('show') // Select third tab
        }
        //function isNumberKey(evt) {
        //    var charCode = (evt.which) ? evt.which : evt.keyCode;
        //    if (charCode > 31 && (charCode < 48 || charCode > 57))
        //        return false;
        //    return true;
        //}
        function isNumberKey(evt) {
            var charcode = (evt.which) ? evt.which : evt.keyCode;
            if (charcode > 31 && (charcode < 48 || charcode > 57)) {
                return false;
                return true;
            }
        }

        //function isAlphabetKey(evt) {
        //    var charcode = (evt.which) ? evt.which : evt.keyCode;
        //    if (charcode <=91 && charcode >=65 || charcode <=122 && charcode >= 97)) {

        //        return false;
        //        return true;
        //    }
        // //   alert("Only A - Z or a - z");

        //}
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtBudgetOpional").attr("maxlength", 8);
            $("#txtContactNumber").attr("maxlength", 20);
        });
    </script>
</head>
<body style="background-color: #f8f8f8;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
        </asp:ScriptManager>

        <div>
            <uc1:ucHeader runat="server" ID="ucHeader" />
        </div>


        <div class="container-fluid">
            <div class="row" style="margin-top: 20px; margin-bottom: 20px;">
                <div class="col-lg-2 hidden-xs">
                    <ul class="nav nav-pills nav-stacked" id="myTab" style="margin-top: 18px;">
                        <%-- <li class="active"><a data-toggle="tab" class="disabled" href="#pnlSelect"><i class="fa fa-hourglass-start icon" aria-hidden="true"></i>&nbsp;&nbsp;Start</a></li>--%>
                        <li class="active"><a data-tiggke="tab" class="disabled" href="#pnlSelect"><i class="fa fa-adjust" aria-hidden="true"></i>&nbsp;&nbsp;Select</a></li>
                        <li><a data-toggle="tab" class="disabled" href="#pnlSecond"><i class="fa fa-tags icon" aria-hidden="true"></i>&nbsp;&nbsp;Basic details</a></li>
                        <li><a data-toggle="tab" class="disabled" href="#pnlThird"><i class="fa fa-pencil-square-o icon" aria-hidden="true"></i>&nbsp;&nbsp;Talent info</a></li>
                        <li><a data-toggle="tab" class="disabled" href="#pnlForth"><i class="fa fa-cog icon" aria-hidden="true"></i>&nbsp;&nbsp;Budget</a></li>
                        <li><a data-toggle="tab" class="disabled" href="#pnlFive"><i class="fa fa-cogs icon" aria-hidden="true"></i>&nbsp;&nbsp;Company Info</a></li>
                    </ul>
                </div>
                <div class="col-lg-8">
                    <div class="tab-content" id="firstrow" runat="server" style="text-align: center; width: 100%; padding: 5px; margin: 0 auto; background-color: White; border: 1px solid gray; color: Black; font-size: medium; margin-bottom: 40px; margin-top: 20px; min-height: 400px;">
                        <asp:UpdatePanel ID="updatepnl" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="pnlFirst" runat="server" DefaultButton="btnNext" Style="display: none;">
                                    <h1 style="font-size: 25px; color: Gray;">Let's Start
                                    </h1>
                                    <div class="divField">
                                        <asp:TextBox ID="txtFullname" class="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                                        <div style="text-align: center;">
                                            <asp:RequiredFieldValidator ID="reqtxtFullname" runat="server" SetFocusOnError="True"
                                                Display="Dynamic" ControlToValidate="txtFullname" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your name"
                                                ToolTip="Name is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="divField">
                                        <asp:TextBox ID="txtEmailId" class="form-control" placeholder="Work Email Id" runat="server"></asp:TextBox>
                                        <div style="text-align: center;">
                                            <asp:Label runat="server" ID="lblEmailExists" Font-Size="Small" Style="display: none;" ForeColor="Red" Text="This Email already present with us. Please login!"></asp:Label>

                                            <asp:RequiredFieldValidator ID="reqtxtEmail" runat="server" SetFocusOnError="True"
                                                Display="Dynamic" ControlToValidate="txtEmailid" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill the email"
                                                ToolTip="E-mail is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>

                                            <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Invalid email"
                                                SetFocusOnError="True" ControlToValidate="txtEmailid" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                                ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />
                                        </div>
                                    </div>
                                    <div class="divField">
                                        <asp:Button ID="btnNext" runat="server" Text="Next" ValidationGroup="Signup" class="form-control" Style="margin-top: 30px; margin-bottom: 40px;"
                                            OnClick="btnNext_Click" />
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlSelect" runat="server" Style="display: none; margin-top: 20px; margin-bottom: 20px;"
                                    DefaultButton="btnselect">
                                    <h2 style="font-size: 25px; color: Gray;">Select Talent Type</h2>
                                    <div class="divField">
                                        <asp:RadioButton ID="rblNoSelect" runat="server" Checked="true" Style="margin-left: 5%;" GroupName="times"
                                            value="Parttime" />&nbsp;<h3 style="font-size: large; display: inline;">Part Time</h3>
                                        <br />
                                        <h5 style="margin-left: 20px;">Remote working only regardless of length of engagement</h5>
                                        <br />
                                        <br />
                                        <asp:RadioButton ID="rblYesSelect" runat="server" Style="margin-left: 5%;" GroupName="times"
                                            value="Fulltime" />&nbsp;<h3 style="font-size: large; display: inline;">Full Time</h3>
                                        <br />
                                        <h5 style="margin-left: 20px;">On-site or Remote; better availability of remote talent</h5>
                                    </div>
                                    <br />
                                    <div class="divField">
                                        <asp:Button ID="btnselect" runat="server" class="form-control" OnClientClick="pnlSelect();return false;"
                                            Style="margin-top: 30px; margin-bottom: 40px;" Text="Next" />
                                    </div>

                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:Panel ID="pnlSecond" runat="server" Style="display: none; margin-top: 20px; margin-bottom: 20px;"
                            DefaultButton="btnNext2">
                            <h2 style="font-size: 25px; color: Gray;">Basic Details
                            </h2>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="divField" style="float: right;">
                                                <h6>Project Category</h6>
                                                <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" AutoPostBack="true"
                                                    Style="margin: 0 auto;" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged1">
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
                                        <div class="col-sm-6">
                                            <div class="divField" style="float: left;">
                                                <h6>Project SubCategory</h6>
                                                <asp:DropDownList ID="ddlSubCategory" class="form-control" runat="server" Style="margin: 0 auto;">
                                                    <asp:ListItem Value="18">Website Development</asp:ListItem>
                                                    <asp:ListItem Value="19">Website Designing - UI/UX</asp:ListItem>
                                                    <asp:ListItem Value="20">Website Maintenance</asp:ListItem>
                                                    <asp:ListItem Value="21">Mobile Applications</asp:ListItem>
                                                    <asp:ListItem Value="22">Any Other</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="divField">
                                <h6>Project/ Role Title</h6>
                                <asp:TextBox ID="txtProjectTitle" class="form-control" placeholder="Role Title" runat="server"></asp:TextBox>
                            </div>
                            <div class="divField">
                                <h6>Project/ Role Description</h6>
                                <asp:TextBox ID="txtProjectDescription" Style="height: 100px;" runat="server" placeholder="Project Description" TextMode="MultiLine"
                                    class="form-control"></asp:TextBox>
                            </div>
                            <div class="divField">
                                <h6>Skills</h6>
                                <asp:TextBox runat="server" ID="txtSkills" class="form-control" TextMode="MultiLine" Placeholder="Any specific technical skills required - eg: java, .net"></asp:TextBox>
                            </div>
                            <div class="divField">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnbackpnlselect" runat="server" Text="Back" class="form-control"
                                            Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;" OnClientClick="displaypnlSelectback(); return false;" />
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnNext2" runat="server" class="form-control" OnClientClick="displaypnlThird(); return false;"
                                            Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;" Text="Next" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlThird" runat="server" Style="display: none; margin-top: 20px; margin-bottom: 20px;"
                            DefaultButton="btnNext3">
                            <h2 style="font-size: 25px; color: Gray;">Type of Talent </h2>
                            <div id="divFullTime" style="text-align: center; display: none;">
                                <div class="divField" style="font-size: medium;">
                                    <h6>Number of People Required</h6>
                                    <table style="font-size: small; width: 100%; text-align: center; margin-left: 5%; font-size: 14px; margin-top: 20px; margin-bottom: 30px;">
                                        <tr>
                                            <td style="text-align: left; font-weight: bold;">Expertise (Experience)
                                            </td>
                                            <td style="font-weight: bold;">Talent Count
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">Basic (1-3 yrs)
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlBasic" Style="margin: 0 auto; margin-top: 5px;"
                                                    onchange="ddlbasic_count()" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">Intermediate (3-6 yrs)
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlIntermediate" onchange="ddlintermediate_count()"
                                                    Style="margin: 0 auto; margin-top: 5px;" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">Expert (>6 yrs)
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlExpert" Style="margin: 0 auto; margin-top: 5px;"
                                                    onchange="ddlexpert_count()" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; font-weight: bold;">Total  talent Count
                                            </td>
                                            <td>
                                                <asp:Label ID="txtTotalCount" runat="server" Width="50%" Style="margin: 0 auto; font-weight: bold; margin-top: 5px;"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="divField">
                                    <h6>Mode of Work</h6>

                                    <asp:DropDownList runat="server" ID="ddlWorkMode" Style="margin: 0 auto;"
                                        class="form-control" onchange="selectLocation()">
                                        <asp:ListItem Value="1" Selected="True">Remote</asp:ListItem>
                                        <asp:ListItem Value="2">Onsite</asp:ListItem>
                                        <asp:ListItem Value="3">Periodic Onsite</asp:ListItem>
                                    </asp:DropDownList>

                                    <%--  <asp:TextBox runat="server" ID="txtLocation" class="form-control" Style="margin-top: 20px;
                                            display: none;" Placeholder="Location"></asp:TextBox>--%>
                                </div>
                                <asp:UpdatePanel ID="UpdatePanelState" runat="server">
                                    <ContentTemplate>
                                        <div class="divField">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <asp:DropDownList ID="ddlStatesFullTime" runat="server" Width="90%" class="form-control" Style="margin-right: 20px; margin-bottom: 20px; display: none;"
                                                        AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlStatesFullTime_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:DropDownList ID="ddlCitiesFullTime" runat="server" Width="90%" Style="display: none;" class="form-control">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="divField">
                                    <h6>Role Duration</h6>

                                    <asp:TextBox runat="server" ID="txtRoleDurationfulltime" class="form-control" Placeholder="eg: 4 months"></asp:TextBox>
                                </div>
                            </div>
                            <div id="divPartTime" style="text-align: center; display: none;">
                                <div class="divField" style="font-size: medium;">
                                    <h6>Number of People Required</h6>
                                    <table style="font-size: small; width: 100%; text-align: center; border: medium; margin-left: 5%;">
                                        <tr>
                                            <td style="text-align: left; font-weight: bold;">Expertise (Experience)
                                            </td>
                                            <td style="font-weight: bold;">Talent Count
                                            </td>
                                            <td style="font-weight: bold;">Hours per Week
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">Basic (1-3 yrs)
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlBasicPartTime" onchange="ddlbasicparttime_count()"
                                                    Style="margin: 0 auto; margin-top: 5px;" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlBasicHoursperWeek" Style="margin: 0 auto; margin-top: 5px;"
                                                    runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">Intermediate (3-6 yrs)
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlIntermediatePartTime" onchange="ddlintermediateparttime_count()"
                                                    Style="margin: 0 auto; margin-top: 5px;" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlIntermediateHoursperWeek" Style="margin: 0 auto; margin-top: 5px;"
                                                    runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">Expert (>6 yrs)
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlExpertPartTime" onchange="ddlexpertpartime_count()"
                                                    Style="margin: 0 auto; margin-top: 5px;" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlExpertHoursperWeek" Style="margin: 0 auto; margin-top: 5px;"
                                                    runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; font-weight: bold;">Total  talent Count
                                            </td>
                                            <td>
                                                <asp:Label ID="lblPartTimeCount" runat="server" Width="30%" Style="margin: 0 auto; font-weight: bold; margin-top: 5px;"></asp:Label>
                                                <asp:HiddenField ID="hidden" runat="server" Value="0" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="divField">
                                    <h6>Role Duration</h6>

                                    <asp:TextBox runat="server" ID="txtDurationPartTime" class="form-control" Placeholder="eg: 4 months"></asp:TextBox>
                                </div>
                                <div class="divField">
                                    <h6>Location Preference (Optional)</h6>


                                    <asp:RadioButtonList ID="rblLocation" Style="margin-left: 10%;" runat="server" onclick=" return selectLocationPartTime(this); return false;" Width="30%"
                                        RepeatDirection="Horizontal" data-toggle="buttons">
                                        <asp:ListItem Value="1" Selected="True">No</asp:ListItem>
                                        <asp:ListItem Value="2">Yes</asp:ListItem>
                                    </asp:RadioButtonList>

                                    <%-- <asp:TextBox ID="txtOnsiteLoaction" class="form-control" runat="server" placeholder="Location"
                                            Style="display: none;">
                                        </asp:TextBox>--%>
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="divField">
                                            <div class="row">
                                                <div class="col-lg-6">


                                                    <asp:DropDownList ID="ddlStatesPartTime" runat="server" Width="90%" class="form-control" Style="margin-right: 20px; margin-bottom: 20px; display: none;"
                                                        AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlStatesPartTime_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:DropDownList ID="ddlCitiesPartTime" runat="server" Width="90%" Style="display: none;" class="form-control">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="divField">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnScondBack" runat="server" Text="Back" class="form-control"
                                            Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;" OnClientClick="displaypnlSeconndback(); return false;" />
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnNext3" runat="server" class="form-control" Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;"
                                            OnClientClick="displaypnlForth(); return false;" Text="Next" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlForth" runat="server" Style="display: none; margin-top: 20px; margin-bottom: 20px;"
                            DefaultButton="btnNext4">
                            <h2 style="font-size: 25px; color: Gray;">Budget</h2>
                            <div class="divField">
                                <h6>Budget (INR) (Optional)</h6>
                                <asp:TextBox ID="txtBudgetOpional" runat="server" MaxLength="8" Width="30%" class="form-control" oncopy="return false"
                                    onpaste="return false" oncute="return false" Style="margin-left: 5px; margin-top: 5px; float: left; margin-right: 20px;"></asp:TextBox>
                                <asp:RadioButtonList ID="rblBudgetType" Width="20%" runat="server" CssClass="form-group"
                                    RepeatDirection="Horizontal" data-toggle="buttons">
                                    <asp:ListItem class="btn active" Value="1" Selected="True">Fixed Price</asp:ListItem>
                                    <asp:ListItem class="btn" Value="2" style="margin-left: 5%;">Per Hour</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <%--<div class="divField">
                                <asp:CheckBox ID="checkbox1" runat="server" Text="Do not show my budget to the agencies" />
                            </div>--%>
                            <div class="divField">
                                <h6>Any Attachment (Options)</h6>

                                <asp:FileUpload ID="File1" runat="server" Class="multi" AllowMultiple="true" />
                                <%--  <progress id="progressBar" value="0" max="100" style="width: 300px;"></progress>--%>
                                <%-- <p id="loaded_n_total">
                                    </p>--%>
                            </div>
                            <div class="divField">
                                <h6 style="line-height: unset;">Instructions & Questions for Agencies (Optional)</h6>

                                <asp:TextBox runat="server" ID="txtInstructions" Height="80px" TextMode="MultiLine"
                                    class="form-control" Placeholder="Any questions or instructions for service provider"
                                    Style="margin: 0 auto;"></asp:TextBox>
                            </div>
                            <div class="divField">
                                <h6>Planning to Start</h6>
                                <br />
                                <asp:RadioButtonList ID="rblUrgency" runat="server" Width="20%"
                                    RepeatDirection="Horizontal" data-toggle="buttons">
                                    <asp:ListItem class="btn active" style="padding: 6px 4px;" Value="1" Selected="True">Immediate</asp:ListItem>
                                    <asp:ListItem class="btn" Value="2" style="padding: 6px 4px;">In 30 days</asp:ListItem>
                                    <asp:ListItem class="btn" Value="3" style="padding: 6px 4px;">>30 days</asp:ListItem>
                                </asp:RadioButtonList>

                            </div>
                            <div class="divField">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnthirdback" runat="server" Text="Back" class="form-control"
                                            Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;" OnClientClick="displaypnlThirdback(); return false;" />
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnNext4" runat="server" Text="Next" class="form-control"
                                            Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;" OnClientClick="displayFive(); return false;" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlFive" runat="server" Style="display: none; margin-top: 20px; margin-bottom: 20px;"
                            DefaultButton="btnsubmit">
                            <h2 style="font-size: 25px; color: Gray;">Company Info</h2>
                            <div class="divField">
                                <h6>Your Company Industry</h6>

                                <asp:DropDownList runat="server" ID="ddlIndustry" class="form-control" Style="margin: 0 auto;">
                                    <asp:ListItem Value="0">Select Company Industry</asp:ListItem>
                                    <asp:ListItem Value="advertising-and-pr">Advertising & PR</asp:ListItem>
                                    <asp:ListItem Value="construction-renovation">Construction Renovation</asp:ListItem>
                                    <asp:ListItem Value="digital-marketing">Digital Marketing</asp:ListItem>
                                    <asp:ListItem Value="ecommerce">Ecommerce</asp:ListItem>
                                    <asp:ListItem Value="education">Education</asp:ListItem>
                                    <asp:ListItem Value="energy">Energy</asp:ListItem>
                                    <asp:ListItem Value="entertainment">Entertainment</asp:ListItem>
                                    <asp:ListItem Value="financial-services">Financial Services</asp:ListItem>
                                    <asp:ListItem Value="food-beverage">Food &amp; Beverage</asp:ListItem>
                                    <asp:ListItem Value="game-dev-support">Game Dev & Support</asp:ListItem>
                                    <asp:ListItem Value="government">Government</asp:ListItem>
                                    <asp:ListItem Value="hardware-tech-it">Hardware Tech/IT</asp:ListItem>
                                    <asp:ListItem Value="health-care">Healthcare</asp:ListItem>
                                    <asp:ListItem Value="hospitality">Hospitality</asp:ListItem>
                                    <asp:ListItem Value="legal">Legal</asp:ListItem>
                                    <asp:ListItem Value="manufacturing">Manufacturing</asp:ListItem>
                                    <asp:ListItem Value="media-publishing">Media Publishing</asp:ListItem>
                                    <asp:ListItem Value="non-profit">Non Profit</asp:ListItem>
                                    <asp:ListItem Value="pharmaceutical">Pharmaceutical</asp:ListItem>
                                    <asp:ListItem Value="public-utilities">Public Utilities</asp:ListItem>
                                    <asp:ListItem Value="real-estate">Real Estate</asp:ListItem>
                                    <asp:ListItem Value="recruiting-staffing">Recruiting Staffing</asp:ListItem>
                                    <asp:ListItem Value="retail">Retail</asp:ListItem>
                                    <asp:ListItem Value="software-tech-it">Software Tech/IT</asp:ListItem>
                                    <asp:ListItem Value="telecoms">Telecoms</asp:ListItem>
                                    <asp:ListItem Value="transportation">Transportation</asp:ListItem>
                                    <asp:ListItem Value="travel">Travel</asp:ListItem>
                                    <asp:ListItem Value="other">Other sector</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="divField">
                                <h6>Type of Company</h6>

                                <asp:DropDownList runat="server" ID="ddlTypeofCompany" class="form-control" Style="margin: 0 auto;">
                                    <asp:ListItem Value="0">Select CompanyType</asp:ListItem>
                                    <asp:ListItem Value="1">MNC</asp:ListItem>
                                    <asp:ListItem Value="2">Medium</asp:ListItem>
                                    <asp:ListItem Value="3">Large</asp:ListItem>
                                    <asp:ListItem Value="4">Small</asp:ListItem>
                                    <asp:ListItem Value="5">Startup</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="divField">
                                <h6>Your Company Name</h6>

                                <asp:TextBox runat="server" ID="txtCompanyName" class="form-control"></asp:TextBox>
                            </div>
                            <div class="divField">
                                <h6>About Company (Optional)</h6>

                                <asp:TextBox runat="server" ID="txtCompanyIntroduce" class="form-control"></asp:TextBox>
                            </div>
                            <%--<div class="divField">
                                        Company Linkedin Profile Link (Optional)
                                   
                                    <asp:TextBox runat="server" ID="txtCompanyInfo" class="form-control"></asp:TextBox>--%>
                            <div class="divField">
                                <h6>Contact Number</h6>
                                <asp:TextBox ID="txtContactNumber" MaxLength="20" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="divField">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnBack4" runat="server" Text="Back" class="form-control"
                                            Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;" OnClientClick="displaypnlForthback(); return false;" />
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnsubmit" runat="server" Text="Next" class="form-control"
                                            OnClientClick=" displayAllValidation(); return false;" Style="background: #18D26E; margin-bottom: 30px; margin-top: 20px;" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlSix" runat="server" Style="display: none; margin-top: 20px; margin-bottom: 20px;" DefaultButton="btnSetPassword">
                            <h2 style="font-size: 25px; color: Gray;">Set Password
                            </h2>
                            <div class="divField">
                                Password
                              <%--  <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" Placeholder="Password" CssClass="form-control"></asp:TextBox>--%>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="divField">
                                Confirm Password
                                <asp:TextBox runat="server" ID="txtConfPassword" TextMode="Password" Placeholder="Confirm Password" class="form-control"></asp:TextBox>
                            </div>
                            <div class="divField">
                                <h5>
                                    <asp:CheckBox ID="chkpasswordread" runat="server" Style="margin-left: 5%; text-align: left;" />
                                    &nbsp;&nbsp;I Agree to the 
                                 <a href="../Policies/Terms-of-use-for-Clients.html">Terms of use for Clients</a>&nbsp;&&nbsp;<a href="../Policies/Benchkart-Privacy-Policy.html">Privacy Policy</a></h5>
                            </div>
                            <div class="divField">
                                <asp:Button ID="btnSetPassword" runat="server" Text="Submit" OnClientClick="return chackpassword();"
                                    Style="margin-top: 30px; margin-bottom: 10px;" OnClick="btnSetPassword_Click" CssClass="form-control" />
                            </div>
                        </asp:Panel>
                        <%--<asp:Panel ID="divMenu1" runat="server" Visible="false">
                        <div id="divmenu" class="container" style="text-align: center; width: 100%; background-color: White;">
                            <ul class="nav nav-tabs" id="myTab">
                                <li class="active"><a data-toggle="tab" class="disabled" href="#pnlSelect">Select</a></li>
                                <li><a data-toggle="tab" class="disabled" href="#pnlSecond">Basic details</a></li>
                                <li><a data-toggle="tab" class="disabled" href="#pnlThird">Talent info</a></li>
                                <li><a data-toggle="tab" class="disabled" href="#pnlForth">Budget</a></li>
                                <li><a data-toggle="tab" class="disabled" href="#pnlFive">Company info</a></li>
                            </ul>
                            <div class="tab-content">
                               
                                
                                
                              
                                
                            </div>
                        </div>
                    </asp:Panel>--%>
                    </div>
                </div>
                <%--   <div class="col-lg-4" style="text-align: center; margin-top: 70px;">
                <h1 style="font-size: 50px; font-size: 25px; color: White;">
                    Why Us?</h1>
                <div style="display: inline-block; text-align: left;">
                    <h2 style="color: White; font-size: 20px;">
                        <i class="fa fa-check" aria-hidden="true"></i>Save cost by sharing talent</h2>
                    <h2 style="color: White; font-size: 20px;">
                        <i class="fa fa-check" aria-hidden="true"></i>Low cost outsourcing</h2>
                    <h2 style="color: White; font-size: 20px;">
                        <i class="fa fa-check" aria-hidden="true"></i>Easy Payment</h2>
                    <h2 style="color: White; font-size: 20px;">
                        <i class="fa fa-check" aria-hidden="true"></i>Quality assurance</h2>
                </div>
            </div>--%>
            </div>
        </div>
        <div>
            <uc2:ucCustomerFooter runat="server" ID="ucFooter" />
        </div>
    </form>
</body>
</html>

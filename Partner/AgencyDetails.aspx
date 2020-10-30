<%@ Page Title="" Language="C#" MasterPageFile="~/Partner/Site1.Master" AutoEventWireup="true" CodeBehind="AgencyDetails.aspx.cs" Inherits="Benchkart.Partner.AgencyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .label {
            color: Black;
            font-size: medium;
            font-weight: normal;
            width: 100%;
            /*word-break: break-all;*/
            /*display: inline-flex;*/
            white-space: pre-wrap;
            margin-left: 40px;
            overflow-wrap: break-word;
            line-height: 2;
        }

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
    <style>
        a.disabled {
            pointer-events: none;
            cursor: default;
        }

        .fieldtitle {
            margin-top: 10px;
            text-align: left;
            margin-bottom: 5px;
            font-size: small;
            color: gray;
        }

        .container {
            width: 90%;
            padding: 10px;
            margin: 20px;
        }

        @media (max-width: 767px) {
            .container {
                width: 100%;
            }
        }
    </style>
    <style>
        .fade {
            opacity: 1;
        }
        .packagedetails table  th{
            padding:5px;
        }
        .packagedetails table  td{
            padding:5px;
        }
    </style>
    <script type="text/javascript">

        function Allvalidation() {



            var fullname = document.getElementById("ContentPlaceHolder1_txtRepresentativeName").value;

            if (fullname == "") {

                alert("Please fill Full Name");
                document.getElementById("ContentPlaceHolder1_txtRepresentativeName").focus;
                return false;
            }

            var image = document.getElementById("ContentPlaceHolder1_fileuploadPic").value;
             var picimage = document.getElementById("ContentPlaceHolder1_imagePic").baseURI;
            if (image == "" && picimage=="") {
                alert("Please upload the pic");
                document.getElementById("ContentPlaceHolder1_fileuploadPic").focus;
                return false;
            }

            var location = document.getElementById("ContentPlaceHolder1_txtLocation").value;
            if (location == "") {
                alert("Please fill the location");
                document.getElementById("ContentPlaceHolder1_txtLocation").focus;
                return false;
            }

            var employeecount = document.getElementById("ContentPlaceHolder1_txtEmployeeCount").value;
            if (employeecount == "") {
                alert("Please fill the employee count");
                document.getElementById("ContentPlaceHolder1_txtEmployeeCount").focus;
                return false;
            }

            var companystarted = document.getElementById("ContentPlaceHolder1_txtCompanyStarted").value;
            if (companystarted == "") {
                alert("Please fill the companystarted years");
                document.getElementById("ContentPlaceHolder1_txtCompanyStarted").focus;
                return false;
            }

            var description1 = document.getElementById("ContentPlaceHolder1_txtDescribedAs").value;
            if (description1 == "") {
                alert("Please fill the described as");
                document.getElementById("ContentPlaceHolder1_txtDescribedAs").focus;
                return false;
            }

            var description2 = document.getElementById("ContentPlaceHolder1_txtConsiderUsBecause").value;
            if (description2 == "") {
                alert("Please fill consider us because");
                document.getElementById("ContentPlaceHolder1_txtConsiderUsBecause").focus;
                return false;
            }

            var description3 = document.getElementById("ContentPlaceHolder1_txtOurTopCustomersAre").value;
            if (description3 == "") {
                alert("Please fil our top customers are");
                document.getElementById("ContentPlaceHolder1_txtOurTopCustomersAre").focus;
                return false;
            }


            if (document.getElementById("ContentPlaceHolder1_chkTerms").checked == true) {
                return true;
            }
            else {
                alert('Please check agree to the terms & conditions')
                document.getElementById("ContentPlaceHolder1_chkTerms").focus;
                return false;
            }
        }
        function AddValidation() {
            
            var ddlcategory = document.getElementById("ContentPlaceHolder1_ddlCategory");
            if (ddlcategory.value == "") {
                alert("Please select category");
                document.getElementById("ContentPlaceHolder1_ddlCategory").focus;
                return false;
            }
            var ddlsubcategory = document.getElementById("ContentPlaceHolder1_ddlSubCategory");
            if (ddlsubcategory.value == "") {
                alert("Please select subcategory");
                document.getElementById("ContentPlaceHolder1_ddlSubCategory").focus;
                return false;
            }
            var ddlpackagetype = document.getElementById("ContentPlaceHolder1_ddlPackageType");
            if (ddlpackagetype.value == "") {
                alert("Please select packagetype");
                document.getElementById("ContentPlaceHolder1_ddlPackageType").focus;
                return false;
            }
            var packagename = document.getElementById("ContentPlaceHolder1_txtPackageName").value;
            if (packagename == "") {
                alert("Please fill the package name");
                document.getElementById("ContentPlaceHolder1_txtPackageName").focus;
                return false;
            }
            var packagedescription = document.getElementById("ContentPlaceHolder1_txtPackageDescription").value;
            if (packagedescription == "") {
                alert("Please fill the package description");
                document.getElementById("ContentPlaceHolder1_txtPackageDescription").focus;
                return false;
            }
            var packagecostbasic = document.getElementById("ContentPlaceHolder1_txtPackageCost1").value;
            if (packagecostbasic == "") {
                alert("Please fill the package basic cost");
                document.getElementById("ContentPlaceHolder1_txtPackageCost1").focus;
                return false;
            }
           
            var packagecoststandardcost = document.getElementById("ContentPlaceHolder1_txtPackageCost2").value;
            if (packagecoststandardcost == "") {
                alert("Please fill the package standard cost");
                document.getElementById("ContentPlaceHolder1_txtPackageCost2").focus;
                return false;
            }
            var packagecostpremium = document.getElementById("ContentPlaceHolder1_txtPackageCost3").value;
            if (packagecostpremium == "") {
                alert("Please fill the package premium cost");
                document.getElementById("ContentPlaceHolder1_txtPackageCost3").focus;
                return false;
            }

        }
        function Allvalidationedit() {
            var ddlcategoryedit = document.getElementById("ContentPlaceHolder1_ddlCategoryedit");
            if (ddlcategoryedit.value == "") {
                alert("Please select category");
                document.getElementById("ContentPlaceHolder1_ddlCategoryedit").focus;
                return false;
            }
            var ddlsubcategoryedit = document.getElementById("ContentPlaceHolder1_ddlSubCategoryedit");
            if (ddlsubcategoryedit.value == "") {
                alert("Please select subcategory");
                document.getElementById("ContentPlaceHolder1_ddlSubCategoryedit").focus;
                return false;
            }
            var ddlpackagetypeedit = document.getElementById("ContentPlaceHolder1_ddlPackageTypeedit");
            if (ddlpackagetypeedit.value == "") {
                alert("Please select packagetype");
                document.getElementById("ContentPlaceHolder1_ddlPackageTypeedit").focus;
                return false;
            }
            var packagenameedit = document.getElementById("ContentPlaceHolder1_txtPackageNameedit").value;
            if (packagenameedit == "") {
                alert("Please fill the package name");
                document.getElementById("ContentPlaceHolder1_txtPackageNameedit").focus;
                return false;
            }
            var packagedescriptionedit = document.getElementById("ContentPlaceHolder1_txtPackageDescriptionedit").value;
            if (packagedescriptionedit == "") {
                alert("Please fill the package description");
                document.getElementById("ContentPlaceHolder1_txtPackageDescriptionedit").focus;
                return false;
            }
            var packagecostbasicedit = document.getElementById("ContentPlaceHolder1_txtbasicpackagecostedit").value;
            if (packagecostbasicedit == "") {
                alert("Please fill the package basic cost");
                document.getElementById("ContentPlaceHolder1_txtbasicpackagecostedit").focus;
                return false;
            }
            var packagecoststandardcostedit = document.getElementById("ContentPlaceHolder1_txtstandardpackagecostedit").value;
            if (packagecoststandardcostedit == "") {
                alert("Please fill the package standard cost");
                document.getElementById("ContentPlaceHolder1_txtstandardpackagecostedit").focus;
                return false;
            }
            var packagecostpremiumedit = document.getElementById("ContentPlaceHolder1_txtpremiumpackagecostedit").value;
            if (packagecostpremiumedit == "") {
                alert("Please fill the package premium cost");
                document.getElementById("ContentPlaceHolder1_txtpremiumpackagecostedit").focus;
                return false;
            }

        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
            $("#ContentPlaceHolder1_txtPackageName").attr("maxlength", 60);
            $("#ContentPlaceHolder1_txtPackageDescription").attr("maxlength", 250);
            $("#ContentPlaceHolder1_txtPackageNameedit").attr("maxlength", 60);
            $("#ContentPlaceHolder1_txtPackageDescriptionedit").attr("maxlength", 250);
            $("#ContentPlaceHolder1_txtPackageCost1").attr("maxlength", 8);
            $("#ContentPlaceHolder1_txtPackageCost2").attr("maxlength", 8);
            $("#ContentPlaceHolder1_txtPackageCost3").attr("maxlength", 8);
            $("#ContentPlaceHolder1_txtbasicpackagecostedit").attr("maxlength", 8);
            $("#ContentPlaceHolder1_txtstandardpackagecostedit").attr("maxlength", 8);
            $("#ContentPlaceHolder1_txtpremiumpackagecostedit").attr("maxlength", 8);

        });
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#ContentPlaceHolder1_imagePic").prop('src', e.target.result)
                        .width(150)
                        .height(150);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function SearchText() {
            $("#ContentPlaceHolder1_txtLocation").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AgencyDetails.aspx/GetAutoCompleteData",
                        data: "{'username':'" + extractLast(request.term) + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                },
                focus: function () {
                    // prevent value inserted on focus
                    return false;
                },
                select: function (event, ui) {
                    var terms = split(this.value);
                    // remove the current input
                    terms.pop();
                    // add the selected item
                    terms.push(ui.item.value);
                    // add placeholder to get the comma-and-space at the end
                    terms.push("");
                    this.value = terms.join(", ");
                    return false;
                }
            });
            $("#ContentPlaceHolder1_txtLocation").bind("keydown", function (event) {
                if (event.keyCode === $.ui.keyCode.TAB &&
                    $(this).data("autocomplete").menu.active) {
                    event.preventDefault();
                }
            })
            function split(val) {
                return val.split(/,\s*/);
            }
            function extractLast(term) {
                return split(term).pop();
            }
        }
    </script>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid" style="background-color: #f8f8f8;">
        <div class="row" style="margin: 20px;">
            <div class="tab-content" id="firstrow" runat="server" style="text-align: center; margin-left: 20px; margin-right: 20px; padding: 20px; width: 90%; border-radius: 30px; background-color: White; border: 1px solid green; color: Black; font-size: medium; margin-top: 10px;">




                <div>

                    <div class="row">
                        <div class="col-sm-12">
                            <h3 style="color: gray;">Agency Details</h3>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">



                                <asp:TextBox ID="txtRepresentativeName" class="form-control" Style="border-radius: 10px;" placeholder="Representative Name" runat="server"></asp:TextBox>


                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">
                                <asp:FileUpload ID="fileuploadPic" onchange="ShowImagePreview(this);" runat="server" />

                                <asp:Image ID="imagePic" runat="server" Style="margin-left: 500px;" />



                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">



                                <asp:TextBox ID="txtLocation" class="form-control" Style="border-radius: 10px;" placeholder="Office Location"
                                    runat="server"></asp:TextBox>


                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">



                                <asp:TextBox ID="txtEmployeeCount" class="form-control" Style="border-radius: 10px;" ReadOnly="true" placeholder="Employee Count"
                                    runat="server"></asp:TextBox>


                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">



                                <asp:TextBox ID="txtCompanyStarted" class="form-control" Style="border-radius: 10px;" ReadOnly="true" placeholder=" Company Started years"
                                    runat="server"></asp:TextBox>


                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">



                                <asp:TextBox ID="txtDescribedAs" Height="60" runat="server" Style="border-radius: 10px;" placeholder="Described as" TextMode="MultiLine"
                                    class="form-control"></asp:TextBox>


                            </div>


                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">



                                <asp:TextBox ID="txtConsiderUsBecause" Height="80" runat="server" Style="border-radius: 10px;" placeholder="Consider us because " TextMode="MultiLine"
                                    class="form-control"></asp:TextBox>


                            </div>


                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">



                                <asp:TextBox ID="txtOurTopCustomersAre" Height="60" runat="server" Style="border-radius: 10px;" placeholder="Our Top Customers are " TextMode="MultiLine"
                                    class="form-control"></asp:TextBox>


                            </div>


                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">
                                <asp:CheckBox runat="server" ID="chkTerms" Style="margin-left: 1%; font-size: small; text-align: left;" />&nbsp;&nbsp; I Agree to the <a href="../Policies/Terms-of-use-for-Partners.html" style="font-size: small; font-weight: bold;" target="_blank">Terms of use for Partners</a>&nbsp; & &nbsp;<a href="../Policies/Benchkart-Privacy-Policy.html" style="font-size: small; font-weight: bold;" target="_blank">Privacy Policy</a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">
                                <asp:Button ID="btnsubmit" runat="server" Text="Save" class="form-control" OnClientClick="return Allvalidation();"
                                    Style="margin-bottom: 30px; margin-top: 20px; border-radius: 10px;" OnClick="btnsubmit_Click" />
                            </div>
                        </div>
                    </div>
                </div>




            </div>


        </div>
    </div>
    <br />

    <asp:Panel ID="pnlpackage" runat="server" Style="display: none; overflow:auto; background-color: #f8f8f8;">
        <div class="container-fluid" style="margin-left: 50px; margin-right: 50px; padding: 20px; width: 80%; border-radius: 20px; background-color: #f8f8f8; border: 1px solid green; color: Black; font-size: medium; margin-top: 10px;">
            <div class="row">
                <div class="col-md-12 packagedetails" style="overflow:scroll;">
                    <div class ="form-group">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" onclick="clearTextBox();"><i class="fa fa-plus">Add New Package</i></button><br />
                    <br />
                    <asp:GridView ID="grdPackage" runat="server" Width="100%"  AutoGenerateColumns="false" AlternatingRowStyle-Wrap="true" OnRowCommand="grdPackage_RowCommand" RowStyle-Wrap="True" HeaderStyle-Wrap="True" PagerStyle-Wrap="True">
                        <Columns>
                            <asp:TemplateField HeaderText="PackageId" >
                                <ItemTemplate >
                                    <%#Eval("PartnerPackageId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PackageName" >
                                <ItemTemplate >
                                    <%#Eval("PackageName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PackageDescription" >
                                <ItemTemplate >

                                    <%#Eval("PackageDescription") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PackageType">
                                <ItemTemplate>
                                    <%#Eval("PackageType").ToString()=="1"? "Economy" : Eval("PackageType").ToString()=="2"? "Standard":"Premium" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IsActive">
                                <ItemTemplate>
                                    <%#Eval("IsActive").ToString()=="0"? "Not Active":"Active" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lkbedit" runat="server" ForeColor="Blue" Font-Bold="true"
                                        Text="Edit" CommandArgument='<%#Eval("PartnerPackageId") %>' CommandName="Edt"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                        </div>
                    
                </div>
            </div>
        </div>
    </asp:Panel>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="background-color: #f8f8f8; border: 1px solid green; border-radius: 10px;" aria-hidden="true">
        <div class="modal-dialog" style="width: 80%; border: 1px solid green; border-radius: 10px;">
            <div class="modal-content">

                <div class="modal-body" style="background-color: #f8f8f8; border: 1px solid green;">
                    <div class="row" style="margin: 10px; padding: 10px;">
                        <div class="form-group">
                            <button type="button" class="close btn btn-danger " data-dismiss="modal" style="font-weight: bold; font-size: large;">×</button>
                            <h4 class="modal-title" id="myModalLabel" style="text-align: center; font-weight: bold; font-size: large;">Package Details</h4>
                        </div>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row" style="margin: 10px; padding: 10px;">
                                <div class="form-group">

                                    <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"
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

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" style="margin: 10px; padding: 10px;">
                                <div class="form-group">

                                    <asp:DropDownList ID="ddlSubCategory" AutoPostBack="true" class="form-control" runat="server"
                                        Style="border-radius: 10px;">

                                        <%--<asp:ListItem Value="18">Website Development</asp:ListItem>
                                                    <asp:ListItem Value="19">Website Designing - UI/UX</asp:ListItem>
                                                    <asp:ListItem Value="20">Website Maintenance</asp:ListItem>
                                                    <asp:ListItem Value="21">Mobile Applications</asp:ListItem>
                                                    <asp:ListItem Value="22">Any Other</asp:ListItem>--%>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="row" style="margin: 10px; padding: 10px;">
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlPackageType" class="form-control" runat="server"
                                        Style="border-radius: 10px;">
                                        <asp:ListItem Value="">Select Package</asp:ListItem>
                                        <asp:ListItem Value="1">Economy</asp:ListItem>
                                        <asp:ListItem Value="2">Standard</asp:ListItem>
                                        <asp:ListItem Value="3">Premium</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="row" style="margin: 10px; padding: 10px;">
                        <div class="form-group">
                            <asp:TextBox ID="txtPackageName" class="form-control" runat="server"
                                Style="border-radius: 10px;" placeholder="Package Name" MaxLength="60"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" style="margin: 10px; padding: 10px;">
                        <div class="form-group">
                            <asp:TextBox ID="txtPackageDescription" class="form-control" runat="server"
                                Style="border-radius: 10px;" TextMode="MultiLine" MaxLength="250" Height="150px" placeholder="Package Description"></asp:TextBox>
                        </div>
                    </div>


                    <div class="row" style="margin: 10px; padding: 10px;">
                        <div class="form-group">

                            <table id="tblparameter" style="width: 100%; border: 2px solid green;">
                                <thead style="background-color: blanchedalmond; border: 2px solid green; font-weight: bold; font-size: large;">
                                    <tr>
                                        <th>Parameter type</th>
                                        <th>Basic</th>
                                        <th>Standard</th>
                                        <th>Premium</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtParameter1" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBasic1" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStandard1" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPremium" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtParameter2" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBasic2" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStandard2" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPremium2" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtParameter3" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBasic3" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStandard3" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPremium3" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtParameter4" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBasic4" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStandard4" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPremium4" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtParameter5" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBasic5" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStandard5" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPremium5" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtParameter6" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBasic6" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStandard6" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPremium6" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtParameter7" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBasic7" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStandard7" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPremium7" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtParameter8" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBasic8" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStandard8" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPremium8" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtPackageAmountCost" runat="server"  CssClass="form-control" Style="font-size: large; font-weight: bold;" Text=" Package Amount Cost" ReadOnly="true"></asp:TextBox>
                                            
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPackageCost1" class="form-control" runat="server" MaxLength="8" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');" ></asp:TextBox>
                                            
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPackageCost2" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');" class="form-control" runat="server" MaxLength="8"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPackageCost3" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');" class="form-control" runat="server" MaxLength="8"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="text-align: center;">
                                            <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="btn btn-primary form-control"
                                                OnClick="btnadd_Click" Style="border-radius: 10px;" OnClientClick="return AddValidation();" />

                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>





                </div>

            </div>
        </div>
    </div>
   
    <asp:Panel ID="pnlMyModal" runat="server" Style="display: none; width: 80%;  border: 1px solid green; border-radius: 20px;">
        <div class="modal-body" style="background-color: #f8f8f8; width: 80%; margin-left:50px; margin-right:50px; border-radius:20px; border: 1px solid green;">
            <div class="row" style="margin: 10px; padding: 10px;">
                <div class="form-group">
                    <button type="button" class="close btn btn-danger " data-dismiss="modal" style="font-weight: bold; font-size: large;">×</button>
                    <h4 class="modal-title" id="pnlMyModalLabel" style="text-align: center; font-weight: bold; font-size: large;">Package Details</h4>
                </div>
            </div>

            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="row" style="margin: 10px; padding: 10px;">
                        <div class="form-group">

                            <asp:DropDownList ID="ddlCategoryedit" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryedit_SelectedIndexChanged"
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

                            </asp:DropDownList>
                            
                        </div>
                    </div>
                    <div class="row" style="margin: 10px; padding: 10px;">
                        <div class="form-group">

                            <asp:DropDownList ID="ddlSubCategoryedit" AutoPostBack="true" class="form-control" runat="server"
                                Style="border-radius: 10px;">

                                <%--<asp:ListItem Value="18">Website Development</asp:ListItem>
                                                    <asp:ListItem Value="19">Website Designing - UI/UX</asp:ListItem>
                                                    <asp:ListItem Value="20">Website Maintenance</asp:ListItem>
                                                    <asp:ListItem Value="21">Mobile Applications</asp:ListItem>
                                                    <asp:ListItem Value="22">Any Other</asp:ListItem>--%>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="row" style="margin: 10px; padding: 10px;">
                        <div class="form-group">
                            <asp:DropDownList ID="ddlPackageTypeedit" class="form-control" runat="server"
                                Style="border-radius: 10px;">
                                <asp:ListItem Value="">Select Package</asp:ListItem>
                                <asp:ListItem Value="1">Economy</asp:ListItem>
                                <asp:ListItem Value="2">Standard</asp:ListItem>
                                <asp:ListItem Value="3">Premium</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="row" style="margin: 10px; padding: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="txtPackageNameedit" class="form-control" runat="server"
                        Style="border-radius: 10px;" placeholder="Package Name" MaxLength="60"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="margin: 10px; padding: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="txtPackageDescriptionedit" class="form-control" runat="server"
                        Style="border-radius: 10px;" TextMode="MultiLine" MaxLength="250" Height="150px" placeholder="Package Description"></asp:TextBox>
                </div>
            </div>

            <div class="row" style="margin: 10px; width:100%; padding: 10px;">
                <div class="form-group">
                    <asp:UpdatePanel ID="UpdatePaneledit" runat ="server" >
                        <ContentTemplate>
                    <asp:GridView ID="grdpackagedetails" DataKeyNames="PartnerPackageDetailsId" Width="90" runat="server"  AutoGenerateColumns="false"
                        OnPageIndexChanging="grdpackagedetails_PageIndexChanging" OnRowCancelingEdit="grdpackagedetails_RowCancelingEdit"
                        OnRowEditing="grdpackagedetails_RowEditing" OnRowUpdating="grdpackagedetails_RowUpdating" OnRowDeleting="grdpackagedetails_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Parameter Type">
                                <ItemTemplate>
                                    <%#Eval("Parameter") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtparameteredit"  runat="server" Text='<%# Eval("Parameter") %>' ></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Basic">
                                <ItemTemplate>
                                    <%#Eval("BasicDisplayText") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtbasicedit"  runat="server" Text=' <%#Eval("BasicDisplayText") %>' ></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Standard">
                                <ItemTemplate>
                                    <%#Eval("StandardDisplayText") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtstandardedit"  runat="server" Text='<%#Eval("StandardDisplayText") %>' ></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Premium">
                                <ItemTemplate>
                                    <%#Eval("PremiumDisplayText") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtpremiumedit" runat="server" Text='<%#Eval("PremiumDisplayText") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                        </Columns>
                    </asp:GridView>
                            </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="row" style="margin: 10px; width:100%; padding: 10px;">
                <div class="form-group">
                    
                    <table id="tblparameteredit" style="width: 100%; border: 2px solid green;">

                       

                            <tr>
                                <td>
                                    <asp:TextBox ID="txtpackageamountedit" runat="server"  CssClass="form-control"
                                        Style="font-size: large; font-weight: bold;" Text=" Package Amount Cost" ReadOnly="true"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtbasicpackagecostedit" class="form-control" runat="server" MaxLength="8" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtstandardpackagecostedit" class="form-control" runat="server" MaxLength="8" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtpremiumpackagecostedit" class="form-control" runat="server" MaxLength="8" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: center;">
                                    <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-primary form-control"
                                        Style="border-radius: 10px;" OnClick="btnupdate_Click" OnClientClick=" return Allvalidationedit();"   />

                                </td>
                            </tr>
                        
                    </table>

                </div>
            </div>





        </div>
    </asp:Panel>
        
</asp:Content>


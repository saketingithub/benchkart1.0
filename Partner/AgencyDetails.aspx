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

                alert("Please enter full name");
                document.getElementById("ContentPlaceHolder1_txtRepresentativeName").focus;
                return false;
            }

            //var image = document.getElementById("ContentPlaceHolder1_fileuploadPic").value;
            // var picimage = document.getElementById("ContentPlaceHolder1_imagePic").baseURI;
            //if (image == "" && picimage=="") {
            //    alert("Please upload the pic");
            //    document.getElementById("ContentPlaceHolder1_fileuploadPic").focus;
            //    return false;
            //}

            var location = document.getElementById("ContentPlaceHolder1_txtLocation").value;
            if (location == "") {
                alert("Please choose the location/s");
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
                alert("Please fill the yrs of operation");
                document.getElementById("ContentPlaceHolder1_txtCompanyStarted").focus;
                return false;
            }

            var description1 = document.getElementById("ContentPlaceHolder1_txtDescribedAs").value;
            if (description1 == "") {
                alert("Please fill 'Described as'");
                document.getElementById("ContentPlaceHolder1_txtDescribedAs").focus;
                return false;
            }

            var description2 = document.getElementById("ContentPlaceHolder1_txtConsiderUsBecause").value;
            if (description2 == "") {
                alert("Please fill 'Consider us because'");
                document.getElementById("ContentPlaceHolder1_txtConsiderUsBecause").focus;
                return false;
            }

            var description3 = document.getElementById("ContentPlaceHolder1_txtOurTopCustomersAre").value;
            if (description3 == "") {
                alert("Please fil 'Our top customers are'");
                document.getElementById("ContentPlaceHolder1_txtOurTopCustomersAre").focus;
                return false;
            }


            if (document.getElementById("ContentPlaceHolder1_chkTerms").checked == true) {
                return true;
            }
            else {
                alert('Please agree to the terms')
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
                alert("Please enter the package name");
                document.getElementById("ContentPlaceHolder1_txtPackageName").focus;
                return false;
            }
            var packagedescription = document.getElementById("ContentPlaceHolder1_txtPackageDescription").value;
            if (packagedescription == "") {
                alert("Please enter the package description");
                document.getElementById("ContentPlaceHolder1_txtPackageDescription").focus;
                return false;
            }
            var packagecostbasic = document.getElementById("ContentPlaceHolder1_txtPackageCost1").value;
            var packagecoststandardcost = document.getElementById("ContentPlaceHolder1_txtPackageCost2").value;
            var packagecostpremium = document.getElementById("ContentPlaceHolder1_txtPackageCost3").value;
            if (packagecostbasic == "" && packagecoststandardcost == "" && packagecostpremium == "") {
                alert("You must enter the package cost");
                document.getElementById("ContentPlaceHolder1_txtPackageCost1").focus;
                return false;
            }
            if (parseInt($.trim(packagecostbasic)) > 500000 || parseInt($.trim(packagecoststandardcost)) > 500000 || parseInt($.trim(packagecostpremium)) > 500000) {
               
                alert("Amount should be between 1 and 500000");
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
                alert("Please enter the package name");
                document.getElementById("ContentPlaceHolder1_txtPackageNameedit").focus;
                return false;
            }
            var packagedescriptionedit = document.getElementById("ContentPlaceHolder1_txtPackageDescriptionedit").value;
            if (packagedescriptionedit == "") {
                alert("Please enter the package description");
                document.getElementById("ContentPlaceHolder1_txtPackageDescriptionedit").focus;
                return false;
            }
            var packagecostbasicedit = document.getElementById("ContentPlaceHolder1_txtbasicpackagecostedit").value;
            var packagecoststandardcostedit = document.getElementById("ContentPlaceHolder1_txtstandardpackagecostedit").value;
            var packagecostpremiumedit = document.getElementById("ContentPlaceHolder1_txtpremiumpackagecostedit").value;
            if (packagecostbasicedit == "" && packagecoststandardcostedit == "" && packagecostpremiumedit == "") {
                alert("You must enter the package cost");
                document.getElementById("ContentPlaceHolder1_txtbasicpackagecostedit").focus;
                return false;
            }
            if (parseInt($.trim(packagecostbasicedit)) > 500000 || parseInt($.trim(packagecoststandardcostedit)) > 500000 || parseInt($.trim(packagecostpremiumedit)) > 500000) {

                alert("Amount should be between 1 and 500000");
                return false;
            } 



        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
            $("#ContentPlaceHolder1_txtRepresentativeName").attr("maxlength", 100);
            $("#ContentPlaceHolder1_txtLocation").attr("maxlength", 100);
            $("#ContentPlaceHolder1_txtDescribedAs").attr("maxlength", 200);
            $("#ContentPlaceHolder1_txtConsiderUsBecause").attr("maxlength", 300);
            $("#ContentPlaceHolder1_txtOurTopCustomersAre").attr("maxlength", 200);

            $("#ContentPlaceHolder1_txtPackageName").attr("maxlength", 60);
            $("#ContentPlaceHolder1_txtPackageDescription").attr("maxlength", 250);
            $("#ContentPlaceHolder1_txtPackageNameedit").attr("maxlength", 60);
            $("#ContentPlaceHolder1_txtPackageDescriptionedit").attr("maxlength", 250);
            $("#ContentPlaceHolder1_txtPackageCost1").attr("maxlength", 6);
            $("#ContentPlaceHolder1_txtPackageCost2").attr("maxlength", 6);
            $("#ContentPlaceHolder1_txtPackageCost3").attr("maxlength", 6);
            $("#ContentPlaceHolder1_txtbasicpackagecostedit").attr("maxlength", 6);
            $("#ContentPlaceHolder1_txtstandardpackagecostedit").attr("maxlength", 6);
            $("#ContentPlaceHolder1_txtpremiumpackagecostedit").attr("maxlength", 6);

        });
        //function ShowImagePreview(input) {
        //    if (input.files && input.files[0]) {
        //        var reader = new FileReader();
        //        reader.onload = function (e) {
        //            $("#ContentPlaceHolder1_imagePic").prop('src', e.target.result)
        //                .width(150)
        //                .height(150);
        //        };
        //        reader.readAsDataURL(input.files[0]);
        //    }
        //}
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
    <asp:Panel ID="pnlagency" runat="server" style="border:1px solid green;" >
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
                    <%--<div class="row">
                        <div class="col-sm-12">
                            <div class="fieldtitle">
                                <asp:FileUpload ID="fileuploadPic" onchange="ShowImagePreview(this);" runat="server" />

                                <asp:Image ID="imagePic" runat="server"  Style="margin-left: 500px;" />



                            </div>

                        </div>
                    </div>--%>
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
                                <asp:CheckBox runat="server" ID="chkTerms" Style="margin-left: 1%; font-size: small; text-align: left;" />&nbsp;&nbsp; I Agree to the <a href="../Policies/Terms-Packages.html" style="font-size: small; font-weight: bold;" target="_blank">Qik Project Terms</a>
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
        </asp:Panel>
    <br />

    <asp:Panel ID="pnlpackage" runat="server" Style="display: none; overflow:auto; background-color: #f8f8f8;">
        <div class="container-fluid" style="margin-left: 50px; margin-right: 50px; padding: 20px; width: 80%; border-radius: 20px; background-color: #f8f8f8; border: 1px solid green; color: Black; font-size: medium; margin-top: 10px;">
            <div class="row">
                <div class="col-md-12 packagedetails" style="overflow:scroll;">
                    <div class ="form-group">
                        <h4 style="text-align :center; font-weight :bold; color:green;">Agency Details</h4>
                        
                        <asp:GridView ID="grdAgencyDetails" runat ="server" Width="100%" OnRowCommand="grdAgencyDetails_RowCommand" AutoGenerateColumns="false" RowStyle-Wrap="True" HeaderStyle-Wrap="True" PagerStyle-Wrap="True" >
                            <Columns>
                                <asp:TemplateField HeaderText="Representative Name"  >
                                 
                                    <ItemTemplate >
                                        
                                        <%#Eval("PocFullName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Office Location">
                                    
                                    <ItemTemplate>
                                        <%#Eval("CompanyCity") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Created/Modified on">
                                    <ItemTemplate>
                                        <%#Eval("ModificationDate") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                      <asp:LinkButton ID="btneditAgency" runat ="server" ForeColor="Blue" Font-Bold="true" CommandArgument='<%#Eval("PartnerId") %>' CommandName ="EdtAgency">Edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" onclick="clearTextBox();"><i class="fa fa-plus">Add New Package</i></button><br />
                    
                        
                       <h4 style ="text-align:center; font-weight :bold; color:green;"> Package Details</h4>
                    <asp:GridView ID="grdPackage" runat="server" Width="100%"  AutoGenerateColumns="false" AlternatingRowStyle-Wrap="true" OnRowCommand="grdPackage_RowCommand" RowStyle-Wrap="True" HeaderStyle-Wrap="True" PagerStyle-Wrap="True">
                        <Columns>
                            <asp:TemplateField HeaderText="PackageId" >
                                <ItemTemplate >
                                    <%#Eval("PartnerPackageId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Package Name" >
                                <ItemTemplate >
                                    <%#Eval("PackageName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Package Description" >
                                <ItemTemplate >

                                    <%#Eval("PackageDescription") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Package Type">
                                <ItemTemplate>
                                    <%#Eval("PackageType").ToString()=="1"? "Logo" : Eval("PackageType").ToString()=="2"? "Other"
                                            :  Eval("PackageType").ToString()=="3"? "Social Media Banners": Eval("PackageType").ToString()=="4"? "Other"
                                            :  Eval("PackageType").ToString()=="5"? "Flyer/Poster Design": Eval("PackageType").ToString()=="6"? "Brochure Design"
                                            :  Eval("PackageType").ToString()=="7"? "Catalogue Design": Eval("PackageType").ToString()=="8"? "Other"
                                            :  Eval("PackageType").ToString()=="9"? "Packaging Design": Eval("PackageType").ToString()=="10"? "Other"
                                            :  Eval("PackageType").ToString()=="11"? "Banner Ads": Eval("PackageType").ToString()=="12"? "Other"
                                            :  Eval("PackageType").ToString()=="13"? "Presentation Design": Eval("PackageType").ToString()=="14"? "Other"
                                            :  Eval("PackageType").ToString()=="15"? "Video Making": Eval("PackageType").ToString()=="16"? "Animation"
                                            :  Eval("PackageType").ToString()=="17"? "3D Design": Eval("PackageType").ToString()=="18"? "Graphics - Any Other"
                                            :  Eval("PackageType").ToString()=="19"? "Simple Website": Eval("PackageType").ToString()=="20"? "Dynamic Website"
                                            :  Eval("PackageType").ToString()=="21"? "Landing Page": Eval("PackageType").ToString()=="22"? "Ecommerce Website"
                                            :  Eval("PackageType").ToString()=="23"? "API Integrations": Eval("PackageType").ToString()=="24"? "Other"
                                            :  Eval("PackageType").ToString()=="25"? "Website Designing - UI/UX": Eval("PackageType").ToString()=="26"? "Other"
                                            :  Eval("PackageType").ToString()=="27"? "Bug Fixing & Maintenance": Eval("PackageType").ToString()=="28"? "Ecommerce Management"
                                            :  Eval("PackageType").ToString()=="29"? "Other": Eval("PackageType").ToString()=="30"? "Readymade Apps"
                                            :  Eval("PackageType").ToString()=="31"? "Apps - Any Other": Eval("PackageType").ToString()=="32"? "Website - Any Other"
                                            :  Eval("PackageType").ToString()=="33"? "Digital Strategy	": Eval("PackageType").ToString()=="34"? "Other"
                                            :  Eval("PackageType").ToString()=="35"? "PPC": Eval("PackageType").ToString()=="36"? "Other"
                                            :  Eval("PackageType").ToString()=="37"? "Video Marketing": Eval("PackageType").ToString()=="38"? "Other"
                                            :  Eval("PackageType").ToString()=="39"? "Email-Marketing": Eval("PackageType").ToString()=="40"? "Other"
                                            :  Eval("PackageType").ToString()=="41"? "SMM": Eval("PackageType").ToString()=="42"? "Other"
                                            :  Eval("PackageType").ToString()=="43"? "Influencer Marketing": Eval("PackageType").ToString()=="44"? "Other"
                                            :  Eval("PackageType").ToString()=="45"? "Content Writing": Eval("PackageType").ToString()=="46"? "Content Marketing"
                                            :  Eval("PackageType").ToString()=="47"? "Other": Eval("PackageType").ToString()=="48"? "SEO"
                                            :  Eval("PackageType").ToString()=="49"? "Other": Eval("PackageType").ToString()=="50"? "Data Mining & Analytics"
                                            :  Eval("PackageType").ToString()=="51"? "Other": Eval("PackageType").ToString()=="52"? "Lead generation"
                                            :  Eval("PackageType").ToString()=="53"? "Ecommerce Marketing": Eval("PackageType").ToString()=="54"? "Podcast Marketing"
                                            :  Eval("PackageType").ToString()=="55"? "Web Traffic": Eval("PackageType").ToString()=="56"? "Music Promotion"
                                            :  Eval("PackageType").ToString()=="57"? "DM - Any Other": Eval("PackageType").ToString()=="58"? "Hire a Developer"
                                            :  Eval("PackageType").ToString()=="59"? "Software Development": Eval("PackageType").ToString()=="60"? "Other"
                                            :  Eval("PackageType").ToString()=="61"? "SaaS Applications"
                                            :  Eval("PackageType").ToString()=="62"? "Other": Eval("PackageType").ToString()=="63"? "Testing & QA"
                                            :  Eval("PackageType").ToString()=="64"? "Other": Eval("PackageType").ToString()=="65"? "Maintenance & Support"
                                            :  Eval("PackageType").ToString()=="66"? "Other": Eval("PackageType").ToString()=="67"? "Cloud Computing Applications"
                                            :  Eval("PackageType").ToString()=="68"? "Other": Eval("PackageType").ToString()=="69"? "Integration & Migration Services"
                                            :  Eval("PackageType").ToString()=="70"? "Other": Eval("PackageType").ToString()=="71"? "Game Development"
                                            :  Eval("PackageType").ToString()=="72"? "Other": Eval("PackageType").ToString()=="73"? "IoT Solutions"
                                            :  Eval("PackageType").ToString()=="74"? "Other": Eval("PackageType").ToString()=="75"? "Chatbots"
                                            :  Eval("PackageType").ToString()=="76"? "Other": Eval("PackageType").ToString()=="77"? "Packaged Software Implementation"
                                            :  Eval("PackageType").ToString()=="78"? "Software Subscription Services": Eval("PackageType").ToString()=="79"? "Software - Any Other"
                                            :  Eval("PackageType").ToString()=="80"? "Server Setup & Troubleshooting": Eval("PackageType").ToString()=="81"? "Other"
                                            :  Eval("PackageType").ToString()=="82"? "Server Management & Webmaster Services": Eval("PackageType").ToString()=="83"? "Other"
                                            :  Eval("PackageType").ToString()=="84"? "Network Setup And Management": Eval("PackageType").ToString()=="85"? "Other"
                                            :  Eval("PackageType").ToString()=="86"? "Remote IT Management": Eval("PackageType").ToString()=="87"? "Other"
                                            :  Eval("PackageType").ToString()=="88"? "Cloud Setup & Migration": Eval("PackageType").ToString()=="89"? "Other"
                                            :  Eval("PackageType").ToString()=="90"? "Cloud Consulting & Strategy": Eval("PackageType").ToString()=="91"? "Other"
                                            :  Eval("PackageType").ToString()=="92"? "Cloud - Any Other": Eval("PackageType").ToString()=="93"? "Other"
                                            :  Eval("PackageType").ToString()=="94"? "Support": Eval("PackageType").ToString()=="95"? "Other"
                                            :  Eval("PackageType").ToString()=="96"? "Tele Sales": Eval("PackageType").ToString()=="97"? "Other"
                                            :  Eval("PackageType").ToString()=="98"? "Debt Collection": Eval("PackageType").ToString()=="99"? "Other"
                                            :  Eval("PackageType").ToString()=="100"? "BPO - Any Other": Eval("PackageType").ToString()=="101"? "Other"
                                            :  Eval("PackageType").ToString()=="102"? "HR Services": Eval("PackageType").ToString()=="103"? "Other"
                                            :  Eval("PackageType").ToString()=="104"? "Consulting": Eval("PackageType").ToString()=="105"? "Other"
                                            :  Eval("PackageType").ToString()=="106"? "Legal Support": Eval("PackageType").ToString()=="107"? "Other"
                                            :  Eval("PackageType").ToString()=="108"? "Chartered Accountant Services": Eval("PackageType").ToString()=="109"? "Other"
                                            :  Eval("PackageType").ToString()=="110"? "Healthcare": Eval("PackageType").ToString()=="111"? "Other"
                                            :  Eval("PackageType").ToString()=="112"? "IT Consulting	": Eval("PackageType").ToString()=="113"? "Other"
                                            :  Eval("PackageType").ToString()=="114"? "IT Training ": Eval("PackageType").ToString()=="115"? "Other"
                                            :  Eval("PackageType").ToString()=="116"? "Market Research": Eval("PackageType").ToString()=="117"? "Other"
                                            :  Eval("PackageType").ToString()=="118"? "Public Relations	": Eval("PackageType").ToString()=="119"? "Other"
                                            :  Eval("PackageType").ToString()=="120"? "KPO - Any Other": Eval("PackageType").ToString()=="121"? "Other"
                                            :  Eval("PackageType").ToString()=="122"? "24X7 Chat": Eval("PackageType").ToString()=="123"? "Other"
                                            :  Eval("PackageType").ToString()=="124"? "Email Management": Eval("PackageType").ToString()=="125"? "Other"
                                            :  Eval("PackageType").ToString()=="126"? "Data Entry Operator Monthly": Eval("PackageType").ToString()=="127"? "Other"
                                            :  Eval("PackageType").ToString()=="128"? "Data Processing": Eval("PackageType").ToString()=="129"? "Other"
                                            :  Eval("PackageType").ToString()=="130"? "Digitization": Eval("PackageType").ToString()=="131"? "Other"
                                            :  Eval("PackageType").ToString()=="132"? "Research & Analytics": Eval("PackageType").ToString()=="133"? "Other"
                                            :  Eval("PackageType").ToString()=="134"? "Offline & Online Catalogues ": Eval("PackageType").ToString()=="135"? "Other"
                                            :  Eval("PackageType").ToString()=="136"? "Field Executive Support": Eval("PackageType").ToString()=="137"? "Other"
                                            :  Eval("PackageType").ToString()=="138"? "Writing & Translation Services": Eval("PackageType").ToString()=="139"? "Other"
                                            :  Eval("PackageType").ToString()=="140"? "Back Office - Any Other": "Other" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Is Active">
                                <ItemTemplate>
                                    <%#Eval("IsActive").ToString()=="0"? "Not Active": Eval("IsActive").ToString()=="1"?"Active":"Rejected" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lkbedit" runat="server" ForeColor="Blue" Font-Bold="true" Visible=' <%#Eval("IsActive").ToString()=="1"? false:true %>'
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

                                    <asp:DropDownList ID="ddlSubCategory" AutoPostBack="true"  class="form-control" runat="server"
                                        Style="border-radius: 10px;" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged">

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
                                <thead style="background-color: darkseagreen; border: 2px solid green; font-weight: bold; font-size: large;">
                                    <tr>
                                        <th>Parameter type <br />(Max 100 char.)</th>
                                        <th style="text-align:center;">Basic<br />(Max 10 char.)</th>
                                        <th style="text-align:center;">Standard<br />(Max 10 char.)</th>
                                        <th style="text-align:center;">Premium<br />(Max 10 char.)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtParameter1" runat="server" MaxLength="100" placeholder="You must've at-least 1 parameter" CssClass="form-control"></asp:TextBox>
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
                                        <td style="text-align:center;">
                                            <b>Qik Project Cost incl. taxes</b>
                                            
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPackageCost1" onpaste="return false;" class="form-control" runat="server" MaxLength="8" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');" ></asp:TextBox>
                                            
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPackageCost2" onpaste="return false;" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');" class="form-control" runat="server" MaxLength="8"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPackageCost3" onpaste="return false;" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');" class="form-control" runat="server" MaxLength="8"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="text-align: center;">
                                            <asp:Button ID="btnadd" runat="server" Text="Submit Package" CssClass="btn btn-primary form-control"
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
                                Style="border-radius: 10px;" OnSelectedIndexChanged="ddlSubCategoryedit_SelectedIndexChanged">

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

            <div class="row" style="margin: 10px; width:100%; padding: 10px; overflow:scroll;">
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
                            <asp:CommandField ShowEditButton="true" />
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
                                    &nbsp;
                                </td>
                                <td>
                                   <b>Basic</b>
                                </td>
                                <td>
                                    <b>Standard</b>
                                </td>
                                <td>
                                  <b>  Premium </b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                 <b>Qik Project Cost incl. Taxes</b>   
                                </td>
                                <td>
                                    <asp:TextBox ID="txtbasicpackagecostedit" class="form-control" runat="server" MaxLength="8" onpaste="return false;" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtstandardpackagecostedit" class="form-control" runat="server" MaxLength="8" onpaste="return false;" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtpremiumpackagecostedit" class="form-control" runat="server" MaxLength="8" onpaste="return false;" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');"></asp:TextBox>
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


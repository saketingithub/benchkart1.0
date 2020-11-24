<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuickProjectList.aspx.cs" Inherits="Benchkart.Consultant.QuickProjectList" %>
<%@ Register Src="~/Consultant/ucConsultantHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset='utf-8'>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="IT Shared Services" />
    <title>benchkart - marketplace for outsourcing</title>
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
    <script src="../Scripts/Skills.js"></script>
    <style>
        h4 {
            margin-top: 25px;
            font-size: medium;
            font-weight: bold;
        }

        h5 {
            font-size: small;
            font-weight: bold;
            margin-bottom: 3px;
            margin-top: 0px;
        }

        td {
            padding-left: 20px;
        }

        .label {
            font-size: medium;
            color: Black;
            font-weight: normal;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        li {
            float: left;
        }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

                li a:hover:not(.active) {
                    background-color: #111;
                }

        .active {
            background-color: #4CAF50;
        }
    </style>
    <script type="text/javascript">
        function Allvalidationedit() {
            var ddlcategoryedit = document.getElementById("ddlCategoryedit");
            if (ddlcategoryedit.value == "") {
                alert("Please select category");
                document.getElementById("ddlCategoryedit").focus;
                return false;
            }
            var ddlsubcategoryedit = document.getElementById("ddlSubCategoryedit");
            if (ddlsubcategoryedit.value == "") {
                alert("Please select subcategory");
                document.getElementById("ddlSubCategoryedit").focus;
                return false;
            }
            var ddlpackagetypeedit = document.getElementById("ddlPackageTypeedit");
            if (ddlpackagetypeedit.value == "") {
                alert("Please select packagetype");
                document.getElementById("ddlPackageTypeedit").focus;
                return false;
            }
            var packagenameedit = document.getElementById("txtPackageNameedit").value;
            if (packagenameedit == "") {
                alert("Please fill the package name");
                document.getElementById("txtPackageNameedit").focus;
                return false;
            }
            var packagedescriptionedit = document.getElementById("txtPackageDescriptionedit").value;
            if (packagedescriptionedit == "") {
                alert("Please fill the package description");
                document.getElementById("txtPackageDescriptionedit").focus;
                return false;
            }
            var isactive = document.getElementById("ddlIsActive");
            if (isactive.value == "") {
                alert("Please select IsActive");
                document.getElementById("ddlIsActive").focus;
                return false;
            }
            var packagecostbasicedit = document.getElementById("txtbasicpackagecostedit").value;
            //if (packagecostbasicedit == "") {
            //    alert("Please fill the package basic cost");
            //    document.getElementById("txtbasicpackagecostedit").focus;
            //    return false;
            //}
            var packagecoststandardcostedit = document.getElementById("txtstandardpackagecostedit").value;
            //if (packagecoststandardcostedit == "") {
            //    alert("Please fill the package standard cost");
            //    document.getElementById("txtstandardpackagecostedit").focus;
            //    return false;
            //}
            var packagecostpremiumedit = document.getElementById("txtpremiumpackagecostedit").value;
            //if (packagecostpremiumedit == "") {
            //    alert("Please fill the package premium cost");
            //    document.getElementById("txtpremiumpackagecostedit").focus;
            //    return false;
            //}
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
               $("#txtPackageNameedit").attr("maxlength", 60);
              $("#txtPackageDescriptionedit").attr("maxlength", 250);
              $("#txtbasicpackagecostedit").attr("maxlength", 6);
              $("#txtstandardpackagecostedit").attr("maxlength", 6);
              $("#txtpremiumpackagecostedit").attr("maxlength", 6);
          });
      </script>
</head>
<body>
    <form id="form1" runat="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
    </asp:ScriptManager>
         <div class="container-fluid">
             
             <div class="row">
            <uc1:ucHeader runat="server" ID="ucHeader" />
                 </div>
             <div class="row">
             <div class="col-lg-4" style="margin-left:20px; margin-top:20px; margin-bottom:10px;"> 
                 <asp:HyperLink ID="hylQuickPackage" runat ="server" Style="font-size:large;color:forestgreen; text-decoration: underline;" NavigateUrl="~/Consultant/PartnerQuickProjectList.aspx" >Qik Project</asp:HyperLink>
             </div>
             </div>
             <div class="row" style="margin-top:30px; overflow:scroll;">
                 <div class="col-lg-12" style="margin:20px;">
                     <asp:GridView ID="grdPackage" runat="server" Width="90%"  AutoGenerateColumns="False" OnRowCommand="grdPackage_RowCommand" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" >
                        <Columns>
                            <asp:TemplateField HeaderText="PackageId">
                                <ItemTemplate>
                                    <%#Eval("PartnerPackageId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <%#Eval("CategoryId").ToString()=="1" ? "Graphics & Design" :Eval("CategoryId").ToString()=="2" ? "Website & Apps":
                                            Eval("CategoryId").ToString()=="3" ? "Digital Marketing":Eval("CategoryId").ToString()=="4" ? "Software":
                                            Eval("CategoryId").ToString()=="5" ? "Cloud & Infra":Eval("CategoryId").ToString()=="6" ? "Call Center":
                                            Eval("CategoryId").ToString()=="7" ? "KPO" : "Back-Office" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="SubCategory">
                                <ItemTemplate>
                                    <%#Eval("SubCategoryId").ToString()=="11" ? "Logo Creation & Adaptation" :Eval("SubCategoryId").ToString()=="12" ?
                                            "Social Media Design": Eval("SubCategoryId").ToString()=="13" ? "POSM Design":Eval("SubCategoryId").ToString()=="14" ?
                                            "Packaging Design": Eval("SubCategoryId").ToString()=="15" ? "Banner Ads":Eval("SubCategoryId").ToString()=="16" ? 
                                            "Presentation Design": Eval("SubCategoryId").ToString()=="17" ? "Any Other" : Eval("SubCategoryId").ToString()=="18" ? "Website Development" :
                                            Eval("SubCategoryId").ToString()=="19" ? "Website Designing - UI/UX" :Eval("SubCategoryId").ToString()=="20" ? "Website Maintenance" :
                                            Eval("SubCategoryId").ToString()=="21" ? "Mobile Applications" :Eval("SubCategoryId").ToString()=="22" ? "Any Other" :
                                            Eval("SubCategoryId").ToString()=="23" ? "Digital Strategy" :Eval("SubCategoryId").ToString()=="24" ? "Search Marketing" :
                                            Eval("SubCategoryId").ToString()=="25" ? "Display Marketing" :Eval("SubCategoryId").ToString()=="26" ? "E-mail Marketing" :
                                            Eval("SubCategoryId").ToString()=="27" ? "Social Media Marketing" :Eval("SubCategoryId").ToString()=="28" ? "Influencer Marketing" :
                                            Eval("SubCategoryId").ToString()=="29" ? "Content Marketing" :Eval("SubCategoryId").ToString()=="30" ? "Search Engine Optimization (SEO)" :
                                            Eval("SubCategoryId").ToString()=="31" ? "Data Mining & Analytics" :Eval("SubCategoryId").ToString()=="32" ? "Any Other" :
                                            Eval("SubCategoryId").ToString()=="33" ? "Software Development" :Eval("SubCategoryId").ToString()=="34" ? "SaaS Applications" :
                                            Eval("SubCategoryId").ToString()=="35" ? "Testing & QA" :Eval("SubCategoryId").ToString()=="36" ? "Maintenance & Support" :
                                            Eval("SubCategoryId").ToString()=="37" ? "Cloud Computing Applications" :Eval("SubCategoryId").ToString()=="38" ? "Integration & Migration Services" :
                                            Eval("SubCategoryId").ToString()=="39" ? "Game Development" :Eval("SubCategoryId").ToString()=="40" ? "IoT Solutions" :
                                            Eval("SubCategoryId").ToString()=="41" ? "Chatbots" :Eval("SubCategoryId").ToString()=="42" ? "Any Other" :
                                            Eval("SubCategoryId").ToString()=="43" ? "Server Setup & Troubleshooting" :Eval("SubCategoryId").ToString()=="44" ? "Server Management & Webmaster Services" :
                                            Eval("SubCategoryId").ToString()=="45" ? "Network Setup And Management" :Eval("SubCategoryId").ToString()=="46" ? "Remote IT Management" :
                                            Eval("SubCategoryId").ToString()=="47" ? "Cloud Setup & Migration" :Eval("SubCategoryId").ToString()=="48" ? "Cloud Consulting & Strategy" :
                                            Eval("SubCategoryId").ToString()=="49" ? "Any Other" :Eval("SubCategoryId").ToString()=="50" ? "Inbound Calling" :
                                            Eval("SubCategoryId").ToString()=="51" ? "Outbound Calling" :Eval("SubCategoryId").ToString()=="52" ? "Outbound - Debt Collection" :
                                            Eval("SubCategoryId").ToString()=="53" ? "Any Other" :Eval("SubCategoryId").ToString()=="54" ? "Human Resources" :
                                            Eval("SubCategoryId").ToString()=="55" ? "Business Strategy" :Eval("SubCategoryId").ToString()=="56" ? "Legal" :
                                        Eval("SubCategoryId").ToString()=="57" ? "Financial & Accounting" :Eval("SubCategoryId").ToString()=="58" ? "Healthcare" :
                                        Eval("SubCategoryId").ToString()=="59" ? "IT Consulting" :Eval("SubCategoryId").ToString()=="60" ? "IT Training & Development" :
                                        Eval("SubCategoryId").ToString()=="61" ? "Market Research" :Eval("SubCategoryId").ToString()=="62" ? "Public Relations" :
                                        Eval("SubCategoryId").ToString()=="63" ? "Any Other" :Eval("SubCategoryId").ToString()=="64" ? "24X7 Chat" :
                                        Eval("SubCategoryId").ToString()=="65" ? "Email Managementr" :Eval("SubCategoryId").ToString()=="66" ? "Data Entry & Internet Research" :
                                        Eval("SubCategoryId").ToString()=="67" ? "Data Processing" :Eval("SubCategoryId").ToString()=="68" ? "Digitization" :
                                        Eval("SubCategoryId").ToString()=="69" ? "Research & Analytics" :Eval("SubCategoryId").ToString()=="70" ? "Offline & Online Catalogues " :
                                        Eval("SubCategoryId").ToString()=="71" ? "Field Executive Support" :Eval("SubCategoryId").ToString()=="72" ? "Writing & Translation Services"
                                        :"Any other"%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PackageName">
                                <ItemTemplate>
                                    <%#Eval("PackageName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PackageDescription">
                                <ItemTemplate>
                                    <%#Eval("PackageDescription") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PackageType">
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
                            <asp:TemplateField HeaderText="IsActive">
                                <ItemTemplate>
                                    <%#Eval("IsActive").ToString()=="0"? "Not Active":Eval("IsActive").ToString()=="1"?"Active":Eval("IsActive").ToString()=="2"?"Reject":"AllPkg" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lkbedit" runat="server" ForeColor="Blue" Font-Bold="true"
                                        Text="Edit" CommandArgument='<%#Eval("PartnerPackageId") %>' CommandName="Edt"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                         <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                         <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                         <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                         <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                         <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                         <SortedAscendingCellStyle BackColor="#FFF1D4" />
                         <SortedAscendingHeaderStyle BackColor="#B95C30" />
                         <SortedDescendingCellStyle BackColor="#F1E5CE" />
                         <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                 </div>
             </div>
             <div class="row" style="overflow :scroll;">
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

                            <asp:DropDownList ID="ddlCategoryedit" class="form-control" runat="server" AutoPostBack="true" 
                                Style="border-radius: 10px;" OnSelectedIndexChanged="ddlCategoryedit_SelectedIndexChanged" >
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
                                Style="border-radius: 10px;" OnSelectedIndexChanged="ddlSubCategoryedit_SelectedIndexChanged" >

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
                        Style="border-radius: 10px;" TextMode="MultiLine" MaxLength="250" Height="250px" placeholder="Package Description"></asp:TextBox>
                </div>
            </div>
           

            <div class="row" style="margin:10px; padding: 10px; ">
                <div class="form-group" style="overflow:scroll;">
                    <asp:UpdatePanel ID="UpdatePaneledit" runat ="server" >
                        <ContentTemplate>
                    <asp:GridView ID="grdpackagedetails"  DataKeyNames="PartnerPackageDetailsId" Width="90" runat="server"  AutoGenerateColumns="false"
                        OnRowUpdating="grdpackagedetails_RowUpdating" OnRowCancelingEdit="grdpackagedetails_RowCancelingEdit"
                         OnPageIndexChanging="grdpackagedetails_PageIndexChanging" OnRowEditing="grdpackagedetails_RowEditing" OnRowDeleting="grdpackagedetails_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Parameter Type" >
                                <ItemTemplate>
                                    <%#Eval("Parameter") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtparameteredit"  runat="server" Text='<%# Eval("Parameter") %>' ></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Basic" >
                                <ItemTemplate>
                                    <%#Eval("BasicDisplayText") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtbasicedit"  runat="server" Text=' <%#Eval("BasicDisplayText") %>' ></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Standard" >
                                <ItemTemplate>
                                    <%#Eval("StandardDisplayText") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtstandardedit"  runat="server" Text='<%#Eval("StandardDisplayText") %>' ></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Premium" >
                                <ItemTemplate>
                                    <%#Eval("PremiumDisplayText") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtpremiumedit" runat="server" Text='<%#Eval("PremiumDisplayText") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField >
                            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                        </Columns>
                       
                    </asp:GridView>
                            </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="row" style="margin: 10px; width:100%;  padding: 10px;">
                <div class="form-group" >
                    
                    <table id="tblparameteredit"  >

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
                                   <b>Premium</b> 
                                </td>
                            </tr>

                            <tr>
                                <td>
                                 <b>Package Amount Cost</b>  
                                </td>
                                <td>
                                    <asp:TextBox ID="txtbasicpackagecostedit" onpaste="return false;" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');" class="form-control" runat="server" MaxLength="8"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtstandardpackagecostedit" onpaste="return false;" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');" class="form-control" runat="server" MaxLength="8"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtpremiumpackagecostedit" onpaste="return false;" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');" class="form-control" runat="server" MaxLength="8"></asp:TextBox>
                                </td>
                            </tr>
                           
                        
                    </table>

                </div>
            </div>
             <div class="row" style="margin:10px; padding:10px;">
                <div class="form-group">
                    <asp:DropDownList ID="ddlIsActive" runat ="server" CssClass="form-control"  Style="border-radius: 10px;" >
                        <asp:ListItem Value="">Select Active</asp:ListItem>
                        <asp:ListItem Value ="0">Not Active</asp:ListItem>
                        <asp:ListItem Value ="1">Active</asp:ListItem>
                        <asp:ListItem Value="2">Reject</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
             <div class="row" style="margin:10px; padding:10px;">
                <div class="form-group" style="text-align:center;">
                   <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-success form-control" 
                                        Style="border-radius: 10px;" OnClick="btnupdate_Click" OnClientClick=" return Allvalidationedit();" />
                </div>
            </div>




        </div>
    </asp:Panel>
             </div>
        </div>
    </form>
</body>
</html>

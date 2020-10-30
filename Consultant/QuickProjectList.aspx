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
            if (packagecostbasicedit == "") {
                alert("Please fill the package basic cost");
                document.getElementById("txtbasicpackagecostedit").focus;
                return false;
            }
            var packagecoststandardcostedit = document.getElementById("txtstandardpackagecostedit").value;
            if (packagecoststandardcostedit == "") {
                alert("Please fill the package standard cost");
                document.getElementById("txtstandardpackagecostedit").focus;
                return false;
            }
            var packagecostpremiumedit = document.getElementById("txtpremiumpackagecostedit").value;
            if (packagecostpremiumedit == "") {
                alert("Please fill the package premium cost");
                document.getElementById("txtpremiumpackagecostedit").focus;
                return false;
            }

        }
    </script>
      <script type="text/javascript">
          $(document).ready(function () {
               $("#txtPackageNameedit").attr("maxlength", 60);
              $("#txtPackageDescriptionedit").attr("maxlength", 250);
              $("#txtbasicpackagecostedit").attr("maxlength", 8);
              $("#txtstandardpackagecostedit").attr("maxlength", 8);
              $("#txtpremiumpackagecostedit").attr("maxlength", 8);
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
             
             <div class="row" style="margin-top:30px;">
                 <div class="col-lg-12" style="margin:20px;">
                     <asp:GridView ID="grdPackage" runat="server" Width="90%"  AutoGenerateColumns="False" OnRowCommand="grdPackage_RowCommand" >
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
             <div class="row">
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
                        Style="border-radius: 10px;" TextMode="MultiLine" MaxLength="250" Height="250px" placeholder="Package Description"></asp:TextBox>
                </div>
            </div>
           

            <div class="row" style="margin:10px; padding: 10px;">
                <div class="form-group">
                    <asp:UpdatePanel ID="UpdatePaneledit" runat ="server" >
                        <ContentTemplate>
                    <asp:GridView ID="grdpackagedetails" DataKeyNames="PartnerPackageDetailsId" Width="90" runat="server"  AutoGenerateColumns="false"
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
            <div class="row" style="margin: 10px; width:100%; padding: 10px;">
                <div class="form-group">
                    
                    <table id="tblparameteredit" >

                       

                            <tr>
                                <td>
                                    <asp:TextBox ID="txtpackageamountedit" runat="server"  CssClass="form-control"
                                        Style="font-size: large; font-weight: bold;" Text=" Package Amount Cost" ReadOnly="true"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtbasicpackagecostedit" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtstandardpackagecostedit" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtpremiumpackagecostedit" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                            </tr>
                           
                        
                    </table>

                </div>
            </div>
             <div class="row" style="margin:10px; padding:10px;">
                <div class="form-group">
                    <asp:DropDownList ID="ddlIsActive" runat ="server" class="form-control"  Style="border-radius: 10px;" >
                        <asp:ListItem Value="">Select Active</asp:ListItem>
                        <asp:ListItem Value ="0">Not Active</asp:ListItem>
                        <asp:ListItem Value ="1">Active</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
             <div class="row" style="margin:10px; padding:10px;">
                <div class="form-group">
                   <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-primary form-control"
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

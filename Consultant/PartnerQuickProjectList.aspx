<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerQuickProjectList.aspx.cs" Inherits="Benchkart.Consultant.PartnerQuickProjectList" %>

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
        $(document).ready(function () {
            SearchText();
            $("#txtRepresentativeName").attr("maxlength", 100);
            $("#txtLocation").attr("maxlength", 100);
            $("#txtDescribedAs").attr("maxlength", 200);
            $("#txtConsiderUsBecause").attr("maxlength", 300);
            $("#txtOurTopCustomersAre").attr("maxlength", 200);


        });
        function Allvalidation() {



            var fullname = document.getElementById("txtRepresentativeName").value;

            if (fullname == "") {

                alert("Please enter full name");
                document.getElementById("txtRepresentativeName").focus;
                return false;
            }

            //var image = document.getElementById("ContentPlaceHolder1_fileuploadPic").value;
            // var picimage = document.getElementById("ContentPlaceHolder1_imagePic").baseURI;
            //if (image == "" && picimage=="") {
            //    alert("Please upload the pic");
            //    document.getElementById("ContentPlaceHolder1_fileuploadPic").focus;
            //    return false;
            //}

            var location = document.getElementById("txtLocation").value;
            if (location == "") {
                alert("Please choose the location/s");
                document.getElementById("txtLocation").focus;
                return false;
            }

            var employeecount = document.getElementById("txtEmployeeCount").value;
            if (employeecount == "") {
                alert("Please fill the employee count");
                document.getElementById("txtEmployeeCount").focus;
                return false;
            }

            var companystarted = document.getElementById("txtCompanyStarted").value;
            if (companystarted == "") {
                alert("Please fill the yrs of operation");
                document.getElementById("txtCompanyStarted").focus;
                return false;
            }

            var description1 = document.getElementById("txtDescribedAs").value;
            if (description1 == "") {
                alert("Please fill 'Described as'");
                document.getElementById("txtDescribedAs").focus;
                return false;
            }

            var description2 = document.getElementById("txtConsiderUsBecause").value;
            if (description2 == "") {
                alert("Please fill 'Consider us because'");
                document.getElementById("txtConsiderUsBecause").focus;
                return false;
            }

            var description3 = document.getElementById("txtOurTopCustomersAre").value;
            if (description3 == "") {
                alert("Please fil 'Our top customers are'");
                document.getElementById("txtOurTopCustomersAre").focus;
                return false;
            }


            
        }

        function SearchText() {
            $("#txtLocation").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "PartnerQuickProjectList.aspx/GetAutoCompleteData",
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
            $("#txtLocation").bind("keydown", function (event) {
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
                <div class="col-lg-4" style="margin-left: 20px; margin-top: 30px; margin-bottom: 10px;">
                    <asp:HyperLink ID="hylQuickPackage" runat="server" Style="font-size: large; color: forestgreen; text-decoration: underline;" NavigateUrl="~/Consultant/Requests.aspx">Back</asp:HyperLink>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2">
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtsearch" CssClass="form-control" placeholder="Please fill partner name or companyname" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:Button ID="btnsearch" runat="server" CssClass="form-control btn btn-primary" Text="Search Partner" OnClick="btnsearch_Click" />
                </div>

            </div>
             


            <div class="row" style="margin-top: 30px;">
                <div class="col-lg-12" style="margin: 20px; overflow: scroll;">
                    <asp:GridView ID="grdpartnerQuickdetails" runat="server" Width="90%" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" CssClass="table-bordered" OnRowCommand="grdpartnerQuickdetails_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Partner Name">
                                <ItemTemplate>
                                    <%#Eval("CompanyName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PartnerType">
                                <ItemTemplate>
                                    <%#Eval("PartnerType").ToString()=="1"? "Economy":Eval("PartnerType").ToString()=="2"?"Standard":"Premium" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PrimarySourceOfRevenue">
                                <ItemTemplate>
                                    <%#Eval("PrimarySourceOfRevenue") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="AllPkg">
                                <ItemTemplate>
                                    <%#Eval("AllPackages") %>
                                    <asp:HyperLink ID="hylall" runat="server" Text="ViewDetails" NavigateUrl='<%# String.Format("~/Consultant/QuickProjectList.aspx?PartnerIdAll={0}", Eval("PartnerId")) %>'></asp:HyperLink>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active">

                                <ItemTemplate>
                                    <%#Eval("ActivePkg") %>
                                    <asp:HyperLink ID="hylactive" runat="server" Text="ViewDetails" NavigateUrl='<%# String.Format("~/Consultant/QuickProjectList.aspx?PartnerIdActive={0}", Eval("PartnerId")) %>'></asp:HyperLink>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="InActive">
                                <ItemTemplate>
                                    <%#Eval("InActivePkg") %>
                                    <asp:HyperLink ID="hylinactive" runat="server" Text="ViewDetails" NavigateUrl='<%# String.Format("~/Consultant/QuickProjectList.aspx?PartnerIdInActive={0}", Eval("PartnerId")) %>'></asp:HyperLink>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Rejected">
                                <ItemTemplate>
                                    <%#Eval("RejectPkg") %>
                                    <asp:HyperLink ID="hylreject" runat="server" Text="ViewDetails" NavigateUrl='<%# String.Format("~/Consultant/QuickProjectList.aspx?PartnerIdReject={0}", Eval("PartnerId")) %>'></asp:HyperLink>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AgencyDetails">
                                <ItemTemplate>

                                    <asp:LinkButton ID="hylagencydetails" CommandArgument='<%#Eval("PartnerId") %>' CommandName="Edt"  runat="server" Text="AgencyDetails"></asp:LinkButton>

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
                <asp:Panel ID="pnlagency" runat="server" style="border:1px solid green; display:none;" >
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
                                <asp:Button ID="btnsubmit" runat="server" Text="Save" class="form-control btn btn-success" OnClientClick="return Allvalidation();"
                                    Style="margin-bottom: 30px; margin-top: 20px; border-radius: 10px;" OnClick="btnsubmit_Click"/>
                            </div>
                        </div>
                    </div>
                </div>




            </div>


        </div>
    </div>
        </asp:Panel>
        </div>
     

              <%--  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="background-color: #f8f8f8; border: 1px solid green; border-radius: 10px;" aria-hidden="true">
                    <div class="modal-dialog" style="width: 80%; border: 1px solid green; border-radius: 10px;">
                        <div class="modal-content">

                            <div class="modal-body" style="background-color: #f8f8f8; border: 1px solid green;">
                                <div class="row" style="margin-left: 10px; margin-right: 10px; padding: 1px;">
                                    <div class="form-group">
                                        <button type="button" class="close btn btn-danger " data-dismiss="modal" style="font-weight: bold; font-size: large;">
                                            X</button>
                                        <h4 class="modal-title" id="myModalLabel" style="text-align: center; font-weight: bold; font-size: large;">Agency Details</h4>
                                    </div>
                                </div>


                                <div class="row" style="margin-left: 10px; margin-right: 10px; padding: 1px;">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtRepresentativeName" class="form-control" Style="border-radius: 10px;" placeholder="Representative Name" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="row" style="margin-left: 10px; margin-right: 10px; padding: 1px;">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtLocation" class="form-control" Style="border-radius: 10px;" placeholder="Office Location"
                                            runat="server"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="row" style="margin-left: 10px; margin-right: 10px; padding: 1px;">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEmployeeCount" class="form-control" Style="border-radius: 10px;" ReadOnly="true" placeholder="Employee Count"
                                            runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="margin-left: 10px; margin-right: 10px; padding: 1px;">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtCompanyStarted" class="form-control" Style="border-radius: 10px;" ReadOnly="true" placeholder=" Company Started years"
                                            runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="margin-left: 10px; margin-right: 10px; padding: 1px;">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtDescribedAs" Height="60" runat="server" Style="border-radius: 10px;" placeholder="Described as" TextMode="MultiLine"
                                            class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="margin-left: 10px; margin-right: 10px; padding: 1px;">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtConsiderUsBecause" Height="80" runat="server" Style="border-radius: 10px;" placeholder="Consider us because " TextMode="MultiLine"
                                            class="form-control"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="row" style="margin-left: 10px; margin-right: 10px; padding: 1px;">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtOurTopCustomersAre" Height="60" runat="server" Style="border-radius: 10px;" placeholder="Our Top Customers are " TextMode="MultiLine"
                                            class="form-control"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="row" style="margin-left: 10px; margin-right: 10px; padding: 1px;">
                                    <div class="form-group">
                                        <asp:Button ID="btnupdateagencydetails" runat="server" OnClick="btnupdateagencydetails_Click"
                                            OnClientClick="return Allvalidation();" Text="Update Agency Details" CssClass="btn btn-success form-control" />
                                    </div>
                                </div>






                            </div>

                        </div>
                    </div>
                </div>--%>
        
          
               
    </form>
</body>
</html>

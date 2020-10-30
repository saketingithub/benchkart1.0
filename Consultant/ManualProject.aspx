<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManualProject.aspx.cs" Inherits="Benchkart.Consultant.ManualProject1" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Manual Project</title>
    <meta charset='utf-8'>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="Partner sign up" />

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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" />

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {

       <%-- $('#<%=ddlLocation.ClientID%>').chosen();--%>

            $('#ddlPartnerType').multiselect({
                includeSelectAllOption: true,

            });
            $('#ddlEmployeeCount').multiselect({
                includeSelectAllOption: true,

            });
            $('#ddlPrimarySourceofRevenue').multiselect({
                includeSelectAllOption: true,

            });
            $('#ddlIsTalentShared').multiselect({
                includeSelectAllOption: true,
            });
            SearchText();
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
          //  getcheck();
            getall(headercheck);
        });
        function SearchText() {
            $("#txtSearch").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "ManualProject.aspx/GetAutoCompleteData",
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
            $("#txtSearch").bind("keydown", function (event) {
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

        function getcheck(chkitem) {
            if (chkitem.checked == true) {
                $("#btnsend").show();
            }
            else {
                $("#btnsend").hide();
            }
           
        }

        //function getall(headercheck) {
        //    $("#btnsend").show();
        //    var ischeckbox = headercheck.checked;
        //    parent = document.getElementById("grdmanual");
        //    var item = document.getElementsByTagName("input");
        //    for (i = 0; i < item.length; i++) {
        //        if (item[i].id != headercheck && item[i].type == "checkbox" ) {
        //            if (item[i].checked != ischeckbox) {
        //                item[i].click();
        //            }
        //        }
        //    }
        //}
        function getall(CheckBoxControl) {
            if (CheckBoxControl.checked == true) {
                $("#btnsend").show();
                var i;
                for (i = 0; i < document.forms[0].elements.length; i++) {

                    if ((document.forms[0].elements[i].type == 'checkbox') &&

                        (document.forms[0].elements[i].name.indexOf('grdManual') > -1)) {
                        if (document.forms[0].elements[i].disabled) {
                            document.forms[0].elements[i].checked = false;
                        }
                        else {
                            document.forms[0].elements[i].checked = true;
                        }
                    }
                }
            }
            else {
                $("#btnsend").hide();
                var i;
                for (i = 0; i < document.forms[0].elements.length; i++) {

                    if ((document.forms[0].elements[i].type == 'checkbox') &&

                        (document.forms[0].elements[i].name.indexOf('grdManual') > -1)) {
                        document.forms[0].elements[i].checked = false;
                    }
                }
            }
        }
    </script>
</head>
<body>

    <form id="form1" class="form-horizontal" role="form" style="margin-left: 5%; margin-right: 5%; border: 1px solid groove" runat="server">

        <div class="container">
            <div class="card" style="border: 1px solid groove; margin: 2%; padding: 2%;">
                <h2 style="text-align: center;">Manual Project</h2>

                <div class="form-group">
                    <label class="control-label col-sm-2" style="text-align: left;" for="PartnerType">PartnerType :</label>

                    <div class="col-sm-10">



                        <asp:ListBox ID="ddlPartnerType" runat="server" SelectionMode="Multiple" Width="100%" Pleaceholder="Partner Type">
                            <asp:ListItem Value="1">Economy</asp:ListItem>
                            <asp:ListItem Value="2">Standard</asp:ListItem>
                            <asp:ListItem Value="3">Premium</asp:ListItem>
                        </asp:ListBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" style="text-align: left;" for="EmployeeCount">Employee Count :</label>
                    <div class="col-sm-10">
                        <asp:ListBox runat="server" ID="ddlEmployeeCount" SelectionMode="Multiple" CssClass="form-control"
                            Width="100%" Placeholder="Employee Count" multiple="multiple">
                            <asp:ListItem Value="1-9" Text="1-9">1-9</asp:ListItem>
                            <asp:ListItem Value="10-49" Text="10-49">10-49</asp:ListItem>
                            <asp:ListItem Value="50-99" Text="50-99">50-99</asp:ListItem>
                            <asp:ListItem Value="100-499" Text="100-499">100-499</asp:ListItem>
                            <asp:ListItem Value="500-999" Text="500-999">500-999</asp:ListItem>
                            <asp:ListItem Value=">1000" Text=">1000">1000</asp:ListItem>
                        </asp:ListBox>
                    </div>

                </div>



                <div class=" form-group">
                    <label class="control-label col-sm-2" style="text-align: left;" for="PrimarySourceofRevenue">Primary Source of Revenue :</label>
                    <div class="col-sm-10">
                        <asp:ListBox ID="ddlPrimarySourceofRevenue" runat="server" SelectionMode="Multiple" CssClass="form-control"
                            Width="100%" placeholder="Primary SOurce of revenue" multiple="multiple">


                            <asp:ListItem Value="1">Graphics & Design</asp:ListItem>
                            <asp:ListItem Value="2">Website & Apps</asp:ListItem>
                            <asp:ListItem Value="3">Digital Marketing</asp:ListItem>
                            <asp:ListItem Value="4">Software</asp:ListItem>
                            <asp:ListItem Value="5">Cloud & Infra</asp:ListItem>
                            <asp:ListItem Value="6">Call Center</asp:ListItem>
                            <asp:ListItem Value="7">KPO</asp:ListItem>
                            <asp:ListItem Value="8">Back-Office</asp:ListItem>
                        </asp:ListBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" style="text-align: left;" for="IsTalentShared">Is Talent Shared :</label>
                    <div class="col-sm-10">

                        <asp:ListBox ID="ddlIsTalentShared" runat="server" SelectionMode="Multiple" CssClass="form-control"
                            Width="100%" placeholder="Primary SOurce of revenue" multiple="multiple">
                            <asp:ListItem Value="1">Yes </asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:ListBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" style="text-align: left;" for="Location">Location :</label>
                    <div class="col-sm-10">

                        <%--<asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true"></asp:DropDownList>--%>
                        <asp:TextBox ID="txtSearch" runat="server" Width="100%"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="Show Partner List" />
                    </div>
                </div>
                <br />
                <br />
                <asp:GridView ID="grdManual" runat="server" AutoGenerateColumns="False" EnablePersistedSelection="True" PagerSettings-Mode="Numeric" DataKeyNames="PartnerId">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkmultiselect" runat="server" Text="All Select" onclick="javascript:getall(this);" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkitem" runat="server" onclick="javascript:getcheck(this);"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="PartnerId" DataField="PartnerId" />
                        <asp:BoundField HeaderText="FullName" DataField="PocFullName" />
                        <asp:BoundField HeaderText="Email" DataField ="Email" />
                        <asp:TemplateField HeaderText="PartnerType">
                            <ItemTemplate>
                                <%#Eval("PartnerType").ToString()=="1" ? "Economy" : Eval("PartnerType").ToString()=="2" ? "Standard" : "Premium" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField HeaderText="PrimarySourceOfRevenue" DataField="PrimarySourceOfRevenue" />
                        <asp:BoundField HeaderText="Employee Count" DataField ="EmployeeCount" />
                        <asp:TemplateField HeaderText="IsTalentShard">
                            <ItemTemplate>
                                <%#Eval("IsTalentShared").ToString()=="0" ? "No" : "Yes" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:BoundField HeaderText="CompanyCity" DataField ="CompanyCity" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <%#Eval("IsActive").ToString()=="0" ? "InComplete": Eval("IsActive").ToString()=="1"? "Pending" : Eval("IsActive").ToString()=="2"?"Approved":"Reject" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        

                    </Columns>
                </asp:GridView>
                <br />
                <asp:Button ID="btnsend" runat="server" Text="Send" style="display:none;" OnClick="btnsend_Click" CssClass="btn btn-success" />
                <br />
            </div>


        </div>
    </form>

</body>
</html>

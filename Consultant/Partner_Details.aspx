<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="Partner_Details.aspx.cs" Inherits="Benchkart.Consultant.Partner_Details" %>

<%@ Register Src="~/Consultant/ucConsultantHeader.ascx" TagPrefix="uc1" TagName="ucHeader" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- Required meta tags -->
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
     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
     <script src="../Scripts/Custom.js"></script>
     <script>
        $(document).ready(function () {
            $('[id*=ddlGraphics]').multiselect({
                includeSelectAllOption: true
            });
            //$('#ddlGraphics').multiselect({
            //    includeSelectAllOption: true,
            //});
            $('[id*=ddlWeb]').multiselect({
                includeSelectAllOption: true,
            });
            $('[id*=ddlDigital]').multiselect({
                includeSelectAllOption: true,
            });
            $('[id*=ddlApps]').multiselect({
                includeSelectAllOption: true,
            });
            $('[id*=ddlCloud]').multiselect({
                includeSelectAllOption: true,
            });
            $('[id*=ddlVoice]').multiselect({
                includeSelectAllOption: true,
            });

            $('[id*=ddlKnowledge]').multiselect({
                includeSelectAllOption: true,
            });
            $('[id*=ddlBackoffice]').multiselect({
                includeSelectAllOption: true,
            });
        });
    </script>
    <style>
        multiselect dropdown-toggle btn btn-default {
            width: 500px;
        }
    </style>
    <style>
        h4 {
            margin-top: 25px;
            font-size: small;
            font-weight: bold;
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

</head>
<body>
    <form id="form1" runat="server" height="none" style="margin-bottom: 5px;">

        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
        </asp:ScriptManager>
        <div>
            <uc1:ucHeader runat="server" ID="ucHeader" />
        </div>
        <div style="font-size: 20px; font-weight: bold; color: Black; height: 15px; background-color: #1d4354; margin-top: 0px;">
           
            <div>
                <asp:Label runat="server" ID="lblConsultantEmail" CssClass="label" ForeColor="White"
                    styel="padding: 20px;"></asp:Label>
            </div>
        </div>
        <div class="container">
            <div class="row" style="text-align: center;">
                <div class="form-group">
                    <h3>Partner Details</h3>
                </div>
            </div>

            <div class="row" style="margin-bottom: 20px;">
                <div class="form-group">
                    <div class="col-md-4">
                        <b>PartnerId</b>
                        <br />
                        <asp:Label ID="lblPartnerId" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>Company Name</b>
                        <br />
                        <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>Company Website</b>
                        <br />
                        <asp:Label ID="lblWebsite" runat="server"></asp:Label>
                    </div>

                </div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="form-group">
                    <div class="col-md-4">
                        <b>Primary Contact Person Name</b>
                        <br />
                        <asp:Label ID="lblFullName" runat="server"></asp:Label>
                    </div>

                    <div class="col-md-4">
                        <b>Contact Number</b>
                        <br />
                        <asp:Label ID="lblContactNumber" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>Work Email</b>
                        <br />
                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="form-group">
                    <div class="col-md-4">
                        <b>Company Industry</b>
                        <br />
                        <asp:Label ID="lblCompanyIndustry" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>Company Profile</b>
                        <br />
                        <asp:Label ID="lblCompanyProfile" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="form-group">
                    <div class="col-md-4">
                        <b>Company Address</b>
                        <br />
                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>Company GST Number</b>
                        <br />
                        <asp:Label ID="lblCompanyGSTNumber" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>Employee Count</b>
                        <br />
                        <asp:Label ID="lblEmployeeCount" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                     <div class="col-lg-12">
                        <b>Location</b>
                        <br />
                        <asp:Label ID="lblLocation" runat="server"></asp:Label>
                    </div>
                </div>
            </div>            
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                     <div class="col-lg-12">
                        <b>Services</b>
                        <br />
                          <h5 style="color: Gray; text-align: center;">Please select all the services offered by your company. Our algorithms will use this representation to match you to relevant customers.</h5>
                         </br>
                       <%-- <asp:TextBox ID="txtServices" runat="server" ReadOnly="true" TextMode="MultiLine" style="width: 80%;"></asp:TextBox>--%>
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
                                        class="form-control" Width="70%" Placeholder="Category" multiple="multiple">
                                        
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: Gray; padding: 10px; border: 1px solid gray;">Website & Apps
                                </td>
                                <td style="padding: 10px; border: 1px solid gray;">
                                    <asp:ListBox runat="server" ID="ddlWeb" SelectionMode="Multiple" class="form-control"
                                        Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                        multiple="multiple">                                      
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: Gray; padding: 10px; border: 1px solid gray;">Digital Marketing
                                </td>
                                <td style="padding: 10px; border: 1px solid gray;">
                                    <asp:ListBox runat="server" ID="ddlDigital" SelectionMode="Multiple" class="form-control"
                                        Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                        multiple="multiple">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: Gray; padding: 10px; border: 1px solid gray;">Software
                                </td>
                                <td style="padding: 10px; border: 1px solid gray;">
                                    <asp:ListBox runat="server" ID="ddlApps" SelectionMode="Multiple" class="form-control"
                                        Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                        multiple="multiple">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: Gray; padding: 10px; border: 1px solid gray;">Cloud & Infra
                                </td>
                                <td style="padding: 10px; border: 1px solid gray;">
                                    <asp:ListBox runat="server" ID="ddlCloud" SelectionMode="Multiple" class="form-control"
                                        Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                        multiple="multiple">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: Gray; padding: 10px; border: 1px solid gray;">Call Center

                                </td>
                                <td style="padding: 10px; border: 1px solid gray;">
                                    <asp:ListBox runat="server" ID="ddlVoice" SelectionMode="Multiple" class="form-control"
                                        Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                        multiple="multiple">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: Gray; padding: 10px; border: 1px solid gray;">KPO
                                </td>
                                <td style="padding: 10px; border: 1px solid gray;">
                                    <asp:ListBox runat="server" ID="ddlKnowledge" SelectionMode="Multiple" class="form-control"
                                        Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                        multiple="multiple">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: Gray; padding: 10px; border: 1px solid gray;">Back-Office
                                </td>
                                <td style="padding: 10px; border: 1px solid gray;">
                                    <asp:ListBox runat="server" ID="ddlBackoffice" SelectionMode="Multiple" class="form-control"
                                        Width="70%" Style="margin: 0 auto; margin-top: 20px;" Placeholder="Category"
                                        multiple="multiple">
                                    </asp:ListBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
             <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                     <div class="col-lg-12">
                        <b>Other Services</b>
                        <br />
                        <asp:TextBox ID="txtOtherServices" runat="server" ReadOnly="true" TextMode="MultiLine" style="width: 80%;"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="form-group">
                    <div class="col-md-4">
                        <b>IsTalentAvailable</b>
                        <br />
                        <asp:Label ID="lblIsTalentAvailable" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>CreationDate</b>
                        <br />
                        <asp:Label ID="lblCreationDate" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>Company Started</b>
                        <br />
                        <asp:Label ID="lblCompanyStarted" runat="server"></asp:Label>
                    </div>
                    
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class="col-md-4">
                        <b>Described As</b>
                        <br />
                        <asp:Label ID="lblDescribedAs" runat="server"></asp:Label>
                    </div>
                     <div class="col-md-4">
                        <b>Company Type</b>
                        <br />
                        <asp:Label ID="lblCompanyType" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>ClientFrom</b>
                        <br />
                        <asp:Label ID="lblClientFrom" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="form-group">
                   
                    
                    <div class="col-md-4">
                        <b>Price Positioning</b>
                        <br />
                        <asp:Label ID="lblPricePositioning" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>Customer Segment</b>
                        <br />
                        <asp:Label ID="lblCustomerSegment" runat="server"></asp:Label>
                    </div>
                     <div class="col-md-4">
                        <b>PrimarySourceOfRevenue</b>
                        <br />
                        <asp:Label ID="lblPrimarySourceOfRevenue" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="form-group">
                   
                    <div class="col-md-4">
                        <b>MinimumProjectValue</b>
                        <br />
                        <asp:Label ID="lblMinimumProjectValue" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>RepresentativeName</b>
                        <br />
                        <asp:Label ID="lblRepresentativeName" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>RepresentativeContact</b>
                        <br />
                        <asp:Label ID="lblRepresentativeContact" runat="server"></asp:Label>
                    </div>

                </div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="form-group">
                    <div class="col-md-4">
                        <b>RepresentativeLoginEmail</b>
                        <br />
                        <asp:Label ID="lblRepresentativeLoginEmail" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <b>CompanyCity</b>
                        <br />
                        <asp:Label ID="lblCompanyCity" runat="server"></asp:Label>
                    </div>
                    
                </div>
            </div>
            <div  class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class="col-md-6">
                        <b>Partner Type</b>
                        <br />
                        <asp:RadioButtonList ID="rblpartnertype" runat ="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1" Selected="True">&nbsp; Economy</asp:ListItem>
                            <asp:ListItem Value="2" style="margin-left:10px;">&nbsp; Standard</asp:ListItem>
                            <asp:ListItem Value="3" style="margin-left:10px;">&nbsp; Premium</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="col-md-6">

                        <b>Status</b>
                        <br />
                        <asp:DropDownList ID="ddlStatus" runat="server">
                            <asp:ListItem Value="0">InComplete</asp:ListItem>
                            <asp:ListItem Value="1"> Pending</asp:ListItem>
                            <asp:ListItem Value="2">Approved</asp:ListItem>
                            <asp:ListItem Value="3">Reject</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="form-group">
                    <div class="col-md-12">
                        <b>Status Comment</b>

                        <asp:TextBox ID="txtStatusComment" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>

                    </div>
                </div>
            </div>
            <div class="row" style="text-align: center; margin-top: 10px;">
                <div class="form-group ">
                    <div class="col-md-6">
                        <asp:Button ID="btncancel" runat="server" Text="Cancel" OnClick="btncancel_Click" CssClass="btn btn-warning btn-lg form-control" />
                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Submit" CssClass="form-control btn-success btn-lg" />
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>

<%@ Page Language="C#" Title="Partner Messages" AutoEventWireup="true" Inherits="Benchkart.Partner.Services" MasterPageFile="~/Partner/Site1.Master" CodeBehind="Services.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
    <%--<script>
        $(document).ready(function () {
            $("#liServices").css("background-color", "white");
            $("#liServices").css("color", "#F79507");
        })

    </script>--%>
    <script>

        function setServices() {
           
            var x = document.getElementById('<%=ddlGraphics.ClientID %>').value;
            if (x == "") {
                
                x = document.getElementById('<%=ddlWeb.ClientID %>').value;
                if (x == "") {
                    x = document.getElementById('<%=ddlDigital.ClientID %>').value;
                    if (x == "") {
                        x = document.getElementById('<%=ddlApps.ClientID %>').value;
                        if (x == "") {
                            x = document.getElementById('<%=ddlCloud.ClientID %>').value;
                            if (x == "") {
                                x = document.getElementById('<%=ddlVoice.ClientID %>').value;
                                if (x == "") {
                                    x = document.getElementById('<%=ddlKnowledge.ClientID %>').value;
                                    if (x == "") {
                                        x = document.getElementById('<%=ddlBackoffice.ClientID %>').value;
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

        }

        
    </script>
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

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- Page Content  -->
        <div id="content" style="padding: 0px;">
            <div>
                <div class="card" style="margin: 0 auto; background-color: White; margin-top: 30px; margin-bottom: 50px; width: 90%;">
                    <div class="container" style="width: 90%;">
                        <h3 style="color: Gray; text-align: center; margin-top: 15px;">Services</h3>
                        <h5 style="color: Gray; text-align: center;">Please select all the services offered by your company. Our algorithms will use this representation to match you to relevant customers.</h5>

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
                        <div class="divField" style="margin-top: 30px; margin-bottom: 35px; text-align: center;">

                            <asp:Button ID="btnUpdateServices" runat="server" class="form-control" Style="margin-left: 25px; display: inline-block; color: White;"
                                Width="45%" Text="Save"
                                OnClientClick="return setServices(); return false;" OnClick="btnUpdateServices_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>


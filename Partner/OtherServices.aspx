<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OtherServices.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.OtherServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- Page Content  -->
        <div id="content" style="padding: 0px;">
            <div>
                <div class="card" style="margin: 0 auto; background-color: White; margin-top: 30px; margin-bottom: 50px; width: 90%;">
                    <div class="container" style="width: 90%;">
                        <div>
                            <h3 style="color: Gray;">Trial Offer</h3>
                            <h4 style="margin-top: 20px;">
                                <asp:CheckBox runat="server" ID="chkFreeTrial" />&nbsp;&nbsp;Opt in for 15 Days Trial Offer to Customer</h4>
                            <h5>Refer <a style="color: blue; text-decoration: underline;" href="TrialOffer.html" target="_blank">Trial Offer Terms</a> for further clarifications</h5>
                            <h5 style="padding: 50px; text-align: left; padding-top: 0px; padding-bottom: 0px;">Benchkart is proposing to offer a 15-day trial offer to Customers from participating Partners. Participation is purely voluntary. Please read through the details provided below to evaluate your participation. Do reach out to us at partnership@benchkart.com for any queries in this regard.</h5>
                            <br />
                            <h4>
                                <asp:CheckBox runat="server" ID="chkBenchShared" />&nbsp;&nbsp;Opt in for Bench Sharing Program
                            </h4>
                            <h5 style="padding: 50px; text-align: left; padding-top: 0px; padding-bottom: 0px;">In this program partner companies with urgent requirement of talent/resources can hire talent for short term from other Benchkart partner companies at lesser prices. And they can also share their bench resources with other companies.</h5>

                        </div>
                        <div>
                            <h3 style="color: Gray;">Other Services</h3>
                            <h4 style="text-align: left; font-size: medium; margin-top: 15px;">Please add upto 3 sub categories that you would like us
                            to offer</h4>
                            <table style="width: 95%; text-align: center; margin-left: 10px; margin-top: 20px;">
                                <tr style="font-weight: bold; font-size: large; color: Gray;">
                                    <td style="padding: 10px; border: 1px solid gray;">Service (Categories)
                                    </td>
                                    <td style="padding: 10px; border: 1px solid gray;">Sub category
                                    </td>
                                    <td style="padding: 10px; border: 1px solid gray;">Description
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px; border: 1px solid gray;">
                                        <asp:DropDownList ID="ddlCategory1" runat="server" Width="95%" class="form-control">
                                            <asp:ListItem Value="2">Website & Apps</asp:ListItem>
                                   <asp:ListItem Value="1">Graphics & Design</asp:ListItem>                                   
                                   <asp:ListItem Value="3">Digital Marketing</asp:ListItem>
                                   <asp:ListItem Value="4">Software</asp:ListItem>
                                   <asp:ListItem Value="5">Cloud & Infra</asp:ListItem>
                                   <asp:ListItem Value="6">Call Center</asp:ListItem>
                                   <asp:ListItem Value="7">KPO</asp:ListItem>
                                   <asp:ListItem Value="8">Back-Office</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="padding: 10px; border: 1px solid gray;">
                                        <asp:TextBox ID="txtSubcategory1" runat="server" MaxLength="40" Width="95%" class="form-control">
                                        </asp:TextBox>
                                    </td>
                                    <td style="padding: 10px; border: 1px solid gray;">
                                        <asp:TextBox ID="txtSubcategoryDesc1" runat="server" MaxLength="100" Width="95%" class="form-control">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px; border: 1px solid gray;">
                                        <asp:DropDownList ID="ddlCategory2" runat="server" Width="95%" class="form-control">
                                            <asp:ListItem Value="2">Website & Apps</asp:ListItem>
                                   <asp:ListItem Value="1">Graphics & Design</asp:ListItem>                                   
                                   <asp:ListItem Value="3">Digital Marketing</asp:ListItem>
                                   <asp:ListItem Value="4">Software</asp:ListItem>
                                   <asp:ListItem Value="5">Cloud & Infra</asp:ListItem>
                                   <asp:ListItem Value="6">Call Center</asp:ListItem>
                                   <asp:ListItem Value="7">KPO</asp:ListItem>
                                   <asp:ListItem Value="8">Back-Office</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="padding: 10px; border: 1px solid gray;">
                                        <asp:TextBox ID="txtSubcategory2" runat="server" MaxLength="40" Width="95%" class="form-control">
                                        </asp:TextBox>
                                    </td>
                                    <td style="padding: 10px; border: 1px solid gray;">
                                        <asp:TextBox ID="txtSubcategoryDesc2" runat="server" MaxLength="100" Width="95%" class="form-control">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px; border: 1px solid gray;">
                                        <asp:DropDownList ID="ddlCategory3" runat="server" Width="95%" class="form-control">
                                            <asp:ListItem Value="2">Website & Apps</asp:ListItem>
                                   <asp:ListItem Value="1">Graphics & Design</asp:ListItem>                                   
                                   <asp:ListItem Value="3">Digital Marketing</asp:ListItem>
                                   <asp:ListItem Value="4">Software</asp:ListItem>
                                   <asp:ListItem Value="5">Cloud & Infra</asp:ListItem>
                                   <asp:ListItem Value="6">Call Center</asp:ListItem>
                                   <asp:ListItem Value="7">KPO</asp:ListItem>
                                   <asp:ListItem Value="8">Back-Office</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="padding: 10px; border: 1px solid gray;">
                                        <asp:TextBox ID="txtSubcategory3" runat="server" MaxLength="40" Width="95%" class="form-control">
                                        </asp:TextBox>
                                    </td>
                                    <td style="padding: 10px; border: 1px solid gray;">
                                        <asp:TextBox ID="txtSubcategoryDesc3" runat="server" MaxLength="100" Width="95%" class="form-control">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="divField" style="margin-top: 30px; margin-bottom: 35px;">

                            <asp:Button ID="btnOtherServices" runat="server" class="form-control" Style="margin-left: 25px; display: inline-block; color: White;"
                                Width="45%" Text="Update" OnClick="btnOtherServices_Click"
                                 />
                        </div>
                        <h4 style="text-align: center; font-size: large; padding: 20px; padding-top: 0px;">Our Category team will study your recommended Sub-Categories & may include it among our offerings basis internal discussions. Please do provide a short description for the proposed sub-category to help us understand it better.</h4>

                    </div>
                </div>
            </div>
        </div>
    </asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Partner_Review.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.Partner_Review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h3 {
            font-size: 24px;
        }

        label {
            padding-left: 10px;
            font-weight: 500;
        }
    </style>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Card -->
    <div class="card" style="margin: 0 auto; background-color: White; margin-top: 40px;">
        <div class="container">
            <div class="row form-group">
                <div class="col-lg-8" style="margin-left: 20%; margin-top: 30px;">
                    <h2>Review Your Project
                    </h2>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-8" style="margin-left: 5%;">
                    <h3>How was your overall experience?</h3>
                    <asp:RadioButtonList ID="rbloverall" runat="server" RepeatDirection="Vertical" Font-Size="Medium" Font-Bold="false">
                        <asp:ListItem Value="1">Very Poor</asp:ListItem>
                        <asp:ListItem Value="2">Below Average</asp:ListItem>
                        <asp:ListItem Value="3">Average</asp:ListItem>
                        <asp:ListItem Value="4">Above Average</asp:ListItem>
                        <asp:ListItem Value="5">Excellent</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rbloverall" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-lg-8" style="margin-left: 5%;">
                    <h3>Any comments </h3>
                    <asp:TextBox ID="txtanycomment" runat="server" CssClass="form-control" Style="height: 100px;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtanycomment" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-8 " style="margin-left: 5%; text-align: center;">
                    <asp:Button ID="btnSave" runat="server" Text="Submit" OnClick="btnSave_Click" Style="width: 50%;" CssClass="btn btn-warning form-control" />

                </div>
            </div>

        </div>
    </div>
</asp:Content>

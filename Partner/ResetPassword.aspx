<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .content {
            margin-left: auto;
            margin-right: auto;
            position: relative;
            z-index: 0;
            min-width: 500px;
            min-height: 600px;
        }

        .button {
            width: 70%;
            background-color: Green;
            color: White;
            height: 30px;
            border-radius: 5px;
            margin-top: 20px;
        }

        .panel {
            padding: 20px;
            width: 50%;
            margin: 0 auto;
            margin-top: 30px;
        }

        br {
            display: block; /* makes it have a width */
            content: ""; /* clears default height */
            margin-top: 0; /* change this to whatever height you want it */
        }
    </style>

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content " style="margin-left: auto; margin-right: auto; margin-top: 50px;">
        <div class="row">

            <div id="divlogin" class="col-sm-12">
                <asp:Panel ID="pnlResetPassword" runat="server" DefaultButton="btnSave" CssClass="panel">
                    <div>
                        <asp:TextBox runat="server" ID="txtOldPassword" class="form-control" TextMode="Password"
                            PlaceHolder="Current Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtOldPassword" runat="server" SetFocusOnError="True"
                            ControlToValidate="txtOldPassword" Display="Dynamic" ForeColor="Red" Font-Size="Small" ErrorMessage="Old password is required."
                            ToolTip="Password is required." ValidationGroup="Save"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" Style="margin-top: 20px;"
                            CssClass="form-control fa-step-forward" placeholder="New Password" ValidationGroup="Save"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtNewPassword" runat="server" SetFocusOnError="True"
                            ControlToValidate="txtNewPassword" Display="Dynamic" ForeColor="Red" Font-Size="Small" ErrorMessage="New password is required."
                            ToolTip="New Password is required." ValidationGroup="Save"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:TextBox ID="txtCNewPassword" runat="server" TextMode="Password" Style="margin-top: 20px;"
                            CssClass="form-control " placeholder="Confirm password" ValidationGroup="Save"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtCNewPassword" runat="server" SetFocusOnError="True"
                            ControlToValidate="txtCNewPassword" Display="Dynamic" ForeColor="Red" Font-Size="Small" ErrorMessage="Confirm password is required."
                            ToolTip="Confirm password is required." ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cmptxtConfPassword" runat="server" ControlToCompare="txtNewPassword"
                            Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtCNewPassword"
                            ForeColor="Red" Font-Size="Small" ErrorMessage="The password and confirmation password must match."
                            ValidationGroup="Save"></asp:CompareValidator>
                    </div>
                    <div class="formindent">
                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Style="margin-top: 20px;" ValidationGroup="Save" CssClass="button" Text="Save" />
                    </div>

                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>


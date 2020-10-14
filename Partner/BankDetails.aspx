<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankDetails.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.BankDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .divField {
            width: 70%;
            margin: 0 auto;
            margin-top: 35px;
        }

        h5 {
            margin-bottom: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- Page Content  -->
        <div id="content" style="padding: 0px;">

            <div class="card" style="margin: 0 auto; background-color: White; margin-top: 30px; margin-bottom: 50px; width: 90%;">
                <div class="container" style="width: 90%; margin-top:20px;">

                    <h3 style="color: Gray; text-align: center; margin-top:20px;">Bank Account Details</h3>

                    <div class="divField">
                        <h5>Bank Account holder's name</h5>
                        <asp:TextBox runat="server" ID="txtAccountHoldername" ValidationGroup="Account" class="form-control"
                            Style="text-align: left;" Placeholder="Must be Same as present in the bank documents"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="reqtxtAccountHoldername" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtAccountHoldername" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill"
                                        ToolTip="Please fill" ValidationGroup="Account"></asp:RequiredFieldValidator>

                    </div>
                    <div class="divField">
                        <h5>Bank Account Number</h5>
                        <asp:TextBox runat="server" ID="txtAccountNumber" class="form-control" Width="45%" Style="text-align: left; margin: initial; float: left; margin-right: 20px;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtAccountNumber" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtAccountNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill"
                                        ToolTip="Please fill" ValidationGroup="Account"></asp:RequiredFieldValidator>

                        <asp:TextBox runat="server" ID="txtConfAccountNumber" ValidationGroup="FirstRegistration"
                            TextMode="Password" Width="45%" Placeholder="Confirm Account Number" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtConfAccountNumber" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtConfAccountNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill"
                                        ToolTip="Please fill" ValidationGroup="Account"></asp:RequiredFieldValidator>

                         <asp:CompareValidator ID="cmptxtAccountNumber" runat="server" ControlToCompare="txtAccountNumber"
                            Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtConfAccountNumber"
                            ForeColor="Red" Font-Size="Small" ErrorMessage="The account number must match."
                            ValidationGroup="Account"></asp:CompareValidator>
                    </div>
                    <br />
                    <div class="divField">
                        <h5>Bank Account Type</h5>
                        <asp:DropDownList ID="ddlAccountType" runat="server" Width="45%" class="form-control" Style="text-align: left; margin: initial;">
                            <asp:ListItem Value="1">Current
                            </asp:ListItem>
                            <asp:ListItem Value="2">Saving
                            </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="divField">
                        <h5>Benefeciary Bank Name</h5>
                        <asp:TextBox runat="server" ID="txtBeneficiaryBank"
                            class="form-control" Style="text-align: left;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtBeneficiaryBank" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtBeneficiaryBank" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill"
                                        ToolTip="Please fill" ValidationGroup="Account"></asp:RequiredFieldValidator>
                        
                    </div>
                    <div class="divField">
                        <h5>SWIFT Code(Optional)</h5>
                        <asp:TextBox runat="server" ID="txtSwiftcode" class="form-control"
                            Style="text-align: left;"></asp:TextBox>
                    </div>
                    <div class="divField" style="margin-bottom:20px;">
                        <h5>Bank IFSC Code</h5>
                        <asp:TextBox runat="server" ID="txtIfsccode" class="form-control" Style="text-align: left;"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="reqtxtIfsccode" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtIfsccode" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill"
                                        ToolTip="Please fill" ValidationGroup="Account"></asp:RequiredFieldValidator>
                    </div>

                    <asp:Button ID="btnEdit" runat="server" class="form-control"
                        Width="70%" Text="Edit" OnClick="btnEdit_Click" style="margin-top: 40px;" />
                    <br />
                    <asp:Button ID="btnUpdateAccount" runat="server" class="form-control" ValidationGroup="Account" Style="background-color: #18D26E; margin-bottom: 40px;"
                        Width="70%" Text="Save" OnClick="btnUpdateAccount_Click"/>

                </div>
            </div>

        </div>
    </asp:Content>


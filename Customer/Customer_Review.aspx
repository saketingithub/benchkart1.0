<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Review.aspx.cs" MasterPageFile="~/Customer/Site1.Master" Inherits="Benchkart.Customer.Customer_Review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        h3 {
            font-size: 20px;
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
                    <h3>1. How would you rate the overall quality of this delivery?</h3>
                    <br />
                    <asp:RadioButtonList ID="rblquality" runat="server" RepeatDirection="Vertical">
                        <asp:ListItem Value="1">Very Poor</asp:ListItem>
                        <asp:ListItem Value="2">Below Average</asp:ListItem>
                        <asp:ListItem Value="3">Average</asp:ListItem>
                        <asp:ListItem Value="4">Above Average</asp:ListItem>
                        <asp:ListItem Value="5">Excellent</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rblquality" ForeColor="Red" ErrorMessage="Please select rating"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-8" style="margin-left: 5%;">
                    <h3>2.	How would you rate the timeliness of this delivery?</h3>
                    <br />
                    <asp:RadioButtonList ID="rbltimeliness" runat="server" RepeatDirection="Vertical">
                        <asp:ListItem Value="1">Very Poor</asp:ListItem>
                        <asp:ListItem Value="2">Below Average</asp:ListItem>
                        <asp:ListItem Value="3">Average</asp:ListItem>
                        <asp:ListItem Value="4">Above Average</asp:ListItem>
                        <asp:ListItem Value="5">Excellent</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="rbltimeliness" runat="server" ErrorMessage='Please select rating' ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-8" style="margin-left: 5%;">
                    <h3>3. How would you rate the value for money of this project?</h3>
                    <br />
                    <asp:RadioButtonList ID="rblmoney" runat="server" RepeatDirection="Vertical">
                        <asp:ListItem Value="1">Very Poor</asp:ListItem>
                        <asp:ListItem Value="2">Below Average</asp:ListItem>
                        <asp:ListItem Value="3">Average</asp:ListItem>
                        <asp:ListItem Value="4">Above Average</asp:ListItem>
                        <asp:ListItem Value="5">Excellent</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="rblmoney" runat="server" ErrorMessage='Please select rating' ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-8" style="margin-left: 5%;">
                    <h3>Any comment (Optional)</h3>
                    <asp:TextBox ID="txtanycomment" runat="server" CssClass="form-control" Style="height: 50px; width: 80%;"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtanycomment" ErrorMessage="Please select rating" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-8" style="margin-left: 5%;">
                    <h3>We absolutely love referrals! Can you give us some leads we could reach out to?
                    </h3>
                    <table style="width: 90%;">
                        <tr>
                            <td>
                                <asp:TextBox ID="txtPersonName1" runat="server" CssClass="form-control" placeholder="Person Name"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtPersonName2" runat="server" CssClass="form-control" placeholder="Person Name"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtPersonName3" runat="server" CssClass="form-control" placeholder="Person Name"></asp:TextBox>
                                <br />
                                <br />
                            </td>

                            <td>
                                <asp:TextBox ID="txtCompanyName1" runat="server" CssClass="form-control" placeholder="Company Name"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtCompanyName2" runat="server" CssClass="form-control" placeholder="Company Name"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtCompanyName3" runat="server" CssClass="form-control" placeholder="Company Name"></asp:TextBox>
                                <br />
                                <br />
                            </td>

                            <td>
                                <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" placeholder="Email Id"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" placeholder="Email Id"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtEmail3" runat="server" CssClass="form-control" placeholder="Email Id"></asp:TextBox>
                                <br />
                                <br />
                            </td>

                            <td>
                                <asp:TextBox ID="txtPhoneNumber1" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtPhoneNumber2" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtPhoneNumber3" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                                <br />
                                <br />
                            </td>
                        </tr>

                        <tr>
                            <td colspan="4" style="text-align: center;">
                                <br />
                                <br />
                                <asp:Button ID="btnSave" runat="server" Text="Submit" OnClick="btnSave_Click" Style="width: 30%;" CssClass="btn btn-warning form-control" />
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

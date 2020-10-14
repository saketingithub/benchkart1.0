<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create-Contract.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.Create_Contract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery.multifile.js"></script>

    <style>
        h1, h2, h3, h4, h5, h6 {
            text-transform: none;
            margin-top: 0;
        }

        h4 {
            font-size: medium;
            font-weight: normal;
            margin-top: 0px;
            line-height: 1;
        }

        h5 {
            font-weight: bold;
            color: gray;
            line-height: 1;
            margin-top: 15px;
        }
    </style>
    <script type="text/javascript">
        function ValidateCheckBox(sender, args) {
            if (document.getElementById("ContentPlaceHolder1_chkTerms").checked == true) {
                args.IsValid = true;
            } else {
                document.getElementById("ContentPlaceHolder1_lblTerms").style.display = "block";
                args.IsValid = false;
                return false;
            }
        }
    </script>
    <script>
        $(function () {
            $(".datepicker").datepicker();
            //$('#txtStartDate').attr('readonly', true);
            $(".datepicker").datepicker();
            //$('#txtEndDate').attr('readonly', true);
        });
        //window.onload = function () {
        //    document.getElementById("txtStartDate").name = "txt" + Math.random();
        //    document.getElementById("txtEndDate").name = "txt" + Math.random();
        //}
    </script>
    <script>
        $(document).ready(function () {
            document.getElementById('<%=txtProjectValue.ClientID %>').maxLength = "8";
            document.getElementById('<%=txtProjectDuration.ClientID %>').maxLength = "8";
        });
    </script>

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content" style="padding: 0px;">
        <!-- Card -->
        <div class="card" style="margin: 0 auto; background-color: White;">
            <div class="container" style="background-color: White; border-radius: 5px; width: 90%; margin: 0 auto; margin-top: 30px; padding: 20px 0px 20px 0px;">
                <div class="bidfield" style="margin-left: 20px;">
                    <h5>Project Value (INR)</h5>

                    <asp:TextBox runat="server" ID="txtProjectValue" class="form-control" Style="width: 200px; float: left;" MaxLength="8"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ID="reqtxtProjectValue" ForeColor="Red" ControlToValidate="txtProjectValue" ErrorMessage="Please enter project value!" />

                    <asp:RegularExpressionValidator ID="regtxtProjectValue" ValidationGroup="submit"
                        ControlToValidate="txtProjectValue"
                        ValidationExpression="\d+"
                        Display="Static"
                        EnableClientScript="true"
                        ErrorMessage="Please enter numbers only"
                        runat="server"
                        ForeColor="Red" />
                </div>
                <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                    <h5>Project Duration</h5>

                    <asp:TextBox runat="server" ID="txtProjectDuration" class="form-control" Style="width: 200px; float: left" MaxLength="6"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator runat="server" ID="reqtxtProjectDuration" ControlToValidate="txtProjectDuration" ErrorMessage="Please enter project duration!" />

                    <asp:RegularExpressionValidator ID="regtxtProjectDuration" ValidationGroup="submit"
                        ForeColor="Red"
                        ControlToValidate="txtProjectDuration"
                        ValidationExpression="\d+"
                        Display="Static"
                        EnableClientScript="true"
                        ErrorMessage="Please enter numbers only"
                        runat="server" />
                </div>
                <div class="bidfield" style="margin-left: 20px;">
                    <h5>Duration Type</h5>

                    <asp:DropDownList runat="server" ID="ddlProjectDurationType" class="form-control" Style="width: 100px; float: left">
                        <asp:ListItem Text="Days" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Weeks" Value="2" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Months" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="bidfield" style="margin-left: 20px; float: left; clear: left;">
                    <h5>Proposed Start Date</h5>

                    <asp:TextBox runat="server" ID="txtStartDate" CssClass="datepicker" class="form-control"></asp:TextBox>
                </div>
                <div class="bidfield" style="margin-left: 20px; float: left;">
                    <h5>Proposed End Date</h5>

                    <asp:TextBox runat="server" ID="txtEndDate" CssClass="datepicker" class="form-control"></asp:TextBox>
                </div>
                <div class="bidfield" style="clear: left; margin-left: 20px; margin-bottom: 20px; margin-top: 150px;">
                    <h5>Any Attachments</h5>

                    <asp:FileUpload ID="File1" runat="server" Width="100%" CssClass="multi" AllowMultiple="true" />
                </div>
                <div class="bidfield" style="margin-left: 20px; margin-bottom: 20px;">
                    <h5>
                        <asp:CheckBox runat="server" ID="chkTerms" Checked="true" />&nbsp;&nbsp;I Agree to the 
                                    <a href="../Policies/Projec-Agreement.html" target="_blank" style="color: blue; text-decoration: underline;">Terms of Project Agreement</a>
                    </h5>
                    <asp:Label runat="server" ID="lblTerms" Style="display: none; font-size: small;" ForeColor="Red" Text="Please check and agree to the Project Agreement"></asp:Label>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ClientValidationFunction="ValidateCheckBox"></asp:CustomValidator>
                </div>

                <asp:Button runat="server" ID="btnSubmitContract" Text="SUBMIT"
                    Style="height: 30px; font-weight: bold; margin-left: 20px; width: 50%; margin-bottom: 50px;" OnClick="btnSubmitContract_Click" />

            </div>
        </div>
    </div>
    </div>
    
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create-Payment-Request.aspx.cs"  MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.Create_Payment_Request" %>


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

        .checkbox label {
            padding-left: 5px;
        }
    </style>
   <%-- <script>
        $(function () {
            $("#txtPotentialPayDate").datepicker();
        });
    </script>--%>
     <script>
        $(document).ready(function () {
            document.getElementById('<%=txtPaymentAmount.ClientID %>').maxLength = "7";

        });
        </script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div id="content" style="padding: 0px;">
            <!-- Card -->
            <div class="card" style="margin: 0 auto; background-color: White;">
                <div class="container" style="background-color: White; border-radius: 5px; width: 90%; margin: 0 auto; margin-top: 30px; padding: 20px 0px 20px 0px;">
                    <div class="bidfield" style="margin-left: 20px;">
                        <h5>Amount (INR)</h5>

                        <asp:TextBox runat="server" ID="txtPaymentAmount" class="form-control" Style="width: 200px; float: left;" MaxLength="6"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ID="reqtxtPaymentAmount" ForeColor="Red" ControlToValidate="txtPaymentAmount"
                            ErrorMessage="Please enter amount!" />
                          <asp:RangeValidator ID="rgvtxtPaymentAmount"  runat="server" MinimumValue="1" MaximumValue="500000" 
                                ControlToValidate="txtPaymentAmount" ForeColor="red" ErrorMessage="Maximum value 500000 and Minimum value 1"></asp:RangeValidator>
                        <asp:RegularExpressionValidator ID="regtxtPaymentAmount"
                            ControlToValidate="txtPaymentAmount"
                            ValidationExpression="\d+"
                            Display="Static"
                            EnableClientScript="true"
                            ErrorMessage="Please enter numbers only"
                            runat="server"
                            ForeColor="Red" />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Delivery Remarks</h5>
                        <div class="row">
                            <div class="col-sm-6">
                                <asp:TextBox runat="server" ID="txtRemarks" class="form-control" Style="float: left" TextMode="MultiLine" Height="100px"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                            </div>
                        </div>
                        <br />
                    </div>

                    <%--<div class="bidfield" style="margin-left: 20px; float: left; clear: left;">
                        <h5>Potential Pay Date</h5>

                        <asp:TextBox runat="server" ID="txtPotentialPayDate" class="form-control"></asp:TextBox>
                    </div>--%>

                   

                    <div class="bidfield" style="clear: left; margin-left: 20px; margin-bottom: 50px; margin-top: 30px;">
                        <h5>Any Attachments</h5>

                        <asp:FileUpload ID="File1" runat="server" Width="100%" CssClass="multi" AllowMultiple="true"  />
                    </div>
                    <div>
                        <asp:Button runat="server" ID="btnRequestPayment" Text="Send Payment Request" Style="height: 30px; font-weight: bold; margin-left: 20px; width: 50%; margin-bottom: 50px;" OnClick="btnRequestPayment_Click" />

                    </div>
                </div>
            </div>
        </div>
   
</asp:Content>

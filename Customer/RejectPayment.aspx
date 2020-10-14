<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RejectPayment.aspx.cs" MasterPageFile="~/Customer/Site1.Master" Inherits="Benchkart.Customer.RejectPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery.multifile.js"></script>

    <style>
        h1, h2, h3, h4, h5, h6 {
            text-transform: none;
            margin-top: 0;
        }
        /*.label {
            font-size: medium;
            font-weight: normal;
            margin-top: 0px;
            line-height: 1.5;
            color: gray;
            margin-left: 0px;
            word-break: break-all;
            display: inline-flex;
            white-space: pre-wrap;
            text-align: left; 
        }*/
        .label {
            font-size: medium;
            font-weight: normal;
            margin-top: 0px;
            line-height: 2;
            color: black;
            margin-left: 0px;
            text-align: left;
            padding: 0px;
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
    

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div id="content" style="padding: 0px;">
            <!-- Card -->
            <div class="card" style="margin: 0 auto; background-color: White;">
                <div class="container" style="background-color: White; border-radius: 5px; width: 90%; margin: 0 auto; margin-top: 30px; padding: 20px 0px 20px 0px;">
                    <h3>Reject Payment</h3>
                    <asp:HiddenField ID="hfPaymentRequestId" runat="server" />
                    <div class="bidfield" style="margin-left: 20px;">
                        <h5>Amount (INR)</h5>

                        <asp:Label runat="server" ID="lblPaymentAmount" Style="width: 200px; float: left;"></asp:Label><br />

                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Date</h5>
                        <asp:Label runat="server" ID="lblDate" Style="float: left"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Agency Name</h5>
                        <asp:Label runat="server" ID="lblCompanyName" Style="float: left"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Delivery Remarks</h5>
                        <asp:Label runat="server" ID="lblRemarks" Style="float: left" CssClass="label"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Rejection Reason</h5>
                        <div class="row">
                            <div class="col-sm-6">
                                <asp:TextBox runat="server" class="form-control" ID="txtRejectionReason" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ValidationGroup="Reject" ID="reqtxtRejectionReason"
                                    ControlToValidate="txtRejectionReason" ErrorMessage="Please fill rejection reason" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-6">
                            </div>
                        </div>
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" ValidationGroup="Reject" Text="Submit"  style="width: 50%; height: 35px;"/>
                    </div>
                </div>
            </div>
        </div>
 
 </asp:Content>

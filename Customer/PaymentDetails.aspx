<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentDetails.aspx.cs" MasterPageFile="~/Customer/Site1.Master" Inherits="Benchkart.Customer.PaymentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery.multifile.js"></script>

    <style>
        h1, h2, h3, h4, h5, h6 {
            text-transform: none;
            margin-top: 0;
        }
        /*.label{
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
            margin-top: 8px;
            margin-left: 12px;
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
            margin-top: 8px;
            float: left;
        }

        /*span {
            margin-top: 12px;
            margin-left: 20px;
            font-weight: normal;
            font-size: medium;
        }*/

        .container {
            background-color: White;
            border-radius: 5px;
            width: 90%;
            margin: 0 auto;
            margin-top: 30px;
            padding: 20px 0px;
        }

        @media (max-width: 799px) {
            .container {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content" style="padding: 0px;">
        <!-- Card -->
        <div class="card" style="margin: 0 auto; background-color: White;">
            <div class="container">
                <%--  <asp:HiddenField runat="server" ID="hfPaymentRequestId" />--%>
                <h3 style="text-align: center; font-weight: bold; color: gray;">Payment Details</h3>
                <div class="bidfield" style="margin-left: 20px;">
                    <h5>Amount (INR):</h5>

                    <asp:Label runat="server" ID="lblPaymentAmount" CssClass="label" Style="width: 200px;"></asp:Label><br />

                </div>
                <div class="bidfield" style="margin-left: 20px; clear: left;">
                    <h5>Date Requested:</h5>
                    <asp:Label runat="server" ID="lblDate" CssClass="label"></asp:Label>
                    <br />
                </div>
                <div class="bidfield" style="margin-left: 20px; clear: left;">
                    <h5>Remarks:</h5>
                    <asp:Label runat="server" ID="lblLastRemarks" CssClass="label"></asp:Label>
                    <br />
                </div>
                <asp:Panel runat="server" ID="pnlProjectReopenPaymentReleased" Visible="false" Style="margin-top: 75px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Status:</h5>
                        <asp:Label runat="server" ID="lblProjectReopenPaymentReleasedStatus" CssClass="label" Text="Payment Released & Project Not Closed by Customer"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Date:</h5>
                        <asp:Label runat="server" ID="lblProjectReopenPaymentReleasedDate" CssClass="label"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Remarks:</h5>
                        <asp:Label runat="server" ID="lblProjectReopenPaymentReleasedRemarks" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlProjectClosedPaymentReleased" Visible="false" Style="margin-top: 75px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Status:</h5>
                        <asp:Label runat="server" ID="lblProjectClosedPaymentReleasedStatus" CssClass="label" Text="Payment Released & Project Closed by Customer"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Date:</h5>
                        <asp:Label runat="server" ID="lblProjectClosedPaymentReleasedDate" CssClass="label"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Remarks:</h5>
                        <asp:Label runat="server" ID="lblProjectClosedPaymentReleasedRemarks" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlFinalPaymentReleaseRequest" Visible="false" Style="margin-top: 75px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Status:</h5>
                        <asp:Label runat="server" ID="lblFinalPaymentReleaseRequestStatus" CssClass="label" Text="Release Payment Request & Project Closed by Agency"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Date:</h5>
                        <asp:Label runat="server" ID="lblFinalPaymentReleaseRequestDate" CssClass="label"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Remarks:</h5>
                        <asp:Label runat="server" ID="lblFinalPaymentReleaseRequestRemarks" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlPaymentReleased" Visible="false" Style="margin-top: 75px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Status:</h5>
                        <asp:Label runat="server" ID="lblPaymentReleasedStatus" CssClass="label" Text="Payment Released by Customer"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Date:</h5>
                        <asp:Label runat="server" ID="lblPaymentReleasedDate" CssClass="label"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Remarks:</h5>
                        <asp:Label runat="server" ID="lblPaymentReleasedRemarks" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlPaymentReleaseRequest" Visible="false" Style="margin-top: 75px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Status:</h5>
                        <asp:Label runat="server" ID="lblPaymentReleaseRequestStatus" CssClass="label" Text="Payment Release Request by Agency"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Date:</h5>
                        <asp:Label runat="server" ID="lblPaymentReleaseRequestDate" CssClass="label"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Remarks:</h5>
                        <asp:Label runat="server" ID="lblPaymentReleaseRequestRemarks" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlPaymentMade" Visible="false" Style="margin-top: 75px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Status:</h5>
                        <asp:Label runat="server" ID="lblPaymentMadeStatus" CssClass="label" Text="Payment Made Successfuly by Customer"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Date:</h5>
                        <asp:Label runat="server" ID="lblPaymentMadeDate" CssClass="label"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Remarks:</h5>
                        <asp:Label runat="server" ID="lblPaymentMadeRemarks" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlRejected" Visible="false" Style="margin-top: 75px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Status:</h5>
                        <asp:Label runat="server" ID="lblRejectedStatus" CssClass="label" Text="Payment Rejected by Customer"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Date:</h5>
                        <asp:Label runat="server" ID="lblRejectedDate" CssClass="label"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Remarks:</h5>
                        <asp:Label runat="server" ID="lblRejectedRemarks" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlRequested" Visible="false" Style="margin-top: 75px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Status:</h5>
                        <asp:Label runat="server" ID="lblRequestedStatus" CssClass="label" Text="Payment Requested by Agency"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Date:</h5>
                        <asp:Label runat="server" ID="lblRequestedDate" CssClass="label"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left;">
                        <h5>Remarks:</h5>
                        <asp:Label runat="server" ID="lblRequestedRemarks" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

</asp:Content>


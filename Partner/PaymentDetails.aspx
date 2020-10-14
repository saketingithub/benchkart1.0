<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentDetails.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.PaymentDetails" %>

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


        h2 {
            font-size: 24px;
            margin-left: 20px;
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
            float: left;
        }

        span {
            margin-top: 10px;
            font-weight: normal;
            margin-left: 20px;
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content" style="padding: 0px;">
        <!-- Card -->
        <div class="card" style="margin: 0 auto; background-color: White;">
            <div class="container" style="background-color: White; border-radius: 5px; width: 90%; margin: 0 auto; margin-top: 30px; padding: 20px 0px;">
                <%--  <asp:HiddenField runat="server" ID="hfPaymentRequestId" />--%>
                <h2>Payment Details</h2>
                <div class="bidfield" style="margin-left: 20px;">
                    <h5>Amount (INR)</h5>

                    <asp:Label runat="server" ID="lblPaymentAmount" Style="width: 200px; float: left;"></asp:Label><br />

                </div>
                <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                    <h5>Date Requested</h5>
                    <asp:Label runat="server" ID="lblDate" Style="float: left"></asp:Label>
                    <br />
                </div>
                <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                    <h5>Delivery Remarks</h5>
                    <asp:Label runat="server" ID="lblLastRemarks" Style="float: left" CssClass="label"></asp:Label>
                    <br />
                </div>
                <asp:Panel runat="server" ID="pnlProjectReopenPaymentReleased" Visible="false" Style="margin-top: 50px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Status</h5>
                        <asp:Label runat="server" ID="lblProjectReopenPaymentReleasedStatus" Text="Payment Released & Project Not Closed by Customer" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Date:</h5>
                        <asp:Label runat="server" ID="lblProjectReopenPaymentReleasedDate" Style="float: left"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Remarks</h5>
                        <asp:Label runat="server" ID="lblProjectReopenPaymentReleasedRemarks" CssClass="label" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlProjectClosedPaymentReleased" Visible="false" Style="margin-top: 50px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Status</h5>
                        <asp:Label runat="server" ID="lblProjectClosedPaymentReleasedStatus" Text="Payment Released & Project Closed by Customer" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Date</h5>
                        <asp:Label runat="server" ID="lblProjectClosedPaymentReleasedDate" Style="float: left"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Remarks</h5>
                        <asp:Label runat="server" ID="lblProjectClosedPaymentReleasedRemarks" CssClass="label" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlFinalPaymentReleaseRequest" Visible="false" Style="margin-top: 50px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Status</h5>
                        <asp:Label runat="server" ID="lblFinalPaymentReleaseRequestStatus" Text="Release Payment Request & Project Closed by Agency" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Date</h5>
                        <asp:Label runat="server" ID="lblFinalPaymentReleaseRequestDate" Style="float: left"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Remarks</h5>
                        <asp:Label runat="server" ID="lblFinalPaymentReleaseRequestRemarks" CssClass="label" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlPaymentReleased" Visible="false" Style="margin-top: 50px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Status</h5>
                        <asp:Label runat="server" ID="lblPaymentReleasedStatus" Text="Payment Released by Customer" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Date</h5>
                        <asp:Label runat="server" ID="lblPaymentReleasedDate" Style="float: left"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Remarks</h5>
                        <asp:Label runat="server" ID="lblPaymentReleasedRemarks" CssClass="label" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlPaymentReleaseRequest" Visible="false" Style="margin-top: 50px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Status</h5>
                        <asp:Label runat="server" ID="lblPaymentReleaseRequestStatus" Text="Payment Release Request by Agency" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Date</h5>
                        <asp:Label runat="server" ID="lblPaymentReleaseRequestDate" Style="float: left"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Remarks</h5>
                        <asp:Label runat="server" ID="lblPaymentReleaseRequestRemarks" CssClass="label" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlPaymentMade" Visible="false" Style="margin-top: 50px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Status</h5>
                        <asp:Label runat="server" ID="lblPaymentMadeStatus" Text="Payment Made Successfuly by Customer" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Date</h5>
                        <asp:Label runat="server" ID="lblPaymentMadeDate" Style="float: left"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Remarks</h5>
                        <asp:Label runat="server" ID="lblPaymentMadeRemarks" Style="float: left;" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlRejected" Visible="false" Style="margin-top: 50px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Status</h5>
                        <asp:Label runat="server" ID="lblRejectedStatus" Text="Payment Rejected by Customer" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Date</h5>
                        <asp:Label runat="server" ID="lblRejectedDate" Style="float: left"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Remarks</h5>
                        <asp:Label runat="server" ID="lblRejectedRemarks" Style="float: left;" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlRequested" Visible="false" Style="margin-top: 50px;">
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Status</h5>
                        <asp:Label runat="server" ID="lblRequestedStatus" Text="Payment Requested by Agency" Style="float: left;"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Date</h5>
                        <asp:Label runat="server" ID="lblRequestedDate" Style="float: left"></asp:Label>
                        <br />
                    </div>
                    <div class="bidfield" style="margin-left: 20px; clear: left; margin-top: 20px;">
                        <h5>Remarks</h5>
                        <asp:Label runat="server" ID="lblRequestedRemarks" Style="float: left;" CssClass="label"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>

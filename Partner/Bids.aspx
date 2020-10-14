<%@ Page Language="C#" Title="Partner Bids List" AutoEventWireup="true" CodeBehind="Bids.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.Bids" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
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

  </style>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Page Content  -->
        <div id="content" style="padding: 0px;">
            <asp:Panel ID="pnlSearchingProjects" runat="server" Visible="false" Style="text-align: center; height: 200px; margin: 0 auto; padding: 20px;">
                <h2 style="margin-top: 100px;">Right now there are no bids made by you.
                   </h2>
            </asp:Panel>
            <div>
                <asp:ListView ID="rptBids" runat="server">
                    <ItemTemplate>
                        <!-- Card -->
                        <div class="card" style="margin: 0 auto; background-color: White; margin-top: 50px;">
                            <div class="row" style="margin: 0 auto; background-color: #f1f1f1; border: 1px solid lightgray;">
                                <div class="col-sm-12" style="text-align: left; padding: 15px 30px;">
                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title")%>' Style="font-weight: bold; font-size: large; margin-left: 20px; color: #212529;"></asp:Label>

                                </div>
                            </div>
                            <div class="container" style="background-color: White; border-radius: 5px; width: 100%; margin: 0 auto; padding: 10px 50px 30px 50px;">
                                <div class="row" style="position: relative;">
                                    <div class="col-sm-12">
                                        <asp:Label ID="lblDate" runat="server" Text='<%# "Project Date: " + Eval("ProjectDate", "{0: dd/MM/yyyy}")%>'></asp:Label>
                                    </div>
                                </div>
                                <div class="row fields" style="padding-top: 0px;">
                                    <div class="col-sm-12">
                                        <div class="bidfield">
                                            <h5>Estimation</h5>
                                        </div>
                                        <div>
                                            <h4>
                                                <asp:Label ID="lblDescription" CssClass="label" runat="server" Style="line-height: 1.7;" Text='<%# Eval("ExecutionRemarks").ToString().Length <= 100 ? Eval("ExecutionRemarks") : Eval("ExecutionRemarks").ToString().Substring(0,
                        100)+"..." %>'></asp:Label></h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="row fields">
                                    <div class="col-sm-4">
                                        <div class="bidfield">
                                            <h5>Bid Amount (INR)</h5>
                                        </div>
                                        <div>
                                            <h4>
                                                <asp:Label ID="lblBidamount" runat="server" Text='<%# Eval("BidAmount")%>'></asp:Label></h4>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="bidfield">
                                            <h5>Bid Date</h5>
                                        </div>
                                        <div>
                                            <h4>
                                                <asp:Label ID="lblBiddingDate" runat="server" Text='<%# Eval("BiddingDate", "{0: dd/MM/yyyy}")%>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="bidfield">
                                            <h5>Bid Status</h5>
                                        </div>
                                        <div>
                                            <h4>
                                                <asp:Label ID="lblCompanyIndustry" Text=' <%#Eval("BidStatus").ToString() == "2" ? "Bid Accepted by Customer" : Eval("BidStatus").ToString() == "1" ? "Bid Approved" : "Bid Submitted"  %>' runat="server" /></h4>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row" style="margin-top: 30px;">                                    
                                    <div class="col-sm-12">
                                        <asp:HyperLink ID="btnBid" Text="View Details" runat="server" Style="font-size: Medium; font-weight: bold; padding: 10px 20px; border-radius: 3px; color: white; background-color: #18D26E;"
                                            NavigateUrl='<%# String.Format("~/Partner/Bid-Details?id={0}", DataBinder.Eval(Container.DataItem, "BidId")) %>'></asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                
            </div>
        </div>
    </asp:Content>

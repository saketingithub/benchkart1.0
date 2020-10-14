<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects_Dashboard.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.Projects_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        h1, h2, h3, h4, h5, h6 {
            text-transform: none;
            margin-top: 0;
        }

        h4 {
            font-size: 1.2em;
            font-weight: normal;
            margin-top: 0px;
            line-height: 1;
        }

        h5 {
            font-weight: bold;
            color: gray;
            line-height: 1;
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

    </style>
    <style>
        .tblBids {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

            .tblBids td, #tblBids th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            /*.tblBids tr:nth-child(even) {
                background-color: #f2f2f2;
            }*/

            .tblBids tr:hover {
                background-color: #ddd;
            }

            .tblBids th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: Gray;
                color: white;
            }

        .nav > li > a {
            color: white;
            font-size: small;
        }

        .row {
            margin-top: 7px;
            margin-bottom: 7px;
        }
    </style>
    <style>
        @media (max-width: 799px) {
            .nav > li > a {
                padding: 4px;
                font-size: .8em;
            }           
        }
    </style>

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">--%>
    <!-- Page Content  -->
    <div id="content" style="padding: 0px;">

        <asp:Panel ID="pnlSearchingProjects" runat="server" Visible="false" Style="text-align: center; height: 200px; margin: 0 auto; padding: 20px;">
            <h2 style="margin-top: 100px;">Only those projects will be displayed here for which your bid is selected.</h2>
        </asp:Panel>
        <div style="margin-bottom: 70px;">

            <asp:ListView ID="lstProjects" runat="server" OnItemDataBound="lstProjects_ItemDataBound" OnItemCommand="lstProjects_ItemCommand">
                <ItemTemplate>
                    <!-- Card -->
                    <div class="card" style="margin: 0 auto; background-color: White; margin-top: 40px;">
                        <ul class="nav nav-tabs" style="background-color: #212529; border-radius: 5px;">
                            <li class="active"><a data-toggle="tab" href="#home<%=cLine%>"><i class="fa fa-cog fa-2x"></i>
                                <br />
                                Project</a></li>
                            <li><a data-toggle="tab" href="#menu1<%=cLine%>"><i class="fa fa-tasks fa-2x"></i>
                                <br />
                                Bid</a></li>
                            <li><a data-toggle="tab" href="#menu2<%=cLine%>"><i class="fa fa-pencil-square-o fa-2x"></i>
                                <br />
                                Contract</a></li>
                            <li><a data-toggle="tab" href="#menu3<%=cLine%>"><i class="fa fa-money fa-2x"></i>
                                <br />
                                Delivery</a></li>
                        </ul>
                        <div class="container" style="padding: 15px; background-color: White; border-radius: 5px; margin: 0 auto; padding: 20px; width: 100%; min-height: 250px;">
                            <div class="tab-content" style="padding: 10px;">
                                <div id="home<%=cLine%>" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-sm-12" style="text-align: left; margin-top: 15px;">
                                            <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title")%>' Style="font-weight: bold; font-size: large; color: gray; text-align: left; margin-right: 30px;"></asp:Label>
                                            <h6>
                                                <asp:HyperLink ID="hplViewProjectDetails" runat="server" NavigateUrl='<%# Eval("BidId","~/Partner/Bid-Details?id={0}") %>' Style="text-decoration: underline; margin-top: 3px; color: gray; float: left;">View Project Details</asp:HyperLink></h6>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 5px;">
                                        <div class="col-sm-12" style="text-align: left;">
                                            <h6>
                                                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("CreationDate", "{0: dd/MM/yyyy}")%>'></asp:Label></h6>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 5px;">
                                        <div class="col-sm-12" style="text-align: left;">
                                            <h5 style="float: left;">Customer Company Name :&nbsp;&nbsp;</h5>
                                            <h4>
                                                <asp:Label ID="lblCustomerCompanyName" runat="server" Text='<%# Eval("CompanyName")%>'></asp:Label></h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="bidfield" style="">
                                                <h5 style="float: left; margin-top: 5px;">Status :&nbsp;&nbsp;</h5>
                                                <h4>
                                                    <asp:Label ID="lblStatus" Style="line-height: 1.5;" runat="server" Text='<%# SetProjectStatus(Convert.ToInt32(Eval("Status"))) %>'></asp:Label></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 style="float: left; margin-top: 5px;">Description :&nbsp;&nbsp;</h5>
                                            <h4>
                                                <asp:Label ID="lblDescription" Style="line-height: 1.5;" runat="server" Text=' <%# Eval("Description").ToString().Length <= 200 ? Eval("Description") : Eval("Description").ToString().Substring(0,200)+"..." %>'></asp:Label></h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:HyperLink ID="LinkButton1" runat="server" NavigateUrl='<%# Eval("ProjectId","~/Partner/Partner_Review?ID={0}") %>'
                                                Visible='<%#Convert.ToInt32(Eval("Status").ToString()) ==9? true:Convert.ToInt32(Eval("Status").ToString()) ==8? true : false %>' Text="Review Project"
                                                Style="margin-bottom: 20px; margin-bottom: 20px; font-size: medium; background-color: #F79507; padding: 5px 20px; border-radius: 5px; color: white;"></asp:HyperLink>
                                        </div>
                                    </div>
                                </div>

                                <div id="menu1<%=cLine%>" class="tab-pane fade">
                                    <asp:Panel runat="server" Style="margin-top: 20px;" ID="pnlBids" Visible='<%# Convert.ToInt32(Eval("Status"))  > 1? true : false %>'>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="bidfield" style="">
                                                    <h5 style="float: left;">Bid Amount :&nbsp;&nbsp;</h5>
                                                    <h4>
                                                        <asp:Label ID="lblBidAmount" runat="server" Text='<%# Eval("BidAmount").ToString() + " INR "%>'></asp:Label></h4>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="bidfield" style="">
                                                    <h5 style="float: left;">Date :&nbsp;&nbsp;</h5>
                                                    <h4>
                                                        <asp:Label ID="lblBidDate" runat="server" Text='<%# Eval("CreationDate", "{0:MMMM d, yyyy}").ToString()%>'></asp:Label></h4>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h5 style="float: left; margin-top: 5px;">Estimation :&nbsp;&nbsp;</h5>
                                                <h4>
                                                    <asp:Label ID="Label1" Style="line-height: 1.5;" runat="server" Text=' <%# Eval("ExecutionRemarks").ToString().Length <= 200 ? Eval("ExecutionRemarks") : Eval("ExecutionRemarks").ToString().Substring(0,200)+"..." %>'></asp:Label></h4>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:HiddenField ID="hfProjectId" runat="server" Value='<%# Eval("ProjectId") %>' />
                                </div>

                                <div id="menu2<%=cLine%>" class="tab-pane fade">
                                    <%-- <asp:Label ID="lblSentBack" runat="server" Visible='<%# Convert.ToInt32(Eval("ContractCount"))  > 0? false : true %>' Text="Agency will respond with final contract. For any query email to outsource@benchkart.com"></asp:Label>--%>
                                    <asp:Panel runat="server" Style="margin-top: 20px;" ID="pnlContract" Visible='<%# Convert.ToInt32(Eval("Status"))  > 3? true : false %>'>
                                        <asp:HiddenField ID="hfContractId" runat="server" Value='<%# Eval("ContractId") %>' />
                                        <div class="row" style="position: relative; margin-bottom: 20px; margin-top: 20px;">
                                            <div class="col-sm-6">

                                                <h5 style="float: left;">Project Value (INR) :&nbsp;&nbsp;</h5>
                                                <h4>
                                                    <asp:Label ID="lblProjectValue" runat="server" Text='<%# Eval("ProjectValue").ToString()%>'></asp:Label></h4>

                                            </div>
                                            <div class="col-sm-6">
                                                <h5 style="float: left;">Duration :&nbsp;&nbsp;</h5>
                                                <h4>
                                                    <asp:Label ID="lblDuration" runat="server" Text='<%# Eval("Duration").ToString() +"  " + Eval("DurationType").ToString()%>'></asp:Label></h4>

                                            </div>
                                        </div>
                                        <div class="row" style="position: relative; margin-top: 10px;">
                                            <div class="col-sm-6">
                                                <h5 style="float: left;">Start Date :&nbsp;&nbsp;</h5>
                                                <h4>
                                                    <asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("StartDate", "{0: dd/MM/yyyy}")%>'></asp:Label></h4>

                                            </div>
                                            <div class="col-sm-6">
                                                <h5 style="float: left;">End Date :&nbsp;&nbsp;</h5>
                                                <h4>
                                                    <asp:Label ID="lblEndDate" runat="server" Text='<%# Eval("EndDate", "{0: dd/MM/yyyy}")%>'></asp:Label></h4>
                                            </div>

                                        </div>

                                        <div class="row" style="position: relative; margin-top: 10px;">
                                            <div class="col-sm-6">
                                                <asp:Panel ID="pnlContractAttachments" runat="server"></asp:Panel>
                                            </div>

                                        </div>
                                    </asp:Panel>

                                    <asp:Panel ID="pnlClientInfo" runat="server" Visible='<%# Convert.ToInt32(Eval("Status"))  > 2? true : false %>'>
                                        <h4>Client Contact Details</h4>
                                        <div class="row" style="position: relative; margin-bottom: 20px; margin-top: 20px;">
                                            <div class="col-sm-6">
                                                <h5 style="float: left;">Name :&nbsp;&nbsp;</h5>
                                                <h4>
                                                    <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("FullName").ToString()%>'></asp:Label></h4>

                                            </div>
                                            <div class="col-sm-6">
                                                <h5 style="float: left;">Contact Number :&nbsp;&nbsp;</h5>
                                                <h4>
                                                    <asp:Label ID="lblContactNumber" runat="server" Text='<%# Eval("ContactNumber").ToString() %>'></asp:Label></h4>

                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:Label runat="server" ID="lblContractSent" Style="margin-bottom: 20px;" Text="Contract Sent! Waiting for Customer Approval."
                                                Visible='<%# Convert.ToInt32(Eval("Status"))  == 4? true : false %>'></asp:Label>
                                            <asp:Label Style="font-weight: bold; margin-bottom: 20px; display: block;" runat="server" ID="lblResend"
                                                Text="Contract Not Approved by Customer. Please Discuss and Re-send New Contract."
                                                Visible='<%# Convert.ToInt32(Eval("Status"))  == 11? true : false %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <asp:HyperLink ID="hplCreateContract" runat="server" Style="margin-bottom: 20px; margin-bottom: 20px; font-size: medium; background-color: #F79507; padding: 5px 20px; border-radius: 5px; color: white;"
                                                Visible='<%# Convert.ToInt32(Eval("Status"))  == 3? true : false %>'
                                                NavigateUrl='<%# Eval("BidId","~/Partner/Create-Contract?ID={0}") %>' Text="Create & Send Contract"></asp:HyperLink>
                                            <asp:Label runat="server" ID="lblCreateContract" Style="font-size: medium; margin-top: 20px;"
                                                Text="Send Contract & Milestones to Customer for Approval"
                                                Visible='<%# Convert.ToInt32(Eval("Status"))  == 3? true : false %>'></asp:Label>

                                        </div>
                                        <div class="col-lg-6">

                                            <asp:HyperLink ID="hplResendContract" runat="server" Style="margin-bottom: 20px; font-size: medium; background-color: #F79507; padding: 5px 20px; border-radius: 5px; color: white;"
                                                Visible='<%# Convert.ToInt32(Eval("Status"))  == 11? true : false %>'
                                                NavigateUrl='<%# Eval("BidId","~/Partner/Create-Contract?ID={0}") %>' Text="Re-send Contract with Milestones"></asp:HyperLink>
                                        </div>
                                    </div>
                                </div>
                                <%-- <asp:Label runat="server" ID="lbl" Text="Contract Approved"
                                        Visible='<%# Convert.ToInt32(Eval("Status"))  == 5? true : false %>'></asp:Label><br />--%>
                                <div id="menu3<%=cLine%>" class="tab-pane fade">
                                    <asp:HyperLink ID="hplPaymentRequest" runat="server" Style="padding: 7px 15px 7px 15px; margin-top: 15px; margin-bottom: 15px; background-color: #F79507; border-radius: 3px; color: white;"
                                        Visible='<%# Convert.ToInt32(Eval("Status"))  == 5? true : Convert.ToInt32(Eval("Status"))  == 6? true: Convert.ToInt32(Eval("Status"))  == 7? true : false %>'
                                        NavigateUrl='<%# Eval("ProjectId","~/Partner/Create-Payment-Request?ID={0}") %>' Text="Create Payment Request"></asp:HyperLink>
                                    <asp:ListView runat="server" ID="lstPayments" OnItemDataBound="lstPayments_ItemDataBound">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfPaymentRequestId" runat="server" Value='<%# Eval("PaymentRequestId") %>' />
                                            <div class="container" style="padding: 15px; background-color: #f8f8f8; border: 1px solid gray; border-radius: 5px; width: 100%; margin: 0 auto; margin-top: 20px;">
                                                <div class="row" style="position: relative; padding: 10px;">
                                                    <div class="col-sm-4">
                                                        Amount (INR): 
                                                        <asp:Label ID="lblPaymentAmount" Text='<%# Eval("PaymentAmount") %>' runat="server" />
                                                    </div>
                                                    <div class="col-sm-4">
                                                        Date: 
                                                         <asp:Label ID="lblPaymentRequestedDate" Text='<%# Eval("StatusUpdateDate", "{0: dd/MM/yyyy}") %>' runat="server" /></td>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        Attachments: 
                                                         <asp:Panel ID="pnlAttachments" runat="server"></asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row" style="position: relative; padding: 10px;">
                                                    <div class="col-sm-12">
                                                        Remarks:
                                                         <asp:Label ID="lblCustomerRequestRemarks" Text='<%# Eval("LastRemark") %>' runat="server" />
                                                    </div>
                                                </div>
                                                <div class="row" style="position: relative; padding: 10px;">
                                                    <div class="col-sm-6">
                                                        <asp:Label ID="lblPaymentRequested" runat="server" Style="margin-bottom: 10px; color: black;" Text="Status: Payment Requested" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 1? true : false %>' />
                                                        <asp:Label ID="lblPaymentRejected" runat="server" Style="margin-bottom: 10px; color: black;" Text="Status:  Payment Request Rejected" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 2? true : false %>' />
                                                        <asp:Label ID="lblPaymentSubmitted" runat="server" Style="margin-bottom: 10px; color: black;" Text="Status:  Payment Submitted by Customer" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 3? true : false %>' />
                                                        <asp:Label ID="lblReleaseReuestSent" runat="server" Style="margin-bottom: 10px; color: black;" Text="Status: Payment Release Requested" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 4? true : false %>' />
                                                        <asp:Label ID="lblPaymentReleased" runat="server" Style="margin-bottom: 10px; color: black;" Text="Status: Payment Released by Customer" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 5? true : false %>' />
                                                        <asp:HyperLink ID="hplView" Style="margin-bottom: 10px; margin-left: 20px; margin-top: 15px; text-decoration: underline; color: blue;" runat="server" NavigateUrl='<%# Eval("PaymentRequestId","~/Partner/PaymentDetails?PaymentRequestId={0}") %>'>View Details</asp:HyperLink>

                                                    </div>
                                                    <div class="col-sm-6" style="text-align: center; padding: 0px; margin-top: 10px;">
                                                        <asp:HyperLink ID="btnReleasePayment" Style="margin-bottom: 10px; padding: 5px 7px 5px 7px; font-size: small; background-color: #F79507; border-radius: 3px; color: white;" runat="server" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 3? true : false %>' Text="Send Payment Release Request" NavigateUrl='<%# Eval("PaymentRequestId","~/Partner/ReleasePayment?PaymentRequestId={0}") %>'></asp:HyperLink>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                            <%--<br />
                                <br />
                                <asp:LinkButton ID="lkbCloseProject" runat="server" CommandArgument='<%#Eval("ProjectId") %>' CommandName="status"
                                    Visible='<%#Convert.ToInt32(Eval("Status").ToString()) == 6 ? true:false %>' Text="Close Project"
                                    Style="margin-left: 10%;"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%# Eval("ProjectId","~/Partner/Partner_Review?ID={0}") %>'
                                    Visible='<%#Convert.ToInt32(Eval("Status").ToString()) ==9? true:false %>' Text="Review Project"
                                    Style="margin-left: 70%;"></asp:LinkButton>--%>
                        </div>
                    </div>
                    <%cLine++;%>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <%--</asp:content>--%>
</asp:Content>

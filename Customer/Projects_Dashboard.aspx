<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects_Dashboard.aspx.cs" MasterPageFile="~/Customer/Site1.Master" Inherits="Benchkart.Customer.Projects_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            background-color: white;
            border-radius: 5px;
            margin: 0 auto;
            padding: 20px;
            width: 100%;
            min-height: 250px;
        }

        /*.bidfield
        {
            font-size: medium;
            color: gray;
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

        @media (max-width: 799px) {
            .nav > li > a {
                padding: 4px;
                font-size: .8em;
            }

            .container {
                width: 95%;
                padding: 15px 0px;
                min-height: 200px;
            }

            #content {
                padding: 5px;
            }

            .col-sm-9 {
                padding-right: 0px;
                padding-left: 0px;
            }
        }
    </style>

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
            line-height: 2;
            margin-top: 2px;
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

        .bidaction {
            text-align: center;
            margin-top: 30px;
        }
    </style>
 
    
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <%--<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">--%>
    <!-- Page Content  -->
    <%-- <div id="content" style="padding: 0px;">--%>
    
   
    <div id="content">
        <div class="row" style="margin: 5px;">
            <div class="col-sm-3">
                <div class="info-box">
                    <span class="info-box-icon bg-info elevation-1"><i class="fa fa-paper-plane fa-2x" style="color: white;"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Projects Posted</span>
                        <span class="info-box-number">
                            <asp:Label runat="server" ID="lblprojectsCount"></asp:Label>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-sm-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-danger elevation-1"><i class="fa fa-gavel fa-2x" style="color: white;"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Bids</span>
                        <span class="info-box-number">
                            <asp:Label runat="server" ID="lblbidsCount"></asp:Label>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-sm-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-success elevation-1"><i class="fa fa-play fa-2x" style="color: white;"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Deliveries</span>
                        <span class="info-box-number">
                            <asp:Label runat="server" ID="lblprojectsRunningCount"></asp:Label>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-sm-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-warning elevation-1"><i class="fa fa-check fa-2x" style="color: white;"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Deliveries Completed</span>
                        <span class="info-box-number">
                            <asp:Label runat="server" ID="lblprojectsClosedCount"></asp:Label>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
        </div>
        <asp:Panel ID="pnlSearchingProjects" runat="server" Visible="false" Style="text-align: center; height: 200px; margin: 0 auto; padding: 20px">
            <h2 style="margin-top: 100px;">Post a Project as per Your Requirement.
            </h2>
        </asp:Panel>
        <div style="margin-bottom: 70px;">

            <asp:ListView ID="lstProjects" runat="server" DataKeyNames="ProjectId" OnItemDataBound="lstProjects_ItemDataBound"
                OnItemCommand="lstProjects_ItemCommand">
                <ItemTemplate>
                    <!-- Card -->
                    <div class="card" style="margin: 0 auto; background-color: White; margin-top: 40px;">
                        <ul class="nav nav-tabs" style="background-color: #212529; border-radius: 5px;">
                            <li class="active"><a data-toggle="tab" href="#home<%=cLine%>"><i class="fa fa-cog fa-2x"></i>
                                <br />
                                Project</a></li>
                            <li><a data-toggle="tab" href="#menu1<%=cLine%>"><i class="fa fa-tasks fa-2x"></i>
                                <br />
                                Bids</a></li>
                            <li><a data-toggle="tab" href="#menu2<%=cLine%>"><i class="fa fa-pencil-square-o fa-2x"></i>
                                <br />
                                Contract</a></li>
                            <li><a data-toggle="tab" href="#menu3<%=cLine%>"><i class="fa fa-play fa-2x"></i>
                                <br />
                                Delivery</a></li>
                        </ul>
                        <div class="container">
                            <div class="tab-content" style="padding: 10px;">
                                <div id="home<%=cLine%>" class="tab-pane fade in active">

                                    <div class="row">
                                        <div class="col-sm-12" style="text-align: left;">
                                            <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title")%>' Style="font-weight: bold; font-size: large; color: gray; float: left; margin-right: 30px;"></asp:Label>
                                            <h6>
                                                <asp:HyperLink ID="hplViewProjectDetails" runat="server" NavigateUrl='<%# Eval("ProjectId","~/Customer/Project_Details?id={0}") %>'
                                                    Style="text-decoration: underline; margin-top: 3px;">View Details</asp:HyperLink></h6>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12" style="text-align: left;">
                                            <h6>
                                                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("CreationDate", "{0: dd/MM/yyyy}")%>'></asp:Label></h6>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="bidfield">
                                                <h5 style="float: left;">Status :&nbsp;&nbsp;</h5>

                                                <asp:Label ID="lblStatus" CssClass="label" runat="server" Text='<%# SetProjectStatus(Convert.ToInt32(Eval("Status"))) %>'></asp:Label>
                                                <%--<h6>All bids will be displayed in 2 working days</h6>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 style="float: left;">Description :&nbsp;&nbsp;</h5>

                                            <asp:Label ID="lblDescription" CssClass="label" runat="server" Text=' <%# Eval("Description").ToString().Length <= 200 ? Eval("Description") : Eval("Description").ToString().Substring(0,200)+"..." %>'></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div id="menu1<%=cLine%>" class="tab-pane fade">
                                    <asp:Label ID="lblProjectUnderReview" Style="font-size: 20px;" Text='Once project live, BIDDING will start immediately.' Visible='<%# Convert.ToInt32(Eval("Status"))  == 0? true : false %>'
                                        runat="server" />
                                    <asp:Label ID="lblNoBids" Style="font-size: 20px;" Text='Bidding is IN PROGRESS' Visible='<%# Convert.ToInt32(Eval("Status"))  == 1? true : false %>'
                                        runat="server" />
                                    <asp:Panel runat="server" ID="pnlBids" Visible='<%# Convert.ToInt32(Eval("Status"))  > 1? true : false %>'>

                                        <asp:Label ID="lblSelectedBid" CssClass="label" Text='<%# "Selected Agency : " + Eval("BidSelected").ToString() %>' Visible='<%# Convert.ToInt32(Eval("Status"))  >2 ? true:false%>'
                                            runat="server" />
                                        <asp:Label ID="lblCreateContract" CssClass="label" Text='Next step is to ask Agency to send contract of work and share on Benchkart for your approval.' Visible='<%# Convert.ToInt32(Eval("Status"))  == 3 ? true:false%>'
                                            runat="server" />
                                        <div style="margin-bottom: 30px;">
                                            <asp:ListView ID="lstBids" runat="server" OnItemCommand="lstBids_ItemCommand">
                                                <ItemTemplate>
                                                    <div class="container" style="background-color: #f8f8f8;">
                                                        <div class="row" style="position: relative; background-color: White; border-radius: 5px; padding: 20px 0px;">
                                                            <div class="col-sm-3" style="margin-bottom: 50px;">
                                                                <div id="divImage" class="divImage" style="text-align: center; margin-bottom: 10px;">
                                                                    <asp:Image runat="server" Width="80px" Height="80px" ImageUrl="~/Images/company_logo.jpg"
                                                                        Style="border-radius: 50%; margin-right: 10px; border: 1px solid lightgray;" />
                                                                </div>
                                                                <div>
                                                                    <div class="bidfield">
                                                                        Agency Name
                                                                    </div>
                                                                    <asp:Label ID="lblCompanyName" CssClass="label" runat="server" Text='<%# Eval("CompanyName")%>'></asp:Label>
                                                                </div>
                                                                <%--<div class="bidfield">
                                                                    Bid Date
                                                                </div>
                                                                <asp:Label ID="lblDate" CssClass="label" runat="server" Text='<%# Eval("CreationDate", "{0: dd/MM/yyyy}")%>'></asp:Label>--%>
                                                                <div style="margin-top: 25px;">
                                                                    <div class="bidfield">
                                                                        Website
                                                                    </div>
                                                                    <i class="fa fa-globe" style="color: darkblue; font-size: 20px;"></i>
                                                                    <asp:Label ID="hplWebsite" runat="server" Style="text-decoration: underline;" Text='<%# Eval("Website")%>'></asp:Label>
                                                                </div>
                                                                <div style="margin-top: 25px;">
                                                                    <asp:UpdatePanel ID="UpdatePanelContactNumber" runat="server">
                                                                        <ContentTemplate>
                                                                            <div class="bidfield">
                                                                                Contact Number
                                                                            </div>
                                                                            <div class="bidfield">

                                                                                <asp:LinkButton ID="btncontact" runat="server" class="form-control" Text="View Contact" CommandName="getcontact"
                                                                                    Style="text-align: center; display: inline-block; background-color: #18D26E; color: white; width: 80%;"></asp:LinkButton>

                                                                            </div>
                                                                            <i class="fa fa-phone-square" style="color: darkblue; font-size: 20px;"></i>
                                                                            <asp:HyperLink ID="hplContactNumber" runat="server" Visible="false" Style="text-decoration: underline;" Text='<%# Eval("ContactNumber")%>' NavigateUrl='<%# "tel:" + Eval("ContactNumber")%>'></asp:HyperLink>

                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-9">
                                                                <h5 style="margin-top: 20px; margin-bottom: 0px;">Bidding Price (INR)
                                                                </h5>
                                                                <asp:Label ID="lblPrice" CssClass="label" runat="server" Text='<%# Eval("BidAmount")%>'></asp:Label>

                                                                <h5 style="margin-top: 20px; margin-bottom: 0px;">Agency Estimation
                                                                </h5>
                                                                <asp:Label ID="lblExecutionRemarks" CssClass="label" runat="server" Text='<%# Eval("ExecutionRemarks")%>'></asp:Label>
                                                                <h5 style="margin-top: 20px; margin-bottom: 0px;">Similar Experience
                                                                </h5>
                                                                <asp:Label ID="lblExperience" CssClass="label" runat="server" Text='<%# Eval("Experience")%>'></asp:Label>
                                                                <%-- <asp:Label ID="Label1" runat="server" Text='<%# Eval("PaymentType")%>'></asp:Label>--%>
                                                                <div class="bidaction">
                                                                    <div class="row">
                                                                        <div class="col-lg-3">
                                                                            <div style="margin-top: 20px;">
                                                                                <asp:HyperLink ID="hplViewDetail" class="hplProject" Text="View Details" runat="server"
                                                                                    Style="margin-right: 20px; margin-bottom: 20px; text-align: center; text-decoration: underline; margin-top: 20px;"
                                                                                    NavigateUrl='<%# String.Format("~/Customer/Bid-Details?id={0}&action=view", DataBinder.Eval(Container.DataItem, "BidId")) %>'>           
                                                                                </asp:HyperLink>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3">
                                                                            <asp:HyperLink ID="hplMessage" class="form-control hplProject" Text="Message" runat="server"
                                                                                Height="30px" Style="text-align: center; margin-bottom: 20px; text-decoration: none; margin-right: 20px; margin-top: 20px;"
                                                                                NavigateUrl='<%# String.Format("~/Customer/Bid-Details?id={0}&action=message", DataBinder.Eval(Container.DataItem, "BidId")) %>'>           
                                                                            </asp:HyperLink>
                                                                        </div>

                                                                        <asp:UpdatePanel runat="server" ID="UpdatePanelgetcallback">
                                                                            <ContentTemplate>
                                                                                <div class="col-lg-3">
                                                                                    <div style="margin-top: 20px;">
                                                                                        <asp:LinkButton ID="btnGetCallBack" class="form-control hplProject" runat="server" Text="Get Call Back" Visible='<%# Convert.ToInt32(Eval("GetCallBack")) < 2 ? true : false%>'
                                                                                            CommandName="GetCallBack" Height="30px" Style="text-align: center; display: inline-block; background-color: #18D26E; color: white; font-weight: bold;" />

                                                                                        <asp:Label ID="LabelGetCallBack" runat="server" Text="Call Back Request Sent" Visible='<%# 2.Equals(Convert.ToInt32(Eval("GetCallBack"))) ? true : false%>'
                                                                                            Height="30px" />
                                                                                    </div>
                                                                                </div>
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                        <div class="col-lg-3">
                                                                            <div style="margin-top: 20px;">
                                                                                <asp:LinkButton ID="btnAccept" class="form-control hplProject" runat="server" Text="Accept Bid" Visible='<%# Convert.ToInt32(Eval("BidStatus")) < 2 ? true : false%>'
                                                                                    CommandName="AcceptBid" Height="30px" Style="text-align: center; display: inline-block; background-color: #F79507; color: white;" />
                                                                                <asp:Label ID="LabelBidAccept" runat="server" Text="Bid Accepted" Visible='<%# 2.Equals(Convert.ToInt32(Eval("BidStatus"))) ? true : false%>'
                                                                                    Height="30px" />
                                                                                <asp:HiddenField ID="hfBidId" runat="server" Value='<%# Eval("BidId") %>' />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </ItemTemplate>
                                            </asp:ListView>

                                            <div style="text-align: center;">
                                                <asp:Label ID="Label2" runat="server" Visible="false" Text="Currently there are no bids"
                                                    Style="font-weight: bold; color: Gray; font-size: xx-large;"></asp:Label>
                                            </div>
                                        </div>

                                    </asp:Panel>
                                </div>

                                <div id="menu2<%=cLine%>" class="tab-pane fade">
                                    <asp:Label ID="lblNoContract" Style="font-size: 20px;" Text='After bidding completed and bid accepted by you, Agency will send CONTRACT for your approval.' Visible='<%# Convert.ToInt32(Eval("Status"))  < 4? true : false %>'
                                        runat="server" />
                                    <%--<div class="row">
                                        <div class="col-sm-12" style="text-align: left;">
                                            <asp:HyperLink ID="hplSendMessage" runat="server" Style="margin-bottom: 20px; margin-bottom: 20px; font-size: medium; background-color: #F79507; padding: 5px 20px; border-radius: 5px; color: white;"
                                                Visible='<%# Convert.ToInt32(Eval("Status"))  > 3? true : false %>'
                                                NavigateUrl='<%# Eval("ContractId","~/Customer/Send-Message?ID={0}") %>' Text="Send Message to Agency"></asp:HyperLink>
                                        </div>
                                    </div>--%>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:HiddenField ID="hfProjectId" runat="server" Value='<%# Eval("ProjectId") %>' />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <%-- <asp:Label ID="lblSentBack" runat="server" Visible='<%# Convert.ToInt32(Eval("ContractCount"))  > 0? false : true %>' Text="Agency will respond with final contract. For any query email to outsource@benchkart.com"></asp:Label>--%>
                                            <asp:Panel runat="server" ID="pnlContract" Visible='<%# Convert.ToInt32(Eval("Status"))  > 3? true : false %>'>
                                                <asp:HiddenField ID="hfContractId" runat="server" Value='<%# Eval("ContractId") %>' />
                                                <div class="row" style="position: relative; margin-bottom: 20px; margin-top: 20px;">
                                                    <div class="col-sm-3">
                                                        <h5 style="float: left; line-height: 1; margin-top: 8px;">Project Value (INR) :&nbsp;&nbsp;</h5>
                                                        <asp:Label ID="lblProjectValue" runat="server" CssClass="label" Text='<%# Eval("ProjectValue").ToString()%>'></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <h5 style="float: left; line-height: 1; margin-top: 8px;">Duration :&nbsp;&nbsp;</h5>
                                                        <asp:Label ID="lblDuration" runat="server" CssClass="label" Text='<%# Eval("Duration").ToString() +"  " + Eval("DurationType").ToString()%>'></asp:Label>

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <h5 style="float: left; line-height: 1; margin-top: 8px;">Start Date :&nbsp;&nbsp;</h5>
                                                        <asp:Label ID="lblStartDate" CssClass="label" runat="server" Text='<%# Eval("StartDate", "{0: dd/MM/yyyy}")%>'></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <h5 style="float: left; line-height: 1; margin-top: 8px;">End Date :&nbsp;&nbsp;</h5>
                                                        <asp:Label ID="lblEndDate" CssClass="label" runat="server" Text='<%# Eval("EndDate", "{0: dd/MM/yyyy}")%>'></asp:Label>
                                                    </div>
                                                </div>

                                                <div class="row" style="position: relative; margin-top: 10px;">
                                                    <div class="col-sm-6">
                                                        <asp:Panel ID="pnlContractAttachments" runat="server"></asp:Panel>
                                                    </div>

                                                </div>
                                                <div class="row" style="position: relative; margin-bottom: 20px; margin-top: 20px;">
                                                    <div class="col-sm-12">
                                                        <h5 style="font-weight: normal;">
                                                            <asp:CheckBox runat="server" ID="chkTerms" Visible='<%# Convert.ToInt32(Eval("Status"))  == 4? true : false %>' Checked="true" />&nbsp;&nbsp;I Agree to the 
                                                            <a href="../Policies/Projec-Agreement.html" target="_blank" style="text-decoration: underline;">Terms of Project Agreement</a>
                                                        </h5>

                                                    </div>
                                                </div>
                                                <div class="row" style="position: relative; margin-bottom: 20px; margin-top: 20px;">
                                                    <div class="col-sm-6">
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Button class="btn" Style="margin-bottom: 20px;" Width="100%" runat="server" ID="btnAcceptContract" Visible='<%# Convert.ToInt32(Eval("Status"))  == 4? true : false %>' Text="Accept Contract" CommandName="AcceptContract" />
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Button class="btn" Width="100%" runat="server" ID="btnRejectContract" Visible='<%# Convert.ToInt32(Eval("Status"))  == 4? true : false %>' Text="Send Back" CommandName="SendBackContract" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>

                                </div>
                                <div id="menu3<%=cLine%>" class="tab-pane fade">
                                    <asp:Label ID="lblNoWorkPayment" Style="font-size: 20px;" Text='Once contract approved by you then DELIVERY will begin.' Visible='<%# Convert.ToInt32(Eval("Status")) < 6 ? true : Convert.ToInt32(Eval("Status")) == 11 ? true : false %>'
                                        runat="server" />
                                    <asp:ListView runat="server" ID="lstPayments" OnItemDataBound="lstPayments_ItemDataBound">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfPaymentRequestId" runat="server" Value='<%# Eval("PaymentRequestId") %>' />
                                            <div class="container" style="padding: 15px; background-color: #f8f8f8; border: 1px solid gray; border-radius: 5px; width: 100%; margin: 0 auto; margin-top: 20px;">
                                                <div class="row" style="position: relative; padding: 10px;">
                                                    <div class="col-sm-4">
                                                        <h5 style="float: left; line-height: 1; margin-top: 8px;">Amount (INR) :&nbsp;&nbsp;</h5>

                                                        <asp:Label ID="lblPaymentAmount" CssClass="label" Text='<%# Eval("PaymentAmount") %>' runat="server" />
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <h5 style="float: left; line-height: 1; margin-top: 8px;">Date :&nbsp;&nbsp;</h5>

                                                        <asp:Label ID="lblStatusUpdateDate" CssClass="label" Text='<%# Eval("StatusUpdateDate", "{0: dd/MM/yyyy}") %>' runat="server" />
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <h5 style="float: left; line-height: 1; margin-top: 8px;">Attachments :&nbsp;&nbsp;</h5>
                                                        <asp:Panel ID="pnlAttachments" runat="server"></asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row" style="position: relative; padding: 10px;">
                                                    <div class="col-sm-12">
                                                        <h5 style="float: left; line-height: 1; margin-top: 8px;">Remarks :&nbsp;&nbsp;</h5>

                                                        <asp:Label ID="lblRemarks" CssClass="label" Text='<%# Eval("LastRemark") %>' runat="server" />
                                                    </div>
                                                </div>
                                                <div class="row" style="position: relative; padding: 10px;">
                                                    <div class="col-sm-6">
                                                        <asp:Label ID="Label1" runat="server" CssClass="label" Style="margin-bottom: 10px;" Text="Status: Payment Requested by Agency" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 1? true : false %>' />
                                                        <asp:Label ID="lblPaymentRejected" runat="server" CssClass="label" Style="margin-bottom: 10px;" Text="Status: Payment Rejected" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 2? true : false %>' />
                                                        <asp:Label ID="lblPaymentMade" runat="server" CssClass="label" Style="margin-bottom: 10px;" Text="Status: Payment Submitted" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 3? true : false %>' />
                                                        <asp:Label ID="Label3" runat="server" CssClass="label" Style="margin-bottom: 10px; margin-left: 20px;" Text="Status: Payment Release Requested by Agency"
                                                            Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 4? true : false %>' />
                                                        <asp:Label ID="lblPaymentRelease" runat="server" CssClass="label" Text="Status: Payment Released"
                                                            Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 5? true : false %>' />
                                                        <asp:HyperLink ID="hplView" Style="margin-bottom: 10px; margin-left: 20px; margin-top: 15px; text-decoration: underline; color: blue;" runat="server" NavigateUrl='<%# Eval("PaymentRequestId","~/Customer/PaymentDetails?PaymentRequestId={0}") %>'>View Details</asp:HyperLink>

                                                    </div>
                                                    <div class="col-sm-6" style="text-align: center; padding: 0px; margin-top: 10px;">
                                                        <asp:HyperLink ID="hplPay" Style="margin-bottom: 10px; margin-top: 15px; margin-right: 15px; width: 100px; height: 30px; font-weight: bold; font-size: large; background-color: #F79507; padding: 5px 50px; border-radius: 3px; color: white;"
                                                            runat="server" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 1? true : false %>' Text="Pay" NavigateUrl='<%# Eval("PaymentRequestId","~/Customer/Payment?PaymentRequestId={0}") %>'></asp:HyperLink>
                                                        <asp:HyperLink ID="btnReleasePayment" Style="background-color: #F79507; margin-left: 20px; padding: 5px 10px; border-radius: 3px; color: white; font-size: small; font-weight: bold;"
                                                            runat="server" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 4? true : false %>' Text="Approve Payment Release"
                                                            NavigateUrl='<%# Eval("PaymentRequestId","~/Customer/ReleasePayment?PaymentRequestId={0}") %>'></asp:HyperLink>
                                                        <asp:HyperLink ID="HyperLink1" Style="background-color: #F79507; margin-left: 20px; padding: 5px 10px; border-radius: 3px; color: white; font-size: small; font-weight: bold;"
                                                            runat="server" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 6? true : false %>'
                                                            Text="Release Final Payment" NavigateUrl='<%# Eval("PaymentRequestId","~/Customer/ReleasePayment?PaymentRequestId={0}&action=final") %>'></asp:HyperLink>

                                                        <asp:HyperLink ID="hplRejectPayment" Style="margin-bottom: 10px; margin-left: 20px; margin-top: 25px; text-decoration: underline; margin-left: 10px; margin-right: 15px;" runat="server" Visible='<%# Convert.ToInt32(Eval("PaymentStatus"))  == 1? true : false %>' Text="Reject" NavigateUrl='<%# Eval("PaymentRequestId","~/Customer/RejectPayment?PaymentRequestId={0}") %>'></asp:HyperLink>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                            <%-- <br />
                            <asp:LinkButton ID="lkbAcceptClose" runat="server" Text="Accept Close" CommandArgument='<%#Eval("ProjectId") %>'
                                Visible='<%#Convert.ToInt32(Eval("Status").ToString()) ==7 ? true : false %>' CommandName="status"></asp:LinkButton>--%>
                        </div>
                    </div>
                    <%cLine++;%>
                </ItemTemplate>

            </asp:ListView>
        </div>
    </div>
    <%--</asp:content>--%>
</asp:Content>

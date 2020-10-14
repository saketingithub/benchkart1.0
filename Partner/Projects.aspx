<%@ Page Language="C#" Title="Partner Projects List" AutoEventWireup="true" Inherits="Benchkart.Partner.Projects" MasterPageFile="~/Partner/Site1.Master" CodeBehind="Projects.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding: 10px 50px 30px 50px;
            background-color: White;
            border-radius: 5px;
            width: 100%;
            margin: 0 auto;
        }
        .title
        {
            text-align: left; padding: 15px 30px;
        }
        @media (max-width: 799px) {
            .container {
                padding: 5px 15px 10px 15px;
                
            }
            .title
            {
                padding: 15px 0px;
            }
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
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">--%>
    <!-- Page Content  -->
    <div id="content" style="padding: 15px;">
        <div class="row" style="margin: 15px;">
            <div class="col-sm-3">
                <div class="info-box">
                    <span class="info-box-icon bg-info elevation-1"><i class="fa fa-paper-plane fa-2x" style="color: white;"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Leads</span>
                        <span class="info-box-number">
                            <asp:Label runat="server" ID="lblOppurtunitiesCount"></asp:Label>
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
                            <asp:Label runat="server" ID="lblBidCount"></asp:Label>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-sm-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-success elevation-1"><i class="fa fa-bullseye fa-2x" style="color: white;"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Projects</span>
                        <span class="info-box-number">
                            <asp:Label runat="server" ID="lblSelectedbidCount"></asp:Label>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-sm-3">
                <div class="info-box mb-3">
                    <span class="info-box-icon bg-warning elevation-1"><i class="fa fa-play fa-2x" style="color: white;"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Deliveries</span>
                        <span class="info-box-number">
                            <asp:Label runat="server" ID="lblActiveProjectCount"></asp:Label>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
        </div>
        <asp:Panel ID="pnlSearchingProjects" runat="server" Visible="false" Style="text-align: center; height: 200px; margin: 0 auto; padding: 20px;">
            <h2 style="margin-top: 100px;">We are searching for projects as per your company services.
                    <br />
                Please update your all services if not already done.</h2>
        </asp:Panel>
        <div style="margin-bottom: 70px;">

            <asp:ListView ID="lstProjects" runat="server">
                <ItemTemplate>
                    <!-- Card -->
                    <div class="card" style="margin: 0 auto; background-color: White; margin-top: 50px;">
                        <div class="row" style="margin: 0 auto; background-color: #f1f1f1; border: 1px solid lightgray;">
                            <div class="col-sm-12 title">
                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title")%>' Style="font-weight: bold; font-size: large; margin-left: 20px; color: #212529;"></asp:Label>

                            </div>
                        </div>
                        <div class="container">
                            <div class="row" style="position: relative;">
                                <div class="col-sm-12">
                                    <asp:Label ID="lblDate" runat="server" Text='<%# "Date: " + Eval("CreationDate", "{0: dd/MM/yyyy}")%>'></asp:Label>
                                </div>
                            </div>
                            <div class="row fields" style="padding-top: 0px;">
                                <div class="col-sm-12">
                                    <div class="bidfield">
                                        <h5>Description</h5>
                                    </div>
                                    <div>
                                        <h4>
                                            <asp:Label ID="lblDescription" CssClass="label" runat="server" Style="line-height: 1.7;" Text='<%# Eval("Description").ToString().Length <= 200 ? Eval("Description") : Eval("Description").ToString().Substring(0,
                        200)+"..." %>'></asp:Label></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row fields">
                                <div class="col-sm-3">
                                    <div class="bidfield">
                                        <h5>Project Category</h5>
                                    </div>
                                    <div>
                                        <h4>
                                            <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("ServiceTitle")%>'></asp:Label></h4>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="bidfield">
                                        <h5>Project Type</h5>
                                    </div>
                                    <div>
                                        <h4>
                                            <asp:Label ID="lblServiceType" Text='<%# Eval("OutsourceType").ToString() == "2" ? "Outsource Project" : "Hire Developer" %>'
                                                runat="server" /></h4>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="bidfield">
                                        <h5>Customer Industry</h5>
                                    </div>
                                    <div>
                                        <h4>
                                            <asp:Label ID="lblCompanyIndustry" Text='<%# Eval("CompanyIndustry")%>' runat="server" /></h4>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="bidfield">
                                        <h5>Budget (INR)</h5>
                                    </div>
                                    <div>
                                        <h4>
                                            <asp:Label ID="lblBudget" Text='<%# Eval("Budget").ToString() == "" ? "Budget not shared" : Eval("Budget").ToString() == "1" ? "<INR 25000" : Eval("Budget").ToString() == "2" ?
                                                    "INR 25000-1 Lac" : Eval("Budget").ToString() == "3" ? "INR 1 Lac-10 Lacs" : Eval("Budget").ToString() == "4" ?
                                                    "INR 10-50 Lacs" : Eval("Budget").ToString() == "5" ? "INR 50 Lacs +" : Eval("Budget").ToString() == "6" ?
                                                    "<USD 1000" : Eval("Budget").ToString() == "7" ? "USD 1K-5K" : Eval("Budget").ToString() == "8" ?
                                                    "USD 5K-20K" : Eval("Budget").ToString() == "9" ? "USD 20 K-100K" : Eval("Budget").ToString() == "10" ?
                                                    "USD 100K+" : Eval("Budget").ToString()  %>' runat="server" />
                                            <asp:Label ID="lblBudgetType" Text='<%# Eval("BudgetType").ToString() == "1" ? " - Fixed" : " - Per Hour" %>'
                                                runat="server" />
                                        </h4>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 30px;">
                                <div class="row">

                                    <div class="col-sm-6" style="text-align: center; margin-bottom: 15px;">
                                        <asp:HyperLink ID="btnViewDetail" Text="View Details" runat="server" Style="color: gray; text-decoration: underline;"
                                            NavigateUrl='<%# String.Format("~/Partner/Project_Details?id={0}", DataBinder.Eval(Container.DataItem, "ProjectId")) %>'></asp:HyperLink>
                                    </div>
                                    <div class="col-sm-6" style="text-align: center;">
                                        <asp:HyperLink ID="btnBid" Text="Bid On Project" runat="server" Style="font-size: Medium; font-weight: bold; padding: 5px 20px; border-radius: 3px; color: white; background-color: #18D26E;"
                                            NavigateUrl='<%# String.Format("~/Partner/Project_Details?id={0}", DataBinder.Eval(Container.DataItem, "ProjectId")) %>'></asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <%--</asp:content>--%>
</asp:Content>

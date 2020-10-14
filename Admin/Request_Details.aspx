<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request_Details.aspx.cs" Inherits="Benchkart.Admin.Request_Details" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- Required meta tags -->
    <meta charset='utf-8'>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="IT Shared Services" />
    <title>benchkart - marketplace for outsourcing</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
     <script src="../Scripts/Custom.js"></script>
    <style>
        h4 {
            margin-top: 25px;
            font-size: small;
            font-weight: bold;
        }

        td {
            padding-left: 20px;
        }

        .label {
            font-size: medium;
            color: Black;
            font-weight: normal;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        li {
            float: left;
        }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

                li a:hover:not(.active) {
                    background-color: #111;
                }

        .active {
            background-color: #4CAF50;
        }
    </style>
    <script>
        function selectLocation() {
            if (document.getElementById("ddlWorkMode").value != "1") {
                $('#txtLocationFullTime').show();
            }
            else {
                $('#txtLocationFullTime').hide();
            }
        }
        function selectLocationPartTime() {
            if (document.getElementById("rblLocation").value != "1") {
                $("#txtOnsiteLoaction").show();
            }
            else {
                $("#txtOnsiteLoaction").hide();
            }

        }
        function SelectTalent() {
            if (document.getElementById("ddlOutsourceType").value != "3") {
                $('#pnlTalent').hide();
            }
            else {
                $('#pnlTalent').show();
            }
        }
        function showtalent() {
            if (document.getElementById("ddlTalentType").value == 1) {
                $("#pnlFullTime").show();
                $("#pnlPartTime").hide();
                $("#txtDuration").hide();
                $("#txtLocation").hide();
            }
            else if (document.getElementById("ddlTalentType").value == 0) {
                $("#pnlPartTime").show();
                $("#pnlFullTime").hide();
                $("#txtDuration").hide();
                $("#txtLocation").hide();
            }
            else {
                $("#pnlPartTime").hide();
                $("#pnlFullTime").hide();
                $("#txtDuration").show();
                $("#txtLocation").show();
            }
        }
        function ddlbasic_count() {
            var ddlbas = document.getElementById("ddlBasic");

            var ddlcout = ddlbas.options[ddlbas.selectedIndex].value;
            document.getElementById("lblTotalCount").innerText = parseInt(ddlcout);
            document.getElementById('<%=HiddenField2.ClientID %>').value = parseInt(ddlcout);



        }
        function ddlintermediate_count() {
            var ddlbas = document.getElementById("ddlBasic");
            var ddlinter = document.getElementById("ddlIntermediate");
            //  var a = dropdown1.options[dropdown1.selectedIndex].value;
            var ddlcount = ddlbas.options[ddlbas.selectedIndex].value;
            var ddlintercount = ddlinter.options[ddlinter.selectedIndex].value;
            document.getElementById("lblTotalCount").innerText = (parseInt(ddlcount) + parseInt(ddlintercount));
            document.getElementById('<%=HiddenField2.ClientID %>').value = (parseInt(ddlcount) + parseInt(ddlintercount));


        }
        function ddlexpert_count() {
            var ddlbas = document.getElementById("ddlBasic");
            var ddlinter = document.getElementById("ddlIntermediate");
            var ddlexper = document.getElementById("ddlExpert");
            var ddlcount = ddlbas.options[ddlbas.selectedIndex].value;
            var ddlintercount = ddlinter.options[ddlinter.selectedIndex].value;
            var ddlexpertcount = ddlexper.options[ddlexper.selectedIndex].value;
            document.getElementById("lblTotalCount").innerText = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));
            document.getElementById('<%=HiddenField2.ClientID %>').value = ((parseInt(ddlcount) + parseInt(ddlintercount) + parseInt(ddlexpertcount)));

        }
        function ddlbasicparttime_count() {
            var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = parseInt(ddlbasicprttime);
            document.getElementById('<%=HiddenField2.ClientID %>').value = parseInt(ddlbasicprttime);

        }
        function ddlintermediateparttime_count() {
            var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlintermediateprt = document.getElementById("ddlIntermediatePartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            var ddlintermediateprttime = ddlintermediateprt.options[ddlintermediateprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = (parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime));
            document.getElementById('<%=HiddenField2.ClientID %>').value = (parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime));
        }
        function ddlexpertpartime_count() {
            var ddlbasicprt = document.getElementById("ddlBasicPartTime");
            var ddlintermediateprt = document.getElementById("ddlIntermediatePartTime");
            var ddlexpertprt = document.getElementById("ddlExpertPartTime");
            var ddlbasicprttime = ddlbasicprt.options[ddlbasicprt.selectedIndex].value;
            var ddlintermediateprttime = ddlintermediateprt.options[ddlintermediateprt.selectedIndex].value;
            var ddlexpertprttime = ddlexpertprt.options[ddlexpertprt.selectedIndex].value;
            document.getElementById("lblPartTimeCount").innerText = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));
            document.getElementById('<%=HiddenField2.ClientID %>').value = ((parseInt(ddlbasicprttime) + parseInt(ddlintermediateprttime) + parseInt(ddlexpertprttime)));

        }
        function Isbudgetsharedshow() {
            var chk = document.getElementById("chkIsBudgetShared").value;
            if (chk == "1") {
                chk.innerText = true;

            }
            else {
                chk.innerText = false;
            }
        }
        $(document).ready(function () {
            if (document.getElementById("ddlOutsourceType").value != "3") {
                $('#pnlTalent').hide();
            }
            else {
                $('#pnlTalent').show();
                if (document.getElementById("ddlTalentType").value == 1) {
                    $("#pnlFullTime").show();
                    $("#pnlPartTime").hide();
                    $("#txtDuration").hide();
                    $("#txtLocation").hide();
                }
                else if (document.getElementById("ddlTalentType").value == 0) {
                    $("#pnlPartTime").show();
                    $("#pnlFullTime").hide();
                    $("#txtDuration").hide();
                    $("#txtLocation").hide();
                }
                else {
                    $("#pnlPartTime").hide();
                    $("#pnlFullTime").hide();
                    $("#txtDuration").show();
                    $("#txtLocation").show();
                }
            }

        })
    </script>
</head>
<body>
    <form id="form1" runat="server" height="none" style="margin-bottom:5px;">
       
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div style="font-size: 20px; font-weight: bold; color: Black; height: 60px; background-color: #1d4354; margin-top: 0px;">
            <div style="color: White; float: left; padding: 20px;">
                BenchKart
            </div>
            <div style="float: right;">
                <asp:Label runat="server" ID="lblConsultantEmail" CssClass="label" ForeColor="White"
                    styel="padding: 20px;"></asp:Label>
            </div>
        </div>
        <div class="container">
            <div class ="row" style="text-align:center;">
                <div class ="form-group">
                    <h4>Customer Details</h4>
                </div>
            </div>
            <asp:Panel ID="Panel1" runat ="server" >
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class="col-lg-3">
                       
                            Full Name
                           <br />
                                <asp:Label ID="lblFullName"  runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                            Email
                           <br />
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>

                        
                    </div>
                    <div class="col-lg-3">
                        
                            Contact Number
                           <br />
                                <asp:Label ID="lblContactNumber" runat="server"></asp:Label>

                       
                    </div>
                    <div class ="col-lg-3">
                          Company Name
                            <br />
                                <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
                    </div>

                </div>
            </div>
                </asp:Panel>
               <div class ="row" style="text-align:center;">
                <div class ="form-group">
                    <h4>Request Details</h4>
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class="col-lg-4">
                        <div class="bidfield">
                            RequestId
                           <br />
                                <asp:Label ID="lblRequestId" runat="server"></asp:Label>

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="bidfield">
                           OntsourceType
                           
                                 <asp:DropDownList runat="server" class="form-control" Width="80%" ID="ddlOutsourceType" onchange=" return SelectTalent();">
                                     <asp:ListItem Value="1">Assistance</asp:ListItem>
                                     <asp:ListItem Value="2">Service</asp:ListItem>
                                     <asp:ListItem Value="3">Talent</asp:ListItem>
                                 </asp:DropDownList>

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="bidfield">
                            Date
                           <br />
                                <asp:Label ID="lblDate" runat="server"></asp:Label>

                        </div>
                    </div>
                    
                  
                </div>
            </div>
          
            <div class="row" style ="margin-bottom:20px;">

                <div class="form-group">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="col-lg-4">
                                <div class="bidfield">
                                    Service Category
                           
                               <asp:DropDownList ID="ddlCategory" class="form-control" Width="80%" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" >
                                   <asp:ListItem Value="0">Select</asp:ListItem>
                                   <asp:ListItem Value="1">Graphics & Design</asp:ListItem>
                                   <asp:ListItem Value="2">Website & Apps</asp:ListItem>
                                   <asp:ListItem Value="3">Digital Marketing</asp:ListItem>
                                   <asp:ListItem Value="4">Software</asp:ListItem>
                                   <asp:ListItem Value="5">Cloud & Infra</asp:ListItem>
                                   <asp:ListItem Value="6">Call Center</asp:ListItem>
                                   <asp:ListItem Value="7">KPO</asp:ListItem>
                                   <asp:ListItem Value="8">Back-Office</asp:ListItem>                                   
                               </asp:DropDownList>
                                    
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="bidfield">
                                    Service Subcategory
                            
                            
                                 <asp:DropDownList ID="ddlSubCategory" Width="80%" class="form-control" runat="server">
                                 </asp:DropDownList>

                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                   
                    
                </div>

            </div>
              <div class ="row" style="margin-bottom:20px;">
                <div class ="form-group">
                    <div class ="col-lg-12" style="margin-top:5px;">
                           Title
                            
                            
                                <asp:TextBox ID="txtTitle" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class ="row" style="margin-bottom:20px;">
                <div class ="form-group">
                    <div class ="col-lg-12">
                        <div class ="bidfield">
                                Description
                          
                                <asp:TextBox ID="txtDescription" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            
            <asp:Panel ID="pnlTalent" runat ="server" style="display :none;" >
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class="col-lg-12">
                        <div class="bidfield">
                            Talent Type
                            
                            <asp:DropDownList ID="ddlTalentType" onchange=" return showtalent();" Width="30%" runat="server" CssClass="form-control"  RepeatDirection="Horizontal">
                                <asp:ListItem Value="2">--Select Talent Type--</asp:ListItem>
                                <asp:ListItem Value="1">Full Time</asp:ListItem>
                                <asp:ListItem Value="0">Part Time</asp:ListItem>
                            </asp:DropDownList>
                            <asp:HiddenField ID="HiddenField2" runat="server" />
                        </div>
                    </div>

                </div>
            </div>
                </asp:Panel>
            <asp:Panel ID="pnlFullTime" runat ="server" style="display:none;">
            <div id="divFullTime">
                Number of people required
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group">
                        <div class="col-lg-6">
                            <div class="bidfield">
                                Expertise (Experience)
                            </div>

                        </div>
                        <div class="col-lg-6">
                            <div class="bidfield">
                                Talent Count
                                       
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group">
                        <div class="col-lg-6">
                            <div class="bidfield">
                                Basic (1-3 yrs)
                                        
                                       
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="bidfield">

                                <asp:DropDownList ID="ddlBasic" Width="80%"  onchange="ddlbasic_count()" CssClass ="form-control" runat="server"></asp:DropDownList>

                            </div>
                        </div>

                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group">
                        <div class="col-lg-6">
                            <div class="bidfield">
                                Intermediate (3-6 yrs)
                                        
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="bidfield">

                                <asp:DropDownList ID="ddlIntermediate" Width="80%" onchange="ddlintermediate_count()" CssClass="form-control" runat="server"></asp:DropDownList>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group ">
                        <div class="col-lg-6">
                            <div class="bidfield">
                                Expert (>6 yrs)
                                        
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="bidfield">

                                <asp:DropDownList ID="ddlExpert" Width="80%" runat="server"  onchange="ddlexpert_count()" CssClass="form-control"></asp:DropDownList>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group">
                        <div class="col-lg-6">
                            <div class="bidfield">
                                Total Talent
                                        
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="bidfield">

                                <asp:Label ID="lblTotalCount" Width="80%" runat="server" CssClass="form-control"></asp:Label>
                                

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group">
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Duration
                                
                                    <asp:TextBox ID="txtDurationFullTime" Width="80%" CssClass ="form-control" runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Mode of work
                                
                                  <asp:DropDownList runat="server" ID="ddlWorkMode" Width="80%" CssClass="form-control" Style="margin: 0 auto;"
                                      class="form-control" onchange="selectLocation()">
                                      <asp:ListItem Value="1" Selected="True">Remote</asp:ListItem>
                                      <asp:ListItem Value="2">Onsite</asp:ListItem>
                                      <asp:ListItem Value="3">Periodic Onsite</asp:ListItem>
                                  </asp:DropDownList>
                                <br />


                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">


                                <asp:TextBox runat="server" ID="txtLocationFullTime" Width="80%" class="form-control" Style="margin-top: 20px; display: none;"
                                    Placeholder="Location"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
                </asp:Panel>
            <asp:Panel ID="pnlPartTime" runat="server" style="display:none;">
            <div id="divPartTime">
                Number of people required
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group">
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Proficiencylr (Experience)
                                
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Talent Count
                               
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Hours per week
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group ">
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Basic (1-3 yrs)
                            
                            </div>

                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">

                                <asp:DropDownList ID="ddlBasicPartTime" Width="80%" onchange="ddlbasicparttime_count()" runat="server" CssClass="form-control"></asp:DropDownList>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">

                                <asp:DropDownList ID="ddlBasicPartTimeHours" Width="80%" runat="server" CssClass="form-control"></asp:DropDownList>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group">
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Intermediate (3-6 yrs)
                                
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">

                                <asp:DropDownList ID="ddlIntermediatePartTime" Width="80%" onchange="ddlintermediateparttime_count()" runat="server" CssClass="form-control"></asp:DropDownList>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">

                                <asp:DropDownList ID="ddlIntermediatePartTimeHours" Width="80%" runat="server" CssClass="form-control "></asp:DropDownList>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group">
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Expert (>6 yrs)
                                
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">

                                <asp:DropDownList ID="ddlExpertPartTime" Width="80%" onchange="ddlexpertpartime_count()" runat="server" CssClass="form-control "></asp:DropDownList>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">

                                <asp:DropDownList ID="ddlExpertPartTimeHours" Width="80%" runat="server" CssClass="form-control "></asp:DropDownList>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group ">
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Total Count
                                
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">

                                <asp:Label ID="lblPartTimeCount" Width="80%" runat="server" CssClass="form-control "></asp:Label>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="form-group ">
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Duration
                               
                                    <asp:TextBox ID="txtDurationPartTime" Width="80%" runat="server" CssClass="form-control "></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">
                                Location preference (Optional)
                               
                                      <asp:RadioButtonList ID="rblLocation" Width="80%" Style="margin-left: 10%;"  runat="server" onchange=" return selectLocationPartTime(); "
                                           RepeatDirection="Horizontal" data-toggle="buttons">
                                          <asp:ListItem Value="1" Selected="True" >No</asp:ListItem>
                                          <asp:ListItem Value="2">Yes</asp:ListItem>
                                      </asp:RadioButtonList>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bidfield">

                                <asp:TextBox ID="txtOnsiteLoaction" Width="80%" class="form-control" runat="server" placeholder="Loaction"
                                    Style="display: none;">
                                </asp:TextBox>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </asp:Panel>
           <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class="col-lg-4">
                        <div class="bidfield">
                         
                             Duration
                           
                                <asp:TextBox ID="txtDuration" Width="80%" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                  
                    <div class="col-lg-4">
                        <div class="bidfield">
                            Location
                           
                                <asp:TextBox ID="txtLocation" Width="80%" class="form-control" runat="server"></asp:TextBox>

                        </div>
                    </div>
                     <div class="col-lg-4">
                        <div class="bidfield">
                         
                               SkillRequired
                           
                                <asp:TextBox ID="txtSkillRequired" Width="80%" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">

                    <div class="col-lg-4">
                        <div class="bidfield">
                            Budget
                           
                                <asp:TextBox ID="txtbudget" Width="80%" class="form-control" runat="server"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="bidfield">
                            BudgetType
                           
                                 <asp:DropDownList runat="server" Width="80%" ID="ddlBudgetType" class="form-control">
                                    
                                     <asp:ListItem Value="1">Fixed</asp:ListItem>
                                     <asp:ListItem Value="2">Per Hour</asp:ListItem>
                                 </asp:DropDownList>

                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="bidfield">
                            IsBudgetShared
                          
                               <asp:CheckBox ID="chkIsBudgetShared" onchange=" return Isbudgetsharedshow()" class="form-control" runat="server" />&nbsp;&nbsp;

                        </div>
                    </div>
                   
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class ="form-group">
                     <div class ="col-lg-12">
                        <div class ="bidfield">
                             Instructions & Query For Provider
                          
                                  
                    <asp:TextBox runat="server"  class="form-control" ID="txtQueryForPatner" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">

                    <div class="col-lg-4">
                        <div class="bidfield">
                           
                               Status
                         
                                  
                    <asp:DropDownList ID="ddlstatus" Width="80%" CssClass="form-control" runat ="server">
                         <asp:ListItem Value="0"> Select Status-</asp:ListItem>
                        <asp:ListItem Value="1">Approved</asp:ListItem>
                        <asp:ListItem Value="2">Not Reachable</asp:ListItem>
                        <asp:ListItem Value="3">Rescheduled</asp:ListItem>
                        <asp:ListItem Value="4">Requirement Not Clear</asp:ListItem>
                        <asp:ListItem Value="5">Escalate</asp:ListItem>
                        <asp:ListItem Value="6">Requirement Closed</asp:ListItem>
                    </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="bidfield">
                            Urgency
                           
                                  <asp:RadioButtonList ID="rblUrgency" runat="server" RepeatLayout="flow"
                                      RepeatDirection="Horizontal" data-toggle="buttons" class="btn-group">
                                      <asp:ListItem class="btn active" Value="1" Selected="True">Immediately</asp:ListItem>
                                      <asp:ListItem class="btn" Value="2">within 30 Days</asp:ListItem>
                                      <asp:ListItem class="btn" Value="3">>30 Days</asp:ListItem>
                                  </asp:RadioButtonList>

                        </div>
                    </div>

                   
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="form-group">
                    <div class="col-lg-12">
                        Status Comment
                       
                            <asp:TextBox ID="txtStatusComment" runat="server" class="form-control" TextMode="MultiLine" Width="100%"></asp:TextBox>

                    </div>
                </div>
            </div>
            <div class ="row" style ="text-align :center; margin-top :10px;">
                <div class ="form-group ">
                    <div class ="col-lg-12">
                        <asp:Button ID="btnSave" runat ="server" OnClick ="btnSave_Click" Text ="Back" CssClass ="form-control btn-success btn-lg" />
                    </div>
                </div>
            </div>
        </div>
         <asp:HiddenField runat="server" ID="ConsultantId" />
    </form>
</body>
</html>


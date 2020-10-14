<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin_Post_Project.aspx.cs" MasterPageFile="~/Customer/Site1.Master" Inherits="Benchkart.Customer.Signin_Post_Project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery.multifile.js"></script>
    <script src="../Scripts/Skills.js"></script>

    <style>
        .label {
            color: Black;
            font-size: medium;
            font-weight: normal;
            width: 100%;
            /*word-break: break-all;*/
            /*display: inline-flex;*/
            white-space: pre-wrap;
            margin-left: 40px;
            overflow-wrap: break-word;
            line-height: 2;
        }

        .nav > li {
            padding: 5px;
        }

            .nav > li > a {
                color: Black;
                background-color: #f5f5f5;
            }

        .nav-pills > li.active > a, .nav-pills > li.active > a:focus, .nav-pills > li.active > a:hover {
            color: #fff;
            background-color: #F79507;
        }
    </style>
    <style>
        a.disabled {
            pointer-events: none;
            cursor: default;
        }

        .fieldtitle {
            margin-top: 10px;
            text-align: left;
            margin-bottom: 5px;
            
            font-size: small;
            color: gray;
        }

        .container {
            width: 90%;
            padding: 10px;
                margin:20px;
        }

        @media (max-width: 767px) {
            .container {
                width: 100%;
               
            }
        }
    </style>

    <script type="text/javascript">
        function selectwebsite(radioButtonList) {
            for (var i = 0; i < radioButtonList.rows.length; ++i) {

                if (radioButtonList.rows[i].cells[0].firstChild.checked) {
                    $('#<%=txtCompanyName.ClientID %>').hide();
                }
                else {
                    $('#<%=txtCompanyName.ClientID %>').show();
                }
            }
        }
        function selectbudgetoption(radioButtonList) {
            for (var i = 0; i < radioButtonList.rows.length; ++i) {

                if (radioButtonList.rows[i].cells[0].firstChild.checked) {
                    $('#<%= ddlrupees.ClientID %>').show();
                    $('#<%= ddlusd.ClientID %>').hide();
                    document.getElementById("ddlusd").value = "";
                }
                else {
                    $('#<%= ddlrupees.ClientID %>').hide();
                    $('#<%= ddlusd.ClientID %>').show();
                    document.getElementById("ddlrupees").value = "";
                }

            }

        }
       

     

        function displayAllValidation() {

            var category = document.getElementById("ddlCategory");
            if (category.value == "") {
                alert("Please select project category");
                document.getElementById("ddlCategory").focus;
                return false;


            }
            var subcategory = document.getElementById("ddlSubCategory");
            if (subcategory.value == "") {
                alert("Please select project subcategory");
                document.getElementById("ddlSubCategory").focus;
                return false;
            }

            var roleproject = document.getElementById("txtProjectTitle.ClientID ").value;
            if (roleproject == "") {
                alert("Please fill the project title!");
                document.getElementById("txtProjectTitle.ClientID ").focus;
                return false;
            }

            var projectdescription = document.getElementById("txtProjectDescription.ClientID ").value;
            if (projectdescription == "") {
                alert("Please fill the project description!");
                document.getElementById("txtProjectDescription.ClientID ").focus;
                return false;
            }

          


        }

    </script>
    <style>
        .fade {
            opacity: 1;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            
            document.getElementById('<%=txtContactNumber.ClientID %>').maxLength = "20";
        });
    </script>

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
    </asp:ScriptManager>

   
        <div class="container-fluid" style="background-color: #f8f8f8;">
            <div class="row" style="margin: 20px;">
                   <div class="tab-content" id="firstrow" runat="server" style="text-align: center; margin-left:20px; margin-right:20px;
                    padding:20px; width: 90%; border-radius: 30px;
                  background-color: White; border:1px solid green; color: Black; font-size: medium;  margin-top: 10px;">
                  
                      
                        
                            <asp:Panel ID="pnlSecond" runat="server"  CssClass="tab-pane fade in active" DefaultButton="btnsubmit">
                                <div>
                                 
                                                     <div class="row">
                                                         <div class="col-sm-12">
                                                             <h3 style="color:gray;">Project Details</h3>
                                                         </div>
                                                     </div>
                                            <div class="row">
                                                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                 <ContentTemplate>
                                                <div class="col-sm-6">
                                                    <div class="fieldtitle">
                                                        
                                                        
                                                          <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" AutoPostBack="true"
                                                        Width="100%" Style="margin: 0 auto;border-radius:10px;" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                    <asp:ListItem Value="">Select Project Category</asp:ListItem>
                                                              <asp:ListItem Value="2">Website & Apps</asp:ListItem>
                                                        <asp:ListItem Value="1">Graphics & Design</asp:ListItem>
                                                        <asp:ListItem Value="3">Digital Marketing</asp:ListItem>
                                                        <asp:ListItem Value="4">Software</asp:ListItem>
                                                        <asp:ListItem Value="5">Cloud & Infra</asp:ListItem>
                                                        <asp:ListItem Value="6">Call Center</asp:ListItem>
                                                        <asp:ListItem Value="7">KPO</asp:ListItem>
                                                        <asp:ListItem Value="8">Back-Office</asp:ListItem>
                                                    </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rqCategory" runat="server" Font-Size="Small" ValidationGroup="btnsubmit" ErrorMessage="Please select category" ControlToValidate="ddlCategory" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                    
                                                  </div>
                                                    
                                                      
                                                </div>
                                              <div class="col-sm-6">
                                                    <div class="fieldtitle">
                                                       
                                                         
                                                         <asp:DropDownList ID="ddlSubCategory" class="form-control" 
                                                        AutoPostBack="true" runat="server" Style="margin: 0 auto; border-radius:10px;">
                                                       
                                                    </asp:DropDownList>
                                                  
                                                    <asp:RequiredFieldValidator ID="rqSubCategory" runat="server" Font-Size="Small" ValidationGroup="btnsubmit" ErrorMessage="Please select subcategory" ControlToValidate="ddlSubCategory" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                    
                                                 </div>
                                                   
                                                       
                                              </div>
                                             </ContentTemplate>
                                             </asp:UpdatePanel>
                                                </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="fieldtitle">
                                                         <asp:RadioButtonList ID="rblbudgetoption" runat ="server" Width="100%" Font-Size="Small" 
                                                              onclick="selectbudgetoption(this)" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="0" Selected="True">&nbsp;&nbsp;Budget (Rupees)</asp:ListItem>
                                                <asp:ListItem Value ="1">&nbsp;&nbsp;Budget (USD)</asp:ListItem>
                                            </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                   <div class="fieldtitle">
                                                    <asp:DropDownList ID="ddlrupees" runat ="server" Style=" border-radius: 10px;margin: 0 auto;"  class="form-control" >
                                                    
                                                    <asp:ListItem Value ="1" Selected="True"><INR 25000</asp:ListItem>
                                                    <asp:ListItem Value ="2">INR 25000-1 Lac</asp:ListItem>
                                                    <asp:ListItem Value ="3">INR 1 Lac-10 Lacs</asp:ListItem>
                                                    <asp:ListItem Value ="4">INR 10-50 Lacs</asp:ListItem> 
                                                    <asp:ListItem Value ="5">INR 50 Lacs +</asp:ListItem>
                                                </asp:DropDownList>
                                                  
                                                <asp:DropDownList ID="ddlusd" runat ="server" Style=" display:none; border-radius: 10px;margin: 0 auto;"  class="form-control" >
                                                    
                                                    <asp:ListItem Value ="6" Selected="True"><USD 1000</asp:ListItem>
                                                    <asp:ListItem Value ="7">USD 1K-5K</asp:ListItem>
                                                    <asp:ListItem Value ="8">USD 5K-20K</asp:ListItem>
                                                    <asp:ListItem Value ="9">USD 20 K-100K</asp:ListItem> 
                                                    <asp:ListItem Value ="10">USD 100K+</asp:ListItem>
                                                </asp:DropDownList>
                                                 </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="fieldtitle">
                                                       
                                                    
                                                    
                                                    <asp:TextBox ID="txtProjectTitle" class="form-control" style="border-radius:10px;" placeholder="Project Title"
                                                        runat="server"></asp:TextBox>
                                                        
                                                        <asp:RequiredFieldValidator ID="rqProjectTitle" runat="server" Font-Size="Small" ValidationGroup="btnsubmit" ErrorMessage="Please fill project title" ControlToValidate="txtProjectTitle" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                    
                                                        </div>
                                                     
                                               </div>
                                                </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="fieldtitle">
                                                    
                                                    

                                                    <asp:TextBox ID="txtProjectDescription" Height="80" runat="server" style="border-radius:10px;" placeholder="Project Description" TextMode="MultiLine"
                                                        class="form-control"></asp:TextBox>
                                                     
                                                          <asp:RequiredFieldValidator ID="rqProjectDescription" runat="server" Font-Size="Small" ValidationGroup="btnsubmit" ErrorMessage="Please fill project description" ControlToValidate="txtProjectDescription" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                    
                                                </div>
                                                     
                                                      
                                              </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="fieldtitle">
                                                        <h6> Can you share your Company's name?</h6>
                                                         <asp:RadioButtonList ID="rblwebsite" runat="server" Width="70%" Font-Size="Small"
                                                              onclick="selectwebsite(this)" RepeatDirection="Horizontal">
                                                    <asp:ListItem  Value="1" Selected="True">&nbsp;&nbsp;No</asp:ListItem>
                                                    <asp:ListItem  Value="2">&nbsp;&nbsp;Yes</asp:ListItem>
                                                    
                                                </asp:RadioButtonList>
                                                         </div>
                                               
                                                   
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="fieldtitle">
                                                         <asp:TextBox ID="txtCompanyName" runat ="server" CssClass="form-control" Placeholder="Company Name" Style="display:none;  border-radius:10px;"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="fieldtitle">
                                                         <span style="font-size:small;">File Upload (if any)</span>
                                                
                                                    </div>
                                                     <asp:FileUpload ID="File1" runat="server" Width="100%" CssClass="multi" AllowMultiple="true" />
                                                </div>
                                            </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="fieldtitle">
                                               <h6>Contact Number</h6>
                                            <asp:TextBox ID="txtContactNumber" runat="server" Placeholder="Contact Number" style="border-radius:10px;" CssClass="form-control"></asp:TextBox>
                                   
                                                  <asp:RequiredFieldValidator ID="rqtxtContactNumber" runat="server" Font-Size="Small" ValidationGroup="btnsubmit" ErrorMessage="Please fill contact number" ControlToValidate="txtContactNumber" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                   
                                                </div>
                                             
                                                      
                                                </div>
                                    </div>
                                       <div class="row">
                                             <div class="col-sm-12">
                                            <asp:Button ID="btnsubmit" runat="server" Text="Post Your Project" class="form-control"  
                                                ValidationGroup="btnsubmit" OnClick="btnsubmit_Click" Style="margin-bottom: 30px; margin-top: 20px;" />
                                        </div>
                                       </div>
                                </div>
                             
                            </asp:Panel>

                           
                 </div>       
                   
                
            </div>
        </div>
    </div>
</asp:Content>


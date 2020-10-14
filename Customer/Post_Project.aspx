<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post_Project.aspx.cs" Inherits="Benchkart.Customer.Post_Project1" %>

<%@ Register Src="~/Customer/ucCustomerFooter.ascx" TagPrefix="uc2" TagName="ucCustomerFooter" %>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async="async" src="https://www.googletagmanager.com/gtag/js?id=UA-142828286-2"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-142828286-2');
    </script>
    <!-- Required meta tags -->
    <meta charset='utf-8'>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport'>
    <base>
    <meta name="description" content="Post Project" />
    <title>benchkart - post project</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <%-- <link rel="stylesheet" href="css/Custom.css" />--%>
    <script src="../Scripts/Custom.js"></script>
    <script src="../Scripts/jquery.multifile.js"></script>
    <script src="../Scripts/Skills.js"></script>
    <link href="../css/benchkart.css" rel="stylesheet" type="text/css" />


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

        .postfields {
            width: 70% !important;
            padding: 16px;
            font-size: medium;
            margin-top: 35px;
        }

        .btnpostfields {
            margin-top: 50px;
            margin-bottom: 10px;
            width: 70% !important;
            font-size: 18px;
        }

        @media (max-width: 767px) {
            .postfields {
                width: 90% !important;
            }

            .btnpostfields {
                width: 90% !important;
            }
        }
    </style>
    <style>
        a.disabled {
            pointer-events: none;
            cursor: default;
        }
    </style>
    <style>
        label {
            font-weight: normal;
        }

        h6 {
            text-align: left;
            line-height: 1px;
            font-size: small;
            
        }

        input[type=text] {
            width: 100%;
        }

        .divField {
            width: 100%;
            margin: 0 auto;
            margin-top: 15px;
            text-align: left;
        }

        tr {
            padding-right: 10px;
        }

        td {
            padding-right: 10px;
        }
    </style>
    <style>
        @media (max-width: 767px) {
            #divPanel {
                width: 95%;
            }

            .divField {
                width: 95%;
            }
        }

        @media (min-width: 768px) {
            #divPanel {
                width: 70%;
            }

            .btn-group > .btn:first-child {
                margin-left: 0;
                min-width: 500px;
            }
        }
    </style>
    <style>
        a.disabled {
            pointer-events: none;
            cursor: default;
        }
    </style>
    <style>
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
   
    <script type="text/javascript">
        function selectwebsite(radioButtonList) {
            for (var i = 0; i < radioButtonList.rows.length; ++i) {

                if (radioButtonList.rows[i].cells[0].firstChild.checked) {
                    $("#txtCompanyName").hide();
                }
                else {
                    $("#txtCompanyName").show();
                }
            }
        }

        function selectbudgetoption(radioButtonList) {
            for (var i = 0; i < radioButtonList.rows.length; ++i) {

                if (radioButtonList.rows[i].cells[0].firstChild.checked) {
                    $("#ddlrupees").show();
                    $("#ddlusd").hide();
                    document.getElementById("ddlusd").value = "";
                   
                }
                else {
                    $("#ddlrupees").hide();
                    $("#ddlusd").show();
                    document.getElementById("ddlrupees").value = "";
                   
                   
                }
            }
        }


        function checkpassword() {
            console.log($('#File1'));
            //return false;
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
           
           
            var roleproject = document.getElementById("txtProjectTitle").value;
            if (roleproject == "") {
                alert("Please fill the project title try again !");
                document.getElementById("txtProjectTitle").focus;
                return false;
            }

            var projectdescription = document.getElementById("txtProjectDescription").value;
            if (projectdescription == "") {
                alert("Please fill the project description try again !");
                document.getElementById("txtProjectDescription").focus;
                return false;
            }
            var password = document.getElementById("txtPassword").value;
            if (password == "") {
                alert("Password is required.");
                document.getElementById("txtPassword").focus;
                return false;
            }
            var confirmpassword = document.getElementById("txtConfPassword").value;
            if (confirmpassword == "") {
                alert("Confirm Password is required.")
                document.getElementById("txtConfPassword").focus;
                return false;
            }

            if (password == confirmpassword) {
               

                if (document.getElementById("chkpasswordread").checked == true) {
                    return true;
                }
                else {
                    alert('Please agree to the terms & conditions')
                    return false;
                }

            }
            else {
                alert("Confirmation password does not match. Please retry");
                document.getElementById("txtConfPassword").focus;
                return false;
            }

        }

    </script>
    <script type="text/javascript">
        $(document).ready(function () {
           // $("#txtBudgetOpional").attr("maxlength", 8);
            $("#txtContactNumber").attr("maxlength", 20);
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
        </asp:ScriptManager>

      
        <div>
            <div style="background-color: black; color: Black; display: flow-root; height: 60px;">
                <div id="logo" style="float: left;">
                    <h1 class="header"><a href="https://www.benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
                </div>
                <div style="float: right; margin-top: 20px;">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.benchkart.com" Text="Home" ForeColor="Blue" style="color: white; font-size: small; margin-right: 10px; text-decoration: underline;"></asp:HyperLink>
                </div>
            </div>
        </div>
        <div class="container-fluid" style="background-color: #f8f8f8;">
            <div class="row" style="margin: 20px;">



                <div class="tab-content" id="firstrow" runat="server" style="text-align: center; width: 90%; border-radius: 40px;
                  background-color: White; border:1px solid green; color: Black; font-size: medium;  margin-top: 10px;">
                    <asp:UpdatePanel ID="updatepnl" runat="server" UpdateMode="Conditional">
                         <Triggers>
                            <asp:PostBackTrigger ControlID="btnSetPassword" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlFirst" runat="server" DefaultButton="btnNext" Style="display: none; ">
                                <div class="col-md-5">
                                    <asp:Image ID="Image3" ImageUrl="~/Images/Category/Form3-min.jpg" Style="margin-top: 10px; border-radius:20px; margin-left: 20px; margin-right:20px;"
                                        Width="90%" Height="500px" runat="server" />
                                </div>
                                <div class="col-md-7">
                                    <h1 style="font-size: 25px; color: Gray;">Welcome to Benchkart
                                    </h1>
                                    <h3 style="margin-bottom:20px; font-size: 25px; color: Gray;">
                                        Let's create an account for you
                                    </h3>

                                    <div class="divField">
                                        <asp:TextBox ID="txtFullname" class="form-control postfields" placeholder="Full Name" Style="border-radius: 10px;" runat="server"></asp:TextBox>
                                        <div style="text-align: center;">
                                            <asp:RequiredFieldValidator ID="reqtxtFullname" runat="server" SetFocusOnError="True"
                                                Display="Dynamic" ControlToValidate="txtFullname" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your name"
                                                ToolTip="Name is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="divField">
                                        <asp:TextBox ID="txtEmailid" class="form-control postfields" placeholder="Work Email Id" Style="border-radius: 10px;" runat="server"></asp:TextBox>
                                        <div style="text-align: center;">
                                            <asp:Label runat="server" ID="lblEmailExists" Font-Size="Small" Style="display: none;" ForeColor="Red" Text="This Email already present with us. Please login!"></asp:Label>

                                            <asp:RequiredFieldValidator ID="reqtxtEmail" runat="server" SetFocusOnError="True"
                                                Display="Dynamic" ControlToValidate="txtEmailid" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill the email"
                                                ToolTip="E-mail is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>

                                            <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Invalid email"
                                                SetFocusOnError="True" ControlToValidate="txtEmailid" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                                ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />
                                        </div>
                                    </div>
                                    <div class="divField">
                                        <asp:TextBox runat="server" ID="txtContactNumber" ValidationGroup="Signup"
                                            class="form-control postfields" Style="text-align: left; border-radius: 10px;" Placeholder="Mobile Number"></asp:TextBox>
                                        <div style="text-align: center;">
                                        <asp:RequiredFieldValidator ID="reqtxtContactNumber" runat="server" SetFocusOnError="True"
                                            Display="Dynamic" ControlToValidate="txtContactNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill contact number"
                                            ToolTip="Contact number is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                      <%-- <asp:RegularExpressionValidator ID="regtxtContactNumber" runat="server" ErrorMessage="Invalid phone - accept only 10 digit mobile number"
                                            SetFocusOnError="True" ControlToValidate="txtContactNumber" ValidationExpression="^[0-9]{10}$"
                                            ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />--%>
                                   </div>
                                            </div>

                                    <div class="divField">
                                        <asp:Button ID="btnNext" runat="server" Text="Next" class="form-control btnpostfields"
                                            Style="border-radius: 10px; margin-bottom:180px;" ValidationGroup="Signup"
                                            OnClick="btnNext_Click" />
                                    </div>
                                    
                                    <div class="divField">
                                    
                                    <h4 style="font-size:small; text-align:center;">Benchkart services are absolutely free for customers<br />

                                          Your personal details are never shared without your approval


</h4>
                                        </div>
                                </div>
                                
                            </asp:Panel>
                            <asp:Panel ID="pnlSecond" runat="server" Style="display: none; margin:20px; padding:20px;" DefaultButton="btnSetPassword">
                              
                                <div class="col-md-12">
                                    <h2 style="font-size: 25px; color: Gray;">Tell us about your Project
                                    </h2>
                                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                  
                                            <div class="row">
                                                
                                                <div class="col-md-6">
                                                <div class="divField">
                                                
                                                <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" AutoPostBack="true"
                                                    Style=" border-radius: 10px;" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
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
                                               
                                            </div>
                                                     </div>
                                                    <div class="col-md-6">
                                                          <div class="divField">



                                               
                                                <asp:DropDownList ID="ddlSubCategory" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" AutoPostBack="true" class="form-control" runat="server"
                                                    Style=" border-radius: 10px;">
                                                    
                                                    <%--<asp:ListItem Value="18">Website Development</asp:ListItem>
                                                    <asp:ListItem Value="19">Website Designing - UI/UX</asp:ListItem>
                                                    <asp:ListItem Value="20">Website Maintenance</asp:ListItem>
                                                    <asp:ListItem Value="21">Mobile Applications</asp:ListItem>
                                                    <asp:ListItem Value="22">Any Other</asp:ListItem>--%>
                                                </asp:DropDownList>



                                           
                                                    </div>
                                                </div>
                                             </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlCategory" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                            </div>
                                           
                                          
                                            
                                    <div class="row">
                                        <div class="col-md-6">
                                              <div class="divField">
                                            <asp:RadioButtonList ID="rblbudgetoption" runat ="server" Width="100%" Font-Size="Small" onclick="selectbudgetoption(this)" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="0" Selected="True">&nbsp;&nbsp;Budget (Rupees)</asp:ListItem>
                                                <asp:ListItem Value ="1">&nbsp;&nbsp;Budget (USD)</asp:ListItem>
                                            </asp:RadioButtonList> 
                                                  </div>
                                        </div>
                                        <div class="col-md-6">
                                             <div class="divField">
                                                <asp:DropDownList ID="ddlrupees" runat ="server" Style=" border-radius: 10px;"  CssClass="form-control" >
                                                   
                                                    <asp:ListItem Value ="1" Selected="True"><INR 25000</asp:ListItem>
                                                    <asp:ListItem Value ="2">INR 25000-1 Lac</asp:ListItem>
                                                    <asp:ListItem Value ="3">INR 1 Lac-10 Lacs</asp:ListItem>
                                                    <asp:ListItem Value ="4">INR 10-50 Lacs</asp:ListItem> 
                                                    <asp:ListItem Value ="5">INR 50 Lacs +</asp:ListItem>
                                                </asp:DropDownList>
                                                  
                                                <asp:DropDownList ID="ddlusd" runat ="server" Style=" display:none; border-radius: 10px;"  CssClass="form-control" >
                                                   
                                                    <asp:ListItem Value ="6" Selected ="True"><USD 1000</asp:ListItem>
                                                    <asp:ListItem Value ="7">USD 1K-5K</asp:ListItem>
                                                    <asp:ListItem Value ="8">USD 5K-20K</asp:ListItem>
                                                    <asp:ListItem Value ="9">USD 20 K-100K</asp:ListItem> 
                                                    <asp:ListItem Value ="10">USD 100K+</asp:ListItem>
                                                </asp:DropDownList>
                                            
                                            </div>
                                        </div>
                                    </div>
                                           <div class="row">
                                               <div class="col-md-12">
                                            <div class="divField">

                                                <asp:TextBox ID="txtProjectTitle" class="form-control" placeholder="Name your Project" Style="border-radius: 10px;"
                                                    runat="server"></asp:TextBox>


                                            </div>
                                                   </div>
                                           </div>

                                          <div class="row">
                                              <div class="col-md-12">
                                               <div class="divField">

                                                
                                                <asp:TextBox ID="txtProjectDescription" Style="height: 70px; padding: 15px; border-radius: 10px;" 
                                                     runat="server" TextMode="MultiLine" placeholder="Describe Project in short"
                                                    class="form-control"></asp:TextBox>

                                            </div>
                                                  </div>
                                          </div>
                                           <div class="row">
                                               <div class="col-md-6">
                                                   <div class="divField">
                                                <h6>Can you share your Company's name?</h6>
                                                <asp:RadioButtonList ID="rblwebsite" runat="server" Width="70%" Font-Size="Small" onclick="selectwebsite(this);"
                                                    RepeatDirection="Horizontal" data-toggle="buttons">
                                                    <asp:ListItem  Value="1" Selected="True">&nbsp;&nbsp;No</asp:ListItem>
                                                    <asp:ListItem  Value="2">&nbsp;&nbsp;Yes</asp:ListItem>
                                                    
                                                </asp:RadioButtonList>
                                               
                                            </div>
                                               </div>
                                               <div class="col-md-6">
                                                <div class="divField">
                                                     <h6></h6>
                                                <asp:TextBox ID="txtCompanyName" runat ="server" CssClass="form-control" Placeholder="Company Name" Style="display:none;  border-radius:10px;"></asp:TextBox>
                                                </div>
                                               </div>
                                           </div>
                                            

                                         <div class="row">
                                             <div class="col-md-12">
                                            <div class="divField">
                                                <h6 style="font-size:small;">File Upload (if any)</h6>
                                            

                                                <asp:FileUpload ID="File1" runat="server" Width="100%" CssClass="multi" AllowMultiple="true" />
                                                
                                            </div>
                                                 </div>
                                             </div>
                                          <div class="row">
                                              <div class="col-md-6">
                                               <div class="divField">
                                               
                                                <%--  <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" Placeholder="Password" CssClass="form-control"></asp:TextBox>--%>
                                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Style="border-radius: 10px;" placeholder="Set your account password" CssClass="form-control"></asp:TextBox>
                                            </div>
                                              </div> 
                                              <div class="col-md-6">
                                                   <div class="divField">
                                              
                                                <asp:TextBox runat="server" ID="txtConfPassword" TextMode="Password" Style="border-radius: 10px;" Placeholder="Confirm Password" class="form-control"></asp:TextBox>
                                            </div>
                                              </div>
                                          </div>
                                          
                                           <div class ="row">
                                               <div class="col-md-12">
                                            <div class="divField" >
                                                <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="check" style="margin-bottom:10px; text-align :left;" Checked="true" Font-Size="Small" Text="Remember me" />
                                            </div>
                                                   </div>
                                               </div>
                                             <div class="row">
                                                 <div class="col-md-12">
                                            <div class="divField" >
                                                <span>
                                                 <a style="font-size:small;">   <asp:CheckBox ID="chkpasswordread" runat="server" Style="margin-left: 1%; font-size:small; text-align: left;" />
                                                    &nbsp;&nbsp;I Agree to the </a>
                                <a href="../Policies/Terms-of-use-for-Clients.html" style="font-size :small;" target="_blank">Terms of use for Clients</a>&nbsp;&&nbsp;<a href="../Policies/Benchkart-Privacy-Policy.html" style="font-size:small;" target="_blank">Privacy Policy</a></span>
                                            </div>
                                                     </div>
                                                 </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="divField">
                                                <asp:Button ID="btnSetPassword" runat="server" Text="Post Your Project " OnClientClick="return checkpassword()"
                                                    Style=" margin-bottom: 10px; border-radius: 10px; font-size: 18px;" OnClick="btnSetPassword_Click"
                                                    CssClass="form-control" />
                                            </div>
                                       </div>
                                        </div>
                                </div>
                                
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>


        </div>



        <div style ="background-color:black; font-weight:bold; color:white; text-align :center; padding-top:20px; padding-bottom:20px;">
             
                     Copyright <strong>2020 Benchkart Services Pvt Ltd</strong>. All Rights Reserved
               
        </div>
        <div>
            <!--Start of Tawk.to Script-->
            <%-- <script type="text/javascript">
                var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
                (function () {
                    var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                    s1.async = true;
                    s1.src = 'https://embed.tawk.to/5d983f3fdb28311764d765fe/default';
                    s1.charset = 'UTF-8';
                    s1.setAttribute('crossorigin', '*');
                    s0.parentNode.insertBefore(s1, s0);
                })();
            </script>--%>
            <!--End of Tawk.to Script-->
        </div>
    </form>
</body>
</html>

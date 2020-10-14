<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicInfo.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.BasicInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .divField {
            margin: 0 auto;
            margin-top: 15px;
            width: 90%;
            font-size: 16px;
        }

        h5 {
            margin-bottom: 5px;
        }

        label {
            font-weight: normal;
        }

        .row {
            margin-bottom: 20px;
        }
    </style>
    <script type="text/javascript">
        function displaypnlBasicNext() {
            if (Page_ClientValidate()) {
                var x = document.getElementById('<%=ddlIncorporation.ClientID %>').value;
                if (x == "") {
                    alert("Please select incorporation date!");
                    return false;
                }

                var x = document.getElementById('<%=ddlNumberofEmployee.ClientID %>').value;
                if (x == "") {
                    alert("Please select number of employees!");
                    return false;
                }

                var x = document.getElementById('<%=ddlCompanyDescribed.ClientID %>').value;
                if (x == "") {
                    alert("Please select company best described as!");
                    return false;
                }

                var x = document.getElementById('<%=ddlCompanyType.ClientID %>').value;
                if (x == "") {
                    alert("Please select company type!");
                    return false;
                }


                var atLeast = 1
                var opt = document.getElementById('<%=chkblClientPrimarilyFrom.ClientID %>');
                var select = opt.getElementsByTagName("input");
                var counter = 0;
                for (var i = 0; i < select.length; i++) {
                    if (select[i].checked) {
                        counter++;
                    }
                }
                if (atLeast > counter) {
                    alert("Please select atleast 1 'Clients Primarily from' item(s)");
                    return false;
                }

                var atLeast = 1
                var opt = document.getElementById('<%=rblPricePositioning.ClientID %>');
                var select = opt.getElementsByTagName("input");
                var counter = 0;
                for (var i = 0; i < select.length; i++) {
                    if (select[i].checked) {
                        counter++;
                    }
                }
                if (atLeast > counter) {
                    alert("Please select your company price positioning");
                    return false;
                }

                var atLeast = 1
                var opt = document.getElementById('<%=chkblPrimaryCustomerSegments.ClientID %>');
                 var select = opt.getElementsByTagName("input");
                 var counter = 0;
                 for (var i = 0; i < select.length; i++) {
                     if (select[i].checked) {
                         counter++;
                     }
                 }
                 if (atLeast > counter) {
                     alert("Please select atleast 1 'Primary Customer Segments' item(s)");
                     return false;
                 }

                 var x = document.getElementById('<%=ddlPrimarySourceofRevenue.ClientID %>').value;
                 if (x == "") {
                     alert("Please select company best described as!");
                     return false;
                 }

            }

        }

        $(document).ready(function () {
            document.getElementById('<%=txtContactNumber.ClientID %>').maxLength = "20";
            document.getElementById('<%=txtProjectValue.ClientID %>').maxLength = "8";
            document.getElementById('<%=txtRepresentativeContactNumber.ClientID %>').maxLength = "20";

        });


    </script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Content  -->
    <div id="content" style="padding: 0px;">
        <div class="card" style="margin: 0 auto; background-color: White; margin-top: 30px; margin-bottom: 50px; width: 90%;">
            <div class="container" style="width: 90%;">
                <h3 style="color: Gray; text-align: center; margin-top: 20px;">Basic Information</h3>
                <div class="row">
                    <div class="col-md-12">
                        <asp:HyperLink ID="hplResetPassword" runat="server" Text="Reset Password" NavigateUrl="~/Partner/ResetPassword" style="float: right; color: blue; text-decoration: underline;"></asp:HyperLink>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="divField">
                                    Company Name
								<asp:TextBox ID="txtCompanyName" runat="server" placeholder=" Company Name " class="form-control" ValidationGroup="Signup"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqtxtCompanyName" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtCompanyName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your company name"
                                        ToolTip="Company Name is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="divField">
                                    Company Webside URL
								<asp:TextBox ID="txtCompanyWebsideUrl" runat="server" placeholder="Company Website Url" CssClass="form-control" ValidationGroup="Signup"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqtxtWebsite" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtCompanyWebsideUrl" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill your company website"
                                        ToolTip="Company website is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="regtxtWebsite" runat="server" ErrorMessage="Invalid website."
                                        SetFocusOnError="True" ControlToValidate="txtCompanyWebsideUrl" ValidationExpression="^((http|https)://)?([\w-]+\.)+[\w]+(/[\w- ./?]*)?$"
                                        ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />
                                </div>

                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-6">
                                <div class="divField">
                                    Primary Contact Person Name
								<asp:TextBox ID="txtPrimaryContactPersonName" runat="server" placeholder="Primary Contact Person Name" ValidationGroup="Signup"
                                    class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtPrimaryContactPersonName" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill contact person name"
                                        ToolTip="Company Name is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="divField">
                                    ContactNumber
								<asp:TextBox ID="txtContactNumber" runat="server" MaxLength="20" placeholder="ContactNumber" CssClass="form-control" ValidationGroup="Signup"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqtxtContactNumber" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtContactNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill contact number"
                                        ToolTip="Contact number is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regtxtContactNumber" runat="server" ErrorMessage="Invalid phone"
                                        SetFocusOnError="True" ControlToValidate="txtContactNumber" ValidationExpression="^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$"
                                        ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />
                                </div>
                            </div>
                        </div>
                        <div class="row">


                            <div class="col-md-6">
                                <div class="divField">
                                    Year of Incorporation
								<asp:DropDownList ID="ddlIncorporation" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="divField">
                                    Number of Employee
								<asp:DropDownList ID="ddlNumberofEmployee" runat="server" CssClass="form-control">
                                    <asp:ListItem Selected="" Value="">Select</asp:ListItem>
                                    <asp:ListItem Value="1-9">1-9</asp:ListItem>
                                    <asp:ListItem Value="10-49">10-49</asp:ListItem>
                                    <asp:ListItem Value="50-99">50-99</asp:ListItem>
                                    <asp:ListItem Value="100-499">100-499</asp:ListItem>
                                    <asp:ListItem Value="500-999">500-999</asp:ListItem>
                                    <asp:ListItem Value=">1000">>1000</asp:ListItem>
                                </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                        <div class="row">



                            <div class="col-md-6">
                                <div class="divField">
                                    Your Company Type
								<asp:DropDownList ID="ddlCompanyType" runat="server" CssClass="form-control">
                                    <asp:ListItem Selected="" Value="">Select</asp:ListItem>
                                    <asp:ListItem Value="Private Ltd Company">Private Ltd Company</asp:ListItem>
                                    <asp:ListItem Value="Public Ltd Company">Public Ltd Company</asp:ListItem>
                                    <asp:ListItem Value="Unlimited Company">Limited Liability Partnership(LLP)</asp:ListItem>
                                    <asp:ListItem Value="Sole proprietorship">Sole Proprietorship</asp:ListItem>
                                    <asp:ListItem Value="Partnership">Partnership</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="divField">
                                    Your Company is Best Described as
								<asp:DropDownList ID="ddlCompanyDescribed" runat="server" CssClass="form-control">
                                    <asp:ListItem Selected="" Value="">Select</asp:ListItem>
                                    <asp:ListItem Value="Small">Small</asp:ListItem>
                                    <asp:ListItem Value="Medium">Medium</asp:ListItem>
                                    <asp:ListItem Value="Large">Large</asp:ListItem>
                                    <asp:ListItem Value="MNC">MNC</asp:ListItem>
                                    <asp:ListItem Value="Startup">Startup</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="divField">
                                    Primary Source of Revenue
                                            <asp:DropDownList ID="ddlPrimarySourceofRevenue" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="Graphics & Design">Graphics & Design</asp:ListItem>
                                                <asp:ListItem Value="Web Development">Web Development</asp:ListItem>
                                                <asp:ListItem Value="Ecommerce">Ecommerce</asp:ListItem>
                                                <asp:ListItem Value="Digital Marketing">Digital Marketing</asp:ListItem>
                                                <asp:ListItem Value="Apps & Software">Apps & Software</asp:ListItem>
                                                <asp:ListItem Value="Cloud & Infrastructure">Cloud & Infrastructure</asp:ListItem>
                                                <asp:ListItem Value="Voice Services">Voice Services</asp:ListItem>
                                                <asp:ListItem Value="Knowledge Services">Knowledge Services</asp:ListItem>
                                                <asp:ListItem Value="Backoffice Operations">Backoffice Operations</asp:ListItem>
                                            </asp:DropDownList>

                                </div>
                            </div>
                            <div class=" col-md-6">
                                <div class="divField">
                                    Company GST Number
								        <asp:TextBox ID="txtCompanyGSTNumber" runat="server" placeholder="Company GST Number" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqtxtCompanyGSTNumber" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtCompanyGSTNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill GST number"
                                        ToolTip="Please fill GST number" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="divField">
                                    Client Primarily From
								        <asp:CheckBoxList ID="chkblClientPrimarilyFrom" runat="server" RepeatDirection="Horizontal" Font-Bold="false">
                                            <asp:ListItem Value="India">&nbsp;India&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="US">&nbsp;US&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="Europe">&nbsp;Europe&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="Others">&nbsp;Others&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                        </asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="divField">
                                    Price Positioning
								<asp:RadioButtonList ID="rblPricePositioning" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="Economy">&nbsp;Economy&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                    <asp:ListItem Value="Value">&nbsp;Value&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                    <asp:ListItem Value="premium">&nbsp;Premium&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>

                                </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col-md-12">
                                <div class="divField">
                                    Primary Customer Segments
								        <asp:CheckBoxList ID="chkblPrimaryCustomerSegments" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="Startup">&nbsp;Startup&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="Small">&nbsp;Small&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="Medium">&nbsp;Medium&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="Large">&nbsp;Large&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="MNC">&nbsp;MNCs&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                        </asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class=" col-md-12">
                                <div class="divField">
                                    Min. Project Value below which you wouldn't want to work on(INR)?(Optional)
								        <asp:TextBox ID="txtProjectValue" runat="server" placeholder="Min. Project Value below which you wouldn't want to work on(INR)?(Optional)"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=alert('Input only integer');"
                                            oncopye="return false" oncopy="return false" oncute="return false" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-12">
                                <div class="divField">
                                    About Company(Visible to Customer)
							<asp:TextBox runat="server" ID="txtAboutCompany" placeholder="Introduce yourself to your client. This content can be taken from 'About us' in your website, but original content is preferred.(Max 200 words)"
                                TextMode="MultiLine" Style="height: 100px;" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqtxtAboutCompany" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtAboutCompany" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill something about your company"
                                        ToolTip="Please fill something about your company" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="divField">
                                    Company Address
							<asp:TextBox ID="txtCompanyAddress" runat="server" CssClass="form-control" placeholder="Please fill Company Address"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqtxtCompanyAddress" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtCompanyAddress" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill company address"
                                        ToolTip="Please fill company address" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="divField">
                                    Alternate Company Representative Name
                                </div>
                                <asp:TextBox ID="txtAlternateCompanyRepresentativeName" runat="server" CssClass="form-control" ValidationGroup="Signup"
                                    placeholder="Alternate Company Representative Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtRepresentativeName" runat="server" SetFocusOnError="True"
                                    ValidationGroup="Signup" Display="Dynamic" ControlToValidate="txtAlternateCompanyRepresentativeName"
                                    ForeColor="Red" Font-Size="Small" ErrorMessage="Representative Name is required." ToolTip="Company Representative Name is required."></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6">
                                <div class="divField">
                                    Representative Contact Number
							<asp:TextBox ID="txtRepresentativeContactNumber" runat="server" placeholder="Representative Contact Number" CssClass="form-control" ValidationGroup="Signup"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtRepresentativeContactNumber" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill contact number"
                                        ToolTip="Contact number is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid phone"
                                        SetFocusOnError="True" ControlToValidate="txtRepresentativeContactNumber" ValidationExpression="^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$"
                                        ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="divField">
                                    Representative Email
							<asp:TextBox ID="txtRepresentativeEmail" runat="server" placeholder="RepresentativeEmail" CssClass="form-control" ValidationGroup="Signup"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqtxtEmail" runat="server" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="txtRepresentativeEmail" ForeColor="Red" Font-Size="Small" ErrorMessage="Please fill the email"
                                        ToolTip="E-mail is required." ValidationGroup="Signup"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Invalid email"
                                        SetFocusOnError="True" ControlToValidate="txtRepresentativeEmail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                        ForeColor="Red" Font-Size="Small" ValidationGroup="Signup" Display="Dynamic" />
                                </div>
                            </div>
                        </div>
                        <asp:Button ID="btnEdit" runat="server" class="form-control"
                            Width="70%" Text="Edit" OnClick="btnEdit_Click" Style="margin-top: 40px;" />
                        <br />
                        <asp:Button ID="btnSubmit" runat="server" Visible="false" class="form-control"
                            Style="background-color: #18D26E; margin-bottom: 40px;" ValidationGroup="Signup"
                            Width="70%" Text="Save" OnClientClick="return displaypnlBasicNext();" OnClick="btnSubmit_Click" />

                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

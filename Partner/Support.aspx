<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Support.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function validatedata() {
            var txtMessage = document.getElementById('<%=txtMessage.ClientID %>').value;
            if (txtMessage == "") {
                alert("Please fill the message query & try again !");
                document.getElementById("txtMessage").focus;
                return false;
            }
        }
    </script>
    <link href="../css/dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="card" style="margin: 0 auto; background-color: White; margin-top: 30px; width: 80%;">
            <div class="container" style="width: 90%;">
                <div class="row">
                    <div class="col-lg-12">
                        <div style="text-align: center; width: 100%; padding: 5px; margin: 0 auto; font-size: medium; margin-top: 10px;">
                            <h2 style="font-size: 20px; text-align: left; margin-left: 10%; color: gray;">Email us your query at outsource@benchkart.com
                            </h2>
                            OR
                            <h2 style="font-size: 20px; text-align: left; margin-left: 10%; color: gray;">Message Query
                            </h2>
                            <div style="margin-left: 10%; text-align: left;">
                                <asp:TextBox runat="server" ID="txtMessage" Width="100%" TextMode="MultiLine" class="form-control" placeholder="Message query" Height="150"></asp:TextBox>
                            </div>
                            <asp:Button ID="btnSend" runat="server" Text="Send" class="form-control" OnClick="btnSend_Click" OnClientClick="return validatedata();" Style="background: Green; color: White; font-size: medium; font-weight: bold; margin-bottom: 30px; margin-top: 20px; margin-left: 10%; width: 72%;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </asp:Content>


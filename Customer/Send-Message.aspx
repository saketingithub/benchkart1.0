<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Send-Message.aspx.cs" MasterPageFile="~/Customer/Site1.Master" Inherits="Benchkart.Customer.Send_Message" %>


<asp:Content id="Content1" contentplaceholderid="head" runat="server">

    <script src="../Scripts/jquery.multifile.js"></script>

   
    <style>
        input[type='file'] {
            color: transparent; /* Hides your "No File Selected" */
        }
    </style>

</asp:Content>
<asp:Content id="body" contentplaceholderid="ContentPlaceHolder1" runat="server">

        <div class="card" style="margin: 0 auto; background-color: White; margin-top: 20px; margin-bottom: 50px;">
            <div class="content" style="width: 90%; margin-top: 0px; border: none;">
                <!-- Page Content  -->
               
                <br />
                <asp:TextBox ID="txtMessage" runat="server" Placeholder="Type Message..." TextMode="MultiLine" ValidationGroup="Send" class="form-control" Height="100px" Width="80%"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ValidationGroup="Send" ID="reqtxtMessage" ControlToValidate="txtMessage"
                    Style="display: block !important;" ForeColor="Red">Please write message...</asp:RequiredFieldValidator>
                <asp:FileUpload ID="FileUploadControl" runat="server" class="multi" AllowMultiple="true" />
                <asp:Button ID="btnMessage" runat="server" Text="Send" ValidationGroup="Send" Style="background-color: green; width: 30%;
                 margin: 0 auto; height: 30px; margin-top: 20px;" OnClick="btnMessage_Click" /><br />
                
               
            </div>
        </div>
    </asp:Content>

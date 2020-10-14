<%@ Page Language="C#" Title="Message Details" AutoEventWireup="true" Inherits="Benchkart.Partner.Message_Details" MasterPageFile="~/Partner/Site1.Master" CodeBehind="Message_Details.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery.multifile.js"></script>

    <style>
        input[type='file'] {
            color: transparent; /* Hides your "No File Selected" */
        }
    </style>

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="card" style="margin: 0 auto; background-color: White; margin-top: 20px; margin-bottom: 50px;">
            <div class="content" style="width: 90%; margin-top: 0px; border: none;">
                <!-- Page Content  -->
                <br />
                <br />
                <h5 style="margin-right: 15px; line-height: 1.5px;">Project Title </h5>
                <asp:Label ID="lblSubject" runat="server" Style="font-weight: bold; font-size: large; color: gray;"></asp:Label><br />
                <br />
                <asp:TextBox ID="txtMessage" runat="server" Placeholder="Type Message..." TextMode="MultiLine" ValidationGroup="Send" class="form-control" Height="100px" Width="80%"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ValidationGroup="Send" ID="reqtxtMessage" ControlToValidate="txtMessage"
                    Style="display: block !important;" ForeColor="Red">Please write message...</asp:RequiredFieldValidator>
                <asp:FileUpload ID="FileUploadControl" runat="server" class="multi" AllowMultiple="true" />
                <asp:Button ID="btnMessage" runat="server" Text="Send" ValidationGroup="Send" Style="background-color: green; width: 30%; margin: 0 auto; height: 30px; margin-top: 20px;" OnClick="btnMessage_Click" /><br />
                <br />
                 <h4>
                            <i class="fa fa-fw fa-paperclip fa-x"></i><b>Attachments</b></h4>
                        <asp:Panel ID="pnlDownloads" runat="server" Style="padding-left: 50px;"></asp:Panel>
                <asp:PlaceHolder
                    ID="placeMessageDetails"
                    runat="server"></asp:PlaceHolder>
            </div>
        </div>
 </asp:Content>

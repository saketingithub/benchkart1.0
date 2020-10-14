<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Skills.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.Skills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/Skills.js"></script>

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="card" style="margin: 0 auto; background-color: White; margin-top: 30px; margin-bottom: 50px; width: 90%;">
            <div class="container" style="width: 90%;">
                <h3 style="color: Gray; text-align: center; margin-top: 15px;">Talent / Skills Offered</h3>
                <asp:TextBox ID="txtSkills" runat="server" Width="80%" Style="margin-top: 35px;" class="form-control" Placeholder="eg: java, salesforce"></asp:TextBox>
                <h5 style="margin: 0 auto; margin-top: 30px; text-align: left; width: 80%; font-size: 16px; font-weight: normal; color: gray;">Many Clients want to hire talent for short to medium term on an hourly basis. In such an arrangement, Clients would seek an estimate from you for ‘hiring’ your talent for a specified duration for a specified no. of hours. In most cases, your talent would have to work from your facility during this period & deliver work as per the instructions of the hirer. You can provide your proposal basis talent availability & Rates/hour.</h5>
                <div class="divField" style="margin-top: 10px; margin-bottom: 15px; text-align: center;">
                    <asp:CheckBox ID="chkIsTalentShared" runat="server" Checked="true" Style="margin-top: 20px; text-align: center;"></asp:CheckBox>&nbsp;&nbsp;Yes, I want to provide Flexi-talent (not applicable to Certain BPO Services)
                </div>
                <div class="divField" style="margin-top: 30px; margin-bottom: 35px; text-align: center;">

                    <asp:Button ID="btnUpdateSkills" runat="server" class="form-control" Style="margin-left: 25px; display: inline-block; color: White;"
                        Width="45%" Text="Save" OnClick="btnUpdateSkills_Click" />
                </div>
            </div>
        </div>
     </asp:Content>

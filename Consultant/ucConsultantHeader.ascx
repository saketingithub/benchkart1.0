<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucConsultantHeader.ascx.cs" Inherits="Benchkart.Consultant.ucConsultantHeader" %>
<div style="background-color: White; color: Black; display: flow-root; height: 50px;">
     <div id="logo" style="float: left;">
                <h1 class="header"><a href="https://www.benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
            </div>
    <div style="float: right; margin-right: 20px; font-size: 15px; margin-top: 10px;">
        <asp:LinkButton ID="lnkSignout" runat="server" Text="Sign out" OnClick="lnkSignout_Click"></asp:LinkButton>
    </div>
</div>
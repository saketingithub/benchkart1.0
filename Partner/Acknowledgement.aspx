<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs"
    Inherits="Benchkart.Partner.Acknowledgement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/benchkart.css" rel="stylesheet" />
</head>
<body style="background-color: #f8f8f8; margin: 0;">
    <form id="form1" runat="server">
        <div style="background-color: black; color: Black; display: flow-root; height: 70px; margin: 0; padding: 0; width: 100%;">
             <div id="logo" style="float: left;">
                <h1 class="header"><a href="https://benchkart.com" style="text-decoration: none;"><span style="color: #18D26E;"><span style="font-size: 34px;">|</span> bench</span><span style="color: #F79507;">kart</span></a></h1>
            </div>
        </div>
        <div style="background-color: #f8f8f8;">
            <div style="text-align: left; width: 75%; padding: 40px; margin: 0 auto; background-color: White; border: 1px solid gray; margin-bottom: 40px; margin-top: 50px; color: gray;">
                <h2 style="font-weight: normal; line-height: 1.2;">All Done!<br />
                    Thanks for your Interest in joining Benchkart as a Partner. Your Reference no is
                    <asp:Label runat="server" ID="lblReferenceId"></asp:Label>.<br /><br />
                    Our Assessment Team will review your proposal and if required, may reach out to you to schedule a visit to your office or to seek clarifications on phone.  
We will target to respond to you within 3 working days to take this forward.<br /><br />
                    Thanks once again for your interest!!<br />
                    For any queries please write to partnership@benchkart.com with your reference no in the subject
                </h2>
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="Test.aspx.cs" Inherits="Benchkart.Partner.Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type = "text/javascript">
function DisableButton() {
    alert('a');
    document.getElementById("<%=Button1.ClientID %>").disabled = true;
     alert('b');
}
window.onbeforeunload = DisableButton;
</script>
<script type = "text/javascript">
    function DisableButtons() {
        var inputs = document.getElementsByTagName("INPUT");
        for (var i in inputs) {
            if (inputs[i].type == "button" || inputs[i].type == "submit") {
                inputs[i].disabled = true;
            }
        }
    }
   // window.onbeforeunload = DisableButtons; //uncomment to use this script.
</script>
</head>
<body>
<form id="form1" runat="server">
<asp:Button ID="Button1" runat="server" Text="Button" OnClick = "Button1_Clicked" />
</form>
</body>
</html>

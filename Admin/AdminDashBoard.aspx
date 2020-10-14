<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashBoard.aspx.cs" Inherits="Benchkart.Admin.AdminDashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset='utf-8'/>
    <meta content='width=device-width, initial-scale=1.0, user-scalable=0' name='viewport' />
    <base />
    <meta name="description" content="" />
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row"  style="margin-top:10%; text-align :center">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                   <div class="form-group">
                       <div class="col-lg-6">
                           
                           
                           <asp:HyperLink ID="hyplRequestList" style="font-size :large;" NavigateUrl="~/Admin/Requests.aspx" runat="server" >Request List</asp:HyperLink><br />
                         <asp:Label ID="lblRequest" runat="server" ></asp:Label> 
                                

                       </div>
                       <div class="col-lg-6">
                           
                           <asp:HyperLink ID="hyplProjectList" style="font-size :large;" NavigateUrl="~/Admin/Projects.aspx" runat ="server">Project List</asp:HyperLink><br />
                          <asp:Label ID="lblProjectList" runat="server"  ></asp:Label>
                             

                       </div>
                   </div>
                </div>
         
          <div class="row" style="margin-top:20%;text-align:center;">
              <div class="form-group">
                  <div class="col-lg-6">
                      
                      <asp:HyperLink ID="hyplPartnerList" style="font-size :large;" NavigateUrl="~/Admin/Partners.aspx" runat ="server" >Partner List</asp:HyperLink><br />
                      <asp:Label ID="lblPartnerList" runat ="server"  ></asp:Label>
                         
                  </div>
                  <div class="col-lg-6">
                      
                      <asp:HyperLink ID="hyplCustomerList" style="font-size :large;" runat ="server" NavigateUrl="~/Admin/Customers.aspx" >Customer List</asp:HyperLink><br />
                      <asp:Label ID="lblCustomerList" runat ="server" ></asp:Label>
                      
                  </div>
              </div>
          </div>
        </div>
    </form>
</body>
</html>

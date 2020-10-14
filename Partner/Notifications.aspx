<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" MasterPageFile="~/Partner/Site1.Master" Inherits="Benchkart.Partner.Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('[id*=tblNotifications]').footable();
        });
    </script>
    <style>
        td {
            padding: 10px;
            border: 1px solid lightgray;
        }

        th {
            padding: 5px;
            border: 1px solid lightgray;
            font-family: OpenSans-Regular;
            font-size: 18px;
            color: Gray;
        }
    </style>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Page Content  -->
        <div id="content" style="padding: 0px;">
            <asp:Panel ID="pnlSearchingProjects" runat="server" Visible="false" Style="text-align: center; height: 200px; margin: 0 auto; padding: 20px;">
                <h2 style="margin-top: 100px;">We are searching for projects as per your company services.
                    <br />
                    Please update your all services if not already done.</h2>
            </asp:Panel>
            <div>
                <asp:Repeater ID="rptNotifications" runat="server">
                    <HeaderTemplate>
                        <table id="tblNotifications" class="footable" border="0" width="100%">
                            <thead>
                                <tr style="height: 50px; background: Gray;">
                                    <th data-class="expand" style="width: 80%; text-align: center;">Notification</th>
                                    <th data-class="expand" style="width: 20%; text-align: center;">Date
                                    </th>

                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr style="background-color: White; border: 1px solid gray; color: #808080; padding-left: 5px;">
                                <td>
                                    <%#Eval("Notification")%><br />
                                </td>
                                <td>
                                    <%#Eval("CreationDate")%>
                                </td>

                            </tr>
                        </tbody>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </asp:Content>

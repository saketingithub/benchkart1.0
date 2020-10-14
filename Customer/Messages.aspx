<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" MasterPageFile="~/Customer/Site1.Master" Inherits="Benchkart.Customer.Messages" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .footable>thead>tr>th, .footable>thead>tr>td
        {
            background-image: linear-gradient(to bottom,#18D26E,#212529)!important;
        }

        td {
            padding: 10px;
            border: 1px solid Gray;
        }

        .bidfield {
            margin-top: 10px;
            text-align: left;
            font-size: small;
            margin-bottom: 5px;
            font-weight: bold;
            color: Black;
        }

        i {
            font-weight: bold;
            font-size: small;
            margin-top: 0px;
            float: left;
            margin-right: 10px;
        }

        h4 {
            font-weight: bold;
            font-size: small;
            margin-top: 20px;
            color: Black;
        }


        /* Add responsiveness - will automatically display the navbar vertically instead of horizontally on screens less than 500 pixels */
        @media screen and (max-width: 800px) {
            .navbar a {
                float: none;
                display: block;
            }
        }
    </style>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=tblMessages]').footable();
        });
    </script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Content  -->
    <div id="content" style="padding: 0px;">

        <asp:Repeater ID="rptMessages" runat="server" OnItemDataBound="rptMessages_ItemDataBound">
            <HeaderTemplate>
                <table id="tblMessages" class="footable" border="0" width="100%">
                    <thead>
                        <tr style="height: 40px; background: lightseagreen;">
                            <th data-class="expand" style="width: 15%; text-align: center; color: white;">
                                <asp:Label ID="lblSender" runat="server"></asp:Label>
                            </th>
                            <th style="display: table-cell; width: 25%; text-align: center; color: white;">Subject
                            </th>
                            <th style="display: table-cell; width: 35%; text-align: center; color: white;" data-hide="phone">Message
                            </th>
                            <th style="display: table-cell; width: 15%; text-align: center; color: white;" data-hide="phone">Date
                            </th>
                            <th style="display: table-cell; width: 10%; text-align: center; color: white;" data-hide="phone"></th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tbody>
                    <tr style="background-color: White; border: 1px solid gray; padding-left: 5px;">
                        <td>
                            <%#Eval("CustomerCompanyName")%><br />
                        </td>
                        <td>
                            <%#Eval("ProjectTitle")%>
                        </td>
                        <td>
                            <%# Eval("Message").ToString().Length <= 200 ? Eval("Message") : Eval("Message").ToString().Substring(0,
                        200)+"..." %>
                        </td>
                        <td>
                            <%#Eval("CreationDate")%>
                        </td>
                        <td>
                            <asp:HyperLink ID="hplViewDetail" Text="Reply" Style="text-decoration: underline;" ForeColor="Blue" runat="server" NavigateUrl='<%# String.Format("~/Customer/Message_Details?id={0}", DataBinder.Eval(Container.DataItem, "MessageId")) %>'>           
                            </asp:HyperLink>
                        </td>
                    </tr>
                </tbody>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

    </div>

</asp:Content>

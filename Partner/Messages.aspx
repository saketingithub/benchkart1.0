<%@ Page Language="C#" Title="Partner Messages" AutoEventWireup="True" Inherits="Benchkart.Partner.Messages" MasterPageFile="~/Partner/Site1.Master" CodeBehind="Messages.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
    rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>

     <script type="text/javascript">
        $(function () {
            $('[id*=tblMessages]').footable();
        });
    </script>
    <style>
         .footable>thead>tr>th, .footable>thead>tr>td
        {
            background-image: linear-gradient(to bottom,#18D26E,#212529)!important;
        }
        td {
            border: 1px solid lightgray;
            padding: 10px !important;
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
              <div>
                <asp:Repeater ID="rptMessages" runat="server" OnItemDataBound="rptMessages_ItemDateBound">
                    <HeaderTemplate>
                        <table id="tblMessages" class="footable" border="0" width="100%">
                            <thead>
                                <tr style="height: 40px; background: lightseagreen;">
                                    <th data-class="expand" style="width: 15%; text-align: center;color: white;"><asp:Label ID="lblSender" runat="server"></asp:Label> </th>
                                    <th style="display: table-cell; width: 25%; text-align: center;color: white;">Subject
                                    </th>
                                    <th style="display: table-cell; width: 35%; text-align: center;color: white;" data-hide="phone">Message
                                    </th>
                                    <th style="display: table-cell; width: 15%; text-align: center;color: white;" data-hide="phone">Date
                                    </th>
                                    <th style="display: table-cell; width: 10%; text-align: center;color: white;" data-hide="phone"></th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr style="background-color: White; border: 1px solid gray; color: #808080; padding-left: 5px;">
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
                                    <asp:HyperLink ID="hplViewDetail" Text="Reply" Style="text-decoration: underline;" ForeColor="Blue" runat="server" NavigateUrl='<%# String.Format("~/Partner/Message_Details?id={0}", DataBinder.Eval(Container.DataItem, "MessageId")) %>'>           
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
        </div>
    </asp:Content>

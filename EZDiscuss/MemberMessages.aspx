<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberMessages.aspx.cs" Inherits="EZDiscuss.MemberMessages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divMessages" style="width:300px; height:400px; background-color:aliceblue; overflow:scroll;">
            <table>
                <tr>
                    <td><asp:Label ID="l1" runat="server" Text="Date"></asp:Label></td>
                    <td><asp:Label ID="l2" runat="server" Text="Messages"></asp:Label></td>
                </tr>
            </table>
        
            <table>
                <tr>
                    <td>
                        <asp:Repeater ID="rMemberMessages" runat="server">
                            <HeaderTemplate>
                                <asp:Label ID="lMsg" runat="server" Text="Messages:" CssClass="mprofile"></asp:Label><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lM" runat="server" Text='<%# Eval("Message") %>'></asp:Label><br /><br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

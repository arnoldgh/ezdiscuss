<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLogin.ascx.cs" Inherits="EZDiscuss.UserControls.ucLogin" %>

<link href="../StyleSheet/EZStyleCommon.css" rel="stylesheet" />

<div>
<table>
    <tr>
        <td colspan="5">
            <asp:Label ID="lNA" runat="server" Text="Already Registered? Sign-in:" CssClass="smallFont"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lM" runat="server" CssClass="smallFont errorMessage10"></asp:Label>
        </td>
    </tr>
    <tr>    
        <td><asp:Label ID="lE" runat="server" Text="Email:" CssClass="smallFont"></asp:Label></td>
        <td><asp:TextBox ID="tE" runat="server" Text="arnoldgh@gmail.com" Width="130px" CssClass="smallFont"></asp:TextBox></td>
        <td><asp:Label ID="lP" runat="server" Text="Password:" CssClass="smallFont"></asp:Label></td>        
        <td><asp:TextBox ID="tP" runat="server" TextMode="Password" Width="70px" CssClass="smallFont"></asp:TextBox></td>
        <td><asp:Button ID="bLogin" runat="server" Text="Login" OnClick="bLogin_Click" CausesValidation="false" formnovalidate="formnovalidate" Width="50px" Height="20px" CssClass="smallFont"/></td>
    </tr>        
</table>
</div>
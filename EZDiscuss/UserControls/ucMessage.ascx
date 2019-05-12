<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMessage.ascx.cs" Inherits="EZDiscuss.UserControls.ucMessage" %>
<link rel="stylesheet" href="../StyleSheet/EZStyle.css" type="text/css" />

<style>
    .message {font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-weight: 100; font-size: 8pt; color: blue;}
</style>

<div>
    <asp:Literal ID="lC" runat="server" Text="Write a message:"></asp:Literal>
    <br />
    <asp:TextBox ID="tM" runat="server" TextMode="MultiLine" Width="85%" CssClass="message"></asp:TextBox>
    <asp:Button ID="bP" runat="server" Text="Post" OnClick="bP_Click" Width="70px" Height="30px" />
    <asp:Button ID="bSendPrivateMessage" runat="server" Text="Send Private Message" OnClick="bSendPrivateMessage_Click" />
</div>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMailInvite.aspx.cs" Inherits="EZDiscuss.SendMailInvite" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td><asp:Label ID="lGroup" runat="server" Text="Select Group:"></asp:Label></td>
                <td><asp:DropDownList ID="dGroup" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td cellpadding="2px" cellspacing="5px" style="width:150px;"><asp:Label ID="l1" runat="server" Text="Name:"></asp:Label></td>
                <td cellpadding="2px" cellspacing="5px"><asp:TextBox ID="tName" runat="server" Width="400px"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="tName" ErrorMessage="*Required" Text="*Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td cellpadding="2px" cellspacing="5px" style="width:150px;"><asp:Label ID="l2" runat="server" Text="Email Address:"></asp:Label></td>
                <td cellpadding="2px" cellspacing="5px"><asp:TextBox ID="tEmail" runat="server" Width="400px"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="rEmail" runat="server" ControlToValidate="tEmail" ErrorMessage="*Required" Text="*Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td cellpadding="2px" cellspacing="5px" style="width:150px;"><asp:Label ID="l3" runat="server" Text="Subject:"></asp:Label></td>
                <td colspan="2" cellpadding="2px" cellspacing="5px"><asp:TextBox ID="tSubject" runat="server" Width="400px" Text="Invitation to join discussion"></asp:TextBox></td>                
            </tr>
            <tr>
                <td cellpadding="2px" cellspacing="5px" style="width:150px;"><asp:Label ID="l4" runat="server" Text="Message"></asp:Label></td>
                <td colspan="2" cellpadding="2px" cellspacing="5px"><asp:TextBox ID="tMessage" runat="server" TextMode="MultiLine" Width="400px" Rows="4"></asp:TextBox></td>
            </tr>
            <tr>
                <td cellpadding="2px" cellspacing="5px" style="width:150px;"><asp:Button ID="btnPreview" runat="server" Text="Preview" OnClick="btnPreview_Click" Width="150px" /></td>
                <td colspan="2" cellpadding="2px" cellspacing="5px"><asp:Button ID="btnSendMail" runat="server" OnClick="btnSendMail_Click" Text="Send email invitation" Width="200px" /></td>
            </tr>
            <tr>
                <td cellpadding="2px" cellspacing="5px"><asp:Label ID="lMessage" runat="server" Text="Email invitation sent successfully!" Visible="false"></asp:Label></td>
            </tr>
        </table>           
    </div>
    </form>
</body>
</html>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSendEmailInvite.ascx.cs" Inherits="EZDiscuss.UserControls.ucSendEmailInvite" %>

<link rel="stylesheet" href="../StyleSheet/EZStyle.css" type="text/css" />
<link rel="stylesheet" href="../StyleSheet/EZStyleCommon.css" type="text/css" />

<style>
    td { padding: 2px; border-spacing: 5px;
    }

</style>

<div>
    <table>
        <tr>
            <td><asp:Label ID="lGroup" runat="server" Text="Select Group:" CssClass="labelCommon"></asp:Label></td>
            <td><asp:DropDownList ID="dGroup" runat="server" Width="305px" CssClass="bigFont16"></asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width:150px;"><asp:Label ID="l1" runat="server" Text="Name:" CssClass="labelCommon"></asp:Label></td>
            <td><asp:TextBox ID="tName" runat="server" required="required" placeholder="Enter name" Width="300px" CssClass="textboxCommon" CausesValidation="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width:150px;"><asp:Label ID="l2" runat="server" Text="Email Address:" CssClass="labelCommon"></asp:Label></td>
            <td><asp:TextBox ID="tEmail" runat="server" required="required" placeholder="Enter valid email address" TextMode="Email" Width="300px" CssClass="textboxCommon" CausesValidation="false"></asp:TextBox></td>            
        </tr>
<%--        <tr>
            <td style="width:150px;"><asp:Label ID="l3" runat="server" Text="Subject:" CssClass="labelCommon"></asp:Label></td>
            <td"><asp:TextBox ID="tSubject" runat="server" Width="300px" Text="Invitation to join discussion" CausesValidation="false" CssClass="textboxCommon"></asp:TextBox></td>                
        </tr>
        <tr>
            <td style="width:150px;"><asp:Label ID="l4" runat="server" Text="Message:" CssClass="labelCommon"></asp:Label></td>
            <td><asp:TextBox ID="tMessage" runat="server" TextMode="MultiLine" Width="300px" Rows="5" CssClass="noResize"></asp:TextBox></td>
        </tr>
--%>
        <tr>
            <td colspan="2"><asp:Label ID="lMessage" runat="server" Text="Email invitation sent successfully!" Visible="false"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2">
<%--                <asp:Button ID="btnPreview" runat="server" Text="Preview" OnClick="btnPreview_Click" CssClass="buttonCommon" Width="100px" />
                &nbsp;&nbsp;&nbsp;--%>
                <asp:Button ID="btnSendMail" runat="server" OnClick="btnSendMail_Click" Text="Send email invitation" CssClass="buttonCommon" />
            </td>
        </tr>

    </table>           
</div>

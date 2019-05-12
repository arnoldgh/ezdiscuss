<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucStatistics.ascx.cs" Inherits="EZDiscuss.UserControls.ucStatistics" %>

<style>
    .font12 { font-size:12px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-weight:bold;
    }
    .font14 { font-size:14px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-weight:bold;
    }
</style>
<div>
    <table>
        <tr>
            <td><asp:Label ID="lGroups" runat="server" Text="Number of Groups created: " CssClass="font12"></asp:Label></td>
            <td><asp:Label ID="lGroupsNum" runat="server" CssClass="font14" Text="450"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="lMembers" runat="server" Text="Registered Members: " CssClass="font12"></asp:Label></td>
            <td><asp:Label ID="lMembersNum" runat="server" CssClass="font14" Text="9350"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="lTopics" runat="server" Text="Topics created: " CssClass="font12"></asp:Label></td>
            <td><asp:Label ID="lTopicsNum" runat="server" CssClass="font14" Text="4000"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="lMessages" runat="server" Text="Messages: " CssClass="font12"></asp:Label></td>
            <td><asp:Label ID="lMessagesNum" runat="server" CssClass="font14" Text="99500"></asp:Label></td>
        </tr>
    </table>    
</div>
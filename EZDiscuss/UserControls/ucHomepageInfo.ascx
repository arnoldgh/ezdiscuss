<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucHomepageInfo.ascx.cs" Inherits="EZDiscuss.UserControls.ucHomepageInfo" %>

<style>
    .font20 { font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-weight: bold; font-size: 20px;
    }
    .font18 { font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-weight: bold; font-size: 18px;
    }

</style>
<div>
    <asp:Label ID="l1" runat="server" CssClass="font20" Text="Experience Board Meeting virtually!"></asp:Label>
    <br /><br /><br />
    <asp:Label ID="l2" runat="server" CssClass="font18" Text="Create your own Group(s) and discuss topics with:"></asp:Label>
    <asp:Image runat="server" ImageUrl="~/Images/agt_forum.png" />
    <br /><br />
    <ol class="font18">
        <li>Friends</li>
        <li>Family</li>
        <li>Colleagues</li>
        <li>Organization</li>
        <li>Community</li>
        <li>Misc...</li>
    </ol>
    <br />
    
</div>
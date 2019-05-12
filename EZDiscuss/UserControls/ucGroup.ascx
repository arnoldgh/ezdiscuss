<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucGroup.ascx.cs" Inherits="EZDiscuss.UserControls.ucGroup" %>

<link rel="stylesheet" href="../StyleSheet/EZStyle.css" type="text/css" />
<link rel="stylesheet" href="../StyleSheet/EZStyleCommon.css" type="text/css" />

<div id="dG">
    <table>
        <tr>
            <td><asp:Label ID="lG" runat="server" Text="Group Name:" Width="150px" CssClass="labelCommon"></asp:Label></td>
            <td><asp:TextBox ID="tG" runat="server" required="required" placeholder="Enter Groupname" Width="250px" CssClass="textboxCommon" CausesValidation="false"></asp:TextBox>
               <%-- <asp:RequiredFieldValidator ID="rG" runat="server" ControlToValidate="tG" ErrorMessage="*Required" CssClass="errorMessage10"></asp:RequiredFieldValidator>--%>
            </td>            
        </tr>
        <tr>
            <td><asp:Label id="lGT" runat="server" Text="Group Type: " CssClass="labelCommon"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlGroupType" runat="server" CssClass="textboxCommon" Height="25px" CausesValidation="false">
                    <asp:ListItem Value="1" Selected="True">Friends</asp:ListItem>
                    <asp:ListItem Value="2">Family</asp:ListItem>
                    <asp:ListItem Value="3">Colleagues</asp:ListItem>
                    <asp:ListItem Value="4">Fraternity</asp:ListItem>
                    <asp:ListItem Value="5">Sorority</asp:ListItem>
                    <asp:ListItem Value="6">Association</asp:ListItem>
                    <asp:ListItem Value="7">Organization</asp:ListItem>
                    <asp:ListItem Value="8">Community</asp:ListItem>
                    <asp:ListItem Value="9">Other</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lD" runat="server" Text="Group Description:" Width="150px" CssClass="labelCommon"></asp:Label></td>
            <td><asp:TextBox ID="tD" runat="server" Height="60px" Width="250px" TextMode="MultiLine" CssClass="textboxCommon noResize" CausesValidation="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lM" runat="server" Visible="false" CssClass="errorMessage"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="bG" runat="server" Text="Create" Width="100px" OnClick="bG_Click" CssClass="buttonCommon" CausesValidation="false" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="bC" runat="server" Text="Cancel" Width="100px" CssClass="buttonCommon" CausesValidation="false" />
            </td>
        </tr>
        <tr>
            <td>&nbsp</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>

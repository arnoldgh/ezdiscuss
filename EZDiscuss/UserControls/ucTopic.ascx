<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTopic.ascx.cs" Inherits="EZDiscuss.UserControls.ucTopic" %>

<link rel="stylesheet" href="../StyleSheet/EZStyle.css" type="text/css" />
<style>
    .topicCreate {width:100%; height:100%;  }
</style>
<div>
    <div id="divCreate" class="topicCreate">
        <table>
            <tr>
                <td colspan="2"><asp:Label ID="l" runat="server" Text="Create new Topic:" CssClass="smallFont bold"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lT" runat="server" Text="Topic Title:" CssClass="smallFontBlue"></asp:Label></td>
                <td>
                    <asp:TextBox ID="tT" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tT" ErrorMessage="*Required" ForeColor="Red" CssClass="smallFont"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lD" runat="server" Text="Topic Description:" CssClass="smallFontBlue"></asp:Label></td>
                <td><asp:TextBox ID="tD" runat="server" TextMode="MultiLine" Rows="3" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lM" runat="server" Width="200px" CssClass="smallFont "></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="bCreate" runat="server" Text="Create" OnClick="bCreate_Click" /></td>
            </tr>            
        </table>
    </div>
</div>
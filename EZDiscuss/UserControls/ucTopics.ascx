<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTopics.ascx.cs" Inherits="EZDiscuss.UserControls.ucTopics" %>

<link rel="stylesheet" href="../StyleSheet/EZStyle.css" type="text/css" />
<style>
    .topicDisplay {width:100%; height:600px; overflow: scroll;  }
</style>
<div>
    <div id="divDisplay" class="topicDisplay">
        <asp:Label ID="lTs" runat="server" Text="List of Topics:"></asp:Label>
        <br />
        <asp:Repeater ID="rTopics" runat="server" OnItemDataBound="rTopics_ItemDataBound" OnItemCommand="rTopics_ItemCommand">
            <ItemTemplate>
                <table style="width:100%">
                    <tr>
                        <td style="width:100%">
                            <asp:Button ID="bT" runat="server" UseSubmitBehavior="false" Width="280px" Text='<%# Eval("TopicTitle") %>' ToolTip='<%# Eval("TopicDescription") %>' CommandName="Display" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDiscussionBoard.ascx.cs" Inherits="EZDiscuss.UserControls.ucDiscussionBoard" %>
<%@ Register Src="~/UserControls/ucTopics.ascx" TagPrefix="uc1" TagName="ucTopics" %>
<%@ Register Src="~/UserControls/ucTopic.ascx" TagPrefix="uc1" TagName="ucTopic" %>
<%@ Register Src="~/UserControls/ucMessage.ascx" TagPrefix="uc1" TagName="Message" %>
<%@ Register Src="~/UserControls/ucMessages.ascx" TagPrefix="uc1" TagName="ucMessages" %>

<link rel="stylesheet" href="../StyleSheet/EZStyle.css" type="text/css" />
<div class="discussionBoard">
    <div id="dTopics" runat="server" class="Topics">
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

    <div id="divMessages" class="Messages">
        <uc1:ucMessages runat="server" ID="ucMessages" />
    </div>

    <div id="divTopics" class="createTopic">
        <uc1:ucTopic runat="server" id="ucTopic" />        
    </div>

    <div class="createMessage">
        <uc1:Message ID="nM" runat="server" />
    </div>    
</div>

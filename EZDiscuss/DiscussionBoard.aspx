<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true" CodeBehind="DiscussionBoard.aspx.cs" Inherits="EZDiscuss.DiscussionBoard" %>

<%--<%@ Register src="UserControls/ucDiscussionBoard.ascx" tagname="ucDiscussionBoard" tagprefix="uc1" %>--%>
<%@ Register Src="~/UserControls/ucTopic.ascx" TagPrefix="uc1" TagName="ucTopic" %>
<%@ Register Src="~/UserControls/ucMemberProfile.ascx" TagPrefix="uc1" TagName="ucMP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function checkMaxLength(txt) {
            
        }

        function HighlightGreen(btn) {
            //document.getElementById(btn).className = "highlightGreen";
            var button = document.getElementById(btn);
            
            $('.button').removeClass('font16 bold center roundCorners').addClass('highlightGreen');

            //$("[id='_btnTopic']").toggleClass("font16 bold center roundCorners");
        }

    </script>

<link rel="stylesheet" href="../StyleSheet/EZStyle.css" type="text/css" />
    <style>
        .font6 { font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-size:6pt;
        }
        .font8 { font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-size:8px;
        }
        .font10 { font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-size:10px;
        }
        .font12 { font-family:'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-size:12px;
        }
        .font14 { font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-size:14px;
        }
        .font16 { font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-size:16px;
        }
        .font18 { font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-size:18px;
        }
        .font20 { font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-size:20px;
        }
        .bold { font-weight: bold;
        }
        .sectionHeaderBackground { background-color:aliceblue;
        }
        .mainMessage { color: white;
        }
        .alternateMessage { color: yellow;
        }
        .highlight { background-color: yellow;
        }
        .highlightGreen { background-color: green; color: white;
        }
        .lightColor { background-color: salmon;
        }
        .center { align-content:center;
        }
        .roundCorners { border-radius:10px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="c" runat="server">
    
    <asp:Timer ID="updateTimer" runat="server" OnTick="updateTimer_Tick" Interval="30000"></asp:Timer>    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="updateTimer" EventName="Tick" />            
        </Triggers>
        <ContentTemplate>         
            <div class="discussionBoard">
                <div id="divGroups" class="Groups">
                    <asp:Label ID="lGroups" runat="server" Text="Select Group to display:" CssClass="font18 bold"></asp:Label>
                    <br />
                    <asp:RadioButtonList ID="rblGroups" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblGroups_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass="font18 bold">
                        <asp:ListItem Text="Created" Value="1" Selected="True" />
                        <asp:ListItem Text="Joined" Value="2" />
                        <asp:ListItem Text="Both" Value="3" />
                    </asp:RadioButtonList>
                    <asp:DropDownList ID="ddlGroups" runat="server" Width="290px" OnSelectedIndexChanged="ddlGroups_SelectedIndexChanged" CssClass="font16 bold" AutoPostBack="true" BackColor="#ffff66"></asp:DropDownList>
                    <br />
                    <asp:Label ID="lTopics" runat="server" Text="Topics:" CssClass="labelCommon bold"></asp:Label>
                </div>

                <div id="divTopics" class="Topics">                    
                    <div id="divDisplay" class="topicDisplay">
                        <asp:Repeater ID="rTopics" runat="server" OnItemDataBound="rTopics_ItemDataBound" OnItemCommand="rTopics_ItemCommand">
                            <ItemTemplate>
                                <table style="width:100%">
                                    <tr>
                                        <td style="width:100%">                                            
                                            <asp:Button ID="btnTopic" runat="server" ClientIDMode="AutoID" CssClass="font16 center roundCorners" UseSubmitBehavior="false" Width="260px" Text='<%# Eval("TopicTitle") %>' ToolTip='<%# Eval("TopicDescription") %>' CommandName="DisplayMessage" CausesValidation="false" OnClientClick="HighlightGreen(this.id);" OnMouseOver="HighlightGreen(this.id);" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <table style="width:100%">
                                    <tr>
                                        <td style="width:100%">
                                            <asp:Button ID="btnTopic" runat="server" ClientIDMode="AutoID" CssClass="font16 center roundCorners" UseSubmitBehavior="false" Width="260px" Text='<%# Eval("TopicTitle") %>' ToolTip='<%# Eval("TopicDescription") %>' CommandName="DisplayMessage" CausesValidation="false" OnClientClick="HighlightGreen(this.id);" />
                                        </td>
                                    </tr>
                                </table>
                            </AlternatingItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div id="divMessagesContainer" class="MessagesOutsideContainer">
                    <div id="topicTitle" class="TopicTitle">
                        <asp:Label ID="lTopicTitle" runat="server" CssClass="font16 sectionHeader"></asp:Label>
                    </div>
                    <div id="messages" class="MessagesInsideContainer" style="background-image:url(Images/chalkboard-green.jpg); background-size: cover;">
                        <asp:Repeater ID="rMessages" runat="server" OnItemDataBound="rMessages_ItemDataBound">
                            <ItemTemplate>
                                <table class="mainMessage" style="table-layout:fixed;">
                                    <tr>
                                        <td style="column-width:60px; border-bottom: solid; border-bottom-color: red; border-bottom-width:thin;">
                                            <asp:Label ID="lU" runat="server" Text='<%# Eval("FirstName") %>' CssClass="font12" Width="60px"></asp:Label>
                                        </td>
                                        <td style="column-width:390px;">
                                            <asp:Label ID="l1" runat="server" CssClass="font14" Text='<%# Eval("Message") %>' Width="390px"></asp:Label>
                                        </td>
                                        <td style="column-width:50px; text-align: right;">
                                            <asp:Label ID="l2" runat="server" Text='<%# Eval("DateCreated") %>' CssClass="font10" Width="50px"></asp:Label>
                                        </td>
                                        <td style="column-width:20px;">
                                            <%--<asp:Image ID="i1" runat="server" ImageUrl="~/Images/new.png" Visible="false" Height="20px" Width="20px" />--%>
                                            <asp:HiddenField ID="hD" runat="server" Value='<%# Eval("DateCreated") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <table class="alternateMessage">
                                    <tr>
                                        <td style="column-width:60px; border-bottom:solid; border-bottom-color: red; border-bottom-width:thin;">
                                            <asp:Label ID="lU" runat="server" Text='<%# Eval("FirstName") %>' CssClass="font12" Width="60px"></asp:Label>
                                        </td>
                                        <td style="column-width:390px;">
                                            <asp:Label ID="l1" runat="server" CssClass="font14" Text='<%# Eval("Message") %>' Width="390px"></asp:Label>
                                        </td>
                                        <td style="column-width:50px;">
                                            <asp:Label ID="l2" runat="server" Text='<%# Eval("DateCreated") %>' CssClass="font10" Width="50px"></asp:Label>
                                        </td>
                                        <td style="column-width:20px;">
                                            <%--<asp:Image ID="i1" runat="server" ImageUrl="~/Images/new.png" Visible="false" Height="20px" Width="20px" />--%>
                                            <asp:HiddenField ID="hD" runat="server" Value='<%# Eval("DateCreated") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </AlternatingItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div id="divParticipants">
                        <div id="m1" class="participant"> <uc1:ucMP runat="server" id="ucMP1" /></div> 
                        <div id="m2" class="participant"> <uc1:ucMP runat="server" id="ucMP2" /></div> 
                        <div id="m3" class="participant"> <uc1:ucMP runat="server" id="ucMP3" /></div> 
                        <div id="m4" class="participant"> <uc1:ucMP runat="server" id="ucMP4" /></div> 
                        <div id="m5" class="participant"> <uc1:ucMP runat="server" id="ucMP5" /></div> 
                        <div id="m6" class="participant"> <uc1:ucMP runat="server" id="ucMP6" /></div> 
                        <div id="m7" class="participant"> <uc1:ucMP runat="server" id="ucMP7" /></div> 
                        <div id="m8" class="participant"> <uc1:ucMP runat="server" id="ucMP8" /></div> 
                        <div id="m9" class="participant"> <uc1:ucMP runat="server" id="ucMP9" /></div> 
                        <div id="m10" class="participant"> <uc1:ucMP runat="server" id="ucMP10" /></div>    
                        <div id="m11" class="participant"> <uc1:ucMP runat="server" id="ucMP11" /></div> 
                        <div id="m12" class="participant"> <uc1:ucMP runat="server" id="ucMP12" /></div> 
                        <div id="m13" class="participant"> <uc1:ucMP runat="server" id="ucMP13" /></div> 
                        <div id="m14" class="participant"> <uc1:ucMP runat="server" id="ucMP14" /></div> 
                        <div id="m15" class="participant"> <uc1:ucMP runat="server" id="ucMP15" /></div> 
                        <div id="m16" class="participant"> <uc1:ucMP runat="server" id="ucMP16" /></div>  
                        <div id="m17" class="participant"> <uc1:ucMP runat="server" id="ucMP17" /></div> 
                        <div id="m18" class="participant"> <uc1:ucMP runat="server" id="ucMP18" /></div> 
                        <div id="m19" class="participant"> <uc1:ucMP runat="server" id="ucMP19" /></div> 
                        <div id="m20" class="participant"> <uc1:ucMP runat="server" id="ucMP20" /></div>
                    </div>
                </div>

                <div id="divCreateTopic" class="createTopic">
                    <div id="divCreate" class="#l">
                        <table>
                            <tr>
                                <td colspan="2"><asp:Label ID="l" runat="server" Text="Create new Topic:" CssClass="labelCommon bold"></asp:Label>
                                    <asp:Label ID="lM" runat="server" Width="150px" CssClass="errorMessage10"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lT" runat="server" Text="Title:" CssClass="labelCommon" ></asp:Label></td>                                
                                <td>
                                    <asp:TextBox ID="tTopic" runat="server" Width="180px" MaxLength="50" CssClass="font16 bold" Enabled="false" ToolTip="Enter a Topic Title (required, 50 chars max)"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tTopic" ErrorMessage="*" ForeColor="Red" CssClass="smallFont"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lD" runat="server" Text="Description:"  CssClass="labelCommon"></asp:Label></td>
                                <td><asp:TextBox ID="tD" runat="server" TextMode="MultiLine" MaxLength="250" Rows="3" Width="180px" Enabled="false" ToolTip="Enter a Topic Description (optional, 250 chars max)" CssClass="font12 bold noResize"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><asp:Button ID="bCreateTopic" runat="server" Text="Create" CssClass="buttonCommon" OnClick="bCreate_Click" Enabled="false" /></td>
                            </tr>            
                        </table>
                    </div>
                </div>

                <div class="createMessage">
                    <table>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="l2" runat="server" Text="Write a message: (250 chars max)" CssClass="labelCommon bold"></asp:Label>
                                &nbsp; <asp:Label ID="lblMessage" runat="server"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" MaxLength="250" Rows="5" Width="620px" CssClass="font16 bold noResize" Enabled="false"></asp:TextBox></td>
                            <td><asp:Button ID="btnPostMessage" runat="server" Text="Post" OnClick="btnPostMessage_Click" Enabled="false" Width="60px" Height="110px" CssClass="buttonCommon" CausesValidation="false" /></td>
                        </tr>
                    </table>
                </div>
<%--                <div id="divPrivateMessage" class="createPrivateMessage">
                    <table>
                        <tr>
                            <td style="width:200px;">
                                <asp:Label ID="lPM" runat="server" Text="Send Private Message to:"  CssClass="labelCommon bold"></asp:Label>
                                <asp:DropDownList ID="ddlPM" runat="server" Width="200px" CssClass="font16 bold noResize"></asp:DropDownList>
                            </td>
                            <td style="width:416px;">
                                <asp:TextBox ID="tPM" runat="server" TextMode="MultiLine" Rows="2" Width="416px" CssClass="font16 bold noResize"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="bPM" runat="server" Text="Send" Width="60px" Height="40px" CssClass="buttonCommon" CausesValidation="false" OnClick="bPM_Click" />
                            </td>
                        </tr>
                    </table>
                </div>--%>
            </div>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

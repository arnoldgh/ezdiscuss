<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true" CodeBehind="MemberHome.aspx.cs" Inherits="EZDiscuss.MemberHome" %>

<%@ Register Src="~/UserControls/ucGroup.ascx" TagPrefix="uc1" TagName="ucGroup" %>
<%@ Register Src="~/UserControls/ucSendEmailInvite.ascx" TagPrefix="uc1" TagName="ucSendEmailInvite" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="c" runat="server">

    <style>
        .createGroup { width:500px; height:600px; position:relative; border-width:1px; background-color:#ffffff;
        }
        .invite {width:500px; height:600px; position:relative; border-width:1px; background-color:#ffffff;
        }
        .discuss {width:1000px; height:250px; position:relative; border-width:1px; background-color:#ffffff;
        }
        .highlight { background-color: lightgreen;
        }
        .withBorder { border:solid; border-width:1px; border-color:blue;
        }
    </style>

<%--    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>--%>


    <div id="divContent" class="content">
    <br />
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="1000px" Font-Bold="true">
        <ajaxToolkit:TabPanel ID="tabCreate" runat="server" HeaderText="Step 1: Create New Group">
            <ContentTemplate>
                <div id="divCreateGroup" class="createGroup">
                    <table class="pad5">
                        <tr>
                            <td><asp:Image ID="imgPeople" runat="server" ImageUrl="~/Images/people.png" Width="40px" Height="40px" /></td>
                            <td><asp:Label ID="lWelcome" runat="server" CssClass="Font16"></asp:Label></td>
                        </tr>
                        <tr class="highlight">
                            <td colspan="2"><asp:Label ID="lH1" runat="server" Text="Step 1: Create new Group" CssClass="sectionHeader" Width="950px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2"><uc1:ucGroup runat="server" ID="ucGroup" /></td>
                        </tr>
                    </table>
                    <br /><br /><br />
                </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tabInvite" runat="server" HeaderText="Step 2: Send Invitation to join the Group">
            <ContentTemplate>
                <div id="divInvite"  class="invite">
                    <table class="pad5">
                        <tr>
                            <td><asp:Image ID="imgPerson" runat="server" ImageUrl="~/Images/user.png" Width="40px" Height="40px" /></td>
                        </tr>
                        <tr class="highlight">
                            <td><asp:Label ID="lH2" runat="server" Text="Step 2: Invite someone to join the Group" CssClass="sectionHeader" Width="950px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><uc1:ucSendEmailInvite runat="server" id="ucSendEmailInvite" /></td>
                        </tr>
<%--                        <tr>
                            <td><asp:Button ID="btnDiscussion" runat="server" formnovalidate="formnovalidate" Text="Start Discussion" CssClass="buttonCommon" OnClick="btnDiscussion_Click" CausesValidation="false" /></td>
                        </tr>--%>
                    </table>            
                </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>        
    </div>
</asp:Content>

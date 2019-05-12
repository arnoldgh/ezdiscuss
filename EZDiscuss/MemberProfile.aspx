<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true" CodeBehind="MemberProfile.aspx.cs" Inherits="EZDiscuss.MemberProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="c" runat="server">
        <style>
            .header { background-color: darkgreen; color: white; border:solid; border-color: whitesmoke; height:20px; width: 100%;
            }
            .fullWidth { width: 100%;
            }
            .Photo {height: 600px; border: 1px solid double; position: relative;
            }
            .Info {height: 600px; border: 1px solid double; position: relative;
            }
            .Settings {height: 600px; border: 1px solid double; position: relative;
            }
            .space100 { width:100px; position:relative;
            }
            .lbl { float: left;
            }
            .txt {float: left; width:20%;
            }
            .whiteBackground { background-color: white;
            }
            .highlight { background-color: lightgreen;
            }
    </style>  
    <div id="divProfile" class="whiteBackground">
        <br />
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="1000px" Font-Bold="true">
        <ajaxToolkit:TabPanel ID="tabPhoto" runat="server" HeaderText="Upload Photo:">
            <ContentTemplate>
                <br />
                <div id="divPhoto" class="Photo">
                    <div><asp:Label ID="lPhoto" runat="server" Text="Profile Photo:" CssClass="sectionHeader highlight" Width="970px"></asp:Label></div>
                    <br />
                    <div style="border:solid; border-width:1px; width:100px; height:80px;">
                        <asp:Image ID="imgProfile" runat="server" Width="100px" Height="80px" AlternateText="Member Photo (100px x 80px)" />
                    </div>
                    <br />
                    <asp:FileUpload ID="fUpload" runat="server" BackColor="Yellow" Width="300px" />
                    <br /><br />
                    <asp:Button ID="bUpload" runat="server" Text="Upload" OnClick="bUpload_Click" CssClass="buttonCommon" Width="100px" />
                    <br />
                    <asp:Label ID="lMessage" runat="server"></asp:Label>
                </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tabInvite" runat="server" HeaderText="Member Information">
            <ContentTemplate>
                <br />
                <div id="divInfo" class="Info">
                    <div><asp:Label ID="lInfo" runat="server" Text="Member Information:" CssClass="sectionHeader highlight" Width="970px"></asp:Label></div>
                    <br />
                    <table>
                        <tr>
                            <td><asp:Label ID="l3" runat="server" Text="Email:" CssClass="lbl"></asp:Label></td>
                            <td><asp:TextBox ID="tEmail" runat="server" CssClass="txt" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="l1" runat="server" Text="First name:" CssClass="lbl"></asp:Label></td>
                            <td><asp:TextBox ID="tFname" runat="server" CssClass="txt" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="l2" runat="server" Text="Last name:" CssClass="lbl"></asp:Label></td>
                            <td><asp:TextBox ID="tLName" runat="server" CssClass="txt" Width="200px"></asp:TextBox></td>
                        </tr>
        <%--                <tr>
                            <td><asp:Label ID="Label1" runat="server" Text="Country" CssClass="lbl"></asp:Label></td>
                            <td><asp:DropDownList ID="dCountry" runat="server" CssClass="txt" Width="200px"></asp:DropDownList></td>
                        </tr>--%>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td><asp:Button ID="btnUpdateInfo" runat="server" Text="Save" OnClick="btnUpdateInfo_Click"  CssClass="buttonCommon" Width="100px" /></td>
                            <td><asp:Button ID="btnCancelInfo" runat="server" Text="Cancel" OnClick="btnCancelInfo_Click"  CssClass="buttonCommon" Width="100px" /></td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tabMisc" runat="server" HeaderText="Miscellaneous Settings">
            <ContentTemplate>
                <br />
                <div id="divSettings" class="Settings">
                    <div><asp:Label ID="lMisc" runat="server" Text="Miscellaneous Settings:" CssClass="sectionHeader highlight" Width="970px"></asp:Label></div>
                    <br />
                    <table>
                        <tr>
                            <td><asp:Label ID="l4" runat="server" Text="Privacy:"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="ddlPrivacy" runat="server">
                                    <asp:ListItem Text="Public" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Private" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="GroupOnly" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="l5" runat="server" Text="Receive every message through email?"></asp:Label></td>
                            <td><asp:CheckBox ID="chkReceiveEmail" runat="server" Checked="true" /></td>
                        </tr>
                    </table>

                    <br />
                    <table>
                        <tr>
                            <td><asp:Button ID="bSave" runat="server" Text="Save" OnClick="bSave_Click" CssClass="buttonCommon" Width="100px" /></td>
                            <td><asp:Button ID="bCancel" runat="server" Text="Cancel" CssClass="buttonCommon" Width="100px" /></td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>           


    </div>
</asp:Content>

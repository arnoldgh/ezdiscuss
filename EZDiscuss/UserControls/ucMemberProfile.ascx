<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMemberProfile.ascx.cs" Inherits="EZDiscuss.UserControls.ucMemberProfile" %>

<script type="text/javascript">

</script>

<style>
    .mProfileContainer { width:65px; height:45px; border-radius:5px; border-style:solid; border-width:thin;
    }
    .mProfileAvailable{ font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-size: 10px; background-color: silver; border-color: white; color: red;
    }
    .mProfileMale{ font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-weight: bold; font-size: 11px; color: white; background-color: navy; text-shadow: 5px 5px 5px #ffd800;
    }
    .mProfileFemale{ font-family: 'Segoe UI', Verdana, Helvetica, 'Courier New', Arial; font-weight: bold; font-size: 11px; color: white; background-color: fuchsia;
    }
    .shadow { 
    }
    .roundCorner { border-radius: 10px;
    }
</style>

<div id="dialog" style="height:35px; width:40px; background-color:aqua; border:solid 1px red;">

        <asp:HiddenField ID="hMemberId" runat="server" />
        <asp:HiddenField ID="hTopicId" runat="server" />

        <asp:MultiView ID="mv" runat="server">

            <asp:View ID="WithPhoto" runat="server">
                <div id="divPhoto" runat="server" class="mProfileContainer">
                    <asp:Image ID="iPhoto" runat="server" Width="70px" Height="50px" CssClass="roundCorner" />
                </div>
            </asp:View>

            <asp:View ID="vNoPhoto" runat="server">
                <div id="divMP" runat="server" class="mProfileContainer mProfileAvailable">
                    <table>
                        <tr>
                            <td><asp:ImageButton ID="iMP" runat="server" Width="25px" Height="25px" ImageUrl="~/Images/user.png" CausesValidation="false" /></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lMP" runat="server" Text="available"></asp:Label></td>            
                        </tr>
                    </table>
                </div>
            </asp:View>

        </asp:MultiView>
</div>

<%--<script type="text/javascript">
    function displayMessages() {
        var memberId = $("#"+ '<%= hMemberId.ClientID %>').val();
        var topicId = $("#" + '<%= hTopicId.ClientID %>').val();
        $("#dialog").load("MemberTopicMessages.aspx?MemberId=" + memberId + "&TopicId=" + topicId).dialog({
            modal: true,
            width: 400,
            height: 300
        });
    }
</script>--%>

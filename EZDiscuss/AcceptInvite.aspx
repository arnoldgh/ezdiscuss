<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AcceptInvite.aspx.cs" Inherits="EZDiscuss.AcceptInvite" %>

<%@ Register Src="~/UserControls/ucRegistrationForm.ascx" TagPrefix="uc1" TagName="ucRegistrationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="c" runat="server">
    <div id="divAcceptInvite" runat="server">
        <asp:MultiView ID="mvAcceptInvite" runat="server" ActiveViewIndex="0">

            <asp:View ID="vwNonMember" runat="server">
                <div>
                    <uc1:ucRegistrationForm runat="server" ID="ucRegistrationForm" />
                </div>

            </asp:View>
            
            <asp:View ID="vwMember" runat="server">
                <div>
                    <asp:Label ID="lbl" runat="server" Text="Please click the button to accept the Invite."></asp:Label>
                    <br />
                    <asp:Button ID="btnAcceptInvite" runat="server" Text="Accept" OnClick="btnAcceptInvite_Click" />
                    <asp:Label ID="lMsg" runat="server"></asp:Label>
                </div>


            </asp:View>


        </asp:MultiView>

    </div>
    
</asp:Content>

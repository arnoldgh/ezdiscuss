<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Inherits="EZDiscuss.Group" %>

<%@ Register Src="~/UserControls/ucGroup.ascx" TagPrefix="uc1" TagName="ucGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="c" runat="server">
    <div id="divCreateGroup">
        <uc1:ucGroup runat="server" ID="ucGroup" />
    </div>
</asp:Content>

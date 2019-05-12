<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EZDiscuss.Registration" %>

<%@ Register Src="~/UserControls/ucRegistrationForm.ascx" TagPrefix="uc1" TagName="ucRegistrationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="c" runat="server">
        <style>
        .register {width:400px; height:500px; position:absolute; top:100px; left:300px; border-width:1px; border-radius:10px; background-color: #ff6a00; opacity:0.9;
        }
    </style>
    <div id="divContent" class="content">
        <div id="divRegister" class="register">
            <uc1:ucRegistrationForm runat="server" ID="ucRegistrationForm" />
        </div>       
    <div></div>
</asp:Content>

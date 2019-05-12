<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMessages.ascx.cs" Inherits="EZDiscuss.UserControls.ucMessages" %>
<%@ Register Src="~/UserControls/ucMP.ascx" TagPrefix="uc1" TagName="ucMP" %>

<link rel="stylesheet" href="../StyleSheet/EZStyle.css" type="text/css" />
<style>
    #messages {width:520px; height:380px; position:absolute; left: 130px; top:120px; overflow:auto;}
    #m1{width:100px; height:80px; background-color: silver; position:absolute; left: 74px; top:30px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m2{width:100px; height:80px; background-color: silver; position:absolute; left: 188px; top:30px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m3{width:100px; height:80px; background-color: silver; position:absolute; left: 300px; top:30px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m4{width:100px; height:80px; background-color: silver; position:absolute; left: 415px; top:30px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m5{width:100px; height:80px; background-color: silver; position:absolute; left: 530px; top:30px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m6{width:100px; height:80px; background-color: silver; position:absolute; left: 645px; top:30px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m7{width:100px; height:80px; background-color: silver; position:absolute; left: 690px; top:130px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m8{width:100px; height:80px; background-color: silver; position:absolute; left: 690px; top:225px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m9{width:100px; height:80px; background-color: silver; position:absolute; left: 690px; top:325px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m10{width:100px; height:80px; background-color: silver; position:absolute; left: 690px; top:420px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m11{width:100px; height:80px; background-color: silver; position:absolute; left: 645px; top:523px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m12{width:100px; height:80px; background-color: silver; position:absolute; left: 530px; top:522px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m13{width:100px; height:80px; background-color: silver; position:absolute; left: 415px; top:523px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m14{width:100px; height:80px; background-color: silver; position:absolute; left: 300px; top:523px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m15{width:100px; height:80px; background-color: silver; position:absolute; left: 188px; top:523px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m16{width:100px; height:80px; background-color: silver; position:absolute; left: 74px; top:523px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m17{width:100px; height:80px; background-color: silver; position:absolute; left: 20px; top:420px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m18{width:100px; height:80px; background-color: silver; position:absolute; left: 20px; top:325px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m19{width:100px; height:80px; background-color: silver; position:absolute; left: 20px; top:225px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
    #m20{width:100px; height:80px; background-color: silver; position:absolute; left: 20px; top:130px; font-family:'Segoe UI', Verdana, Helvetica, 'Courier New',Arial; font-size:7pt; font-style:italic;}
</style>

<div id="messages">
<asp:Repeater ID="rMessages" runat="server" OnItemDataBound="rMessages_ItemDataBound">
    <HeaderTemplate>
        <table style="width:100%">
            <tr>
                <td style="width:100%;"><asp:Label ID="lTT" runat="server" Width="100%" Text="Topic Name: Norcal 25th Anniversary" CssClass="smallFontBlue"></asp:Label></td>                        
            </tr>
        </table>
    </HeaderTemplate>
    <ItemTemplate>
        <table style="width:100%">
            <tr>
                <td style="width:100%;"><asp:TextBox ID="tT" runat="server" Width="100%" CssClass="smallFontBlue"></asp:TextBox></td>
            </tr>
        </table>
    </ItemTemplate>
</asp:Repeater>
</div>

<div>
    <div id="m1"> <uc1:ucMP runat="server" id="ucMP1" /></div> 
    <div id="m2"> <uc1:ucMP runat="server" id="ucMP2" /></div> 
    <div id="m3"> <uc1:ucMP runat="server" id="ucMP3" /></div> 
    <div id="m4"> <uc1:ucMP runat="server" id="ucMP4" /></div> 
    <div id="m5"> <uc1:ucMP runat="server" id="ucMP5" /></div> 
    <div id="m6"> <uc1:ucMP runat="server" id="ucMP6" /></div> 
    <div id="m7"> <uc1:ucMP runat="server" id="ucMP7" /></div> 
    <div id="m8"> <uc1:ucMP runat="server" id="ucMP8" /></div> 
    <div id="m9"> <uc1:ucMP runat="server" id="ucMP9" /></div> 
    <div id="m10"> <uc1:ucMP runat="server" id="ucMP10" /></div>    
    <div id="m11"> <uc1:ucMP runat="server" id="ucMP11" /></div> 
    <div id="m12"> <uc1:ucMP runat="server" id="ucMP12" /></div> 
    <div id="m13"> <uc1:ucMP runat="server" id="ucMP13" /></div> 
    <div id="m14"> <uc1:ucMP runat="server" id="ucMP14" /></div> 
    <div id="m15"> <uc1:ucMP runat="server" id="ucMP15" /></div> 
    <div id="m16"> <uc1:ucMP runat="server" id="ucMP16" /></div>  
    <div id="m17"> <uc1:ucMP runat="server" id="ucMP17" /></div> 
    <div id="m18"> <uc1:ucMP runat="server" id="ucMP18" /></div> 
    <div id="m19"> <uc1:ucMP runat="server" id="ucMP19" /></div> 
    <div id="m20"> <uc1:ucMP runat="server" id="ucMP20" /></div>
</div>

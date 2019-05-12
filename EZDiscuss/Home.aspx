<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EZDiscuss.Home" %>

<%@ Register Src="~/UserControls/ucRegistrationForm.ascx" TagPrefix="uc1" TagName="ucRegistrationForm" %>
<%@ Register src="UserControls/ucLogin.ascx" tagname="ucLogin" tagprefix="uc2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="c" runat="server">

    <link  href="../StyleSheet/EZStyleCommon.css" rel="stylesheet" />

    <style>
        .loginContainer { width:400px; height:600px; position:absolute; top:50px; right:10px; border-width: thin; border-radius:0px; border-color: royalblue; border-style: solid;
        }
        .registerContainer {width:350px; height:500px; position:absolute; top:50px; right:27px; border-width:1px; border-top-right-radius:20px; border-bottom-left-radius:20px; background-color: green;
        }
        .infoContainer { width:570px; height:600px; position:absolute; top:50px; left:10px; border-width: thin; border-radius:0px; border-color: royalblue; border-style: solid;
        }
        .infoMessage { width:550px; height:200px; position:absolute; top:10px; right:10px; border-width: thin; background-color: gainsboro;
        }
        .infoSnapshot { width:550px; height:370px; position:absolute; bottom:10px; right:15px; border-width: thin;
        }

        #l1{ left: 100px; top:10px;}
        #l2{ left: 210px; top:10px;}
        #l3{ left: 320px; top:10px;}
        #l4{ left: 430px; top:10px;}
        #l5{ left: 540px; top:10px;}
        #l6{ right: 100px; top:10px;}
        #l7{ right: 10px; top:70px;}
        #l8{ right: 10px; top:170px;}
        #l9{ right: 10px; top:270px;}
        #l10{ right: 10px; top:370px;}
        #l11{ right: 100px; bottom:10px;}
        #l12{ left: 540px; bottom:10px;}
        #l13{ left: 430px; bottom:10px;}
        #l14{ left: 320px; bottom:10px;}
        #l15{ left: 210px; bottom:10px;}
        #l16{ left: 100px; bottom:10px;}
        #l17{ left: 10px; top:370px;}
        #l18{ left: 10px; top:270px;}
        #l19{ left: 10px; top:170px;}
        #l20{ left: 10px; top:70px;}


    </style>

    <div id="divContent" class="content">
        <div id="divInfo" class="infoContainer">
            <div class="infoMessage">                
                <asp:Label ID="l1" runat="server" Text="Got something to discuss?" CssClass="bigFont30"></asp:Label>
                <br /><br />
                <asp:Label ID="l2" runat="server" Text="Then, discuss it with Friends, Family or a group of people." CssClass="bigFont20"></asp:Label>
                <br /><br />
                <asp:Label ID="l3" runat="server" Text="EZDiscuss let's you do it in a boardroom-like setting where you can discuss any topic interactively." CssClass="Font16" Font-Italic="true"></asp:Label>
                <br /><br />                
                <asp:Label ID="l4" runat="server" Text="It's cool. Have fun!" CssClass="bigFont20"></asp:Label>
                <br />
            </div>

            <div class="infoSnapshot">
                <asp:Image ID="iSnapshot" runat="server" ImageUrl="~/Images/ezdiscusssnapshot.png" Width="550px" Height="370px" />
            </div>
        </div>
        <div id="div1"  class="loginContainer">        
            <div id="divRegister" class="registerContainer">
                <br />
                <asp:Label ID="lR1" runat="server" Text="No Account yet? Sign Up Now." CssClass="bigFont16 pad10" ForeColor="White"></asp:Label>
                <br />
                <asp:Label ID="lFree" runat="server" Text=" It's Free!" CssClass="bigFont25 pad10" ForeColor="White"></asp:Label>
                <br /><br />
                <uc1:ucRegistrationForm runat="server" ID="ucRegistrationForm" />
            </div>       
         </div>     

</div>
</asp:Content>

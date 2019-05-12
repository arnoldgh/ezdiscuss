<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucRegistrationForm.ascx.cs" Inherits="EZDiscuss.UserControls.ucRegistrationForm" %>

<link href="../StyleSheet/EZStyleCommon.css" rel="stylesheet" />

<div id="divRegForm">
    <table style="width:100%" class="smallFontBlue pad10">
        <tr>
            <td colspan="3">
                <asp:Label ID="lRequired" runat="server" Text="Enter the required information below:" CssClass="labelCommon whiteFont"></asp:Label>
            </td>
        </tr>
        <tr><td colspan="3">&nbsp;</td></tr>
        <tr>
            <td style="width:100px"><asp:Label ID="lEmail" runat="server" Text="Email:*" CssClass="labelCommon whiteFont"></asp:Label></td>
            <td><asp:TextBox ID="tEmail" runat="server" required="required" placeholder="someone@domain.com" TextMode="email" Width="200px" CssClass="textboxCommon" ToolTip="Enter a valid email address. This will be your username." CausesValidation="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lPwd" runat="server" CssClass="labelCommon whiteFont" Text="Password:*"></asp:Label></td>
            <td><asp:TextBox ID="tPwd" runat="server" required="required" placeholder="Enter password" Width="200px" CssClass="textboxCommon" TextMode="Password" ToolTip="Password should be at least 6 characters" CausesValidation="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lFname" runat="server" CssClass="labelCommon whiteFont" Text="First Name:*"></asp:Label></td>
            <td><asp:TextBox ID="tFN" runat="server" required="required" placeholder="Enter Firstname" Width="200px" CssClass="textboxCommon" ToolTip="This will be used to identify you in the discussion board" CausesValidation="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lLname" runat="server" CssClass="labelCommon whiteFont" Text="Last Name:*"></asp:Label></td>
            <td><asp:TextBox ID="tLN" runat="server" required="required" placeholder="Enter Lastname" Width="200px" CssClass="textboxCommon" CausesValidation="false"></asp:TextBox></td>   
        </tr>
        <tr>
            <td><asp:Label ID="lBirthday" runat="server" Text="Birthday:*" CssClass="labelCommon whiteFont"></asp:Label></td>
            <td>                
                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="textboxCommon" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                </asp:DropDownList>         
                <asp:DropDownList ID="ddlDay" runat="server" CssClass="textboxCommon" OnSelectedIndexChanged="ddlDay_SelectedIndexChanged">
                </asp:DropDownList>               
                <asp:DropDownList ID="ddlYear" runat="server" CssClass="textboxCommon" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lGender" runat="server" Text="Gender:*" CssClass="labelCommon whiteFont"></asp:Label></td>
            <td>
                <asp:RadioButton ID="rMale" runat="server" GroupName="Gender" Text="Male" CssClass="textboxCommon whiteFont" ToolTip="Select gender" /><asp:Image ID="iMale" runat="server" ImageUrl="../Images/user_male_olive_blue_black.png" width="30px" height="30px" />
                &nbsp;&nbsp;
                <asp:RadioButton ID="rFemale" runat="server" GroupName="Gender" Text="Female" CssClass="textboxCommon whiteFont" ToolTip="Select gender"/><asp:Image ID="iFemale" runat="server" ImageUrl="../Images/user_female_white_pink_ginger.png" width="30px" height="30px" />
            </td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lMessage" runat="server" Text="" CssClass="textMessage whiteFont"></asp:Label></td>
        </tr>
        <tr>
            <td>&nbsp;</td>

        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="bSubmit" runat="server" Text="Create Account" Width="200px" Height="30px" Font-Bold="true" Font-Size="15px" OnClick="bSubmit_Click" /></td>
        </tr>

    </table>

</div>
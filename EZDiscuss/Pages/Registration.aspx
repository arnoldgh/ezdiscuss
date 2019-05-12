<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EZDiscuss.Pages.Registration" %>

<%@ Register Src="~/UserControls/RegistrationForm.ascx" TagPrefix="uc1" TagName="RegistrationForm" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:RegistrationForm runat="server" id="RegistrationForm" />    
    </div>
    </form>
</body>
</html>

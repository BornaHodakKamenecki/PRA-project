﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="PraProjekt.Game" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table align="center">
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Tu ide pitanje....?"></asp:Label></td>                
            </tr>
            <tr>
                <td>
                    <asp:RadioButton GroupName="Quiz" ID="RadioButton1" runat="server" Text="Odgovor 1" /><br />
                    <asp:RadioButton GroupName="Quiz" ID="RadioButton2" runat="server" Text="Odgovor 2" /><br />
                    <asp:RadioButton GroupName="Quiz" ID="RadioButton3" runat="server" Text="Odgovor 3" /><br />
                    <asp:RadioButton GroupName="Quiz" ID="RadioButton4" runat="server" Text="Odgovor 4" /><br />
                </td>                         
            <tr>
                <td>
                    <asp:Button ID="btnLeave" runat="server" Text="Leave" />
                    <asp:Button ID="btnNext" runat="server" Text="Next" />
                </td>
            </tr>
        </table>
       
    </form>
</body>
</html>

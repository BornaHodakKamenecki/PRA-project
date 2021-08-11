<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="PraProjekt.Game" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/Game.css" rel="stylesheet" />
    <title>Game</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="header">
             <h1>Quizard</h1>
        </div>
        <table align="center">
            <tr>
                <td><asp:Label class="pitanje" ID="Label1" runat="server" Text="Tu ide pitanje....?"></asp:Label></td>                
            </tr>
            <tr>
                <td>
                    <asp:RadioButton GroupName="Quiz" ID="RadioButton1" runat="server" Text="Odgovor 1" />
                    <asp:RadioButton GroupName="Quiz" ID="RadioButton2" runat="server" Text="Odgovor 2" />
                </td>   
            </tr>
            <tr>
                <td>
                    <asp:RadioButton GroupName="Quiz" ID="RadioButton3" runat="server" Text="Odgovor 3" />
                    <asp:RadioButton GroupName="Quiz" ID="RadioButton4" runat="server" Text="Odgovor 4" />
                </td>   
            </tr>
        </table>
        <div class="footer">
            <asp:Button class="btnLeave" ID="btnLeave" runat="server" Text="Leave" />
            <asp:Button class="btnNext" ID="btnNext" runat="server" Text="Next" />
        </div>    
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateQuiz.aspx.cs" Inherits="PraProjekt.CreateQuiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        h2{
            text-align:center;
        }
        h4{
            text-align:left;
            margin-top:150px;
            margin-left:20px;
        }
        .gumbi{
            display:flex;
            flex-direction:column;
            align-items:center;
        }
        .gumbi input{
            margin-bottom:20px;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Kreiranje kviza</h2>
        </div>
        <div>
            <h4>Pitanja:</h4>
        </div>
        <div>

        </div>
        <div class="gumbi">
            <asp:Button Text="Spremi i pokreni kviz" Width="500" Height="50" runat="server" />
            <asp:Button Text="Spremi novi kviz" Width="500" Height="50" runat="server" />
            <asp:Button Text="Odbaci novi kviz" Width="500" Height="50" runat="server" />
        </div>
    </form>
</body>
</html>

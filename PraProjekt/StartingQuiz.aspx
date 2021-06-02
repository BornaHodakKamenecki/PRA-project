<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartingQuiz.aspx.cs" Inherits="PraProjekt.StartingQuiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        h2{
            text-align:center;
        }
        h4{
            text-align:center;
            margin-top:50px;
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
            <h2>Pokretanje kviza</h2>
            <br />
            <h4>KOD ZA KVIZ:</h4>
        </div>
        <div class="gumbi">
            <asp:Label runat="server" Width="500" Height="100" BorderColor="Black" BorderWidth="2px" />
            <br />  
            <asp:Button Text="Pokreni kviz" Width="500" Height="50" runat="server" />
            <asp:Button Text="Odustani" Width="500" Height="50" runat="server" />
        </div>
    </form>
</body>
</html>

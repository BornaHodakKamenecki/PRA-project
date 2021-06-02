<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JoinQuiz.aspx.cs" Inherits="PraProjekt.JoinQuiz" %>

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
        .kod{
            text-align:center;
        }
        
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div>
            <h2>Dobrodošli</h2>
            <br />
            <h4>Unesite kod za kviz:</h4>
        </div>
        <div class="gumbi">
            <asp:TextBox runat="server" class="kod" Font-Size="XX-Large" Width="500" Height="100"  BorderStyle="Double" BorderColor="Black" />
            <br />  
            <asp:Button Text="Pridruži se kvizu" Width="500" Height="50" runat="server" />
            <asp:Button Text="Odustani" Width="500" Height="50" runat="server" />
        </div>
        </div>
    </form>
</body>
</html>

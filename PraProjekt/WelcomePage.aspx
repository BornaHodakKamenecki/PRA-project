<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomePage.aspx.cs" Inherits="PraProjekt.WelcomePage" %>

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
            margin-bottom:50px;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Dobrodošli</h2>
        </div>
        <div>
            <h4>Kreirani kvizovi:</h4>
        </div>
        <div>
            <% for (int i=0; i<5; i++) {%>
                <div class="kviz">

                ....      
                </div>   
            <% } %>
        </div>
        <div class="gumbi">
            <asp:Button Text="Dodaj novi kviz" Width="500" Height="50" runat="server" />

            <asp:Button Text="Pokreni kviz" Width="500" Height="50" runat="server" />
        </div>
    </form>
</body>
</html>

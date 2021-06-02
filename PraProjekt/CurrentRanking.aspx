<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentRanking.aspx.cs" Inherits="PraProjekt.CurrentRanking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        h2{
            text-align:center;
        }
        .button{
            margin-left:75%;
            margin-right:10%;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Trenutni poredak igrača</h2>
        </div>
        <div>
            <% for (int i=0; i<5; i++) {%>
                <div class="kviz">
                ....      
                </div>   
            <% } %> 
        </div>
        <div class="button">
            <asp:Button runat="server" Text="Sljedeće pitanje" Width="200" Height="40" />
        </div>
    </form>
</body>
</html>

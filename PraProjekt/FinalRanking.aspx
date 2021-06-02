<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinalRanking.aspx.cs" Inherits="PraProjekt.FinalRanking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        h2{
            text-align:center;
        }
        .button{
            display:flex;
            flex-direction:column;
            align-items:center;
            margin-top:50px;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Konačni poredak igrača</h2>
        </div>
        <div>
            <% for (int i=0; i<5; i++) {%>
                <div class="kviz">
                ....      
                </div>   
            <% } %>        
        </div>
        <div class="button">
            <asp:Button runat="server" Text="Završi kviz" Width="500" Height="50" />
        </div>
    </form>
</body>
</html>

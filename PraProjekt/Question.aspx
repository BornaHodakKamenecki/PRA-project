<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="PraProjekt.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title>QUIZARD</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 451px">

            <%-- procedura koja hvata pianje i stavlja u labelu --%>
        <asp:Label ID="Pitanje" runat="server" Text="Label"></asp:Label>

            <%-- procedura koja hvata sadržaj i stavlja u labelu --%>
        <asp:Label ID="Odgovor1" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Odgovor2" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Odgovor3" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Odgovor4" runat="server" Text="Label"></asp:Label>

            <%-- prikazat konačnu rang listu nema skidanja u pdf il tak nes --%>
        <asp:Button ID="ZavrsiKvit" runat="server" Text="Zavrsi kviz" />
        
           <%-- moramo iz timera napravit proc koja uzima vrijednost to pohranit u timer i da svake sekunde se smanjuje --%>
        <%--<asp:Timer ID="Timer1" runat="server"></asp:Timer>--%>

            <%-- prikazi trenutnu rang listu pa onda od tam ide na novo pitanje --%>
        <asp:Button ID="SljedecePitanje" runat="server" Text="Sljedeće pitanje" />



        </div>
    </form>
</body>
</html>

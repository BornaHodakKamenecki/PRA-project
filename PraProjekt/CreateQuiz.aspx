﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateQuiZ.aspx.cs" Inherits="PraProjekt.CreateQuiZ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <h2>Kreiranje kviza</h2>
		
		<div>
			<h4>Pitanja:</h4>
			<div class="questions">
				<asp:TextBox runat="server" class="question-box" />
				<br />    
			</div>
		   
			<div class="answers">
				<asp:Label Text="Unesite prvi odgovor:" runat="server" />
				<asp:TextBox runat="server" class="answer-box" />
				<br />    
			</div>
			<div class="answers">
				<asp:Label Text="Unesite drugi odgovor:" runat="server" />
				<asp:TextBox runat="server" class="answer-box" />
				<br />    
			</div>
			<div class="answers">
				<asp:Label Text="Unesite treci odgovor:" runat="server" />
				<asp:TextBox runat="server" class="answer-box" />
				<br />    
			</div>
			<div class="answers">
				<asp:Label Text="Unesite cetvrti odgovor:" runat="server" />
				<asp:TextBox runat="server" class="answer-box" />
				<br />    
			</div>

		</div>
		<div>

		</div>
		<div class="gumbi">
			<asp:Button Text="Spremi pitanje" Width="500" Height="50" runat="server" />
			<asp:Button Text="Odbaci pitanje" Width="500" Height="50" runat="server" />
		</div>
    </form>
</body>
</html>

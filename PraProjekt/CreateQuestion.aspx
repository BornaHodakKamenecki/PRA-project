<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateQuestion.aspx.cs" Inherits="PraProjekt.CreateQuiz" %>

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
		.questions{
			text-align:center;
			margin-top:20px;
			margin-left:20px;
			font-size:large;

		}
		.question-box{
			display:flex;
			flex-direction:column;
			align-items:center;
			font-size:large;
			margin:0 auto;
			width:1500px;
			height:100px;
			border-style:double;
			border-color:black;
			text-wrap:normal;
		}
		.answers{
			text-align:center;
			font-size:large;
			margin-left:20px;
			padding-bottom:20px;
		}
		.answer-box{
			display:flex;
			flex-direction:column;
			align-items:center;
			font-size:large;
			margin:0 auto;
			width:1500px;
			height:20px;
			border-style:double;
			border-color:black;
			padding-top:10px;
		}

	</style>
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<h2>Kreiranje pitanja</h2>
		</div>
		<div>
			<h4>Pitanja:</h4>
			<div class="questions">
				<asp:Label Text="Unesite pitanje:" runat="server" />
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

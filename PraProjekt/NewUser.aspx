<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInScreen.aspx.cs" Inherits="PraProjekt.LogInScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>APLIKACIJA</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
<style>
	html,body { 
	height: 100%; 
}

.global-container{
	height:100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f5f5f5;
}

form{
	padding-top: 8%;
	font-size: 14px;
	margin-top: 30px;
}

.card-title{ font-weight:300; }

.btn{
	font-size: 14px;
	margin-top:20px;
}


.login-form{ 
	width:330px;
	margin:20px;
}

.sign-up{
	text-align:center;
	padding:20px 0 0;
}

.alert{
	margin-bottom:-30px;
	font-size: 13px;
	margin-top:20px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="global-container">
	<div class="card login-form">
	<div class="card-body">
		<h3 class="card-title text-center">Dobrodošli</h3>
		<div class="card-text">
			<!--
			<div class="alert alert-danger alert-dismissible fade show" role="alert">Incorrect username or password.</div> -->
			<form>
				<!-- to error: add class "has-danger" -->
				<div class="form-group">
                    <asp:Label Text="Unesite email:" runat="server" />
                    <asp:TextBox runat="server" ID="tbEmail" AutoCompleteType="Email" TextMode="Email"/>
					
				</div>
				<div class="form-group">
                    <asp:Label Text="Unesite zaporku:" runat="server" />
                    <asp:TextBox runat="server" ID="tbPass" TextMode="Password"/>
				</div>
				<div class="form-group">
                    <asp:Label Text="Ponovno unesite zaporku:" runat="server" />
                    <asp:TextBox runat="server" ID="tbRepeatedPass" TextMode="Password"/>
					<!--<label for="exampleInputPassword1">Ponovno unesite zaporku:</label>
					<a href="#" style="float:right;font-size:12px;">Zaboravili ste lozinku?</a>
					<input placeholder="Zaporka..." type="password" class="form-control form-control-sm" id="exampleInputPassword1">-->
				</div>
				<!-- provjera je li dvaput unešena ista lozinka -->
                <asp:CompareValidator ErrorMessage="Zaporke se ne slažu" ControlToValidate="tbPass" runat="server" 
					ControlToCompare="tbRepeatedPass" Display="Dynamic" ForeColor="Red" Operator="Equal" Type="String"/>
				<div class="form-group">
                    <asp:Label Text="Željeno korisničko ime:" runat="server" />
                    <asp:TextBox runat="server" ID="tbUserName"/>
					<!--<label for="exampleInputEmail1">Željeno korisničko ime:</label>
					<input placeholder="Korisničko ime..." type="text" class="form-control form-control-sm" id="exampleInputEmail1" aria-describedby="emailHelp">-->
				</div>
                <asp:Button Text="Registracija" runat="server" CssClass="btn btn-primary btn-block"
							ID="btnRegister" OnClick="btnRegister_Click"/>
			</form>
		</div>
	</div>
</div>
</div>
    </form>
</body>
</html>

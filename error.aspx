<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="ConnectRechargeWebsite.error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
<title>Error</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i|Source+Sans+Pro:300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styles/style.css">
<link rel="stylesheet" type="text/css" href="styles/framework.css">
<link rel="stylesheet" type="text/css" href="fonts/css/fontawesome-all.min.css">  
<link rel="icon" type="image/png" href="images/favicon.ico"/>    
</head>
    
<body class="theme-light" data-background="none" data-highlight="red2">
    <form id="form1" runat="server">
    <div id="page">
        
    <div id="page-preloader">
        <div class="loader-main"><div class="preload-spinner border-highlight"></div></div>
    </div>
    
	<div class="header header-fixed header-logo-center disabled">
        <a href="index.html" class="header-title">Sticky Mobile</a>
		<a href="#" class="header-icon header-icon-1"><i class="fas fa-arrow-left"></i></a>
		<a href="#" data-toggle-theme-switch="" class="header-icon header-icon-4"><i class="fas fa-lightbulb"></i></a>
	</div>
        
    <div id="footer-menu" class="footer-menu-5-icons footer-menu-style-1">
        <a href="https://connectrecharge.com"><i class="fa fa-home color-black-dark"></i><span>Home</span></a>
        <a href="https://connectrecharge.com/connectrecharge"><i class="fa fa-list color-black-dark"></i><span>Learn More</span></a>
        <a href="https://connectrecharge.com/faq"><i class="fa fa-circle color-black-dark"></i><span>FAQ</span></a>
        <a href="https://app.connectrecharge.com"><i class="fa fa-angle-right color-black-dark"></i><span>Login/Sign-up</span></a>
        <a href="https://connectrecharge.com/contactus" data-menu="menu-settings"><i class="fa fa-envelope-square color-black-dark"></i><span>Contact us</span></a>

        <div class="clear"></div>
    </div>

    <div class="page-content header-clear-medium">
         <div class="content-boxed left-40 right-40 bg-red2-dark">
                <div class="content top-10 bottom-10">
                   <h1 class="center-text top-30"><i class="fa fa-3x fa-times color-white"></i></h1>
        <h1 class="center-text uppercase ultrabold top-30 color-white">Oops!</h1>
        <p class="boxed-text-large color-white">
            <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>
        </p>
     <input id="BtnHtmlOK" type="button" class="button button-center-medium button-s button-r bg-white color-black button-3d button-xl" onclick="javascript:history.go(-1)" value="OK" />
                    </div>
              <asp:Label ID="lblPageName" runat="server" Text="" Visible="false"></asp:Label>
              </div>
    <!-- Page Content Class Ends Here-->

    
    
    <!---------------------------------------------------------------------------------------------->
    <!---------------------------------------------------------------------------------------------->
    <!-- Place all Action Elements and Menus Outside of the page-content class. Starting from here-->
    <!---------------------------------------------------------------------------------------------->
    <!---------------------------------------------------------------------------------------------->

    
    <div class="menu-hider"></div>
</div>


<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/plugins.js" async></script>
<script type="text/javascript" src="scripts/custom.js" async></script>
        </div>
    </form>
    
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="ConnectRechargeWebsite.menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
<title>ConnectRecharge-Menu</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i|Source+Sans+Pro:300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styles/style.css">
<link rel="stylesheet" type="text/css" href="styles/framework.css">
<link rel="stylesheet" type="text/css" href="fonts/css/fontawesome-all.min.css">    
<link rel="icon" type="image/png" href="images/favicon.ico"/>  
</head>
    

<body class="theme-light" data-background="none" data-highlight="green1">
    <form id="form1" runat="server">
   <div id="page">
        
    <div id="page-preloader">
        <div class="loader-main"><div class="preload-spinner border-highlight"></div></div>
    </div>
    
	<div class="header header-fixed header-logo-center disabled">
        <a href="index" class="header-title">ConnectRecharge</a>
		<a href="#" class="back-button header-icon header-icon-1"><i class="fas fa-arrow-left"></i></a>
		<a href="#" data-menu="menu-bookmarks" class="header-icon header-icon-3"><i class="fas fa-bookmark"></i></a>
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
    
	<div class="page-content shadow-none">	
        
        <div data-height="cover" class="caption bottom-0">
            <div class="caption-center">
                <div class="landing-page">
                    <div class="landing-header">
                        <h1 class="center-text font-30 ultrabold color-blue2-light">ConnectRecharge World</h1>
                        <!-- replace image if you want to use a logo <a href="#"><img src="images/logo-light.png" alt="img"></a> -->
                        <em class="font-11 color-theme opacity-60">... where every recharge connects you to wealth!</em>
                    </div>
                    <div class="center-text landing-icons color-theme">
                        <a href="openrechargetopup">
						<img src="images/icons/1.png" alt="img">
                            <em class="color-theme">OpenRecharge</em>
                        </a>
                        <a href="components">
                            <img src="images/icons/2.png" alt="img">
                            <em class="color-theme">Citizens</em>
                        </a>         
                        <a href="navigations">
                            <img src="images/icons/3.png" alt="img">
                            <em class="color-theme">Ambassadors</em>
                        </a>            
                        <a href="media">
                            <img src="images/icons/4.png" alt="img">
                            <em class="color-theme">Vendors</em>
                        </a>
                        <a href="media">
                            <img src="images/icons/5.png" alt="img">
                            <em class="color-theme">Consultants</em>
                        </a>         
                        <a href="pages">
                           <img src="images/icons/login.png" alt="img">
                            <em class="color-theme">Login/Sign-up</em>
                        </a> 
                        <div class="clear"></div>
                    </div>
                    <div class="landing-footer">
                        <p class="center-text bottom-0">
                            <a href="#" class="icon icon-xxs icon-circle bg-facebook"><i class="fab fa-facebook"></i></a>
                            <a href="#" class="icon icon-xxs icon-circle left-10 right-15 bg-twitter"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="icon icon-xxs icon-circle bg-google"><i class="fab fa-google"></i></a>
                        </p>
                        <span class="center-text color-theme font-10 opacity-40">Copyright <span class="copyright-year"></span> ConnectMagnet Limited. All rights Reserved</span>
                    </div>
                </div>  
            </div>
        </div>

    

    <div class="menu-hider"></div>
  </div>
</div>
    </form>
    
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/plugins.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>
</body>
</html>

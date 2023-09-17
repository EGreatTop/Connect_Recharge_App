<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="openrecharge.aspx.cs" Inherits="ConnectRechargeWebsite.openrecharge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
<title>ConnectRecharge</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i|Source+Sans+Pro:300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styles/style.css">
<link rel="stylesheet" type="text/css" href="styles/framework.css">
<link rel="stylesheet" type="text/css" href="fonts/css/fontawesome-all.min.css">    
<link rel="icon" type="image/png" href="images/favicon.ico"/>  
</head>
    
<body class="theme-light" data-background="none" data-highlight="blue2">
    <form id="form1" runat="server">
    <div id="page">
        
    <div id="page-preloader">
        <div class="loader-main"><div class="preload-spinner border-highlight"></div></div>
    </div>
    
	<div class="header header-fixed header-logo-center">
        <a href="index" class="header-title">Connect Recharge</a>
		<a href="menu" class="back-button header-icon header-icon-1"><i class="fas fa-arrow-left"></i></a>
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

        <div data-height="350" class="caption caption-margins top-10 round-medium shadow-large">
            <div class="caption-center">
                <img class="preload-image horizontal-center scale-box" width="120" src="images/empty.png" data-src="images/icons/1.png" alt="img">
                <h1 class="center-text color-white bolder font-34 top-30">OpenRecharge</h1>
                <p class="under-heading font-13 center-text color-blue1-light bottom-10">Recharge and earn 1 - 5% instantly.</p>
                <p class="boxed-text-huge color-white opacity-70 bottom-0">
                    An innovative package free to sign-up. You get back OpenRecharge Points to recharge/top-up for free.
                </p>
            </div>
            <div class="caption-overlay opacity-75"></div>
            <div class="caption-bg bg-18"></div>
        </div>       
        
        <div class="content-boxed disabled">
            <div class="content top-0 bottom-0">              
                <p class="uppercase bolder color-highlight bottom-0">Happy Customers</p>
                <h1 class="uppercase under-heading ultrabold fa-2x bottom-10">Tens of Thousands</h1>
                <p>We've served over 30.000 Customers. We're delighted to see happy customers!</p>

                <div class="divider"></div>

                <div class="one-half">
                    <h1 class="fa-3x center-text"><i class="fa fa-code"></i></h1>
                    <h6 class="center-text uppercase bolder color-highlight top-10">Templates & Themes</h6>
                    <p class="center-text">
                        We have over 100 mobile<br> items in our portfolio. 
                    </p>
                </div>
                <div class="one-half last-column">
                    <h1 class="fa-3x center-text"><i class="fa fa-mobile"></i></h1>
                    <h6 class="center-text uppercase bolder color-highlight top-10">Apps & Hybrd Apps</h6>
                    <p class="center-text">
                        We have over 70 mobile<br> items in our portfolio.
                    </p>
                </div>
                <div class="clear"></div>
                <div class="divider"></div>
                <p class="uppercase bolder color-highlight bottom-0">Over 1500 Ratings</p>
                <h1 class="uppercase bolder font-26 under-heading bottom-10">Unmatched</h1>
                <p class="color-white opacity-70 bottom-30">
                    We've built a reputation. We care about all our customers and we give 150% attention to detail for perfect quality.
                </p>

            </div>
        </div>
                

        <div class="divider divider-margins"></div>
            
        <div class="content-boxed">
            <div class="content">
                <div class="list-columns-left">
                    <div>
                        <i class="fa fa-phone bg-yellow1-dark round-huge fa-2x"></i>
                        <h1 class="bolder font-16">RECHARGE</h1>
                        <p>
                            Get Airtime, data and other top-up services on your app.
                        </p>
                    </div>
                </div>
                <div class="list-columns-left">
                    <div>
                        <i class="fa fa-sync bg-green1-dark round-huge fa-2x"></i>
                        <h1 class="bolder font-16">RETURNS</h1>
                        <p>
                            You get back 1% as Open Recharge Points on Airtime and 5% on data recharges.
                        </p>
                    </div>   
                </div>
                <div class="list-columns-left">
                    <div>
                        <i class="far fa-times bg-blue2-dark round-huge fa-2x"></i>
                        <h1 class="bolder font-16">FREE RECHARGE</h1>
                        <p>
                           Use your earned points to recharge for free.
                        </p>
                    </div>
                </div>
                <div class="list-columns-left">
                    <div>
                        <i class="far fa-handshake bg-yellow1-dark round-huge fa-2x"></i>
                        <h1 class="bolder font-16">TELL A FRIEND</h1>
                        <p>
                            Share the good news and earn more points for free recharge.
                        </p>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        
        <div class="content-boxed">
            <!--<p class="center-text color-highlight opacity-70 under-heading bottom-0 top-10 font-12 uppercase ultrabold">OUR CUSTOMERS SAY WE ROCK.</p>-->
            <h1 class="center-text under-heading uppercase bolder font-30 bottom-30">How to Recharge</h1>
             <div class="content">
                <div class="list-columns-left">
                    <div>
                        <img src="images/icons/signup.png" alt="img">
                        <h1 class="bolder font-16">SIGN-UP</h1>
                        <p>
                            With just your email, you can sign up <a href="openrechargesignup">here</a>.
                        </p>
                    </div>
                </div>
                <div class="list-columns-left">
                    <div>
                        <img src="images/icons/wallet.png" alt="img">
                        <h1 class="bolder font-16">FUND WALLET</h1>
                        <p>
                            Next you login and fund your wallet using any convenient option available.
                        </p>
                    </div>   
                </div>
                <div class="list-columns-left">
                    <div>
                        <img src="images/icons/topup.png" alt="img">
                        <h1 class="bolder font-16">RECHARGE</h1>
                        <p>
                           Enjoy our seamless recharge service for airtime, data, cable TV and others.
                        </p>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    <a href="openrechargelogin" class="button button-3d button-m button-circle shadow-small border-green2-dark bg-green2-dark button-margins button-m button-full">Recharge/Top-Up Now</a>
        <div class="content-boxed disabled">
            <div class="footer">
                <a href="#" class="button button-3d button-m button-circle shadow-small border-red2-dark bg-red2-light">Button</a>

                <a href="#" class="footer-title"><span class="color-highlight">StickyMobile</span></a>
                <p class="footer-text"><span>Made with <i class="fa fa-heart color-highlight font-16 left-10 right-10"></i> by Enabled</span><br><br>Powered by the best Mobile Website Developer on the Envato Marketplaces. Elite Quality. Elite Products.</p>
                <div class="footer-socials">
                    <a href="#" class="round-tiny shadow-medium bg-facebook"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="round-tiny shadow-medium bg-twitter"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="round-tiny shadow-medium bg-phone"><i class="fa fa-phone"></i></a>
                    <a href="#" data-menu="menu-share" class="round-tiny shadow-medium bg-red2-dark"><i class="fa fa-share-alt"></i></a>
                    <a href="#" class="back-to-top round-tiny shadow-medium bg-dark1-light"><i class="fa fa-angle-up"></i></a>
                </div>
                <div class="clear"></div>
                <p class="footer-copyright">Copyright &copy; Enabled <span id="copyright-year">2017</span>. All Rights Re served.</p>
                <p class="footer-links"><a href="#" class="color-highlight">Privacy Policy</a> | <a href="#" class="color-highlight">Terms and Conditions</a> | <a href="#" class="back-to-top color-highlight"> Back to Top</a></p>
                <div class="clear"></div>
            </div>    
        </div>
    </div>
    <!-- Page Content Class Ends Here-->

    <!--Menu Settings-->
    <div id="menu-settings" class="menu menu-box-bottom menu-box-detached round-large" data-menu-height="310" data-menu-effect="menu-over">
        <div class="content bottom-0">
            <div class="menu-title"><h1>Settings</h1><p class="color-highlight">Flexible and Easy to Use</p><a href="#" class="close-menu"><i class="fa fa-times"></i></a></div>
            <div class="divider bottom-20"></div>
            <div class="toggle-with-icon">
                <i class="toggle-icon round-tiny fa fa-moon bg-red2-dark color-white"></i>
                <a href="#" class="toggle-switch toggle-ios toggle-off" 
                   data-toggle-theme=""
                   data-toggle-height="27"
                   data-toggle-width="50"
                   data-toggle-content="toggle-content-1"
                   data-toggle-checkbox="toggle-checkbox-1"
                   data-bg-on="bg-green1-dark" 
                   data-bg-off="">
                    <span class="color-theme regularbold font-13">Dark Mode</span>
                    <strong></strong>
                    <u></u>
                </a>    
            </div>     
            <div class="divider top-25 bottom-0"></div>
            <div class="link-list link-list-2 link-list-long-border">
                <a href="#" data-menu="menu-highlights">
                    <i class="fa fa-tint bg-green1-dark color-white round-tiny"></i>
                    <span>Page Highlight</span>
                    <strong>16 Color Highlights Included</strong>
                    <em class="bg-highlight">HOT</em>
                </a>    
                <a href="#" data-menu="menu-backgrounds" class="no-border">
                    <i class="fa fa-brush bg-blue2-dark color-white round-tiny"></i>
                    <span>Page Background</span>
                    <strong>10 Page Gradients Included</strong>
                    <em class="bg-highlight">NEW</em>
                </a>      
            </div>
        </div> 
        
    </div>    
    <!--Menu Settings Highlights-->
    <div id="menu-highlights" class="menu menu-box-bottom menu-box-detached round-large" data-menu-height="380" data-menu-effect="menu-over">
        <div class="content bottom-0">
            <div class="menu-title"><h1>Highlights</h1><p class="color-highlight">Any Element can have a Highlight Color</p><a href="#" class="close-menu"><i class="fa fa-times"></i></a></div>
            <div class="divider bottom-0"></div>
            <div class="highlight-changer bottom-30">
                <a href="#" data-change-highlight="blue2"><i class="fa fa-circle color-blue2-dark"></i><span class="color-blue2-light">Default</span></a>
                <a href="#" data-change-highlight="red1"><i class="fa fa-circle color-red1-dark"></i><span class="color-red2-light">Red</span></a>    
                <a href="#" data-change-highlight="orange"><i class="fa fa-circle color-orange-dark"></i><span class="color-orange-light">Orange</span></a>    
                <a href="#" data-change-highlight="pink2"><i class="fa fa-circle color-pink2-dark"></i><span class="color-pink2-light">Pink</span></a>    
                <a href="#" data-change-highlight="magenta2"><i class="fa fa-circle color-magenta2-dark"></i><span class="color-magenta2-light">Purple</span></a>    
                <a href="#" data-change-highlight="aqua"><i class="fa fa-circle color-aqua-dark"></i><span class="color-aqua-light">Aqua</span></a>      
                <a href="#" data-change-highlight="teal"><i class="fa fa-circle color-teal-dark"></i><span class="color-teal-light">Teal</span></a>      
                <a href="#" data-change-highlight="mint"><i class="fa fa-circle color-mint-dark"></i><span class="color-mint-light">Mint</span></a>      
                <a href="#" data-change-highlight="green2"><i class="fa fa-circle color-green2-dark"></i><span class="color-green2-light">Green</span></a>    
                <a href="#" data-change-highlight="green1"><i class="fa fa-circle color-green1-dark"></i><span class="color-green1-light">Grass</span></a>       
                <a href="#" data-change-highlight="yellow2"><i class="fa fa-circle color-yellow2-dark"></i><span class="color-yellow2-light">Sunny</span></a>    
                <a href="#" data-change-highlight="yellow1"><i class="fa fa-circle color-yellow1-dark"></i><span class="color-yellow1-light">Goldish</span></a>
                <a href="#" data-change-highlight="brown1"><i class="fa fa-circle color-brown1-dark"></i><span class="color-brown1-light">Wood</span></a>    
                <a href="#" data-change-highlight="dark1"><i class="fa fa-circle color-dark1-dark"></i><span class="color-dark1-light">Night</span></a>
                <a href="#" data-change-highlight="dark2"><i class="fa fa-circle color-dark2-dark"></i><span class="color-dark2-light">Dark</span></a>
                <div class="clear"></div>
            </div>
            <a href="#" data-menu="menu-settings" class="button button-s button-full button-m button-round-large bg-highlight shadow-large">Back to Settings</a>
        </div>
    </div>    
    <!-- Menu Settings Backgrounds-->
    <div id="menu-backgrounds" class="menu menu-box-bottom menu-box-detached round-large" data-menu-height="310" data-menu-effect="menu-over">
        <div class="content">
            <div class="menu-title"><h1>Backgrounds</h1><p class="color-highlight">Change Page Color Behind Content Boxes</p><a href="#" class="close-menu"><i class="fa fa-times"></i></a></div>
            <div class="divider bottom-0"></div>
            <div class="background-changer bottom-30">
                <a href="#" data-change-background="none"><i class="bg-theme"></i><span>Default</span></a>
                <a href="#" data-change-background="plum"><i class="body-plum"></i><span class="color-plum-dark">Plum</span></a>
                <a href="#" data-change-background="magenta3"><i class="body-magenta3"></i><span class="color-magenta3-dark">Magenta</span></a>
                <a href="#" data-change-background="dark3"><i class="body-dark3"></i><span class="color-dark3-dark">Dark</span></a>
                <a href="#" data-change-background="violet"><i class="body-violet"></i><span class="color-violet-dark">Violet</span></a>
                <a href="#" data-change-background="red3"><i class="body-red3"></i><span class="color-red3-dark">Red</span></a>
                <a href="#" data-change-background="green3"><i class="body-green3"></i><span class="color-green3-dark">Green</span></a>
                <a href="#" data-change-background="sky"><i class="body-sky"></i><span class="color-sky-dark">Sky</span></a>
                <a href="#" data-change-background="pumpkin"><i class="body-pumpkin"></i><span class="color-pumpkin-dark">Orange</span></a>
                <a href="#" data-change-background="yellow3"><i class="body-yellow3"></i><span class="color-yellow3-dark">Yellow</span></a>
                <div class="clear"></div>
            </div>
            <a href="#" data-menu="menu-settings" class="button button-s button-full button-m button-round-large bg-highlight shadow-large">Back to Settings</a>
        </div>
    </div>
    <!-- Menu Share-->
    <div id="menu-share" class="menu menu-box-bottom menu-box-detached round-large" data-menu-height="340" data-menu-effect="menu-over">
        <div class="content bottom-0">
            <div class="menu-title"><h1>Share the Love</h1><p class="color-highlight">Just Tap the Social Icon. We'll add the Link</p><a href="#" class="close-menu"><i class="fa fa-times"></i></a></div>
            <div class="divider bottom-0"></div>
        </div>
        <div class="link-list link-list-1 left-15 right-15">
            <a href="#" class="shareToFacebook">
                <i class="font-18 fab fa-facebook color-facebook"></i>
                <span class="font-13">Facebook</span>
                <i class="fa fa-angle-right"></i>
            </a>
            <a href="#" class="shareToTwitter">
                <i class="font-18 fab fa-twitter-square color-twitter"></i>
                <span class="font-13">Twitter</span>
                <i class="fa fa-angle-right"></i>
            </a>
            <a href="#" class="shareToLinkedIn">
                <i class="font-18 fab fa-linkedin color-linkedin"></i>
                <span class="font-13">LinkedIn</span>
                <i class="fa fa-angle-right"></i>
            </a>        
            <a href="#" class="shareToWhatsApp">
                <i class="font-18 fab fa-whatsapp-square color-whatsapp"></i>
                <span class="font-13">WhatsApp</span>
                <i class="fa fa-angle-right"></i>
            </a>   
            <a href="#" class="shareToMail no-border">
                <i class="font-18 fa fa-envelope-square color-mail"></i>
                <span class="font-13">Email</span>
                <i class="fa fa-angle-right"></i>
            </a>
        </div>
    </div>

    <div class="menu-hider"></div>
</div>
    </form>

<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/plugins.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>
</body>
</html>

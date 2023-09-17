<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="connectcitizensignup2.aspx.cs" Inherits="ConnectRechargeWebsite.connectcitizensignup2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
<title>ConnectRecharge-Open</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i|Source+Sans+Pro:300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styles/style.css">
<link rel="stylesheet" type="text/css" href="styles/framework.css">
<link rel="stylesheet" type="text/css" href="fonts/css/fontawesome-all.min.css">  
<link rel="icon" type="image/png" href="images/favicon.ico"/>  
 <script>
  function payWithPaystack(){
    var handler = PaystackPop.setup({
        key: 'pk_live_43306e11eaecf9e3b75463b18acf0a587b482d0b',
        email: '<%=Variable_email %>',
        amount: <%=Variable_amount %>,
      currency: "NGN",
      ref: '<%=Variable_tranid %>', // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
      metadata: {
         custom_fields: [
            {
                display_name: "Email",
                variable_name: "Email",
                value: "<%=Variable_email %>"
            }
         ]
      },
      callback: function(response){
          document.getElementById('<%=hdn.ClientID%>').value = response.reference;
          alert('success. transaction ref is ' + response.reference + ' copy and keep safely.');
      },
      onClose: function(){
          alert('If successful, click on Fund Wallet for Instant Funding.');
      }
    });
    handler.openIframe();
  }
</script>
</head>
    
<body class="theme-light" data-background="none" data-highlight="blue2">
    <form id="form1" runat="server">
    <div id="page">
        <asp:HiddenField id="hdn" runat="server"></asp:HiddenField>
        
    <div id="page-preloader">
        <div class="loader-main"><div class="preload-spinner border-highlight"></div></div>
    </div>
    
	<div class="header header-fixed header-logo-center">
        <a href="#" class="header-title">Connect Citizens</a>
		<a href="#" class="back-button header-icon header-icon-1"><i class="fas fa-arrow-left"></i></a>
		<a href="#" data-toggle-theme-switch="" class="header-icon header-icon-4"><i class="fas fa-lightbulb"></i></a>
	</div>
        
   <div id="footer-menu" class="footer-menu-5-icons footer-menu-style-1">
        <a href="https://connectrecharge.com"><i class="fa fa-home color-black-dark"></i><span>Home</span></a>
        <a href="https://connectrecharge.com/connectrecharge"><i class="fa fa-list color-black-dark"></i><span>Learn More</span></a>
        <a href="https://connectrecharge.com/faq"><i class="fa fa-circle color-black-dark"></i><span>FAQ</span></a>
        <a href="index"><i class="fa fa-angle-right color-black-dark"></i><span>Login/Sign-up</span></a>
        <a href="https://connectrecharge.com/contactus" data-menu="menu-settings"><i class="fa fa-envelope-square color-black-dark"></i><span>Contact us</span></a>

        <div class="clear"></div>
    </div>
    
    <div class="page-content header-clear-medium">
        
        <div data-height="130" class="caption caption-margins round-medium shadow-huge">
            <div class="caption-center right-15 top-15 text-right">
                <%--<a href="openrecharge" class="back-button button button-xs button-round-huge bg-highlight">Back Home</a>--%>
            </div>
            <div class="caption-center left-15 text-left">
                <h1 class="color-white bolder">Connect Citizen - Registration</h1>
                <p class="under-heading color-white opacity-90 bottom-0">
                   Payment Step
                </p>
                <p class="under-heading color-white opacity-90 bottom-0">
                    <asp:Label ID="LblUserID" runat="server" Text="" Visible="false"></asp:Label> <asp:Label ID="LblEmail" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="LblRefID" runat="server" Text="" Visible="false"></asp:Label>
                </p>
            </div>
            <div class="caption-overlay bg-black opacity-70"></div>
            <div class="caption-bg bg-18"></div>
        </div> 
        
        <div class="content-boxed disabled">
            <p class="content bottom-25">
                
            </p>
        </div>

        <div class="content-boxed">
        <div class="left-40 right-40 input-style input-style-1 input-required">
          <span>UserId/Email</span>
           <em>(required)</em>
            <asp:TextBox ID="txtUserID" runat="server" placeholder="Enter UserID/Email"></asp:TextBox>            
              <br />                        
          </div> 
          <div class="input-style has-icon input-style-1 input-required left-40 right-40">
               <span>Choose Registration Option:</span>
               <em><i class="fa fa-angle-down"></i></em>             
                <asp:DropDownList ID="ddlRegOption" runat="server" AutoPostBack="true">
                    <asp:ListItem Selected="False">Citizen</asp:ListItem>                             
                    <asp:ListItem>Citizen</asp:ListItem>
                    <asp:ListItem>Vendor</asp:ListItem>
                </asp:DropDownList>
          </div>          
                    
             <div class="left-40 right-40">                      
         <asp:Button ID="BtnVerify" runat="server" CssClass="button button-m shadow-small button-circle bg-green2-dark" Text="Verify" OnClick="BtnVerify_Click" />  
            <asp:Label ID="LblVerify" runat="server" Text="" Visible="false" style="color: #FFFFFF; background-color: #FF0000"></asp:Label>         
                 </div>
        </div>

        <asp:Panel ID="PanelPay" runat="server" Visible="false">
        <div class="content-boxed">
            <div class="content accordion-style-1 accordion-round-medium">
                <h3 class="bolder">Registration Payment</h3>
                <a href="#" data-accordion="accordion-content-11" class="accordion-toggle-first bg-highlight">
                    <i class="accordion-icon-left fa fa-wallet"></i>
                    PAY WITH ATM (PAYSTACK)
                <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <div id="accordion-content-11" class="accordion-content bottom-10">                     
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>Select a Payment Option</span>
                         <em><i class="fa fa-angle-down"></i></em>                                                                                               
                    </div>
                    <script src="https://js.paystack.co/v1/inline.js"></script>
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>Wallet Funding</span>
                         <em><i class="fa fa-angle-down"></i></em>
                         <asp:DropDownList ID="ddlPayStackFundingOption" runat="server" AutoPostBack="true">
                             <asp:ListItem Selected="False">Citizen - Registration</asp:ListItem>
                             <%--<asp:ListItem>Registration</asp:ListItem>--%>
                             <asp:ListItem>Citizen - Registration</asp:ListItem>
                         </asp:DropDownList>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Amount</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtPayStackAmount" runat="server" placeholder="Enter Amount" ReadOnly="true"></asp:TextBox>
                        <br />
                    </div>
                    <asp:Button ID="BtnPayStackProceed" runat="server" CssClass="button button-m shadow-small button-circle bg-green2-dark" Text="Proceed" OnClick="BtnPayStackProceed_Click" />

                    <asp:Panel ID="PanelPayStack" runat="server" Visible ="false">
                    <button type="button" class="button button-m shadow-small button-circle bg-red2-dark" onclick="payWithPaystack()"> Pay with PayStack </button>
                    
                    </asp:Panel>                    
                </div>

                <a href="#" data-accordion="accordion-content-19" class="accordion-toggle bg-highlight">
                    <i class="accordion-icon-left fa fa-wallet"></i>
                    FUND WALLET INSTANTLY (PAYSTACK)
                <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <div id="accordion-content-19" class="accordion-content bottom-10">                   

                    <asp:Panel ID="PanelInstantFund" runat="server" Visible ="true">
                    <asp:Button ID="BtnFundWalletInstant" runat="server" CssClass="button button-m shadow-small button-circle bg-green2-dark" Text="Fund Wallet" OnClick="BtnFundWalletInstant_Click" />
                    </asp:Panel>                  
                </div>

                <a href="#" data-accordion="accordion-content-18" class="accordion-toggle bg-highlight">
                    <i class="accordion-icon-left fa fa-wallet"></i>
                    FUND LATER AFTER PAYMENT (PAYSTACK)
                <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <div id="accordion-content-18" class="accordion-content bottom-10">

                    <div class="input-style input-style-1 input-required">
                        <span>Payment Transaction ID(Paystack)</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtPayStackTranID" runat="server" placeholder="Enter Transaction ID"></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Amount Paid</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtPayStackIDAmount" runat="server" placeholder="Enter Amount"></asp:TextBox>
                        <br />
                    </div>
                    
                    <asp:Button ID="BtnFundWalletNonInstant" runat="server" CssClass="button button-m shadow-small button-circle bg-green2-dark" Text="Fund Wallet" OnClick="BtnFundWalletInstant_Click" />
                </div>

                <a href="#" data-accordion="accordion-content-14" class="accordion-toggle bg-highlight">
                    <i class="accordion-icon-left fa fa-wallet"></i>
                    USSD
                <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <div id="accordion-content-14" class="accordion-content bottom-10">                     
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>Click to Select your Bank</span>
                         <em><i class="fa fa-angle-down"></i></em>
                         <asp:DropDownList ID="ddlBank" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBank_SelectedIndexChanged">
                             <asp:ListItem Selected="False">Click to Select your Payment Bank</asp:ListItem>
                             <asp:ListItem>ACCESS BANK</asp:ListItem>
                             <asp:ListItem>CITIBANK</asp:ListItem>
                             <asp:ListItem>DIAMOND BANK</asp:ListItem>
                             <asp:ListItem>ECOBANK</asp:ListItem>
                             <asp:ListItem>FIRST BANK</asp:ListItem>
                             <asp:ListItem>FIDELITY BANK</asp:ListItem>
                             <asp:ListItem>FCMB</asp:ListItem>
                             <asp:ListItem>GTBANK</asp:ListItem>
                             <asp:ListItem>HERITAGE BANK</asp:ListItem>
                             <asp:ListItem>KEYSTONE BANK</asp:ListItem>
                             <asp:ListItem>POLARIS BANK(SKYE)</asp:ListItem>
                             <asp:ListItem>STERLING BANK</asp:ListItem>
                             <asp:ListItem>STANBIC IBTC</asp:ListItem>
                             <asp:ListItem>STANDARD CHARTERED BANK</asp:ListItem>
                             <asp:ListItem>UBA</asp:ListItem>
                             <asp:ListItem>UNITY BANK</asp:ListItem>
                             <asp:ListItem>UNION BANK</asp:ListItem>
                             <asp:ListItem>WEMA BANK</asp:ListItem>
                             <asp:ListItem>ZENITH BANK</asp:ListItem>
                         </asp:DropDownList>
                        </div>
                  </div>

                <a href="#" data-accordion="accordion-content-15" class="accordion-toggle bg-highlight">
                    <i class="accordion-icon-left fa fa-wallet"></i>
                    BANK TRANSFER (MOBILE APP)
                <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <div id="accordion-content-15" class="accordion-content bottom-10">                     
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>See Payment Details Below</span>
                        <br/>MAKE TRANSFERS USING THE ACCOUNT DETAILS BELOW
                        <br />Account Name:  <strong>CONNECT MAGNET LIMITED</strong>
                        <br />Account Number:
                        <br />Bank Name: <strong>GUARANTY TRUST BANK</strong>
                        </div>
                  </div>

                <a href="#" data-accordion="accordion-content-16" class="accordion-toggle bg-highlight">
                    <i class="accordion-icon-left fa fa-wallet"></i>
                    BANK DEPOSIT (TELLER)
                <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <div id="accordion-content-16" class="accordion-content bottom-10">                     
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>See Payment Details Below</span>
                          <br/>MAKE DEPOSITS USING THE ACCOUNT DETAILS BELOW
                       <br />Account Name:  <strong>CONNECT MAGNET LIMITED</strong>
                        <br />Account Number:
                        <br />Bank Name: <strong>GUARANTY TRUST BANK</strong>
                        </div>
                  </div>

                <a href="#" data-accordion="accordion-content-12" class="accordion-toggle-last bg-red2-dark">
                    <i class="accordion-icon-left fa fa-gift"></i>
                    Send Payment Notification
                <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <div id="accordion-content-12" class="accordion-content bottom-10">                     
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>Enter Depositor's Name</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtDepositorName" runat="server" placeholder="Enter Depositor Name"></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Phone Email</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtDepositorEmail" runat="server" placeholder="Enter Email"></asp:TextBox>
                    </div>

                     <div class="input-style input-style-1 input-required">
                        <span>Amount</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtDepositorAmount" runat="server" placeholder="Enter Amount"></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Click to select payment mode</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddlPaymentMode" runat="server">
                             <asp:ListItem Selected="False">Select your Payment Option</asp:ListItem>
                             <asp:ListItem>PAYSTACK (ONLINE)</asp:ListItem>
                             <asp:ListItem>USSD</asp:ListItem>
                             <asp:ListItem>BANK TRANSFER</asp:ListItem>
                             <asp:ListItem>BANK DEPOSIT (TELLER)</asp:ListItem>
                         </asp:DropDownList>
                    </div>
                   
                     <div class="input-style input-style-1 input-required">
                        <span>Bank Name</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtBankName" runat="server" placeholder="Select Bank Name" Text="GTBank"></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>TellerNo</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtTellerNo" runat="server" placeholder="Enter Teller Number" Text="None"></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <h5 class="bolder">Enter your payment date</h5>
                        <span>Date</span>
                        <em>(required)</em>
                        <%--<asp:Calendar ID="CalenderDatePaid" runat="server"></asp:Calendar>--%>
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                    </div>

                    <asp:Button ID="BtnSendPayNotification" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="Send" OnClick="BtnSendPayNotification_Click" />
                </div>
           </div> 
            </div>
                </asp:Panel>
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
        </div>
    </form>

    <script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/plugins.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>
</body>
</html>



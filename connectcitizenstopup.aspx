<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="connectcitizenstopup.aspx.cs" Inherits="ConnectRechargeWebsite.ConnectCitizensTopUp" %>

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
          alert('If successful, Click on Fund Wallet for Instant Funding.');
      }
    });
    handler.openIframe();
  }
</script>
</head>
    
<body class="theme-light" data-background="none" data-highlight="green2">
    <form id="form1" runat="server">
    <div id="page">
        <asp:HiddenField id="hdn" runat="server"></asp:HiddenField>
        
    <div id="page-preloader">
        <div class="loader-main"><div class="preload-spinner border-highlight"></div></div>
    </div>
    
	<div class="header header-fixed header-logo-center">
        <a href="connectcitizen" class="header-title">Connect Citizen</a>
		<a href="#" class="back-button header-icon header-icon-1"><i class="fas fa-arrow-left"></i></a>
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
        
        <div data-height="130" class="caption caption-margins round-medium shadow-huge">
            <div class="caption-center right-15 top-15 text-right">
                <%--<a href="openrecharge" class="back-button button button-xs button-round-huge bg-highlight">Back Home</a>--%>
            </div>
            <div class="caption-center left-15 text-left">
                <h1 class="color-white bolder">Connect Citizens</h1>
                <p class="under-heading color-white opacity-100 bottom-0">
                    <em>Virtual Top-Up Software</em>
                </p>
                <p class="under-heading color-white opacity-90 bottom-0">
                    User ID: <asp:Label ID="LblUserID" runat="server" Text=""></asp:Label> 
                    <asp:Label ID="LblRefID" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="LblEmail" runat="server" Text="" Visible="false"></asp:Label>
                </p>
                <p class="under-heading color-white opacity-90 bottom-0">
                 Friendly Name: <asp:Label ID="LblNickName" runat="server" Text=""></asp:Label>
                </p>
                <p class="under-heading color-white opacity-90 bottom-0">
                    Client Status: <asp:Label ID="LblClientStatus" runat="server" Text="*Citizen"></asp:Label>
                </p>                
            </div>
            <div class="caption-overlay bg-black opacity-70"></div>
            <div class="caption-bg bg-18"></div>
        </div> 
        
        <div class="content-boxed">
           <p class="under-heading color-white opacity-90 bottom-0 left-20 right-40">
                    <asp:Button ID="BtnLogout" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="Logout" OnClick="BtnLogout_Click" />
                </p>
        </div>
        
        <div class="content-boxed disabled">
            <p class="content bottom-25">
                
            </p>
        </div>

        <div class="content-boxed">
            <div class="content accordion-style-1 accordion-round-medium">
                <h3 class="bolder">Account Balance</h3>
                <a href="#" data-accordion="accordion-content-11" class="accordion-toggle-first bg-green2-dark">
                    <i class="accordion-icon-left fa fa-wallet"></i>
                    Deposit Balance - <asp:Label ID="LblWalletbalance" runat="server" Text="Label"></asp:Label>
                </a>
                <a href="#" data-accordion="accordion-content-12" class="accordion-toggle-last bg-green2-dark">
                    <i class="accordion-icon-left fa fa-gift"></i>
                    Earnings Balance - <asp:Label ID="LblEarningsBalance" runat="server" Text="Label"></asp:Label>
                </a>                
                </div>
           </div> 

        <div class="content-boxed">
            <div class="content accordion-style-1 accordion-round-medium">
                <h3 class="bolder">More Account Functions</h3>
               <a href="#" data-accordion="accordion-content-13" class="accordion-toggle-first bg-green2-dark">
                    <i class="accordion-icon-left fa fa-gift"></i>
                    Register Sub VTU Account <br />
                </a>
                  <div id="accordion-content-13" class="accordion-content bottom-10">
                     <asp:Button ID="BtnSubAccountSignUp" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="Sign Up" OnClick="BtnSubAccountSignUp_Click" />
                      </div>
                <a href="#" data-accordion="accordion-content-21" class="accordion-toggle-last bg-green2-dark">
                    <i class="accordion-icon-left fa fa-gift"></i>
                    Upgrade to Vendor <br />
                </a>
                <div id="accordion-content-21" class="accordion-content bottom-10">
                     <asp:Button ID="BtnVendor" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="Upgrade" OnClick="BtnVendor_Click" />
                    </div>
                </div>
           </div> 

        <div class="content-boxed">
            <div class="content accordion-style-1 accordion-round-medium">
                <h3 class="bolder">Wallet Funding</h3>
                <a href="#" data-accordion="accordion-content-11" class="accordion-toggle-first bg-green2-dark">
                    <i class="accordion-icon-left fa fa-wallet"></i>
                    PAY & FUND INSTANTLY (PAYSTACK)
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
                             <asp:ListItem Selected="False">Wallet Funding</asp:ListItem>
                             <%--<asp:ListItem>Registration</asp:ListItem>--%>
                             <asp:ListItem>Wallet Funding</asp:ListItem>
                         </asp:DropDownList>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Amount</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtPayStackAmount" runat="server" placeholder="Enter Amount"></asp:TextBox>
                        <br />
                    </div>
                    <asp:Button ID="BtnPayStackProceed" runat="server" CssClass="button button-m shadow-small button-circle bg-green2-dark" Text="Proceed" OnClick="BtnPayStackProceed_Click" />

                    <asp:Panel ID="PanelPayStack" runat="server" Visible ="false">
                    <button type="button" class="button button-m shadow-small button-circle bg-red2-dark" onclick="payWithPaystack()"> Pay with PayStack </button>
                    
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
                        <br />Account Number: 0467424053
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
                        <br />Account Number: 0467424053
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
                        <span>User ID</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtDepositorEmail" runat="server" placeholder="Enter UserID"></asp:TextBox>
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
        <div class="content-boxed">
            <div class="content accordion-style-1 accordion-round-medium">
                <h3 class="bolder">Click on the recharge option you want below</h3>
                <!--<p>
                    Color accordions can have any color you set to your main page, they will get the color automatically.
                </p>-->

                <a href="#" data-accordion="accordion-content-1" class="accordion-toggle-first bg-highlight">
                    <i class="accordion-icon-left fa fa-phone"></i>
                    Airtime VTU 
                    <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <div id="accordion-content-1" class="accordion-content bottom-10">                     
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>Click to select a Network</span>
                         <em><i class="fa fa-angle-down"></i></em>
                         <asp:DropDownList ID="ddlORAirtimeNetwork" runat="server">
                             <asp:ListItem Selected="False">Select your Network</asp:ListItem>
                             <asp:ListItem>MTN</asp:ListItem>
                             <asp:ListItem>GLO</asp:ListItem>
                             <asp:ListItem>AIRTEL</asp:ListItem>
                             <asp:ListItem>9MOBILE</asp:ListItem>
                         </asp:DropDownList>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Phone No.</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtORAirtimePhone" runat="server" placeholder="Phone No."></asp:TextBox>
                    </div>

                     <div class="input-style input-style-1 input-required">
                        <span>Amount</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtORAmountVTU" runat="server" placeholder="Amount"></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Click to select payment option</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddlORPayOptionVTU" runat="server">
                             <asp:ListItem Selected="False">Select your Payment Option</asp:ListItem>
                             <asp:ListItem>Wallet</asp:ListItem>
                             <%--<asp:ListItem>ORP (Open Recharge Points)</asp:ListItem>--%>
                         </asp:DropDownList>
                    </div>
                    <asp:Button ID="BtnOpenRechargeAirtime" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="Recharge Airtime" OnClick="BtnOpenRechargeAirtime_Click" />
                </div>

                <a data-accordion="accordion-content-2" href="#" class="accordion-toggle bg-highlight">
                    <i class="accordion-icon-left fa fa-address-book"></i>
                    Airtime PIN
                    <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <div id="accordion-content-2" class="accordion-content bottom-10">
                    <div class="input-style input-style-1 input-required">
                        <span>Amount</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtORAmountPIN" runat="server" placeholder="Amount"></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Click to select payment option</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddlORPayOptionPIN" runat="server">
                             <asp:ListItem Selected="False">Select your Payment Option</asp:ListItem>
                             <asp:ListItem>Wallet</asp:ListItem>
                             <%--<asp:ListItem>ORP (Open Recharge Points)</asp:ListItem>--%>
                         </asp:DropDownList>
                    </div>
                    <asp:Button ID="BtnOpenRechargeAirtimePIN" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="Generate PIN" OnClick="BtnOpenRechargeAirtimePIN_Click" />
                </div>

                <a href="#" data-accordion="accordion-content-3" class="accordion-toggle-last bg-highlight">
                    <i class="accordion-icon-left fa fa-wifi"></i>
                    Data VTU 
                    <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <!--MTN DATA -->
                <div id="accordion-content-3" class="accordion-content bottom-10">
                <a href="#" class="toggle-switch toggle-ios toggle-off" 
                   data-toggle-height="30"
                   data-toggle-width="58"
                   data-toggle-content="toggle-content-1"
                   data-toggle-checkbox="toggle-checkbox-1"
                   data-icons-size="8"
                   data-bg-on="bg-yellow1-light" 
                   data-bg-off="bg-yellow2-light">
                    <span class="color-theme regularbold font-14">Click to Switch on MTN Data</span>
                    <strong></strong>
                    <i class="fa-t1 font-regular bold">ON</i>
                    <i class="fa-t2 font-regular bold">OFF</i>
                    <u></u>
                </a>

                <div class="toggle-content" id="toggle-content-1">                    
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>MTN</span>
                         <em><i class="fa fa-angle-down"></i></em>                       
                    </div>                  

                    <asp:Panel ID="PanelMtnData" runat="server">
                        <div class="input-style input-style-1 input-required">
                        <span>Click to select data plan</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddlMtnDataPlans" runat="server">
                             <asp:ListItem Selected="False">Select your Data Plan</asp:ListItem>
                             <asp:ListItem>10MB (1 Day) - #200</asp:ListItem>
                             <asp:ListItem>500MB (1 Day) - #400</asp:ListItem>
                             <asp:ListItem>750MB (1 Week) - #650</asp:ListItem>
                             <asp:ListItem>1GB (1 Month) - #1200</asp:ListItem>
                             <asp:ListItem>5GB (1 Month) - #3500</asp:ListItem>
                             <asp:ListItem>10GB (1 Month) - #6000</asp:ListItem>
                             <asp:ListItem>22GB (1 Month) - #12000</asp:ListItem>
                         </asp:DropDownList>
                        </div>
                        </asp:Panel>

                    <div class="input-style input-style-1 input-required">
                        <span>Phone No.</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtORMTNDataPhone" runat="server" placeholder="Phone No."></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Click to select payment option</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddlORMTNPayOptionData" runat="server">
                             <asp:ListItem Selected="False">Select your Payment Option</asp:ListItem>
                             <asp:ListItem>Wallet</asp:ListItem>
                             <asp:ListItem>ORP (Open Recharge Points)</asp:ListItem>
                         </asp:DropDownList>
                    </div>
                    <asp:Button ID="BtnOpenRechargeMTNData" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="Recharge Data" />
                
                </div>       
               <!--GLO Data -->
                         

                <div class="divider top-20 bottom-20"></div>
                    <a href="#" class="toggle-switch toggle-ios toggle-off" 
                   data-toggle-height="30"
                   data-toggle-width="58"
                   data-toggle-content="toggle-content-2"
                   data-toggle-checkbox="toggle-checkbox-2"
                   data-icons-size="8"
                   data-bg-on="bg-green1-light" 
                   data-bg-off="bg-green2-dark">
                    <span class="color-theme regularbold font-14">Click to Switch on GLO Data</span>
                    <strong></strong>
                    <i class="fa-t1 font-regular bold">ON</i>
                    <i class="fa-t2 font-regular bold">OFF</i>
                    <u></u>
                </a>

                <div class="toggle-content" id="toggle-content-2">                    
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>GLO</span>
                         <em><i class="fa fa-angle-down"></i></em>                       
                    </div>                  

                    <asp:Panel ID="Panel1" runat="server">
                        <div class="input-style input-style-1 input-required">
                        <span>Click to select data plan</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddlGloDataPlans" runat="server">
                             <asp:ListItem Selected="False">Select your Data Plan</asp:ListItem>
                             <asp:ListItem>70MB (1 Day) - #150</asp:ListItem>
                             <asp:ListItem>200MB (5 Days) - #300</asp:ListItem>
                             <asp:ListItem>750MB (1 Week) - #650</asp:ListItem>
                             <asp:ListItem>1.6GB (10 Days) - #800</asp:ListItem>
                             <asp:ListItem>3.2GB (1 Month) - #1600</asp:ListItem>
                             <asp:ListItem>7.5GB (1 Month) - #3000</asp:ListItem>
                             <asp:ListItem>22GB (1 Month) - #12000</asp:ListItem>
                         </asp:DropDownList>
                        </div>
                        </asp:Panel>

                    <div class="input-style input-style-1 input-required">
                        <span>Phone No.</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtORGLODataPhone" runat="server" placeholder="Phone No."></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Click to select payment option</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddlORGLOPayOptionData" runat="server">
                             <asp:ListItem Selected="False">Select your Payment Option</asp:ListItem>
                             <asp:ListItem>Wallet</asp:ListItem>
                             <asp:ListItem>ORP (Open Recharge Points)</asp:ListItem>
                         </asp:DropDownList>
                    </div>
                    <asp:Button ID="BtnOpenRechargeGLOData" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="Recharge Data" />
                
                </div>
                    <!-- AIRTEL DATA -->     

                <div class="divider top-20 bottom-20"></div>
                <a href="#" class="toggle-switch toggle-ios toggle-off" 
                   data-toggle-height="30"
                   data-toggle-width="58"
                   data-toggle-content="toggle-content-3"
                   data-toggle-checkbox="toggle-checkbox-3"
                   data-icons-size="8"
                   data-bg-on="bg-red1-light" 
                   data-bg-off="bg-red2-dark">
                    <span class="color-theme regularbold font-14">Click to Switch on AIRTEL Data</span>
                    <strong></strong>
                    <i class="fa-t1 font-regular bold">ON</i>
                    <i class="fa-t2 font-regular bold">OFF</i>
                    <u></u>
                </a>

                <div class="toggle-content" id="toggle-content-3">                    
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>GLO</span>
                         <em><i class="fa fa-angle-down"></i></em>                       
                    </div>                  

                    <asp:Panel ID="Panel2" runat="server">
                        <div class="input-style input-style-1 input-required">
                        <span>Click to select data plan</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddlAIRTELDataPlans" runat="server">
                             <asp:ListItem Selected="False">Select your Data Plan</asp:ListItem>
                             <asp:ListItem>30MB (1 Day) - #150</asp:ListItem>
                             <asp:ListItem>100MB (3 Days) - #350</asp:ListItem>
                             <asp:ListItem>750MB (2 Weeks) - #750</asp:ListItem>
                             <asp:ListItem>1.5GB (1 Month) - #1200</asp:ListItem>
                             <asp:ListItem>3.5GB (1 Month) - #2400</asp:ListItem>
                             <asp:ListItem>5GB (1 Month) - #3500</asp:ListItem>
                             <asp:ListItem>7GB (1 Month) - #4200</asp:ListItem>
                             <asp:ListItem>9GB (1 Month) - #5200</asp:ListItem>
                             <asp:ListItem>10GB (1 Month) - #5800</asp:ListItem>
                             <asp:ListItem>16GB (1 Month) - #9500</asp:ListItem> 
                             <asp:ListItem>22GB (1 Month) - #12000</asp:ListItem>
                             <asp:ListItem>30GB (2 Months) - #18000</asp:ListItem>
                             <asp:ListItem>50GB (6 Months) - #45000</asp:ListItem>
                             <asp:ListItem>100GB (1 Year) - #85000</asp:ListItem>
                             <asp:ListItem>100GB (1 Year) - #85000</asp:ListItem>
                             <asp:ListItem>200GB (1 Year) - #165000</asp:ListItem>
                         </asp:DropDownList>
                        </div>
                        </asp:Panel>

                    <div class="input-style input-style-1 input-required">
                        <span>Phone No.</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtORAIRTELDataPhone" runat="server" placeholder="Phone No."></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Click to select payment option</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddlORAIRTELPayOptionData" runat="server">
                             <asp:ListItem Selected="False">Select your Payment Option</asp:ListItem>
                             <asp:ListItem>Wallet</asp:ListItem>
                             <asp:ListItem>ORP (Open Recharge Points)</asp:ListItem>
                         </asp:DropDownList>
                    </div>
                    <asp:Button ID="BtnOpenRechargeAIRTELData" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="Recharge Data" />
                
                </div>
                    <!--9MOBILE-->     

                <div class="divider top-20 bottom-20"></div>
                    <a href="#" class="toggle-switch toggle-ios toggle-off" 
                   data-toggle-height="30"
                   data-toggle-width="58"
                   data-toggle-content="toggle-content-4"
                   data-toggle-checkbox="toggle-checkbox-4"
                   data-icons-size="8"
                   data-bg-on="bg-green2-dark" 
                   data-bg-off="bg-green1-light">
                    <span class="color-theme regularbold font-14">Click to Switch on 9MOBILE Data</span>
                    <strong></strong>
                    <i class="fa-t1 font-regular bold">ON</i>
                    <i class="fa-t2 font-regular bold">OFF</i>
                    <u></u>
                </a>

                <div class="toggle-content" id="toggle-content-4">                    
                    <div class="input-style has-icon input-style-1 input-required">
                        <span>9Mobile</span>
                         <em><i class="fa fa-angle-down"></i></em>                       
                    </div>                  

                    <asp:Panel ID="Panel3" runat="server">
                        <div class="input-style input-style-1 input-required">
                        <span>Click to select data plan</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddl9MobileDataPlans" runat="server">
                             <asp:ListItem Selected="False">Select your Data Plan</asp:ListItem>
                             <asp:ListItem>150MB (1 Week) - #300</asp:ListItem>
                             <asp:ListItem>1GB (1 Month) - #1200</asp:ListItem>
                             <asp:ListItem>1.5GB (1 Month) - #1500</asp:ListItem>
                             <asp:ListItem>2.5GB (1 Month) - #2500</asp:ListItem>
                             <asp:ListItem>4GB (1 Month) - #4000</asp:ListItem>
                             <asp:ListItem>11.5GB (1 Month) - #10000</asp:ListItem>
                             <asp:ListItem>15GB (1 Month) - #13000</asp:ListItem>
                             <asp:ListItem>27.5GB (1 Month) - #23800</asp:ListItem>
                             <asp:ListItem>30GB (3 Months) - #35500</asp:ListItem> 
                             <asp:ListItem>60GB (6 Months) - #70000</asp:ListItem>
                             <asp:ListItem>100GB (6 Months) - #105000</asp:ListItem>
                             <asp:ListItem>120GB (1 Year) - #150000</asp:ListItem>
                         </asp:DropDownList>
                        </div>
                        </asp:Panel>

                    <div class="input-style input-style-1 input-required">
                        <span>Phone No.</span>
                        <em>(required)</em>
                        <asp:TextBox ID="txtOR9MobileDataPhone" runat="server" placeholder="Phone No."></asp:TextBox>
                    </div>

                    <div class="input-style input-style-1 input-required">
                        <span>Click to select payment option</span>
                        <em><i class="fa fa-angle-down"></i></em>
                        <asp:DropDownList ID="ddlOR9MobilePayOptionData" runat="server">
                             <asp:ListItem Selected="False">Select your Payment Option</asp:ListItem>
                             <asp:ListItem>Wallet</asp:ListItem>
                             <asp:ListItem>ORP (Open Recharge Points)</asp:ListItem>
                         </asp:DropDownList>
                    </div>
                    <asp:Button ID="BtnOpenRecharge9MobileData" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="Recharge Data" />
                
                </div>


                </div>


                <!--<a data-accordion="accordion-content-3" href="#" class="accordion-toggle-last bg-highlight">
                    <i class="accordion-icon-left fa fa-cloud"></i>
                    Accordion Title 3
                    <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <p id="accordion-content-3" class="accordion-content bottom-10">
                    This is the accordion content. You can add any content you want to it. Really, anything!
                    Add images, text, lists, captions or any element you want.
                </p>-->
            
        </div>
</div>

         <div class="content-boxed">
            <div class="content accordion-style-1 accordion-round-medium">
                <h3 class="bolder">Account Track</h3>
                <a href="#" data-accordion="accordion-content-17" class="accordion-toggle bg-highlight">
                    <i class="accordion-icon-left fa fa-wallet"></i>
                    View your account transactions below
                <i class="accordion-icon-right fa fa-arrow-down"></i>
                </a>
                <div id="accordion-content-17" class="accordion-content bottom-10">                     
                    <div class="table-scroll">			
            <table class="table-borders-dark">
                <asp:PlaceHolder ID = "PlaceHolderTrailData" runat="server" />
            </table>	
        </div>
            <asp:Button ID="BtnPrevious" runat="server" CssClass="button button-m shadow-small button-circle bg-red2-dark" Text="<< Previous" OnClick="BtnPrevious_Click"/>
            <asp:Button ID="BtnNext" runat="server" CssClass="button button-m shadow-small button-circle bg-green2-dark" Text="Next >>" OnClick="BtnNext_Click" />
       </div>

           </div> 
        </div>
        <asp:Label ID="lblMaxSN" runat="server" Text="" Visible="false"></asp:Label>
        <div class="content-boxed disabled">
            <div class="content">
                <h3 class="bolder">Checkboxes</h3>
                <p>Default Checkboxes, styled with FontAwesome</p>
                <div class="one-half">
                    <div class="checkboxes-demo">
                        <div class="fac fac-checkbox fac-default"><span></span>
                            <input id="box1-fac-checkbox" type="checkbox" value="1" checked="">
                            <label for="box1-fac-checkbox">Simple</label>
                        </div>
                        <div class="fac fac-checkbox fac-blue"><span></span>
                            <input id="box2-fac-checkbox" type="checkbox" value="1" checked="">
                            <label for="box2-fac-checkbox">Primary</label>
                        </div>
                        <div class="fac fac-checkbox fac-green"><span></span>
                            <input id="box3-fac-checkbox" type="checkbox" value="1" checked="">
                            <label for="box3-fac-checkbox">Success</label>
                        </div>
                        <div class="fac fac-checkbox fac-orange"><span></span>
                            <input id="box5-fac-checkbox" type="checkbox" value="1" checked="">
                            <label for="box5-fac-checkbox">Warning</label>
                        </div>
                        <div class="fac fac-checkbox fac-red"><span></span>
                            <input id="box6-fac-checkbox" type="checkbox" value="1" checked="">
                            <label for="box6-fac-checkbox">Danger</label>
                        </div>
                    </div>
                </div>
                <div class="one-half last-column">
                    <div class="checkboxes-demo">
                        <div class="fac fac-checkbox-round fac-default"><span></span>
                            <input id="box1-fac-checkbox-round" type="checkbox" value="1" checked="">
                            <label for="box1-fac-checkbox-round">Simple</label>
                        </div>
                        <div class="fac fac-checkbox-round fac-blue"><span></span>
                            <input id="box2-fac-checkbox-round" type="checkbox" value="1" checked="">
                            <label for="box2-fac-checkbox-round">Primary</label>
                        </div>
                        <div class="fac fac-checkbox-round fac-green"><span></span>
                            <input id="box3-fac-checkbox-round" type="checkbox" value="1" checked="">
                            <label for="box3-fac-checkbox-round">Success</label>
                        </div>
                        <div class="fac fac-checkbox-round fac-orange"><span></span>
                            <input id="box5-fac-checkbox-round" type="checkbox" value="1" checked="">
                            <label for="box5-fac-checkbox-round">Warning</label>
                        </div>
                        <div class="fac fac-checkbox-round fac-red"><span></span>
                            <input id="box6-fac-checkbox-round" type="checkbox" value="1" checked="">
                            <label for="box6-fac-checkbox-round">Danger</label>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>

        <div class="content-boxed disabled">
            <div class="content bottom-25">
                <h3 class="bolder">Radio Boxes</h3>
                <p class="bottom-15">Default Radios, styled with FontAwesome</p>
                <div class="one-half">
                    <div class="checkboxes-demo">
                        <div class="fac fac-radio fac-default"><span></span>
                            <input id="box1-fac-radio" type="radio" name="rad" value="1">
                            <label for="box1-fac-radio">Simple</label>
                        </div>
                        <div class="fac fac-radio fac-blue"><span></span>
                            <input id="box2-fac-radio" type="radio" name="rad" value="1">
                            <label for="box2-fac-radio">Primary</label>
                        </div>
                        <div class="fac fac-radio fac-green"><span></span>
                            <input id="box3-fac-radio" type="radio" name="rad" value="1">
                            <label for="box3-fac-radio">Success</label>
                        </div>
                        <div class="fac fac-radio fac-orange"><span></span>
                            <input id="box5-fac-radio" type="radio" name="rad" value="1">
                            <label for="box5-fac-radio">Warning</label>
                        </div>
                        <div class="fac fac-radio fac-red"><span></span>
                            <input id="box6-fac-radio" type="radio" name="rad" value="1">
                            <label for="box6-fac-radio">Danger</label>
                        </div>
                    </div>
                </div>
                <div class="one-half last-column">
                    <div class="checkboxes-demo">
                        <div class="fac fac-radio-full fac-default"><span></span>
                            <input id="box1-fac-radio-full" type="radio" name="rad1" value="1">
                            <label for="box1-fac-radio-full">Default</label>
                        </div>
                        <div class="fac fac-radio-full fac-blue"><span></span>
                            <input id="box2-fac-radio-full" type="radio" name="rad1" value="1">
                            <label for="box2-fac-radio-full">Primary</label>
                        </div>
                        <div class="fac fac-radio-full fac-green"><span></span>
                            <input id="box3-fac-radio-full" type="radio" name="rad1" value="1">
                            <label for="box3-fac-radio-full">Success</label>
                        </div>
                        <div class="fac fac-radio-full fac-orange"><span></span>
                            <input id="box5-fac-radio-full" type="radio" name="rad1" value="1">
                            <label for="box5-fac-radio-full">Warning</label>
                        </div>
                        <div class="fac fac-radio-full fac-red"><span></span>
                            <input id="box6-fac-radio-full" type="radio" name="rad1" value="1">
                            <label for="box6-fac-radio-full">Danger</label>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        
        <div class="content-boxed disabled">
            <div class="content">        
                <h3 class="bolder">Modern Fields</h3>
                <p>
                    These boxes will react to them when you type or select a value.
                </p>

                <div class="input-style input-style-2 has-icon input-required">
                    <i class="input-icon fa fa-user"></i>
                    <span>Name</span>
                    <em>(required)</em>
                    <input type="name" placeholder="">
                </div> 

                <div class="input-style input-style-2 input-required">
                    <span>Email</span>
                    <em>(required)</em>
                    <input type="email" placeholder="">
                </div>         

                <div class="input-style input-style-2 input-required">
                    <span>Password</span>
                    <em>(required)</em>
                    <input type="password" placeholder="">
                </div>       

                <div class="input-style input-style-2 input-required">
                    <span>Website</span>
                    <em>(required)</em>
                    <input type="url" placeholder="">
                </div>  

                <div class="input-style input-style-2 input-required">
                    <span>Phone</span>
                    <em>(required)</em>
                    <input type="tel" placeholder="">
                </div>

                <div class="input-style input-style-2 input-required">
                    <span>Select a Value</span>
                    <em><i class="fa fa-angle-down"></i></em>
                    <select>
                        <option value="default" disabled selected>Select a Value</option>
                        <option value="iOS">iOS</option>
                        <option value="Linux">Linux</option>
                        <option value="MacOS">MacOS</option>
                        <option value="Android">Android</option>
                        <option value="Windows">Windows</option>
                    </select>
                </div>
                <div class="input-style input-style-2 input-required">
                    <span>Enter your Message</span>
                    <em>(required)</em>
                    <textarea placeholder=""></textarea>
                </div>
            </div>
        </div>
            
        <div class="content-boxed disabled">
            <div class="content">
                <h3 class="bolder">Minimalist Fields</h3>
                <p>
                    These boxes will react to them when you type or select a value.
                </p>

                <!--<div class="input-style has-icon input-style-1 input-required">
                    <i class="input-icon fa fa-user"></i>
                    <span>Name</span>
                    <em>(required)</em>
                    <input type="name" placeholder="Name">
                </div> 

                <div class="input-style input-style-1 input-required">
                    <span>Email</span>
                    <em>(required)</em>
                    <input type="email" placeholder="Email">
                </div>         

                <div class="input-style input-style-1 input-required">
                    <span>Password: Minimum 8 Characters and 1 Number</span>
                    <em>(required)</em>
                    <input type="password" placeholder="Password">
                </div>       

                <div class="input-style input-style-1 input-required">
                    <span>Website</span>
                    <em>(required)</em>
                    <input type="url" placeholder="Website">
                </div>  

                <div class="input-style input-style-1 input-required">
                    <span>Phone</span>
                    <em>(required)</em>
                    <input type="tel" placeholder="Phone">
                </div>

                <div class="input-style input-style-1 input-required">
                    <span>Select a Value</span>
                    <em><i class="fa fa-angle-down"></i></em>
                    <select>
                        <option value="default" disabled selected>Select a Value</option>
                        <option value="iOS">iOS</option>
                        <option value="Linux">Linux</option>
                        <option value="MacOS">MacOS</option>
                        <option value="Android">Android</option>
                        <option value="Windows">Windows</option>
                    </select>
                </div>
                <div class="input-style input-style-1 input-required">
                    <span>Enter your message</span>
                    <em>(required)</em>
                    <textarea placeholder="Enter your message"></textarea>
                </div>

                <div class="input-style input-style-1 input-required">
                    <span>Select your Birthday</span>
                    <em><i class="fa fa-angle-down"></i></em>
                    <input type="date" value="1980-08-26">
                </div>-->
            </div>
        </div>
        
        <div class="content-boxed disabled">
            <!--<div class="content">
                <h3 class="bolder">Range Sliders</h3>
                <p>
                    Slide and increase or decrease their value.
                </p>
                <form class="range-slider bottom-15 range-slider-icons">
                    <i class="fa fa-range-icon-1 fa-volume-down color-theme"></i>
                    <i class="fa fa-range-icon-2 fa-volume-up color-theme"></i>
                    <input class="ios-slider" type="range" value="50">
                </form>
                <form class="range-slider bottom-15 ">
                    <input class="classic-slider" type="range" value="50">
                </form>
                <form class="range-slider">
                    <input class="material-slider" type="range" value="50">
                </form>
            </div>
        </div>
        
        <div class="content-boxed disabled">
            <div class="footer">
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
                <p class="footer-copyright">Copyright &copy; Enabled <span id="copyright-year">2017</span>. All Rights Reserved.</p>
                <p class="footer-links"><a href="#" class="color-highlight">Privacy Policy</a> | <a href="#" class="color-highlight">Terms and Conditions</a> | <a href="#" class="back-to-top color-highlight"> Back to Top</a></p>
                <div class="clear"></div>
            </div>    
        </div>-->
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
        </div>
    </form>

    <script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/plugins.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>
</body>
</html>

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConnectRechargeWebsite.Model;

namespace ConnectRechargeWebsite
{
    public partial class connectcitizensignup2 : System.Web.UI.Page
    {
        protected string Variable_email;
        protected int Variable_amount;
        protected string Variable_tranid;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnVerify_Click(object sender, EventArgs e)
        {
            if (ddlRegOption.Text == "Citizen" || ddlRegOption.Text == "Vendor")
            {
                Model.ConnectRecharge cre = new Model.ConnectRecharge();
                cre.email = txtUserID.Text;
                cre.UserId = txtUserID.Text;
                cre.VerifyCitizenRegistrationStep2();
                if (cre.ResponseMsg == "0")
                {
                    Session["AlertMessage"] = "Invalid Citizen UserID / Email.";
                    Response.Redirect("error.aspx");
                }
                else
                {
                    if (ddlRegOption.Text == "Citizen")
                    {
                        txtPayStackAmount.Text = "5180";//5180
                        LblVerify.Text = "Your nickname is " + cre.ResponseMsg;
                        LblUserID.Text = cre.UserId;
                        LblEmail.Text = cre.email;
                    }
                    else if (ddlRegOption.Text == "Vendor")
                    {
                        txtPayStackAmount.Text = "10255";
                        LblVerify.Text = "Your nickname is " + cre.ResponseMsg;
                        LblUserID.Text = cre.UserId;
                        LblEmail.Text = cre.email;
                    }
                    PanelPay.Visible = true;
                }
            }
            else
            {
                Session["AlertMessage"] = "Please select a registration option.";
                Response.Redirect("error.aspx");
            }
        }


        protected void BtnSendPayNotification_Click(object sender, EventArgs e)
        {
            if (txtDepositorName.Text != "" && txtDepositorEmail.Text != "" && txtDepositorAmount.Text != "" && ddlPaymentMode.Text != "Select your Payment Option" && txtTellerNo.Text != "" && txtDate.Text != "")
            {
                Model.ConnectRecharge cre = new Model.ConnectRecharge();
                cre.depositorname = txtDepositorName.Text;
                cre.depositoremail = txtDepositorEmail.Text;
                cre.depositoramount = txtDepositorAmount.Text;
                cre.depositorpaymode = ddlPaymentMode.Text;
                cre.depositbank = txtBankName.Text;
                cre.tellerno = txtTellerNo.Text;
                cre.depositorpaydate = txtDate.Text;
                cre.depositorCRStatus = "Connect Citizen";
                cre.SendPayNotification();
                if (cre.ResponseMsg.Contains("Success"))
                {
                    cre.UserId = LblUserID.Text;
                    cre.note = "Registration Payment Notification of " + txtDepositorAmount.Text + "sent.";
                    cre.ConnectCitizensTrail();
                    Session["AlertMessage"] = "Payment Notification sent, your account will be activated within 30 minutes - 3 hours.";
                    Response.Redirect("success.aspx");
                }
                else
                {
                    cre.UserId = LblUserID.Text;
                    cre.note = "Something went wrong. Kindly check your information.";
                    cre.ConnectCitizensTrail();
                    Session["AlertMessage"] = "Something went wrong. Kindly check your information.";
                    Response.Redirect("error.aspx");
                }
            }
        }

        protected void ddlBank_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBank.Text == "ACCESS BANK")
            {
                Session["AlertMessage"] = "USE *901# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "DIAMOND BANK")
            {
                Session["AlertMessage"] = "USE *710# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "ECOBANK")
            {
                Session["AlertMessage"] = "USE *326# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "FIRST BANK")
            {
                Session["AlertMessage"] = "USE *894# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "FIDELITY BANK")
            {
                Session["AlertMessage"] = "USE *770# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "FCMB")
            {
                Session["AlertMessage"] = "USE *329# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "GTBANK")
            {
                Session["AlertMessage"] = "USE *737# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "HERITAGE BANK")
            {
                Session["AlertMessage"] = "USE *322# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "KEYSTONE BANK")
            {
                Session["AlertMessage"] = "USE *533# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "POLARIS BANK(SKYE)")
            {
                Session["AlertMessage"] = "USE *833# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "STERLING BANK")
            {
                Session["AlertMessage"] = "USE *822# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "STANBIC IBTC")
            {
                Session["AlertMessage"] = "USE *909# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "UBA")
            {
                Session["AlertMessage"] = "USE *919# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "UNITY BANK")
            {
                Session["AlertMessage"] = "USE *7799# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "UNION BANK")
            {
                Session["AlertMessage"] = "USE *826# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "WEMA BANK")
            {
                Session["AlertMessage"] = "USE *945# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else if (ddlBank.Text == "ZENITH BANK")
            {
                Session["AlertMessage"] = "USE *966# TO MAKE USSD TRANSFER TO - CONNECT MAGNET LIMITED, GTBANK, 0467424053";
                Response.Redirect("success.aspx");
            }
            else
            {
                Session["AlertMessage"] = "Your Bank may not have a USSD code yet for banking transactions. Kindly contact support if you are sure your bank offers USSD banking services.";
                Response.Redirect("error.aspx");
            }
        }

        protected void BtnFundWalletInstant_Click(object sender, EventArgs e)
        {
            if (hdn.Value != "" && txtPayStackAmount.Text != "")
            {
                string url = "https://api.paystack.co/transaction/verify/" + hdn.Value;
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "GET";
                request.Headers["Authorization"] = "Bearer " + "sk_live_645668addf5254e0dea00465c7ec3ecf9d821f30";

                var webResponse = request.GetResponse();
                var webStream = webResponse.GetResponseStream();
                var responseReader = new StreamReader(webStream).ReadToEnd();
                //Newtonsoft.Json.Linq.JToken token = Newtonsoft.Json.Linq.JObject.Parse(responseReader.ReadToEnd());
                //string getStatus = (string)token.SelectToken("status");
                //string getGResponse = (string)token.SelectToken("gateway_response");
                //Newtonsoft.Json.Linq.JObject jObject = Newtonsoft.Json.Linq.JObject.Parse(responseReader.ReadToEnd());
                string getJson = responseReader.ToString();
                var details = Newtonsoft.Json.Linq.JObject.Parse(getJson);
                var getdata = details["data"];
                string status = getdata["gateway_response"].ToString();
                webStream.Dispose();
                if (status == "Approved")
                {
                    //Fund the wallet 
                    //Redirect to success message
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.UserId = LblUserID.Text;
                    if (hdn.Value != "")
                    {
                        cre.tranid = hdn.Value;
                    }
                    else
                    {
                        cre.tranid = txtPayStackTranID.Text;
                    }
                    cre.PayStackAmount = int.Parse(txtPayStackAmount.Text);
                    //cre.OpenRechargePayStackTrack();
                    cre.citizenRegistration = "1";
                    cre.ConnectCitizenFundWallet();
                    if (cre.ResponseMsg != "")
                    {
                        if (cre.ResponseMsg.Contains("Invalid"))
                        {
                            //Trail
                            cre.UserId = LblUserID.Text;
                            cre.note = "Error: Wallet Funding of " + txtPayStackAmount.Text + " failed.";
                            cre.ConnectCitizensTrail();
                            Session["AlertMessage"] = cre.ResponseMsg;
                            Response.Redirect("error.aspx");
                        }
                        else
                        {
                            cre.UserId = LblUserID.Text;
                            cre.note = "Success: Wallet Funding of " + txtPayStackAmount.Text + " was successful.";
                            cre.ConnectCitizensTrail();
                            Session["AlertMessage"] = cre.ResponseMsg;
                            Session["userID"] = LblUserID.Text;
                            Response.Redirect("connectcitizensignup3");
                        }
                    }
                }
                else
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.UserId = LblUserID.Text;
                    cre.note = "Error: Invalid Transaction.";
                    cre.ConnectCitizensTrail();
                    Session["AlertMessage"] = "Error: Invalid Transaction.";
                    Response.Redirect("error.aspx");
                }
            }
            else if (hdn.Value == "" && txtPayStackTranID.Text != "" && txtPayStackIDAmount.Text != "")
            {
                string url = "https://api.paystack.co/transaction/verify/" + txtPayStackTranID.Text;
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "GET";
                request.Headers["Authorization"] = "Bearer " + "sk_live_645668addf5254e0dea00465c7ec3ecf9d821f30";

                var webResponse = request.GetResponse();
                var webStream = webResponse.GetResponseStream();
                var responseReader = new StreamReader(webStream).ReadToEnd();
                //Newtonsoft.Json.Linq.JToken token = Newtonsoft.Json.Linq.JObject.Parse(responseReader.ReadToEnd());
                //string getStatus = (string)token.SelectToken("status");
                //string getGResponse = (string)token.SelectToken("gateway_response");
                //Newtonsoft.Json.Linq.JObject jObject = Newtonsoft.Json.Linq.JObject.Parse(responseReader.ReadToEnd());
                string getJson = responseReader.ToString();
                var details = Newtonsoft.Json.Linq.JObject.Parse(getJson);                
                var getdata = details["data"];
                string status = getdata["gateway_response"].ToString();
                webStream.Dispose();
                if (status == "Approved")
                {
                    //Fund the wallet 
                    //Redirect to success message
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.UserId = LblUserID.Text;
                    if (hdn.Value != "")
                    {
                        cre.tranid = hdn.Value;
                    }
                    else
                    {
                        cre.tranid = txtPayStackTranID.Text;
                    }
                    cre.PayStackAmount = int.Parse(txtPayStackIDAmount.Text);
                    //cre.OpenRechargePayStackTrack();
                    cre.citizenRegistration = "1";
                    cre.ConnectCitizenFundWallet();
                    if (cre.ResponseMsg != "")
                    {
                        if (cre.ResponseMsg.Contains("Invalid"))
                        {
                            cre.UserId = LblUserID.Text;
                            cre.note = "Error: Registration activation of " + txtPayStackIDAmount.Text + " failed.";
                            cre.ConnectCitizensTrail();
                            Session["AlertMessage"] = cre.ResponseMsg;
                            Response.Redirect("error.aspx");
                        }
                        else
                        {
                            cre.UserId = LblUserID.Text;
                            cre.note = "Success: Wallet Funding of " + txtPayStackAmount.Text + " was successful.";
                            cre.ConnectCitizensTrail();
                            Session["AlertMessage"] = cre.ResponseMsg;
                            Response.Redirect("connectcitizensignup3");
                        }
                    }
                }
                else
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.UserId = LblUserID.Text;
                    cre.note = "Error: Wallet Invalid Transaction";
                    cre.ConnectCitizensTrail();
                    Session["AlertMessage"] = "Error: Invalid Transaction.";
                    Response.Redirect("error.aspx");
                }
            }
        }

        protected void BtnPayStackProceed_Click(object sender, EventArgs e)
        {
            if (txtPayStackAmount.Text != "")
            {
                int amount = int.Parse(txtPayStackAmount.Text);
                if (amount >= 5180)//5180
                {
                    BtnVerify.Enabled = false;
                    Variable_email = LblEmail.Text;
                    Variable_amount = amount * 100;
                    int yourRandomEmailString = 15; //maximum: 32 
                    string tranidCode = Guid.NewGuid().ToString("N").Substring(0, yourRandomEmailString);
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.tranid = tranidCode;
                    cre.checkCitizensTranID();
                    if (cre.ResponseMsg == "0")
                    {
                        Variable_tranid = "CR" + tranidCode.Trim().ToUpper();

                        cre.UserId = LblUserID.Text;
                        cre.tranid = Variable_tranid;
                        cre.PayStackAmount = int.Parse(txtPayStackAmount.Text);
                        cre.CRCitizenPayStackTrack();

                        PanelPayStack.Visible = true;
                        BtnPayStackProceed.Visible = false;
                    }
                    else if (cre.ResponseMsg == "1")
                    {
                        string tranidCode1 = Guid.NewGuid().ToString("N").Substring(0, yourRandomEmailString);
                        Model.ConnectRecharge cre1 = new Model.ConnectRecharge();
                        cre1.tranid = tranidCode;
                        cre1.checkCitizensTranID();
                        if (cre1.ResponseMsg == "0")
                        {
                            Variable_tranid = "CR" + tranidCode1;

                            cre1.UserId = LblUserID.Text;
                            cre1.tranid = Variable_tranid;
                            cre1.PayStackAmount = int.Parse(txtPayStackAmount.Text);
                            cre1.CRCitizenPayStackTrack();

                            PanelPayStack.Visible = true;
                            PanelInstantFund.Visible = true;
                            BtnPayStackProceed.Visible = false;
                        }
                        else
                        {
                            Session["AlertMessage"] = "Re-login again or refresh your software.";
                            Response.Redirect("error.aspx");
                        }
                    }
                }
                else
                {
                    BtnPayStackProceed.Visible = true;
                    PanelInstantFund.Visible = false;
                    PanelPayStack.Visible = false;
                    Session["AlertMessage"] = "Transaction Amount should not be less than 5180(PayStack charges inclusive).";
                    Response.Redirect("error.aspx");
                }
            }
        }
    }
}
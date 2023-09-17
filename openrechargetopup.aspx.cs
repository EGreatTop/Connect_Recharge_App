using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConnectRechargeWebsite.Model;

namespace ConnectRechargeWebsite
{
    public partial class openrechargetopup : System.Web.UI.Page
    {
        public string LoadOption;
        protected string Variable_email;
        protected int Variable_amount;
        protected string Variable_tranid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                //Variable_email = Session["emailLogin"].ToString();
                //LblUserID.Text = Session["emailLogin"].ToString();
                //LblRefID.Text = Session["refID"].ToString();
                //Model.ConnectRecharge cre = new Model.ConnectRecharge();
                //cre.email = Session["emailLogin"].ToString();
                //cre.OpenRechargeCheckCreditBalance();
                
                //LblWalletbalance.Text = "#" + cre.credit.ToString();
                ////Get ORP
                //cre.OpenRechargeCheckPointsBalance();
                //LblORPBalance.Text = "#" + cre.points.ToString();

                ////Trail
                //cre.email = LblUserID.Text;
                //cre.note = "Login attempt by " + LblUserID.Text + " was successful.";
                //cre.OpenRechargeTrail();

                //txtDate.Text = DateTime.Now.ToShortDateString();
                //BtnNext.Visible = false;
                //LoadGetDataTrail();
            }
            else
            {
                Variable_email = LblUserID.Text;
                //LblUserID.Text = Session["emailLogin"].ToString();
                //LblRefID.Text = Session["refID"].ToString();
            }
        }

        //Laad Get Trail Data
        protected void LoadGetDataTrail()
        {
            //Populating a DataTable from database.
            DataTable dt = this.GetDataTrail();

            //Building an HTML string.
            StringBuilder html = new StringBuilder();

            //Building the Header row.
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }

            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            PlaceHolderTrailData.Controls.Add(new Literal { Text = html.ToString() });
        }

        //Get Trail Data
        private DataTable GetDataTrail()
        {
            Model.ConnectRecharge cre = new Model.ConnectRecharge();
            cre.username = LblUserID.Text;
            cre.OpenRechargeGetDataTrail();
            lblMaxSN.Text = cre.MaxSN.ToString();
            return cre.dt;
        }

        protected void BtnOpenRechargeAirtime_Click(object sender, EventArgs e)
        {
            double amount = int.Parse(txtORAmountVTU.Text);
            if (amount >= 50)
            {
                if (ddlORPayOptionVTU.Text == "Wallet")
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.email = LblUserID.Text;
                    cre.OpenRechargeCheckCreditBalance();
                    cre.clientBalance = cre.credit;
                    if (cre.credit >= amount)
                    {
                        cre.network = ddlORAirtimeNetwork.Text;
                        cre.phone = txtORAirtimePhone.Text;
                        cre.phoneRechargeAmount = int.Parse(txtORAmountVTU.Text);
                        cre.TotalRechargeCost = int.Parse(txtORAmountVTU.Text);
                        cre.route = "OR";
                        cre.RechargeType = "VTU";
                        cre.referralID = LblRefID.Text;
                        cre.RechargeAirtime();
                        if (cre.ResponseMsg == null)
                        {
                            cre.email = LblUserID.Text;
                            cre.note = "Something went wrong. Kindly check your transaction.";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = "Something went wrong. Kindly check your transaction.";
                            Response.Redirect("error.aspx");
                        }
                        else if (cre.ResponseMsg.Contains("Success"))
                        {
                            cre.email = LblUserID.Text;
                            cre.note = "Recharge of " + amount.ToString() + " was successful.";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = "Recharge of " + amount.ToString() + " was successful.";
                            Response.Redirect("success.aspx");
                        }
                        else
                        {
                            cre.email = LblUserID.Text;
                            cre.note = "Something went wrong. Kindly check your transaction.";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = "Something went wrong. Kindly check your transaction.";
                            Response.Redirect("error.aspx");
                        }
                    }
                    else
                    {
                        cre.email = LblUserID.Text;
                        cre.note = "Insufficient Wallet Balance.";
                        cre.OpenRechargeTrail();
                        Session["AlertMessage"] = "Insufficient Wallet Balance.";
                        Response.Redirect("error.aspx");
                    }
                }
                else if (ddlORPayOptionVTU.Text == "ORP (Open Recharge Points)")
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.email = LblUserID.Text;
                    cre.OpenRechargeCheckPointsBalance();
                    double balance = cre.points;
                    cre.clientBalance = Convert.ToInt16(balance);
                    if (balance >= amount)
                    {
                        cre.network = ddlORAirtimeNetwork.Text;
                        cre.phone = txtORAirtimePhone.Text;
                        cre.phoneRechargeAmount = int.Parse(txtORAmountVTU.Text);
                        cre.TotalRechargeCost = int.Parse(txtORAmountVTU.Text);
                        cre.route = "ORP";
                        cre.RechargeType = "VTU";
                        cre.referralID = LblRefID.Text;
                        cre.RechargeAirtime();
                        if (cre.ResponseMsg.Contains("Success"))
                        {
                            cre.email = LblUserID.Text;
                            cre.note = "Recharge of " + amount.ToString() + " was successful.";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = "Recharge of " + amount.ToString() + " was successful.";
                            Response.Redirect("success.aspx");
                        }
                        else
                        {
                            cre.email = LblUserID.Text;
                            cre.note = "Something went wrong. Kindly check your transaction.";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = "Something went wrong. Kindly check your transaction.";
                            Response.Redirect("error.aspx");
                        }
                    }
                    else
                    {
                        cre.email = LblUserID.Text;
                        cre.note = "Insufficient Wallet Balance.";
                        cre.OpenRechargeTrail();
                        Session["AlertMessage"] = "Insufficient Wallet Balance.";
                        Response.Redirect("error.aspx");
                    }
                }
            }
            else
            {
                Model.ConnectRecharge cre = new Model.ConnectRecharge();
                cre.email = LblUserID.Text;
                cre.note = "Recharge Amount should not be less than 50.";
                cre.OpenRechargeTrail();
                Session["AlertMessage"] = "Recharge Amount should not be less than 50.";
                Response.Redirect("error.aspx");
            }
        }

        protected void BtnSendPayNotification_Click(object sender, EventArgs e)
        {
            if(txtDepositorName.Text !="" && txtDepositorEmail.Text != "" && txtDepositorAmount.Text !="" && ddlPaymentMode.Text != "Select your Payment Option" && txtTellerNo.Text != "" && txtDate.Text != "")
            {
                Model.ConnectRecharge cre = new Model.ConnectRecharge();
                cre.depositorname = txtDepositorName.Text;
                cre.depositoremail = txtDepositorEmail.Text;
                cre.depositoramount = txtDepositorAmount.Text;
                cre.depositorpaymode = ddlPaymentMode.Text;
                cre.depositbank = txtBankName.Text;
                cre.tellerno = txtTellerNo.Text;
                cre.depositorpaydate = txtDate.Text;
                cre.depositorCRStatus = "Open Recharge";
                cre.SendPayNotification();
                if (cre.ResponseMsg.Contains("Success"))
                {
                    cre.email = LblUserID.Text;
                    cre.note = "Payment Notification of " + txtDepositorAmount + "sent.";
                    cre.OpenRechargeTrail();
                    Session["AlertMessage"] = "Payment Notification sent, you will be credited within 30 minutes - 3 hours.";
                    Response.Redirect("success.aspx");
                }
                else
                {
                    cre.email = LblUserID.Text;
                    cre.note = "Something went wrong. Kindly check your information.";
                    cre.OpenRechargeTrail();
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

        protected void BtnPayStack_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://www.paystack.com");
        }

        protected void BtnOpenRechargeAirtimePIN_Click(object sender, EventArgs e)
        {
            double amount = int.Parse(txtORAmountPIN.Text);
            if (amount >= 50)
            {
                if (ddlORPayOptionPIN.Text == "Wallet")
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.email = LblUserID.Text;
                    cre.OpenRechargeCheckCreditBalance();
                    cre.clientBalance = cre.credit;
                    if (cre.credit >= amount)
                    {
                        cre.phoneRechargeAmount = int.Parse(txtORAmountPIN.Text);
                        cre.TotalRechargeCost = int.Parse(txtORAmountPIN.Text);
                        cre.route = "OR";
                        cre.RechargeType = "Logical";
                        cre.referralID = LblRefID.Text;
                        cre.RechargeAirtime();
                        if (cre.PIN != "")
                        {
                            cre.email = LblUserID.Text;
                            cre.note = cre.PIN + " recharge PIN created." + " Balance points is " + cre.trailAmount;
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = "Successful. Your Recharge PIN is " + "\n" + cre.PIN + ". To use it dial *258*" + cre.PIN + "# on any mobile network.";
                            Response.Redirect("success.aspx");
                        }
                        else
                        {
                            cre.email = LblUserID.Text;
                            cre.note = "Transaction failed";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = "Something went wrong. Kindly check your transaction.";
                            Response.Redirect("error.aspx");
                        }
                    }
                    else
                    {
                        cre.email = LblUserID.Text;
                        cre.note = "Insufficient Wallet Balance.";
                        cre.OpenRechargeTrail();
                        Session["AlertMessage"] = "Insufficient Wallet Balance.";
                        Response.Redirect("error.aspx");
                    }
                }
                else if (ddlORPayOptionPIN.Text == "ORP (Open Recharge Points)")
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.email = LblUserID.Text;
                    cre.OpenRechargeCheckPointsBalance();
                    double balance = cre.points;
                    cre.clientBalance = Convert.ToInt16(balance);
                    if (balance >= amount)
                    {
                        cre.phoneRechargeAmount = int.Parse(txtORAmountPIN.Text);
                        cre.TotalRechargeCost = int.Parse(txtORAmountPIN.Text);
                        cre.route = "ORP";
                        cre.RechargeType = "Logical";
                        cre.referralID = LblRefID.Text;
                        cre.RechargeAirtime();
                        if (cre.PIN != "")
                        {
                            cre.email = LblUserID.Text;
                            cre.note = cre.PIN + " created." + " Balance points is " + cre.trailAmount;
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = "Successful. Your Recharge PIN is " + "\n" + cre.PIN + ". To use it dial *258*" + cre.PIN + "# on any mobile network.";
                            Response.Redirect("success.aspx");
                        }
                        else
                        {
                            cre.email = LblUserID.Text;
                            cre.note = "Transaction failed";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = "Something went wrong. Kindly check your transaction.";
                            Response.Redirect("error.aspx");
                        }
                    }
                    else
                    {
                        cre.email = LblUserID.Text;
                        cre.note = "Insufficient Wallet Balance.";
                        cre.OpenRechargeTrail();
                        Session["AlertMessage"] = "Insufficient Wallet Balance.";
                        Response.Redirect("error.aspx");
                    }
                }
            }
            else
            {
                Model.ConnectRecharge cre = new Model.ConnectRecharge();
                cre.email = LblUserID.Text;
                cre.note = "Recharge Amount should not be less than 50.";
                cre.OpenRechargeTrail();
                Session["AlertMessage"] = "Recharge Amount should not be less than 50.";
                Response.Redirect("error.aspx");
            }
        }

        /// //////////////////////////////////////////
        //Laad Get Trail Data
        protected void LoadGetDataTrail1()
        {
            //Populating a DataTable from database.
            DataTable dt = this.GetDataTrail1();

            //Building an HTML string.
            StringBuilder html = new StringBuilder();

            //Building the Header row.
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }

            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            PlaceHolderTrailData.Controls.Add(new Literal { Text = html.ToString() });
        }

        //Get Trail Dataf
        private DataTable GetDataTrail1()
        {
            Model.ConnectRecharge cre = new Model.ConnectRecharge();
            cre.username = LblUserID.Text;
            cre.MaxSN = int.Parse(lblMaxSN.Text);
            if(LoadOption == "Previous")
            {
                cre.previous = 1;
            }
            else if(LoadOption == "Next")
            {
                cre.next = 1;
            }
            cre.OpenRechargeGetDataTrail();
            lblMaxSN.Text = cre.MaxSN.ToString();
            if (cre.dt.Rows.Count > 0)
            {

            }
            else
            {
                BtnNext.Visible = false;
                lblMaxSN.Text = "0";
            }
            return cre.dt;
            
        }
        /// /////////////////////////////////////////

        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            BtnNext.Visible = true;
            LoadOption = "Previous";
            LoadGetDataTrail1();
        }

        protected void BtnNext_Click(object sender, EventArgs e)
        {
            LoadOption = "Next";
            LoadGetDataTrail1();
        }

        protected void BtnFundWalletInstant_Click(object sender, EventArgs e)
        {
            if (hdn.Value != "" && txtPayStackAmount.Text !="")
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
                    cre.email = LblUserID.Text;
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

                    cre.OpenRechargeFundWallet();
                    if (cre.ResponseMsg != "")
                    {
                        if (cre.ResponseMsg.Contains("Invalid"))
                        {
                            //Trail
                            cre.email = LblUserID.Text;
                            cre.note = "Error: Wallet funding of " + txtPayStackAmount.Text + " failed.";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = cre.ResponseMsg;
                            Response.Redirect("error.aspx");
                        }
                        else
                        {
                            cre.email = LblUserID.Text;
                            cre.note = "Success: Wallet funding of " + txtPayStackAmount.Text + " was Successful.";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = cre.ResponseMsg;
                            Response.Redirect("success.aspx");
                        }
                    }
                }
                else
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.email = LblUserID.Text;
                    cre.note = "Error: Invalid Transaction.";
                    cre.OpenRechargeTrail();
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
                    cre.email = LblUserID.Text;
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

                    cre.OpenRechargeFundWallet();
                    if (cre.ResponseMsg != "")
                    {
                        if (cre.ResponseMsg.Contains("Invalid"))
                        {
                            cre.email = LblUserID.Text;
                            cre.note = "Error: Wallet Funding of " + txtPayStackIDAmount.Text + " failed.";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = cre.ResponseMsg;
                            Response.Redirect("error.aspx");
                        }
                        else
                        {
                            cre.email = LblUserID.Text;
                            cre.note = "Success: Wallet Funding of " + txtPayStackIDAmount.Text + " was successful.";
                            cre.OpenRechargeTrail();
                            Session["AlertMessage"] = cre.ResponseMsg;
                            Response.Redirect("success.aspx");
                        }
                    }
                }
                else
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.email = LblUserID.Text;
                    cre.note = "Error: Wallet Invalid Transaction";
                    cre.OpenRechargeTrail();
                    Session["AlertMessage"] = "Error: Invalid Transaction.";
                    Response.Redirect("error.aspx");
                }
            }
        }

        protected void BtnPayStackProceed_Click(object sender, EventArgs e)
        {
            if(txtPayStackAmount.Text != "")
            {
                int amount = int.Parse(txtPayStackAmount.Text);
                if (amount >= 100)
                {
                    Variable_amount = amount * 100;
                    int yourRandomEmailString = 15; //maximum: 32 
                    string tranidCode = Guid.NewGuid().ToString("N").Substring(0, yourRandomEmailString);
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.tranid = tranidCode;
                    cre.checkTranID();
                    if (cre.ResponseMsg == "0")
                    {
                        Variable_tranid = "C" + tranidCode.Trim().ToUpper();

                        cre.email = LblUserID.Text;
                        cre.tranid = Variable_tranid;
                        cre.PayStackAmount = int.Parse(txtPayStackAmount.Text);
                        cre.OpenRechargePayStackTrack();

                        PanelPayStack.Visible = true;
                        BtnPayStackProceed.Visible = false;
                    }
                    else if (cre.ResponseMsg == "1")
                    {
                        string tranidCode1 = Guid.NewGuid().ToString("N").Substring(0, yourRandomEmailString);
                        Model.ConnectRecharge cre1 = new Model.ConnectRecharge();
                        cre1.tranid = tranidCode;
                        cre1.checkTranID();
                        if (cre1.ResponseMsg == "0")
                        {
                            Variable_tranid = "C" + tranidCode1;

                            cre1.email = LblUserID.Text;
                            cre1.tranid = Variable_tranid;
                            cre1.PayStackAmount = int.Parse(txtPayStackAmount.Text);
                            cre1.OpenRechargePayStackTrack();

                            PanelPayStack.Visible = true;
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
                    PanelPayStack.Visible = false;
                    Session["AlertMessage"] = "Transaction Amount should not be less than 100.";
                    Response.Redirect("error.aspx");
                }
            }
            //if (hdn.Value == "" && txtPayStackTranID.Text == "")
            //{
            //    txtPayStackTranID.Visible = true;
            //}
            //else if(txtPayStackAmount.Text == "" && txtPayStackTranID.Text != "")
            //{

            //}
            //else if (txtPayStackAmount.Text != "" && txtPayStackTranID.Text != "")
            //{
            //    int amount = int.Parse(txtPayStackAmount.Text);
            //    if (amount >= 100 && txtPayStackTranID.Text != "")
            //    {
            //        Variable_amount = amount * 100;
            //    }
            //    else
            //    {
            //        Session["AlertMessage"] = "Transaction Amount should not be less than 100.";
            //        Response.Redirect("error.aspx");
            //    }
            //}
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Index");
        }
    }
}
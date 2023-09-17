using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectRechargeWebsite
{
    public partial class connectcitizensignup1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
                if (!Page.IsPostBack)
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.ConnectCitizensGenerateID();
                    txtUserID.Text = cre.ResponseMsg;
                }
                else
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.ConnectCitizensGenerateID();
                    txtUserID.Text = cre.ResponseMsg;
                }
            //}
            //catch (Exception)
            //{
            //    Response.Redirect("index");
            //}
        }


        private string PopulateBody(string headertext, string bodytext) //string title, string url, string description)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Email/announcement.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{HeaderText}", headertext);
            body = body.Replace("{BodyText}", bodytext);
            //body = body.Replace("{Title}", title);
            //body = body.Replace("{Url}", url);
            //body = body.Replace("{Description}", description);
            return body;
        }

        private void SendHtmlFormattedEmail(string recepientEmail, string subject, string body)
        {
            //Send Email
            //create the mail message
            MailMessage mail = new MailMessage();
            //set the FROM address
            mail.From = new MailAddress("no-reply@connectrecharge.com");
            //set the RECIPIENTS
            mail.To.Add(recepientEmail);
            //enter a SUBJECT
            mail.Subject = subject;
            //Enter the message BODY
            mail.Body = body;
            //Set to HTML true
            mail.IsBodyHtml = true;
            //set the mail server (default should be smtp.1and1.com)
            SmtpClient smtp = new SmtpClient("smtp.1and1.com");
            //Enter your full e-mail address and password
            smtp.Credentials = new NetworkCredential("info@360healthwealth.com", "{fRA.8SJekqx");
            //send the message 
            //smtp.Send(mail);
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                Session["AlertMessage"] = "Passwords do not match!";
                //Session["PageName"] = "openrechargesignup";
                Response.Redirect("error.aspx");
            }
            else
            {
                Model.ConnectRecharge cre = new Model.ConnectRecharge();
                cre.UserId = txtUserID.Text;
                cre.email = txtEmail.Text;
                string password = cre.Encrypt(txtPassword.Text);
                cre.password = password;
                cre.nickname = txtNickName.Text;
                cre.ConnectCitizensSignUpStep1();
                if (cre.ResponseMsg == "This User's information already exists." || cre.ResponseMsg == "Nickname already in use.")
                {
                    Session["AlertMessage"] = cre.ResponseMsg;
                    Response.Redirect("error.aspx");
                }
                else
                {
                    try
                    {
                        //Send Email
                        string getEmail = txtEmail.Text;
                        string headertextMail = "Connect Recharge Pre-Registration!";
                        string bodytextMail = "From Connect Recharge:<p> You have initiated your registration on Connect Recharge. Your need to make payments for your registration fee to proceed. There are a number of options you can use. <p> PayStack -  This allows you Pay Instantly using your ATM card, with this option you can fund your wallet yourself immediately on the app. <p> Other options include USSD, Bank Transfer, Direct Deposit. With any of these options you need to fill the Send Payment Notification form so that you wallet can be funded. <p> Below are your Login details. <p><u>Login Details</u><p> UserID: " + txtUserID.Text + " <p>Password: ********* <p>. <p><p>- Connect Recharge Support Team";
                        string body = this.PopulateBody(headertextMail, bodytextMail);
                        this.SendHtmlFormattedEmail("" + txtEmail.Text + "", "Welcome to Connect Recharge", body);
                    }
                    catch (Exception)
                    {

                    }

                    Session["AlertMessage"] = cre.ResponseMsg;
                    Response.Redirect("connectcitizensignup2.aspx");
                }
            }
        }
    }
}
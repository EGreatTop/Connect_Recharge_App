using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConnectRechargeWebsite.Model;

namespace ConnectRechargeWebsite
{
    public partial class openrechargeforgot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            if (ddlChoose.Text == "OPEN RECHARGE")
            {
                if (BtnSend.Text == "SEND RESET INSTRUCTIONS")
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.email = txtEmail.Text;
                    cre.OpenRechargeForgotPassword();
                    string resetcode = cre.ResponseMsg;
                    if (resetcode != "0")
                    {
                        try
                        {
                            //Send Email
                            string getEmail = txtEmail.Text;
                            string headertextMail = "Password Reset Code!";
                            string bodytextMail = "From Connect Recharge:<p> Your Password reset code is: " + resetcode + ". <p><p>- Connect Recharge Support Team";
                            string body = this.PopulateBody(headertextMail, bodytextMail);
                            this.SendHtmlFormattedEmail("" + txtEmail.Text + "", "Reset Code", body);

                            txtCode.Visible = true;
                            BtnSend.Text = "UPDATE PASSWORD";
                        }
                        catch (Exception)
                        {

                        }
                    }
                    else
                    {
                        Session["AlertMessage"] = "Invalid Email.";
                        Response.Redirect("error.aspx");
                    }
                }
                else if (BtnSend.Text == "UPDATE PASSWORD")
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.email = txtEmail.Text;
                    cre.emailConfCODE = txtCode.Text;
                    cre.OpenRechargeUpdatePassword();
                    if (cre.ResponseMsg != "Invalid Code!")
                    {
                        Session["AlertMessage"] = cre.ResponseMsg;
                        Response.Redirect("success.aspx");
                    }
                    else
                    {
                        Session["AlertMessage"] = cre.ResponseMsg;
                        Response.Redirect("error.aspx");
                    }
                }
            }
            else if(ddlChoose.Text == "CONNECT CITIZEN")
            {
                if (BtnSend.Text == "SEND RESET INSTRUCTIONS")
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.email = txtEmail.Text;
                    cre.ConnectCitizenForgotPassword();
                    string resetcode = cre.ResponseMsg;
                    if (resetcode != "0")
                    {
                        try
                        {
                            //Send Email
                            string getEmail = txtEmail.Text;
                            string headertextMail = "Password Reset Code!";
                            string bodytextMail = "From Connect Recharge:<p> Your Password reset code is: " + resetcode + ". <p><p>- Connect Recharge Support Team";
                            string body = this.PopulateBody(headertextMail, bodytextMail);
                            this.SendHtmlFormattedEmail("" + txtEmail.Text + "", "Reset Code", body);

                            txtCode.Visible = true;
                            BtnSend.Text = "UPDATE PASSWORD";
                        }
                        catch (Exception)
                        {

                        }
                    }
                    else
                    {
                        Session["AlertMessage"] = "Invalid Email.";
                        Response.Redirect("error.aspx");
                    }
                }
                else if (BtnSend.Text == "UPDATE PASSWORD")
                {
                    Model.ConnectRecharge cre = new Model.ConnectRecharge();
                    cre.email = txtEmail.Text;
                    cre.emailConfCODE = txtCode.Text;
                    cre.ConnectCitizenUpdatePassword();
                    if (cre.ResponseMsg != "Invalid Code!")
                    {
                        Session["AlertMessage"] = cre.ResponseMsg;
                        Response.Redirect("success.aspx");
                    }
                    else
                    {
                        Session["AlertMessage"] = cre.ResponseMsg;
                        Response.Redirect("error.aspx");
                    }
                }
            }
            else
            {
                Session["AlertMessage"] = "Please select your section.";
                Response.Redirect("error.aspx");
            }
        }
    }
}
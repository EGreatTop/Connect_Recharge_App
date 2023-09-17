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
    public partial class connectcitizensignup3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtUserID.Text = Session["userID"].ToString();
            }
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            if (btnCreateAccount.Text == "CONFIRM NAME")
            {
                LblMessage.Text = "Enter your 'Confirm Password' and click 'CREATE ACCOUNT'.";
                LblMessage.Visible = true;
                btnCreateAccount.Text = "CREATE ACCOUNT";
                //Session["AlertMessage"] = "Please ensure your full name is written the way it appears in your bank account else you may not be able to make withdrawals of earnings.";
                //Response.Redirect("success.aspx");
            }
            else if (btnCreateAccount.Text == "CREATE ACCOUNT")
            {
                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    Session["AlertMessage"] = "Passwords do not match!";
                    //Session["PageName"] = "openrechargesignup";
                    Response.Redirect("error.aspx");
                }
                else
                {
                    if (txtPassword.Text != "" && txtCity.Text != "" && txtCountry.Text != "" && txtEmail.Text != "" && txtPhone.Text != "" && txtState.Text != "" && txtUserID.Text != "" && ddlRegOption.Text != "- Pls Selct -")
                    {
                        Model.ConnectRecharge cre = new Model.ConnectRecharge();
                        string password = cre.Encrypt(txtPassword.Text);
                        cre.password = password;
                        cre.partnername = txtPartnerName.Text;
                        cre.email = txtEmail.Text;
                        cre.phone = txtPhone.Text;
                        cre.city = txtCity.Text;
                        cre.state = txtState.Text;
                        cre.country = txtCountry.Text;
                        cre.nationality = txtCountry.Text;
                        if (txtRefCode.Text != "")
                        {
                            cre.Referrer = txtRefCode.Text;
                            cre.refCode = txtRefCode.Text;
                        }
                        else
                        {
                            cre.Referrer = "2bb71M9C";
                            cre.refCode = "2bb71M9C";
                        }
                        int yourRandomEmailString = 6; //maximum: 32 
                        string emailconfcode = Guid.NewGuid().ToString("N").Substring(0, yourRandomEmailString);
                        cre.emailConfCODE = emailconfcode;
                        cre.UserId = txtUserID.Text;
                        cre.gender = ddlGender.Text;
                        cre.bankname = txtBankName.Text;
                        cre.accountno = txtAccountNo.Text;
                        cre.IDCard = ddlIdentification.Text;
                        cre.IDNo = txtIDNo.Text;
                        cre.currency = "NGN";
                        if(ddlRegOption.Text == "Citizen")
                        {
                            cre.vendor = 0;
                        }
                        else if (ddlRegOption.Text == "Vendor")
                        {
                            cre.vendor = 1;
                        }
                        cre.ConnectCitizensSignUpStep3();

                        //Placement
                        cre.ConnectCitizensPlacement();

                        cre.UserId = txtUserID.Text;
                        cre.note = "Account creation complete with User ID: " + txtUserID.Text;
                        cre.ConnectCitizensTrail();
                        if (cre.ResponseMsg.Contains("Success"))
                        {
                            try
                            {
                                //Send Email
                                string getEmail = txtEmail.Text;
                                string headertextMail = "Congratulations!";
                                string bodytextMail = "From Connect Recharge:<p> We welcome you to Connect Recharge, the global standard for Recharge/Top-up. Your registration is now complete. We advice you take a few moments to go through the ConnectRecharge App and familiarise yourself with the various sections. <p> Below are your Login details. <p><u>Login Details</u><p> UserID: " + txtUserID.Text + " <p>Password: ********* <p>" + " Your Email Confirmation Code is - <strong>" + emailconfcode + "</strong>. <p>You can now start using our recharge/top-up services. <p><p>- Connect Recharge Support Team";
                                string body = this.PopulateBody(headertextMail, bodytextMail);
                                this.SendHtmlFormattedEmail("" + txtEmail.Text + "", "Welcome to Connect Recharge", body);
                            }
                            catch (Exception)
                            {

                            }

                            Session["AlertMessage"] = cre.ResponseMsg + "Your registration is now complete.";
                            Response.Redirect("success");
                        }
                        else
                        {
                            Session["AlertMessage"] = "An error may have occured.";
                            Response.Redirect("error.aspx");
                        }
                    }
                    else
                    {
                        Session["AlertMessage"] = "One or more fields is empty.";
                        Response.Redirect("error.aspx");
                    }
                }
            }
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


    }
}
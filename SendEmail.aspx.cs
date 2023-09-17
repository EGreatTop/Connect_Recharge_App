//using SocketLabs.InjectionApi;
//using SocketLabs.InjectionApi.Message;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;

namespace ConnectRechargeWebsite
{
    public partial class SendEmail : System.Web.UI.Page
    {
        private string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private SqlDataAdapter da;
        private SqlConnection con;
        private SqlCommand cmd;
        private SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string PopulateBody(string headertext, string bodytext, string text) //string title, string url, string description)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Email/announcement.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{HeaderText}", headertext);
            body = body.Replace("{BodyText}", bodytext);
            body = body.Replace("{Text}", text);
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
            mail.From = new MailAddress("no-reply@connectmagnetmall.com");
            //set the RECIPIENTS
            mail.To.Add(recepientEmail);
            //enter a SUBJECT
            mail.Subject = subject;
            //Enter the message BODY
            mail.Body = body;
            //Set to HTML true
            mail.IsBodyHtml = true;
            //set the mail server (default should be smtp.1and1.com)
            SmtpClient smtp = new SmtpClient("smtp.sendgrid.net");
            smtp.Port = 465;
            //Enter your full e-mail address and password
            smtp.Credentials = new NetworkCredential("apikey", "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");
            //send the message 
            smtp.Send(mail);
        }

        private void SendEmailBlast()
        {
            using (con = new SqlConnection(conn))
            {
                con.Open();
                using (da = new SqlDataAdapter())
                {
                    DataSet ds = new DataSet();
                    string sql = null;
                    sql = "Select emails from CREmails where track !=@track and track !=@track1";
                    using (cmd = new SqlCommand(sql, con))
                    {
                        da.SelectCommand = cmd;
                        da.SelectCommand.Parameters.AddWithValue("@track", "000");
                        da.SelectCommand.Parameters.AddWithValue("@track1", "0");
                        //dr.Dispose();
                        da.Fill(ds);

                        int i; int counter = 0;
                        //Email counter
                        for (i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                        {
                            string emailRetrieved = ds.Tables[0].Rows[i].ItemArray[0].ToString();

                            using (cmd = new SqlCommand("Update CREmails set track=@track where emails=@email and track !=@trackOne", con))
                            {
                                cmd.Parameters.AddWithValue("@track", "0");
                                cmd.Parameters.AddWithValue("@track", "000");
                                cmd.Parameters.AddWithValue("@email", emailRetrieved);
                                cmd.ExecuteNonQuery();
                            }

                            string getEmail = emailRetrieved;
                            string headertextMail = "SALES INCREASE FORMULA - [COVID-19] Resistant";
                            string bodytextMail = "<p>Today, I have just two simple question to ask you. YES! just two.  <br>  <br>and these are...  <br>  <br><strong>What is stopping you from starting or running a&nbsp;</strong><strong>profitable business ?</strong></p><p><strong>What is stopping you from making more sales in your business or more revenue for your organisation where you work(if that is your responsibility) <font color='color: rgb(184, 0, 0);'><even with the dreaded COVID-19</span>?     <br>&nbsp; &nbsp;&nbsp;  </strong>  <br><span style='color: rgb(184, 0, 0);'><strong>Fear, Capital, Ideas trapped, Low Client reach, Inept Strategy, Advert challenges or any other thing(s)?</strong></span></p><p>Whatever the reason is, the bottom line is you just want to make more money whether by starting a business or making more sales or even attracting more revenue for your existing business or company if that is your responsibility in a paid job. </p><p>Now here is the simple truth. what you need is<strong>&nbsp;<span style='background-color: rgb(251, 160, 38); font-size: 20px;'>more customers</span></strong><span style='background-color: rgb(255, 255, 255);'>,&nbsp;</span><strong><span style='font-size:20px;;background-color: rgb(251, 160, 38);'>more clients</span></strong><span style='font-size: 20px;;background-color: rgb(255, 255, 255);'>,&nbsp;</span>  <br><strong><span style='background-color: rgb(251, 160, 38); font-size: 20px;'>more purchases</span></strong>, which leads to <strong><span style='background-color: rgb(251, 160, 38); font-size: 20px;'>more revenue</span></strong> and that is <span style='background-color: rgb(251, 160, 38); font-size: 20px;'><strong>more money</strong></span>. This is just all you need. You need to find a way of doing this while you and staff stay healthy.</p><p>So in this <strong><span style='font-size: 20px; color: rgb(0, 0, 176);'>Sales Rush Blue Prints Package</span></strong>, I have detailed very simple <span style='color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;'>practical&nbsp;</span> steps you can take to attract new customers, increase your client base and make more sales under any condition. These are tested and proven models that works for both products and services. There are also a lot of freebies up for grabs once you access this Sales Rush Blue Prints.   <br>  <br>Here is just a few of the benefits you will get accessing this package.</p><p>1. One-on-One Ideation session where we bring clarity into your business strategy for both newbies and existing businesses.</p><p>2. How to attract clients from within and outside Nigeria to purchase your products.</p><p>3. How to position your business online to sell your products or services.</p><p>4. Top business opportunities you can take advantage of in 2020 to start making 6-7 figure income. &nbsp;&nbsp;</p><p>5. Legit Money generation Apps you can use without quitting your job.&nbsp;</p><p><strong><span style='color: rgb(184, 0, 0);'>And so much more, get complete details when you click the link below</span><strong></p><p><strong>All these you can implement working from home or remotely.</strong></p><p>Click right below to access full access to this resource, you cannot afford to miss this.&nbsp;</p><p><span style='color: rgb(184, 0, 0);'><strong>ONLY LIMITED PACKAGES AVAILABLE!</strong></span></p><p>  <br></p><p><span style='color: rgb(0, 0, 0);'><strong>See you soon,</strong></span></p><p><span style='color: rgb(0, 0, 0);'><strong>For your Success, <br/>Emmanuel.</strong></span></p>";
                            string bodyEnd = "Get Access Now";
                            string body = this.PopulateBody(headertextMail, bodytextMail, bodyEnd);
                            string subject = "Your Proven & Tested Blue-Prints to Generating Sales Rush Traffic in 2020.";
                            this.SendHtmlFormattedEmail("" + getEmail + "", subject, body);
                                                     

                            counter++;                           
                            
                        }
                        Response.Write("<script>alert('" + counter + " messages sent.')</script>");
                    }
                }
            }
        }

        //Send Email
                            //string headertextMail = "SALES INCREASE FORMULA - [COVID-19] Resistant";
                            ////"<p>Thank you for registering on WinningLife International. <p><p>Your User ID is - <strong>" + txtUserID.Text + "</strong>. <p><p>Your Email Confirmation Code is - <strong>" + code + "</strong>. <p>To complete your registration kindly fund your wallet.</p> <p><p>-&nbsp; WinningLife International Team"; ;
                            //string bodytextMail = "<p>Today, I have just two simple question to ask you. YES! just two.  <br>  <br>and these are...  <br>  <br><strong>What is stopping you from starting or running a&nbsp;</strong><strong>profitable business ?</strong></p><p><strong>What is stopping you from making more sales in your business or more revenue for your organisation where you work(if that is your responsibility) <span style="color: rgb(184, 0, 0);"><even with the dreaded COVID-19</span>?     <br>&nbsp; &nbsp;&nbsp;  </strong>  <br><span style="color: rgb(184, 0, 0);"><strong>Fear, Capital, Ideas trapped, Low Client reach, Inept Strategy, Advert challenges or any other thing(s)?</strong></span></p><p>Whatever the reason is, the bottom line is you just want to make more money whether by starting a business or making more sales or even attracting more revenue for your existing business or company if that is your responsibility in a paid job. </p><p>Now here is the simple truth. what you need is<strong>&nbsp;<span style="background-color: rgb(251, 160, 38); font-size: 20px;">more customers</span></strong><span style="background-color: rgb(255, 255, 255);">,&nbsp;</span><strong><span style="font-size:20px;;background-color: rgb(251, 160, 38);">more clients</span></strong><span style="font-size: 20px;;background-color: rgb(255, 255, 255);">,&nbsp;</span>  <br><strong><span style="background-color: rgb(251, 160, 38); font-size: 20px;">more purchases</span></strong>, which leads to <strong><span style="background-color: rgb(251, 160, 38); font-size: 20px;">more revenue</span></strong> and that is <span style="background-color: rgb(251, 160, 38); font-size: 20px;"><strong>more money</strong></span>. This is just all you need. You need to find a way of doing this while you and staff stay healthy.</p><p>So in this <strong><span style="font-size: 20px; color: rgb(0, 0, 176);">Sales Rush Blue Prints Package</span></strong>, I have detailed very simple <span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">practical&nbsp;</span> steps you can take to attract new customers, increase your client base and make more sales under any condition. These are tested and proven models that works for both products and services. There are also a lot of freebies up for grabs once you access this Sales Rush Blue Prints.   <br>  <br>Here is just a few of the benefits you will get accessing this package.</p><p>1. One-on-One Ideation session where we bring clarity into your business strategy for both newbies and existing businesses.</p><p>2. How to attract clients from within and outside Nigeria to purchase your products.</p><p>3. How to position your business online to sell your products or services.</p><p>4. Top business opportunities you can take advantage of in 2020 to start making 6-7 figure income. &nbsp;&nbsp;</p><p>5. Legit Money generation Apps you can use without quitting your job.&nbsp;</p><p><strong><span style="color: rgb(184, 0, 0);">And so much more, get complete details when you click the link below</span><strong></p><p><strong>All these you can implement working from home or remotely.</strong></p><p>Click right below to access full access to this resource, you cannot afford to miss this.&nbsp;</p><p><span style="color: rgb(184, 0, 0);"><strong>ONLY LIMITED PACKAGES AVAILABLE!</strong></span></p><p>  <br></p><p><span style="color: rgb(0, 0, 0);"><strong>See you soon,</strong></span></p><p><span style="color: rgb(0, 0, 0);"><strong>Emmanuel.</strong></span></p>";
                            //string bodyEnd = "Get Access Now";
                            //string body = this.PopulateBody(headertextMail, bodytextMail, bodyEnd);
                            //string plainbodytextMail = "Today, I have just two simple question to ask you. YES! just two.and these are...What is stopping you from starting or running a profitable business? What is stopping you from making more sales in your business or more revenue for your organisation where you work(if that is your responsibility) even with the dreaded COVID-19? Fear, Capital, Ideas trapped, Low Client reach, Inept Strategy, Advert challenges, social restriction or any other thing(s)? Whatever the reason is, the bottom line is you just want to make more money whether by starting a business or making more sales or even attracting more revenue for your existing business or company if that is your responsibility in a paid job. Now here is the simple truth. what you need is more customers, more clients, more purchases, which leads to more revenue and that is more money. This is just all you need. You need to find a way of doing this while you and staff stay healthy. So in this Sales Rush Blue Prints Package, I have detailed very simple practical steps you can take to attract new customers, increase your client base and make more sales under any condition. These are tested and proven models that works for both products and services. There are also a lot of freebies up for grabs once you access this Sales Rush Blue Prints. Here is just a few of the benefits you will get accessing this package. 1. One-on-One Ideation session where we bring clarity into your business strategy for both newbies and existing businesses. 2. How to attract clients from within and outside Nigeria to purchase your products. 3. How to position your business online to sell your products or services. 4. Top business opportunities you can take advantage of in 2020 to start making 6-7 figure income. 5. Legit Money generation Apps you can use without quitting your job. And so much more, get complete details when you click the link below. All these you can implement working from home or remotely. Click right below to access full access to this resource, you cannot afford to miss this. ONLY LIMITED PACKAGES AVAILABLE! See you soon, Emmanuel.";
                            //string plainbody = this.PopulateBody(headertextMail, bodytextMail, bodyEnd);

                            //try
                            //{
                            //    var serverId = 26372;
                            //    var injectionApiKey = "Hf94Mns7L2XaZx85Gpo6";

                            //    var client = new SocketLabsClient(serverId, injectionApiKey);

                            //    var message = new BasicMessage();

                            //    message.Subject = "Your Proven & Tested Blue-Prints to Generating Sales Rush Traffic in 2020.";
                            //    message.HtmlBody = body;
                            //    message.PlainTextBody = plainbody;
                            //    message.From.Email = "no-reply@connectmagnet.com";
                            //    message.To.Add(emailRetrieved);

                            //    var response = client.Send(message);

                            //}
                            //catch (Exception)
                            //{

                            //}

        static async Task Execute()
        {
            SqlConnection con;
            SqlCommand cmd;
            SqlDataAdapter da;
            //string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            //using (con = new SqlConnection(conn))
            //{
            //    con.Open();
            //    using (da = new SqlDataAdapter())
            //    {
            //        DataSet ds = new DataSet();
            //        string sql = null;
            //        sql = "Select emails from CREmail where track !=@track and track !=@track1";
            //        using (cmd = new SqlCommand(sql, con))
            //        {
            //            da.SelectCommand = cmd;
            //            da.SelectCommand.Parameters.AddWithValue("@track", "000");
            //            da.SelectCommand.Parameters.AddWithValue("@track1", "0");
            //            //dr.Dispose();
            //            da.Fill(ds);

            //            int i;
            //            //Email counter
            //            for (i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
            //            {
            //                string emailRetrieved = ds.Tables[0].Rows[i].ItemArray[0].ToString();

            //                using (cmd = new SqlCommand("Update CREmail set track=@track where emails=@email and track !=@trackOne", con))
            //                {
            //                    cmd.Parameters.AddWithValue("@track", "0");
            //                    cmd.Parameters.AddWithValue("@track", "000");
            //                    cmd.Parameters.AddWithValue("@email", emailRetrieved);
            //                    cmd.ExecuteNonQuery();
            //                }


                            var apiKey = Environment.GetEnvironmentVariable("SENDGRID_API_KEY");
                            var client = new SendGridClient(apiKey);
                            var from = new EmailAddress("info@connectmagnetmall.com", "Emmanuel From ConnectMagnet Centre");
                            var subject = "Your Proven & Tested Blue-Prints to Generating Sales Rush Traffic in 2020.";
                            var to = new EmailAddress("heforus@yahoo.com", "Friend");
                            var plainTextContent = "Today, I have just two simple question to ask you. YES! just two.and these are...What is stopping you from starting or running a profitable business? What is stopping you from making more sales in your business or more revenue for your organisation where you work(if that is your responsibility) even with the dreaded COVID-19? Fear, Capital, Ideas trapped, Low Client reach, Inept Strategy, Advert challenges, social restriction or any other thing(s)? Whatever the reason is, the bottom line is you just want to make more money whether by starting a business or making more sales or even attracting more revenue for your existing business or company if that is your responsibility in a paid job. Now here is the simple truth. what you need is more customers, more clients, more purchases, which leads to more revenue and that is more money. This is just all you need. You need to find a way of doing this while you and staff stay healthy. So in this Sales Rush Blue Prints Package, I have detailed very simple practical steps you can take to attract new customers, increase your client base and make more sales under any condition. These are tested and proven models that works for both products and services. There are also a lot of freebies up for grabs once you access this Sales Rush Blue Prints. Here is just a few of the benefits you will get accessing this package. 1. One-on-One Ideation session where we bring clarity into your business strategy for both newbies and existing businesses. 2. How to attract clients from within and outside Nigeria to purchase your products. 3. How to position your business online to sell your products or services. 4. Top business opportunities you can take advantage of in 2020 to start making 6-7 figure income. 5. Legit Money generation Apps you can use without quitting your job. And so much more, get complete details when you click the link below. All these you can implement working from home or remotely. Click right below to access full access to this resource, you cannot afford to miss this. ONLY LIMITED PACKAGES AVAILABLE! See you soon, Emmanuel.";
                            var htmlContent = "<p>Today, I have just two simple question to ask you. YES! just two.  <br>  <br>and these are...  <br>  <br><strong>What is stopping you from starting or running a&nbsp;</strong><strong>profitable business ?</strong></p><p><strong>What is stopping you from making more sales in your business or more revenue for your organisation where you work(if that is your responsibility) <font color='color: rgb(184, 0, 0);'><even with the dreaded COVID-19</span>?     <br>&nbsp; &nbsp;&nbsp;  </strong>  <br><span style='color: rgb(184, 0, 0);'><strong>Fear, Capital, Ideas trapped, Low Client reach, Inept Strategy, Advert challenges or any other thing(s)?</strong></span></p><p>Whatever the reason is, the bottom line is you just want to make more money whether by starting a business or making more sales or even attracting more revenue for your existing business or company if that is your responsibility in a paid job. </p><p>Now here is the simple truth. what you need is<strong>&nbsp;<span style='background-color: rgb(251, 160, 38); font-size: 20px;'>more customers</span></strong><span style='background-color: rgb(255, 255, 255);'>,&nbsp;</span><strong><span style='font-size:20px;;background-color: rgb(251, 160, 38);'>more clients</span></strong><span style='font-size: 20px;;background-color: rgb(255, 255, 255);'>,&nbsp;</span>  <br><strong><span style='background-color: rgb(251, 160, 38); font-size: 20px;'>more purchases</span></strong>, which leads to <strong><span style='background-color: rgb(251, 160, 38); font-size: 20px;'>more revenue</span></strong> and that is <span style='background-color: rgb(251, 160, 38); font-size: 20px;'><strong>more money</strong></span>. This is just all you need. You need to find a way of doing this while you and staff stay healthy.</p><p>So in this <strong><span style='font-size: 20px; color: rgb(0, 0, 176);'>Sales Rush Blue Prints Package</span></strong>, I have detailed very simple <span style='color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;'>practical&nbsp;</span> steps you can take to attract new customers, increase your client base and make more sales under any condition. These are tested and proven models that works for both products and services. There are also a lot of freebies up for grabs once you access this Sales Rush Blue Prints.   <br>  <br>Here is just a few of the benefits you will get accessing this package.</p><p>1. One-on-One Ideation session where we bring clarity into your business strategy for both newbies and existing businesses.</p><p>2. How to attract clients from within and outside Nigeria to purchase your products.</p><p>3. How to position your business online to sell your products or services.</p><p>4. Top business opportunities you can take advantage of in 2020 to start making 6-7 figure income. &nbsp;&nbsp;</p><p>5. Legit Money generation Apps you can use without quitting your job.&nbsp;</p><p><strong><span style='color: rgb(184, 0, 0);'>And so much more, get complete details when you click the link below</span><strong></p><p><strong>All these you can implement working from home or remotely.</strong></p><p>Click right below to access full access to this resource, you cannot afford to miss this.&nbsp;</p><p><span style='color: rgb(184, 0, 0);'><strong>ONLY LIMITED PACKAGES AVAILABLE!</strong></span></p><p>  <br></p><p><span style='color: rgb(0, 0, 0);'><strong>See you soon,</strong></span></p><p><span style='color: rgb(0, 0, 0);'><strong>For your Success, <br/>Emmanuel.</strong></span></p>";
                            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
                            var response = await client.SendEmailAsync(msg);

            //            }
            //        }
            //    }
            //}



            
        }

        protected void BtnSendEMails_Click(object sender, EventArgs e)
        {
            SendEmailBlast();
        }
    }
}
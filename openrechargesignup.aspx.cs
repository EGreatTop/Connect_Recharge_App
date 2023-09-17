using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConnectRechargeWebsite.Model;

namespace ConnectRechargeWebsite
{
    public partial class openrechargesignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
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
                cre.email = txtEmail.Text;
                string password = cre.Encrypt(txtPassword.Text);
                cre.password = password;
                if (txtRefCode.Text != "")
                {
                    cre.refCode = txtRefCode.Text;
                }
                else
                {
                    cre.refCode = "2bb71M9C";
                }
                cre.OpenRechargeSignUp();
                Session["AlertMessage"] = cre.ResponseMsg;
                //Session["PageName"] = "openrechargesignup";
                Response.Redirect("success.aspx");
            }
        }

     

    }
}
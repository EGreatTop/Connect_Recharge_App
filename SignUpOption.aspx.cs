using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectRechargeWebsite
{
    public partial class SignUpOption : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAccountCitizen_Click(object sender, EventArgs e)
        {
            Response.Redirect("connectcitizensignup1");
        }

        protected void btnCreateAccountOpen_Click(object sender, EventArgs e)
        {
            Response.Redirect("openrechargesignup");
        }
    }
}
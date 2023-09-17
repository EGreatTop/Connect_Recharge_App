using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectRechargeWebsite
{
    public partial class error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           LblMessage.Text = Session["AlertMessage"].ToString();
            //lblPageName.Text = Session["PageName"].ToString();
        }

    }
}
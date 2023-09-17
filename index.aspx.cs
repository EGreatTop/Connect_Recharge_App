﻿using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectRechargeWebsite
{
    public partial class index : System.Web.UI.Page
    {
        private const String SecretSalt = "TY#@*Jhgep&31q901ncL#@!!";
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(Object sender, EventArgs e)
        {
            //First, check for the existence of the Anti-XSS cookie
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;

            //If the CSRF cookie is found, parse the token from the cookie.
            //Then, set the global page variable and view state user
            //key. The global variable will be used to validate that it matches in the view state form field in the Page.PreLoad
            //method.
            if (requestCookie != null
            && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                //Set the global token variable so the cookie value can be
                //validated against the value in the view state form field in
                //the Page.PreLoad method.
                _antiXsrfTokenValue = requestCookie.Value;

                //Set the view state user key, which will be validated by the
                //framework during each request
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            //If the CSRF cookie is not found, then this is a new session.
            else
            {
                //Generate a new Anti-XSRF token
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");

                //Set the view state user key, which will be validated by the
                //framework during each request
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                //Create the non-persistent CSRF cookie
                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    //Set the HttpOnly property to prevent the cookie from
                    //being accessed by client side script
                    HttpOnly = true,

                    //Add the Anti-XSRF token to the cookie value
                    Value = _antiXsrfTokenValue
                };

                //If we are using SSL, the cookie should be set to secure to
                //prevent it from being sent over HTTP connections
                if (FormsAuthentication.RequireSSL &&
                Request.IsSecureConnection)
                    responseCookie.Secure = true;

                //Add the CSRF cookie to the response
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += openrechargelogin_Page_PreLoad;
        }

        protected void openrechargelogin_Page_PreLoad(object sender, EventArgs e)
        {
            //During the initial page load, add the Anti-XSRF token and user
            //name to the ViewState
            if (!IsPostBack)
            {
                //Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;

                //If a user name is assigned, set the user name
                ViewState[AntiXsrfUserNameKey] =
                Context.User.Identity.Name ?? String.Empty;
            }
            //During all subsequent post backs to the page, the token value from
            //the cookie should be validated against the token in the view state
            //form field. Additionally user name should be compared to the
            //authenticated users name
            else
            {
                //Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] !=
                (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                //CompleteRegistration();
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if (ddlRouteOption.Text != "Click to Select your Access Route")
            {
                if (ddlRouteOption.Text == "Open Recharge (Sign-up)")
                {
                    Response.Redirect("openrechargesignup");
                }
                else if (ddlRouteOption.Text == "Open Recharge (Login)")
                {
                    Response.Redirect("openrechargelogin");
                }
                else if (ddlRouteOption.Text == "Connect Citizen (Sign-up)")//Continue-Sign-up
                {
                    Response.Redirect("connectcitizensignup1");
                }
                else if (ddlRouteOption.Text == "Connect Citizen (Continue-Sign-up)")
                {
                    Response.Redirect("connectcitizenlogin");
                }
                else if (ddlRouteOption.Text == "Connect Citizen (Login)")
                {
                    Response.Redirect("connectcitizenlogin");                 
                }
                else if(ddlRouteOption.Text == "Reset Login Access")
                {
                    Response.Redirect("openrechargeforgot"); 
                }
            }
            else
            {
                Session["AlertMessage"] = "Select your Access Route.";
                Response.Redirect("error.aspx");
            }
        }

        protected void BtnORSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("openrechargesignup.aspx");
        }

        protected void BtnORLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("openrechargelogin");
        }

        protected void BtnCRSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("connectcitizensignup1");
        }

        protected void BtnCRSignUpContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("connectcitizenlogin");
        }

        protected void BtnCRLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("connectcitizenlogin");
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("openrechargeforgot");
        }

       
       
    }
}
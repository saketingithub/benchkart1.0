using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Customer
{
    public partial class Signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Start - Get Partner Cookie 23 Jun
            if (!IsPostBack)
            {
                if (Request.Cookies["CustomerEmail"] != null && Request.Cookies["Password"] != null)
                {
                    txtLogin.Text = Request.Cookies["CustomerEmail"].Value;
                    txtLoginpassword.Attributes["value"] = Request.Cookies["Password"].Value;
                }
                else if (Request.Cookies["PartnerEmail"] != null && Request.Cookies["Password"] != null)
                {
                    txtLogin.Text = Request.Cookies["PartnerEmail"].Value;
                    txtLoginpassword.Attributes["value"] = Request.Cookies["Password"].Value;
                }
            }
            //End
            
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ClsCustomer sk = new ClsCustomer();
            int authenticates;
            sk.Email = txtLogin.Text;
             sk.Password = txtLoginpassword.Text;
            int checkname=0;
             authenticates = sk.LoginCustomerPartner(ref checkname);
            //ClsPartner pt = new ClsPartner();

            //pt.Email = txtLogin.Text;
            //pt.Password = txtLoginpassword.Text;

            //int authenticates = pt.LoginPartner();
           //5 for Partner
            if (checkname == 5)
            {
                if (authenticates == 0)
                {
                    lblLoginError.Visible = true;
                }
                //else if (authenticates == 0)
                //{
                //    lblLoginError.Text = "Your request is incomplete. Please sign up again.";
                //    lblLoginError.Visible = true;
                //}
                else if (authenticates == 1)
                {
                    lblLoginError.Text = "Your request is pending for approval.";
                    lblLoginError.Visible = true;
                }
                else if (authenticates == 3)
                {
                    lblLoginError.Text = "Your partner request is rejected.";
                    lblLoginError.Visible = true;
                }

                else
                {
                    Session["PartnerId"] = authenticates.ToString();
                    Session["PartnerEmail"] = txtLogin.Text;
                    //Cookie
                    //HttpCookie CookiePartnerId = new HttpCookie("PartnerId");
                    //CookiePartnerId.Value = authenticates.ToString();
                    //CookiePartnerId.Expires = DateTime.Now.AddHours(24);
                    //Response.Cookies.Add(CookiePartnerId);

                    //HttpCookie CookiePartnerEmail = new HttpCookie("PartnerEmail");
                    //CookiePartnerEmail.Value = txtLogin.Text;
                    //CookiePartnerEmail.Expires = DateTime.Now.AddHours(24);
                    //Response.Cookies.Add(CookiePartnerEmail);

                    Response.Cookies["PartnerId"].Expires = DateTime.Now.AddDays(60);
                    Response.Cookies["PartnerId"].Value = authenticates.ToString();


                    //Start - Cookie Implementation for password - 23 Jun
                    if (chkRememberMe.Checked)
                    {
                        Response.Cookies["PartnerEmail"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        Response.Cookies["PartnerEmail"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                    }
                    Response.Cookies["PartnerEmail"].Value = txtLogin.Text.Trim();
                    Response.Cookies["Password"].Value = txtLoginpassword.Text.Trim();
                    //End

                    Response.Redirect("~/Partner/Projects");
                }
            }
            
            else
            {
                if (authenticates > 0)
                {
                    Session["CustomerId"] = authenticates.ToString();
                    Session["emailId"] = txtLogin.Text;

                    //HttpCookie CookieCustomerId = new HttpCookie("CustomerId");
                    //CookieCustomerId.Value = authenticates.ToString();
                    //CookieCustomerId.Expires = DateTime.Now.AddHours(24);
                    //Response.Cookies.Add(CookieCustomerId);

                    //HttpCookie CookieCustomerEmail = new HttpCookie("emailId");
                    //CookieCustomerEmail.Value = txtLogin.Text;
                    //CookieCustomerEmail.Expires = DateTime.Now.AddHours(24);
                    //Response.Cookies.Add(CookieCustomerEmail);

                    Response.Cookies["CustomerId"].Expires = DateTime.Now.AddDays(60);
                    Response.Cookies["CustomerId"].Value = authenticates.ToString();

                    //Start - Cookie Implementation for password - 23 Jun
                    if (chkRememberMe.Checked)
                    {
                        Response.Cookies["CustomerEmail"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        Response.Cookies["CustomerEmail"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                    }
                    Response.Cookies["CustomerEmail"].Value = txtLogin.Text.Trim();
                    Response.Cookies["Password"].Value = txtLoginpassword.Text.Trim();
                    //End

                    Response.Redirect("Projects_Dashboard");
                }
                else
                {
                    lblLoginError.Visible = true;
                }
            }
            
        }
    }
}
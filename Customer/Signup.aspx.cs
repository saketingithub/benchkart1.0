using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace Benchkart.Customer
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (ddlservices.SelectedValue == "0")
            {
                ClsCustomer clscust = new ClsCustomer();
                clscust.FullName = txtFullName.Text;
                clscust.Email = txtEmailid.Text;
                clscust.Password = txtPassword.Text;
                clscust.CompanyName = txtCompanyName.Text;
                clscust.ContactNumber = txtContactNumber.Text;
                int exist;
                exist = clscust.New_SignupCustomer();
                if (exist != 0)
                {
                    Session["CustomerId"] = exist.ToString();
                    //Anurag - Bug Fixed 28-4-2020
                    Session["emailId"] = txtEmailid.Text;
                    //End

                    //HttpCookie CookieCustomerId = new HttpCookie("CustomerId");
                    //CookieCustomerId.Value = exist.ToString();
                    //CookieCustomerId.Expires = DateTime.Now.AddHours(24);
                    //Response.Cookies.Add(CookieCustomerId);

                    //HttpCookie CookieCustomerEmail = new HttpCookie("emailId");
                    //CookieCustomerEmail.Value = txtEmailid.Text;
                    //CookieCustomerEmail.Expires = DateTime.Now.AddHours(24);
                    //Response.Cookies.Add(CookieCustomerEmail);

                    Response.Cookies["CustomerId"].Expires = DateTime.Now.AddDays(60);
                    Response.Cookies["CustomerId"].Value = exist.ToString();

                    Response.Redirect("Projects_Dashboard");
                }
                else
                {
                    Response.Write("<script>alert('This Email Id already present in our database. Please login.')</script>");
                }
            }
            else
            {
                ClsPartner clsPartner = new ClsPartner();
                clsPartner.PocFullName = txtFullName.Text;
                clsPartner.Email = txtEmailid.Text;
              //  clsPartner.Password = txtPassword.Text;
                clsPartner.CompanyName = txtCompanyName.Text;
                clsPartner.ContactNumber = txtContactNumber.Text;
                int exist;
                exist = clsPartner.CustomerSignupPartner();
                if(exist !=0)
                {
                    Response.Redirect("~/Partner/Signup.aspx?email="+txtEmailid.Text);
                }
                else
                {
                    Response.Write("<script>alert('This Email Id already present in our database. Please login.')</script>");
                }
                
            }
        }

       
    }
}
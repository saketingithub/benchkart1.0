using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart
{
    public partial class TestCookie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           int PartnerId =  Convert.ToInt32(Session["PartnerId"].ToString());

            Response.Write(@"<script language='javascript'>alert('The following errors have occurred: \n" + PartnerId + " .');</script>");

           // if (Request.Cookies["PartnerId"] == null)
           // {
                int PartnerIdd = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
                //Response.Write("<script>alert('Not Working')</script>");
               Response.Write(@"<script language='javascript'>alert('Not: \n" + PartnerIdd + " .');</script>");
            //}
            //else
            //{
            //    int PartnerIdd = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
            //    //Response.Write("<script>alert('Working')</script>");
            //    Response.Write(@"<script language='javascript'>alert('Working: \n" + PartnerIdd + " .');</script>");
            //}
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Consultant
{
    public partial class ucConsultantHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkSignout_Click(object sender, EventArgs e)
        {
           Session.Abandon();
           Session.Clear();
           Session.RemoveAll();
           Response.Redirect("~/");
            
        }
    }
}
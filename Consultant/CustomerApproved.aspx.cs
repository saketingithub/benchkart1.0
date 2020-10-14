using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Consultant
{
    public partial class CustomerApproved : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            if (!IsPostBack) 
            { 
            ClsProject pj = new ClsProject();
                string pId = Request.QueryString["projectId"].ToString();
               
            string   projectId = pId.Replace("+","").Trim();
                int project = Convert.ToInt32(projectId);
                pj.ProjectId = project;
            pj.ProjectStatusUpdateByProjectId();
            }
        }
    }
}
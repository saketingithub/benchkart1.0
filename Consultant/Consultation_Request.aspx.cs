using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Consultant
{
    public partial class Consultation_Request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblConsultantEmail.Text = Session["ConsultantEmail"].ToString();
            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            if (!IsPostBack)
            {
                ClsConsult co = new ClsConsult();
                int status = 1;
                rptConsult.DataSource = co.GetConsultList(status);
                rptConsult.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            int status = Convert.ToInt32(ddlStatus.SelectedValue);
            ClsConsult co = new ClsConsult();
            rptConsult.DataSource = co.GetConsultList(status);
            rptConsult.DataBind();
        }

        protected void ddlStatusChange_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList d = (DropDownList)sender;

            int status = Convert.ToInt32(d.SelectedValue);

            Label rptItem = (Label)d.Parent.FindControl("lblConsultId");
            
            ClsConsult co = new ClsConsult();

            co.ConsultId = Convert.ToInt32(rptItem.Text);
            co.Status = status;
            co.UpdateConsultStatusbyConsultant();

            //rptConsult.DataSource = co.UpdateConsultStatus(ref status);
            //rptConsult.DataBind();
        }

        protected virtual void RepeaterItemCreated(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||  e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList MyList = (DropDownList)e.Item.FindControl("ddlStatusChange");
                MyList.SelectedIndexChanged += ddlStatusChange_SelectedIndexChanged;
            }
        }

        //protected string GetStatus(string status)
        //{
        //    if(status == "1")
        //    {
        //        return "New";
        //    }
        //    else if (status == "2")
        //    {
        //        return "Follow Up";
        //    }
        //    if (status == "3")
        //    {
        //        return "Closed";
        //    }
        //    if (status == "4")
        //    {
        //        return "Spam";
        //    }
        //    if (status == "5")
        //    {
        //        return "Not Reachable";
        //    }
        //    if (status == "6")
        //    {
        //        return "Escalate For Assistance";
        //    }
        //    if (status == "7")
        //    {
        //        return "Requirement Not Clear";
        //    }
        //    if (status == "8")
        //    {
        //        return "Project Created";
        //    }
        //    return "New";
        //}
    }
}
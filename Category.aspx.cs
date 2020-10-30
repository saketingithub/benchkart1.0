using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Web.UI.HtmlControls;

namespace Benchkart
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if(!IsPostBack)
            {
                SetCategory();
                DisplayDownloads();
              
            }
        }

        public void DisplayDownloads()
        {
            int serviceId = Convert.ToInt32(Request.QueryString["id"]);
            Image1.ImageUrl = "~/Images/Category/" + serviceId + ".jpg";
            

        }
        public void SetCategory()
        {
            // ddlSubCategory.Items.Clear();

            ClsServiceMaster sm = new ClsServiceMaster();
            string id = Request.QueryString["id"].ToString();
            try
            {
                sm.ServiceId = Convert.ToInt32(id);
            }
            catch (Exception ex)
            {
                ClsLogError.LogErrorToText("Query String Value is " + id, ex);
                Response.Redirect("~/");
            }

            DataSet dtCategory = sm.GetCategoryService();
            if(dtCategory.Tables[0].Rows.Count>0)
            {
                lblsubcategory.Text = dtCategory.Tables[0].Rows[0]["Title"].ToString();
                lbldescription.Text = dtCategory.Tables[0].Rows[0]["CategoryDescription"].ToString();

                this.Page.Title = lblsubcategory.Text;
                HtmlMeta keywords = new HtmlMeta();
                keywords.HttpEquiv = "keywords";
                keywords.Name = "keywords";
                keywords.Content = "KEYWORDS FROM DB GOES HERE";
                this.Page.Header.Controls.Add(keywords);

                //Add Description Meta Tag.
                HtmlMeta description = new HtmlMeta();
                description.HttpEquiv = "description";
                description.Name = "description";
                description.Content = lbldescription.Text;
                this.Page.Header.Controls.Add(description);
            }           
            
        }

        protected void btnpostproject_Click(object sender, EventArgs e)
        {
            int ServiceId = Convert.ToInt32(Request.QueryString["id"]);
            Response.Redirect("~/Customer/Post_Project?id="+ServiceId);
        }

        protected void btnconsultant_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book_Consultation");
        }
        
    }
}
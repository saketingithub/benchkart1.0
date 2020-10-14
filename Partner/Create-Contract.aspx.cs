using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Benchkart.Partner
{
    public partial class Create_Contract : System.Web.UI.Page
    {
        int bidId;
        protected void Page_Load(object sender, EventArgs e)
        {

            bidId = Convert.ToInt32(Request.QueryString["ID"]);                
            
        }

        protected void btnSubmitContract_Click(object sender, EventArgs e)
        {
            ClsContract co = new ClsContract();
            co.BidId = bidId;
            co.ProjectValue = Convert.ToInt32(txtProjectValue.Text);
            co.Duration = Convert.ToInt32(txtProjectDuration.Text);
            co.DurationType = Convert.ToInt32(ddlProjectDurationType.SelectedValue);

            if (txtStartDate.Text != string.Empty)
            {
                DateTime dtStart = DateTime.Parse(txtStartDate.Text);
                co.StartDate = dtStart;
            }
            if (txtEndDate.Text != string.Empty)
            {
                DateTime dtEnd = DateTime.Parse(txtEndDate.Text);
                co.EndDate = dtEnd;
            }

            int contractId = co.SendContracttoCustomer();

            string newPath = string.Empty;
            HttpFileCollection fileCollection = Request.Files;
            if (Request.Files.Count > 0 && Request.Files[0].ContentLength > 0)
            {
                // Mention the directory name where you want to create sub directories.
                string strMainFolderPath = Server.MapPath("~/UploadFiles/Contracts/");

                //Create a new subfolder in the main folder.
                newPath = System.IO.Path.Combine(strMainFolderPath, contractId.ToString());

                DirectoryInfo objDirectory = new DirectoryInfo(newPath);
                if (!objDirectory.Exists)
                {
                    System.IO.Directory.CreateDirectory(newPath);
                }
                for (int i = 0; i < fileCollection.Count; i++)
                {
                    HttpPostedFile uploadfile = fileCollection[i];
                    string fileName = Path.GetFileName(uploadfile.FileName);
                    //if (uploadfile.ContentLength > 0)
                    //{
                    uploadfile.SaveAs(newPath + "\\" + fileName);
                    //}
                }
            }           


            //Response.Redirect("Projects_Dashboard");
            Response.Write("<script>alert('Contract has been sent to customer for approval!');window.location='../Partner/Projects_Dashboard';</script>");
        }

       
    }
}
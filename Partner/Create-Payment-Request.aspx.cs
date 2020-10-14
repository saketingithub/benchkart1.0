using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Benchkart.Partner
{
    public partial class Create_Payment_Request : System.Web.UI.Page
    {
        int projectId;
        protected void Page_Load(object sender, EventArgs e)
        {

            projectId = Convert.ToInt32(Request.QueryString["ID"]);

        }

        protected void btnRequestPayment_Click(object sender, EventArgs e)
        {
            ClsPayment py = new ClsPayment();
            py.ProjectId = projectId;
            py.PaymentAmount = Convert.ToInt32(txtPaymentAmount.Text);
            py.LastRemark = txtRemarks.Text;
            //py.IsFinalDelivery = Convert.ToInt32(chkIsFinalPayment.Checked);

            //if (txtPotentialPayDate.Text != string.Empty)
            //{
            //    py.PotentialPaybyDate = Convert.ToDateTime(txtPotentialPayDate.Text);
            //}            
            
            //Email
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;
            string customerName = string.Empty;
            string customerEmail = string.Empty;

            int paymentRequestId = py.CreatePaymentRequest();

            string newPath = string.Empty;
            HttpFileCollection fileCollection = Request.Files;
            if (Request.Files.Count > 0 && Request.Files[0].ContentLength > 0)
            {
                // Mention the directory name where you want to create sub directories.
                string strMainFolderPath = Server.MapPath("~/UploadFiles/Payments/");

                //Create a new subfolder in the main folder.
                newPath = System.IO.Path.Combine(strMainFolderPath, paymentRequestId.ToString());

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
            Response.Write("<script>alert('Payment request has been sent to customer for approval!');window.location='../Partner/Projects_Dashboard';</script>");
        }

        
    }
}

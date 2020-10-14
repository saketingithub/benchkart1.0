using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Customer
{
    public partial class Book_Consultation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ClsConsult co = new ClsConsult();
            co.Name = txtFullName.Text;
            co.Email = txtEmailId.Text;
            co.Query = txtDescription.Text;
            co.ContactNumber = txtContactNumber.Text;
            co.CompanyName = txtCompanyName.Text;
            co.PreferredContactMethod = Convert.ToInt32(rblContactPreferrence.SelectedValue);
            
            co.BookFreeConsultation();

            Response.Write("<script>alert('Thanks for submitting your query! Benchkart consultant will get back to you soon.');window.location='../';</script>");

        }

    }
}
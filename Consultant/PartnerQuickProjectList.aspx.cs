using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Services;
using System.Data.SqlClient;

namespace Benchkart.Consultant
{
    public partial class PartnerQuickProjectList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            if (!IsCrossPagePostBack)
            {
               
                grdpartnerQuickdetails.Visible = true;
                GetPackageData();
            }
        }
        public void GetPackageData()
        {
            DataTable dt = new DataTable();
            ClsPartner clsqp = new ClsPartner();
            
            dt = clsqp.GetPartnerQuickDetailsAll();
            if (dt.Rows.Count > 0)
            {
                grdpartnerQuickdetails.Visible = true;
                grdpartnerQuickdetails.DataSource = dt;
                grdpartnerQuickdetails.DataBind();
            }
            else
            {
                grdpartnerQuickdetails.Visible = false;
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            ClsPartner clsqp = new ClsPartner();
            clsqp.PocFullName = txtsearch.Text;
            clsqp.CompanyName = txtsearch.Text;
            dt = clsqp.GetPartnerQuickDetailsByPartnerIdSearch();
            if (dt.Rows.Count > 0)
            {
                //grdpartnerQuickdetails.Visible = true;
                grdpartnerQuickdetails.DataSource = dt;
                grdpartnerQuickdetails.DataBind();
            }
            else
            {
                grdpartnerQuickdetails.Visible = false;
            }
        }

        protected void grdpartnerQuickdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edt")
            {
                pnlagency.Attributes.Add("style", "display:block;");
                DataTable dtpartner = new DataTable();
                ClsPartner clspt = new ClsPartner();
                clspt.PartnerId = Convert.ToInt32(e.CommandArgument.ToString());
                dtpartner = clspt.GetPartnerQuickByPartnerId();
                if (dtpartner.Rows[0]["PocFullName"] != DBNull.Value)
                {
                    txtRepresentativeName.Text = dtpartner.Rows[0]["PocFullName"].ToString();
                }
               
                if (dtpartner.Rows[0]["CompanyCity"] != DBNull.Value)
                {
                    txtLocation.Text = dtpartner.Rows[0]["CompanyCity"].ToString();
                }
                if (dtpartner.Rows[0]["EmployeeCount"] != DBNull.Value)
                {
                    txtEmployeeCount.Text = "No. of Employees " + dtpartner.Rows[0]["EmployeeCount"].ToString();
                }
                if (dtpartner.Rows[0]["CompanyStarted"] != DBNull.Value)
                {
                    txtCompanyStarted.Text = "Completed Yrs. " + dtpartner.Rows[0]["CompanyStarted"].ToString();
                }
                if (dtpartner.Rows[0]["Description1"] != DBNull.Value)
                {
                    txtDescribedAs.Text = dtpartner.Rows[0]["Description1"].ToString();

                }

                if (dtpartner.Rows[0]["Description2"] != DBNull.Value)
                {
                    txtConsiderUsBecause.Text = dtpartner.Rows[0]["Description2"].ToString();
                }
                if (dtpartner.Rows[0]["Description3"] != DBNull.Value)
                {
                    txtOurTopCustomersAre.Text = dtpartner.Rows[0]["Description3"].ToString();
                }
                ViewState["PartnerId"] = e.CommandArgument.ToString();
                btnsubmit.Text = "Update Agency Details";
            }
        }

        [WebMethod]
        public static List<string> GetAutoCompleteData(string username)
        {
            List<string> result = new List<string>();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(dbConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proc_GetStateByLike", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.AddWithValue("@name", username);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        result.Add(dr["City"].ToString());
                    }
                    return result;
                }
            }
        }
       

        protected void btnsubmit_Click(object sender, EventArgs e)
        
        {
           
            string location = string.Empty;
            string[] city = txtLocation.Text.Split(',');
            for (int i = 0; i < city.Length; i++)
            {
                location += city[i] + ",";
            }
            location = location.TrimEnd(',');
            ClsPartner clspt = new ClsPartner();
            clspt.PartnerId = Convert.ToInt32(ViewState["PartnerId"]);
            clspt.PocFullName = txtRepresentativeName.Text;
            
            clspt.CompanyCity = location;
            clspt.Description1 = txtDescribedAs.Text;
            clspt.Description2 = txtConsiderUsBecause.Text;
            clspt.Description3 = txtOurTopCustomersAre.Text;
            clspt.UpdatePartnerQuickByPartnerId();
           
            GetPackageData();
            pnlagency.Attributes.Add("style", "display:none;");

        }
    }
}
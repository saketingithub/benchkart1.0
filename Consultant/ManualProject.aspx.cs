using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI.WebControls.WebParts;
using System.Configuration;

namespace Benchkart.Consultant
{
    public partial class ManualProject1 : System.Web.UI.Page
    {

        string  Talent = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                    GetData();
               
            }
        }
        int projectId;
        public void GetData()
        {
            ClsProject clsprj = new ClsProject();

            projectId = Convert.ToInt32(Session["projectid"]);
            clsprj.ProjectId =projectId;
            clsprj.ServiceId = Convert.ToInt32(Session["serviceId"]);
            DataTable dt = new DataTable();
            dt = clsprj.GetManualProjectByProject();
            if(dt.Rows.Count>0)
            {
                grdManual.Visible = true;
                grdManual.DataSource = dt;
                grdManual.DataBind();
            }
            else {
                
                    grdManual.Visible = false;
                 }
        }
        public void GetState()
        {
            ClsCity ct = new ClsCity();

            DataSet dsStates = new DataSet();
            dsStates = ct.BindCitiesManual();

            //ddlLocation.DataSource = dsStates.Tables[0];
            //ddlLocation.DataTextField = "State";
            //ddlLocation.DataValueField = "StateId";
            //ddlLocation.DataBind();

            //ddlLocation.Items.Insert(0, new ListItem("Select State", ""));
            // ddlCities.Items.Insert(0, new ListItem("Select City", ""));


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

        string partnertype = string.Empty;
        protected void btnShow_Click(object sender, EventArgs e)
        {
            
            
            ClsPartner clspt = new ClsPartner();

            if (ddlPartnerType.SelectedValue != "")
            {
                partnertype = GetPartnerType();
            }
            else
            {
                partnertype = " not in(4)";
            }
               
            if (ddlPrimarySourceofRevenue.SelectedValue != "")
            {
                string companypromarysourceofrevenue = string.Empty;
                companypromarysourceofrevenue = GetPrimarySourceofRevenue();
                //string []arr =companypromarysourceofrevenue.Split('",');
                clspt.CompanyPrimarySourceOfRevenue = companypromarysourceofrevenue;
            }
            else
            {
                clspt.CompanyPrimarySourceOfRevenue = " not in('krishan')";
            }

            if (ddlEmployeeCount.SelectedValue != "") { 
                string employeecount = string.Empty;
                employeecount = GetEmployeeCount();
                clspt.EmployeeCount = employeecount;
            }
            else
            {
                clspt.EmployeeCount = " not in('00')";
            }
            if (ddlIsTalentShared.SelectedValue != "")
            {
                Talent = GetIsTalentShared();
            }
            else
            {
                Talent = " not in(2)";
            }
            if (txtSearch.Text != "")
            {

            // clspt.IsTalentShared = talent.ToString();
            string city = string.Empty;     
            string [] search= txtSearch.Text.Split(',');
            for(int k =0; k < search.Length-1; k++)

            {
                if (search[k] == search[0])
                {
                    city = "='" +search[0].Trim() + "'" + ' ';
                }
                else
                {
                    city += "or p.CompanyCity ='" +search[k].Trim() + "'" + ' ';
                }
            }
            city= city.Replace('"', ' ');

            clspt.CompanyCity= city;


            }
            else
            {
                clspt.CompanyCity = " not in('xxx')";
            }
            //string subcatgory = string.Empty;
            //string[] catgory = Session["serviceId"].ToString().Split(',');
            //for(int i = 0; i < catgory.Length ; i++)
            //{
            //    if (catgory[i] == catgory[0])
            //    {
            //        subcatgory = "='" + catgory[0].Trim() + "'" + ' ';
            //    }
            //    else
            //    {
            //        subcatgory="or Services ='"+catgory[i].Trim()+"'" + ' ';
            //    }
            //}
            //subcatgory = subcatgory.Replace('"', ' ');
            //clspt.OtherServices = Session["serviceId"].ToString();
            DataTable dt = new DataTable();
            dt = clspt.GetPartnerManual( partnertype, Talent,Convert.ToInt32(Session["serviceId"]));
            if (dt.Rows.Count > 0)
            {
                grdManual.Visible = true;
                grdManual.DataSource = dt;
                grdManual.DataBind();
            }
            else
            {
                grdManual.Visible = false;
            }

        }
        public string GetPartnerType()
        {

            string partnertype = string.Empty;
            List<int> listitem3 = new List<int>();
            foreach (ListItem item3 in ddlPartnerType.Items)
            {
                if (item3.Selected)
                {
                    listitem3.Add(int.Parse(item3.Value));
                    //primarysourceofrevenue +=  item.Text+',';
                }
            }
            for (int j = 0; j < listitem3.Count; j++)
            {
                if (listitem3[j] == listitem3[0])
                {
                    partnertype = "='" + listitem3[0] + "'" + ' ';
                }
                else
                {
                    partnertype += "or p.PartnerType ='" + listitem3[j] + "'" + ' ';
                }
            }
            partnertype = partnertype.Replace('"', ' ');
            return partnertype;
        }
        public string GetIsTalentShared()
        {

            string istalentshared = string.Empty;
            List<int> listitem2 = new List<int>();
            foreach (ListItem item2 in ddlIsTalentShared.Items)
            {
                if (item2.Selected)
                {
                    listitem2.Add(int.Parse(item2.Value));
                    //primarysourceofrevenue +=  item.Text+',';
                }
            }
            for (int j = 0; j < listitem2.Count; j++)
            {
                if (listitem2[j] == listitem2[0])
                {
                    istalentshared = "='" + listitem2[0] + "'" + ' ';
                }
                else
                {
                    istalentshared += "or p.IsTalentShared ='" + listitem2[j] + "'" + ' ';
                }
            }
            istalentshared = istalentshared.Replace('"', ' '); 
            return istalentshared;
        }
        public string GetEmployeeCount()
        {


            string employeecount = string.Empty;
            List<string> listitem = new List<string>();
            foreach (ListItem item in ddlEmployeeCount.Items)
            {
                if (item.Selected)
                {
                    listitem.Add(item.ToString());
                    //primarysourceofrevenue +=  item.Text+',';
                }
            }
            for (int j = 0; j < listitem.Count; j++)
            {
                if (listitem[j] == listitem[0])
                {
                    employeecount = "='" + listitem[0] + "'" + ' ';
                }
                else
                {
                    employeecount += "or p.EmployeeCount ='" + listitem[j] + "'" + ' ';
                }
            }
            employeecount = employeecount.Replace('"', ' ');
            return employeecount;
        }

      
        public string GetPrimarySourceofRevenue()
        {

            string primarysourceofrevenue = string.Empty;
            List<string> listitem1 = new List<string>();
            foreach (ListItem item1 in ddlPrimarySourceofRevenue.Items)
            {
                if (item1.Selected)
                {
                    listitem1.Add(item1.ToString());
                    //primarysourceofrevenue +=  item.Text+',';
                }
            }
            for(int i=0; i < listitem1.Count; i++)
            {
                if (listitem1[i] == listitem1[0])
                {
                    primarysourceofrevenue = "='" + listitem1[0] + "'" + ' ';
                }
                else
                {
                    primarysourceofrevenue += "or p.PrimarySourceOfRevenue ='" + listitem1[i] + "'" + ' ';
                }
            }
            primarysourceofrevenue = primarysourceofrevenue.Replace('"', ' ');
            return primarysourceofrevenue;
        }

        string partneremailmanual = string.Empty;
        protected void btnsend_Click(object sender, EventArgs e)
        {
            
            //foreach( int i=0; i < grdManual.Rows.Count; i++)
            //{
            //    CheckBox chkmunal = grdManual.Rows[0].FindControl("chkitem")as CheckBox;
            //    if (chkmunal.Checked)
            //    {
            //        email += grdManual.Rows[i].Cells[2].Text+',';
            //    }
            //}
           foreach(GridViewRow gv in grdManual.Rows)
            {
                CheckBox chk = (CheckBox)gv.FindControl("chkitem");
                if (chk.Checked)
                {

                    
                    partneremailmanual += gv.Cells[3].Text + ',';
                }
            }
            string partnermail=partneremailmanual.TrimEnd(',');
            //  Email
            string ptmail = string.Empty;
            ClsPartner partner = new ClsPartner();
            string[] search = partneremailmanual.Split(',');
            for (int k = 0; k < search.Length - 1; k++)

            {
                if (search[k] == search[0])
                {
                    ptmail = "'" + search[0].Trim() + "'" + ' ';
                }
                else
                {
                    ptmail += ", '" + search[k].Trim() + "'" + ' ';
                }
            }
            ptmail = ptmail.Replace('"', ' ');
                partner.Email = ptmail;
                partner.ManualType = "Manual" + Session["projectid"].ToString();
                // int projectid =Convert.ToInt32(Session["projectid"]);
                // string manualproject= "Manual-" + Session["projectid"];
                partner.UpdateManualTypePatner(Convert.ToInt32(Session["projectid"]));
                string title = Session["title"].ToString();
                string description = Session["description"].ToString();
                string statecomments = Session["statusComment"].ToString();
                string customername = Session["customerName"].ToString();
                string customeremail = Session["customerEmail"].ToString();
                string partneremail = Session["partnerEmail"].ToString();
                string subcategory = Session["subcategory"].ToString();

                System.Threading.Thread email = new System.Threading.Thread(delegate ()
                {
                    string subject = "Great! Your Project is Live for Bidding";
                    string body = "<p><b>Project Title -</b> " + title + "</p><p>Your Project is now live on benchkart. Our expert agencies will now start bidding on your project. It will take around 48 hrs for the top bids to reflect in your dashboard, after the algorithm based matching and the automated bidding & review process. It will be worth the wait!!</p><p>You can then compare the bids and select the best bid/agency suited for your project requirement. You can watch a 3 min Video to understand the entire process: <a href=\"https://www.youtube.com/watch?v=Ce1ocIxwDgs\">Watch Video</a></p>";
                    ClsMail.SendEmail(customername, customeremail, subject, body);

                    //Email
                    if (partnermail != "")
                    {
                        subject = "<b>New Project -</b> " + subcategory;
                        body = "<p>There is a new project LEAD in your dashboard.</p><p><b>Project Title -</b> " + title + "</p><p><b>Sub-Category -</b> " + subcategory + "</p><p><b>Description -</b> </p><p>" + description + "</p><p><b>Status Comments -</b>" + statecomments + "</p><p>Post your BID before bidding timeframe (normally 12 - 48 Hrs*) closed for this project. To stop receiving project notifications over email, please write to outsource@benchkart.com.</p>";
                        ClsMail.SendBccEmail(partnermail, subject, body);
                    }
                    //End - Email

                });

                email.IsBackground = true;
                email.Start();
                Response.Redirect("../Consultant/Requests.aspx");
                //End - Email  

        }

       
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Consultant
{
    public partial class Post_NewRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            if (!IsPostBack)
            {
                ddlBasic.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlBasic.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlIntermediate.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlIntermediate.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlExpert.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlExpert.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlBasicPartTime.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlBasicPartTime.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlIntermediatePartTime.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlIntermediatePartTime.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlExpertPartTime.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlExpertPartTime.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlBasicPartTimeHours.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 50; i++)
                {
                    ddlBasicPartTimeHours.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlIntermediatePartTimeHours.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 50; i++)
                {
                    ddlIntermediatePartTimeHours.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlExpertPartTimeHours.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 50; i++)
                {
                    ddlExpertPartTimeHours.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }


                //lblConsultantEmail.Text = Session["ConsultantEmail"].ToString(); //krishan update session value
                DataTable dtRequest = new DataTable();
                //if (lblConsultantEmail.Text == string.Empty)
                //{
                //    lblConsultantEmail.Text = Request.QueryString["Email"].ToString();
                //}
                GetState();
                //GetStateFullTime();
                //GetStatePartTime();

            }
        }
        public void GetState()
        {
            ClsCity ct = new ClsCity();

            DataSet dsStates = new DataSet();
            dsStates = ct.LoadStates();

            ddlStates.DataSource = dsStates.Tables[0];
            ddlStates.DataTextField = "State";
            ddlStates.DataValueField = "StateId";
            ddlStates.DataBind();

            ddlStates.Items.Insert(0, new ListItem("Select State", ""));
			
			ddlStatesFullTime.DataSource = dsStates.Tables[0];
            ddlStatesFullTime.DataTextField = "State";
            ddlStatesFullTime.DataValueField = "StateId";
            ddlStatesFullTime.DataBind();

            ddlStatesFullTime.Items.Insert(0, new ListItem("Select State", ""));
			
			 ddlStatesPartTime.DataSource = dsStates.Tables[0];
            ddlStatesPartTime.DataTextField = "State";
            ddlStatesPartTime.DataValueField = "StateId";
            ddlStatesPartTime.DataBind();

            ddlStatesPartTime.Items.Insert(0, new ListItem("Select State", ""));
            // ddlCities.Items.Insert(0, new ListItem("Select City", ""));


        }
        
        public void GetCities()
        {
            ddlStates.Attributes.Add("Style", "display:block;");
            ddlCities.Attributes.Add("Style", "display:block;");
            DataTable dtCities = new DataTable();
            //  ddlCities.Items.Clear();

            int stateId = Convert.ToInt32(ddlStates.SelectedValue);
            if (stateId > 0)
            {

                ClsCity ct = new ClsCity();
                dtCities = ct.BindCities(stateId);

                ddlCities.DataSource = dtCities;
                ddlCities.DataTextField = "City";
                ddlCities.DataValueField = "CityId";
                ddlCities.DataBind();
            }
            ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
        }
        public void GetCitiesFullTime()
        {
            ddlStatesFullTime.Attributes.Add("Style", "display:block;");
            ddlCitiesFullTime.Attributes.Add("Style", "display:block;");
            ddlStates.Attributes.Add("Style", "display:none");
            ddlCities.Attributes.Add("Style", "display:none");
            DataTable dtCities = new DataTable();
            ddlCitiesFullTime.Items.Clear();

            int stateId = Convert.ToInt32(ddlStatesFullTime.SelectedValue);
            if (stateId > 0)
            {
                ClsCity ct = new ClsCity();
                dtCities = ct.BindCities(stateId);

                ddlCitiesFullTime.DataSource = dtCities;
                ddlCitiesFullTime.DataTextField = "City";
                ddlCitiesFullTime.DataValueField = "CityId";
                ddlCitiesFullTime.DataBind();
            }
            ddlCitiesFullTime.Items.Insert(0, new ListItem("Select City", "0"));
        }
        public void GetCitiesPartTime()
        {
            ddlStatesPartTime.Attributes.Add("Style", "display:block;");
            ddlCitiesPartTime.Attributes.Add("Style", "display:block;");
            ddlStates.Attributes.Add("Style", "display:none");
            ddlCities.Attributes.Add("Style", "display:none");
            DataTable dtCities = new DataTable();
            ddlCitiesPartTime.Items.Clear();

            int stateId = Convert.ToInt32(ddlStatesPartTime.SelectedValue);
            if (stateId > 0)
            {
                ClsCity ct = new ClsCity();
                dtCities = ct.BindCities(stateId);

                ddlCitiesPartTime.DataSource = dtCities;
                ddlCitiesPartTime.DataTextField = "City";
                ddlCitiesPartTime.DataValueField = "CityId";
                ddlCitiesPartTime.DataBind();
            }
            ddlCitiesPartTime.Items.Insert(0, new ListItem("Select City", "0"));
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceId = Convert.ToInt32(ddlCategory.SelectedValue);
            SetSubCategory(serviceId);
           // ddlSubCategory.Items.Insert(0, new ListItem("-Any SubCategory-", "0"));
            //ddlSubCategory.ClearSelection();
          //  ddlSubCategory.Items.FindByValue("0").Selected = true;
        }
        public void SetSubCategory(int parentId)
        {
            ddlSubCategory.Items.Clear();

            ClsServiceMaster sm = new ClsServiceMaster();
            DataTable dtSubCategory = sm.GetSubCategory(parentId);
            ddlSubCategory.DataSource = dtSubCategory;
            ddlSubCategory.DataValueField = "ServiceId";
            ddlSubCategory.DataTextField = "Title";
            ddlSubCategory.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ClsRequest rq = new ClsRequest();
            string FullName = txtFullName.Text;
            string Email = txtEmail.Text;
            string ContactNumber = txtContactNumber.Text;
            string CompanyName = txtCompanyName.Text;

            //rq.ServiceId =Convert.ToInt32( ddlCategory.SelectedValue);
            if (ddlSubCategory.SelectedValue == "0")
            {
                rq.ServiceId = Convert.ToInt32(ddlCategory.SelectedValue);
            }
            else
            {
                rq.ServiceId = Convert.ToInt32(ddlSubCategory.SelectedValue);
            }

            rq.Title = txtTitle.Text;
            rq.Description = txtDescription.Text;
            rq.OutsourceType =Convert.ToInt32( ddlOutsourceType.SelectedValue);
             if(ddlOutsourceType.SelectedValue=="2")
            {
                rq.Duration = txtDuration.Text;
                rq.WorkMode=Convert.ToInt32(ddlWorkMode.SelectedValue);
                rq.State = ddlStates.SelectedValue;
                rq.OnsiteLocation = ddlCities.SelectedValue ;
                rq.SkillRequired = txtSkills.Text;
                rq.Budget =Convert.ToInt32(txtBudget.Text);
                rq.BudgetType = Convert.ToInt32(ddlBudgetType.SelectedValue);
                rq.IsBudgetShard = Convert.ToInt32(chkIsBudgetShared.Checked == true ? 1 : 0);
                rq.QueryForPartner = txtQueryForPatner.Text;
                rq.Urgency = rblUrgency.SelectedValue;
                rq.StatusComment = txtStatusComment.Text;
                rq.PostProjectRequestCunsultant(FullName,Email,ContactNumber,CompanyName);
                SendEmailSubmit();
                Response.Redirect("~/Consultant/Requests.aspx");

            }
             else if(ddlOutsourceType.SelectedValue=="3")
            {
                rq.TalentType=Convert.ToInt32(ddlTalentType.SelectedValue);
                if(ddlTalentType.SelectedValue=="0")
                {
                    rq.Basic = Convert.ToInt32(ddlBasicPartTime.SelectedValue);
                    rq.BasicHours = Convert.ToInt32(ddlBasicPartTimeHours.SelectedValue);
                    rq.Intermediate = Convert.ToInt32(ddlIntermediatePartTime.SelectedValue);
                    rq.IntermediateHours = Convert.ToInt32(ddlIntermediatePartTimeHours.SelectedValue);
                    rq.Expert = Convert.ToInt32(ddlExpertPartTime.SelectedValue);
                    rq.ExpertHours = Convert.ToInt32(ddlExpertPartTimeHours.SelectedValue);
                    rq.TalentCount = Convert.ToInt32(HiddenField2.Value);
                    rq.Duration = txtDurationPartTime.Text;
                    rq.State = ddlStatesPartTime.SelectedValue;
                    rq.OnsiteLocation = ddlCitiesPartTime.SelectedValue;
                    rq.SkillRequired = txtSkills.Text;
                    rq.Budget = Convert.ToInt32(txtBudget.Text);
                    rq.BudgetType = Convert.ToInt32(ddlBudgetType.SelectedValue);
                    rq.IsBudgetShard = Convert.ToInt32(chkIsBudgetShared.Checked == true ? 1 : 0);
                    rq.QueryForPartner = txtQueryForPatner.Text;
                    rq.Urgency = rblUrgency.SelectedValue;
                    rq.StatusComment = txtStatusComment.Text;
                    rq.PostProjectRequestCunsultant(FullName, Email, ContactNumber, CompanyName);
                    SendEmailSubmit();
                    Response.Redirect("~/Consultant/Requests.aspx");

                }
                else
                {
                    rq.Basic = Convert.ToInt32(ddlBasic.SelectedValue);
                    rq.Intermediate = Convert.ToInt32(ddlIntermediate.SelectedValue);
                    rq.Expert = Convert.ToInt32(ddlExpert.SelectedValue);
                    rq.TalentCount = Convert.ToInt32(HiddenField2.Value);
                    rq.Duration = txtDurationFullTime.Text;
                    rq.WorkMode = Convert.ToInt32(ddlWorkMode.SelectedValue);
                    rq.State = ddlStatesFullTime.SelectedValue;
                    rq.OnsiteLocation = ddlCitiesFullTime.SelectedValue;
                    rq.SkillRequired = txtSkills.Text;
                    rq.Budget = Convert.ToInt32(txtBudget.Text);
                    rq.BudgetType = Convert.ToInt32(ddlBudgetType.SelectedValue);
                    rq.IsBudgetShard = Convert.ToInt32(chkIsBudgetShared.Checked == true ? 1 : 0);
                    rq.QueryForPartner = txtQueryForPatner.Text;
                    rq.Urgency = rblUrgency.SelectedValue;
                    rq.StatusComment = txtStatusComment.Text;
                    rq.PostProjectRequestCunsultant(FullName, Email, ContactNumber, CompanyName);
                    SendEmailSubmit();
                    Response.Redirect("~/Consultant/Requests.aspx");
                }
            }
            else
            {

            }
        }
        public void SendEmailSubmit()
        {
            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Your project has been created";
                string body = "<p>We have created a project for you.</p><p>Login to Benchkart and check your dashboard for project.</p>";

                ClsMail.SendEmail(string.Empty, txtEmail.Text, subject, body);
            });

            email.IsBackground = true;
            email.Start();
            //End Email

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Consultant/Requests.aspx");
        }

        protected void ddlStatesFullTime_SelectedIndexChanged(object sender, EventArgs e)
        {
           GetCitiesFullTime();
        }

        protected void ddlStatesPartTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCitiesPartTime();
        }

        protected void ddlStates_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCities();
        }
    }
}
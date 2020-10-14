using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Text;
using System.Web.UI.WebControls.WebParts;

namespace Benchkart.Consultant
{
    public partial class Request_Details : System.Web.UI.Page
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
               //     lblConsultantEmail.Text = Request.QueryString["Email"].ToString();
               // }
                // int requestId = Convert.ToInt32(Request.QueryString["id"].ToString());
                //  //int requestId = 1;
                //  ClsConsultant cn = new ClsConsultant();
                //dtRequest = cn.GetRequestDetails(requestId);
                //  DisplayRequest(dtRequest);
               
                GetState();
                //GetStateFullTime();
                //GetStatePartTime();
                DisplayBindProfile();
                if(ddlstatus.SelectedValue== "6")
                {
                    btnSave.Visible = false;
                }
                else
                {
                    btnSave.Visible = true;
                }

            }
        }

        public void DisplayDownloads(int projectId)
        {
            if (Directory.Exists(Server.MapPath("~/Uploadfiles/ProjectAttachments/" + projectId + "/")))
            {
                DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/Uploadfiles/ProjectAttachments/" + projectId + "/"));
                int i = 0;
                foreach (FileInfo fi in di.GetFiles())
                {
                    HyperLink HL = new HyperLink();
                    HL.ID = "HyperLink" + i++;
                    HL.Text = fi.Name;
                    HL.NavigateUrl = "~/Download.ashx?file=" + fi.FullName;
                    HL.Attributes.Add("style", "color: blue; text-decoration: underline; line-height: 2;");
                    grdimage.DataSource = di.GetFiles();
                    grdimage.DataBind();
                    pnlDownloads.Controls.Add(HL);
                    pnlDownloads.Controls.Add(new LiteralControl("<br/>"));
                }
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
            // ddlCities.Items.Insert(0, new ListItem("Select City", ""));
			
			ddlStatesFullTime.DataSource = dsStates.Tables[0];
            ddlStatesFullTime.DataTextField = "State";
            ddlStatesFullTime.DataValueField = "StateId";
            ddlStatesFullTime.DataBind();

            ddlStatesFullTime.Items.Insert(0, new ListItem("Select State", ""));
            // ddlCities.Items.Insert(0, new ListItem("Select City", ""));
			
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
            //Fixed by Anurag for bland state - 2/25/2020
            if (ddlStates.SelectedValue != string.Empty)
            {
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

            if (ddlStatesFullTime.SelectedValue != string.Empty)
            {
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

            if (ddlStatesPartTime.SelectedValue != string.Empty)
            { 
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
            }
            ddlCitiesPartTime.Items.Insert(0, new ListItem("Select City", "0"));
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceId = Convert.ToInt32(ddlCategory.SelectedValue);
            SetSubCategory(serviceId);
            ///ddlSubCategory.Items.Insert(0, new ListItem("-Any SubCategory-", "0"));
           // ddlSubCategory.ClearSelection();
           // ddlSubCategory.Items.FindByValue("0").Selected = true;
        }
        public void DisplayBindProfile()
        {
            DataTable dtCustomerProfile;
            int requestId = Convert.ToInt32(Request.QueryString["id"].ToString());
            ClsConsultant cn = new ClsConsultant();
            cn.ConsultantId = requestId;
            dtCustomerProfile = cn.GetRequestDetails(requestId);
            DisplayRequest(dtCustomerProfile);

           // DisplayCustomerProfile(dtCustomerProfile);
        }

        public void DisplayRequest(DataTable dtRequest)
        {
            //Session["ConsultantId"] = "anurag";
           // if (Session["ConsultantId"] != null)
           // {
                string parentId = string.Empty;
                string serviceId = string.Empty;


                // txtCustomerId.Text = dtRequest.Rows[0]["CustomerId"].ToString();
                if (dtRequest.Rows[0]["FullName"] != DBNull.Value)
                {
                    lblFullName.Text = dtRequest.Rows[0]["FullName"].ToString();
                }
                if (dtRequest.Rows[0]["Email"] != DBNull.Value)
                {
                    lblEmail.Text = dtRequest.Rows[0]["Email"].ToString();
                }
                if (dtRequest.Rows[0]["ContactNumber"] != DBNull.Value)
                {
                    lblContactNumber.Text = dtRequest.Rows[0]["ContactNumber"].ToString();
                }
                if (dtRequest.Rows[0]["CompanyName"] != DBNull.Value)
                {
                    lblCompanyName.Text = dtRequest.Rows[0]["CompanyName"].ToString();
                }
                if (dtRequest.Rows[0]["CreationDate"] != DBNull.Value)
                {
                    lblDate.Text = dtRequest.Rows[0]["CreationDate"].ToString();
                }
                if (dtRequest.Rows[0]["RequestId"] != DBNull.Value)
                {
                    lblRequestId.Text = dtRequest.Rows[0]["RequestId"].ToString();
                }

                if (dtRequest.Rows[0]["ServiceId"] != DBNull.Value)
                {
                    if (dtRequest.Rows[0]["ParentId"] == DBNull.Value)
                    {
                        serviceId = dtRequest.Rows[0]["ServiceId"].ToString();
                        ddlCategory.ClearSelection();
                        ddlCategory.Items.FindByValue(serviceId).Selected = true;
                        SetSubCategory(Convert.ToInt32(serviceId));
                        ddlSubCategory.Items.Insert(0, new ListItem("-Select SubCategory-", "0"));
                        ddlSubCategory.ClearSelection();
                        ddlSubCategory.Items.FindByValue("0").Selected = true;
                    }
                    else
                    {
                        serviceId = dtRequest.Rows[0]["ServiceId"].ToString();
                        parentId = dtRequest.Rows[0]["ParentId"].ToString();
                        ddlCategory.ClearSelection();
                        ddlCategory.Items.FindByValue(parentId).Selected = true;
                        SetSubCategory(Convert.ToInt32(parentId));
                        ddlSubCategory.ClearSelection();
                        ddlSubCategory.Items.FindByValue(serviceId).Selected = true;
                    }
                }

               //// ddlStatus.ClearSelection();

                //ddlSubCategory.Items.FindByValue(dtRequest.Rows[0]["ServiceId"].ToString()).Selected = true;

                //txtCompanyIndustry.Text = dtRequest.Rows[0]["CompanyIndustry"].ToString();
                //txtCompanyProfile.Text = dtRequest.Rows[0]["CompanyProfile"].ToString();
                //txtCompanyAddress.Text = dtRequest.Rows[0]["CompanyAddress"].ToString();
                //txtCompanyGSTNumber.Text = dtRequest.Rows[0]["CompanyGSTNumber"].ToString();
                //txtEmployeeCount.Text = dtRequest.Rows[0]["EmployeeCount"].ToString();
                //txtWebsite.Text = dtRequest.Rows[0]["Website"].ToString();
                //txtLogoName.Text = dtRequest.Rows[0]["LogoName"].ToString();

                if (dtRequest.Rows[0]["Title"] != DBNull.Value)
                {
                    txtTitle.Text = dtRequest.Rows[0]["Title"].ToString();
                }
                if (dtRequest.Rows[0]["Description"] != DBNull.Value)
                {
                    txtDescription.Text = dtRequest.Rows[0]["Description"].ToString();
                }
                ddlOutsourceType.ClearSelection();
                if (dtRequest.Rows[0]["OutsourceType"] != DBNull.Value)
                {
                    ddlOutsourceType.Items.FindByValue(dtRequest.Rows[0]["OutsourceType"].ToString()).Selected = true;
                }
                //If request is of "Talent" type
                if (dtRequest.Rows[0]["OutsourceType"].ToString() == "3")
                {
                   // pnlTalent.Style["display"] = "block";
                   if(dtRequest.Rows[0]["TalentType"]!=DBNull.Value)
                    {
                        ddlTalentType.Items.FindByValue(dtRequest.Rows[0]["TalentType"].ToString()).Selected = true;

                        if(dtRequest.Rows[0]["TalentType"].ToString()=="1")
                        {
                            ddlBasic.SelectedValue = dtRequest.Rows[0]["Basic"].ToString();
                            ddlIntermediate.SelectedValue = dtRequest.Rows[0]["Intermediate"].ToString();
                            ddlExpert.SelectedValue = dtRequest.Rows[0]["Expert"].ToString();
                            HiddenField2.Value =dtRequest.Rows[0]["TalentCount"].ToString();
                            lblTotalCount.Text = dtRequest.Rows[0]["TalentCount"].ToString();
                            txtDurationFullTime.Text = dtRequest.Rows[0]["Duration"].ToString();
                            ddlWorkMode.SelectedValue=dtRequest.Rows[0]["WorkMode"].ToString().ToString();
                            if(ddlWorkMode.SelectedValue!="1")
                            {
                                ddlStatesFullTime.Attributes.Add("Style","display:block");
                                ddlCitiesFullTime.Attributes.Add("Style", "display:block");
                            ddlStatesFullTime.SelectedValue = dtRequest.Rows[0]["State"].ToString();
                            GetCitiesFullTime();
                            ddlCitiesFullTime.SelectedValue = dtRequest.Rows[0]["OnsiteLocation"].ToString();
                            }
                            else
                            {
                                ddlStatesFullTime.Attributes.Add("Style", "display:none");
                                ddlCitiesFullTime.Attributes.Add("Style", "display:none");
                            }

                        }
                        else if(dtRequest.Rows[0]["TalentType"].ToString() == "0")
                        {
                            ddlBasicPartTime.SelectedValue = dtRequest.Rows[0]["Basic"].ToString();
                            ddlBasicPartTimeHours.SelectedValue = dtRequest.Rows[0]["BasicHours"].ToString();
                            ddlIntermediatePartTime.SelectedValue = dtRequest.Rows[0]["Intermediate"].ToString();
                            ddlIntermediatePartTimeHours.SelectedValue = dtRequest.Rows[0]["IntermediateHours"].ToString();
                            ddlExpertPartTime.SelectedValue = dtRequest.Rows[0]["Expert"].ToString();
                            ddlExpertPartTimeHours.SelectedValue = dtRequest.Rows[0]["ExpertHours"].ToString();
                            HiddenField2.Value = dtRequest.Rows[0]["TalentCount"].ToString();
                            lblPartTimeCount.Text = dtRequest.Rows[0]["TalentCount"].ToString();
                           
                            txtDurationPartTime.Text = dtRequest.Rows[0]["Duration"].ToString();
                           
                                ddlStatesPartTime.Attributes.Add("Style", "display:block");
                                ddlCitiesPartTime.Attributes.Add("Style", "display:block");
                            ddlStatesPartTime.SelectedValue = dtRequest.Rows[0]["State"].ToString().Trim(); ;
                                GetCitiesPartTime();
                                ddlCitiesPartTime.SelectedValue = dtRequest.Rows[0]["OnsiteLocation"].ToString();
                            if (ddlStatesPartTime.SelectedValue != string.Empty)
                            {
                                rblLocation.SelectedValue = 2.ToString();
                            }
                            else
                            {
                                rblLocation.SelectedValue = 1.ToString();
                                ddlStatesPartTime.Attributes.Add("Style", "display:none");
                                ddlCitiesPartTime.Attributes.Add("Style", "display:none");
                            }
                        }

                    }
                  
                }
                else
                {
                    if(dtRequest.Rows[0]["Duration"]!=DBNull.Value)
                    {
                        txtDuration.Text = dtRequest.Rows[0]["Duration"].ToString();
                    }
                    if(dtRequest.Rows[0]["State"]!=DBNull.Value)
                    {
                        ddlStates.ClearSelection();
                        ddlStates.SelectedValue = dtRequest.Rows[0]["State"].ToString();
                    }
                    GetCities();
                    if (dtRequest.Rows[0]["OnsiteLocation"]!=DBNull.Value)
                    {
                        
                        ddlCities.SelectedValue = dtRequest.Rows[0]["OnsiteLocation"].ToString();
                    }
                }
                if(dtRequest.Rows[0]["Budget"]!=DBNull.Value)
                {
                   // txtbudget.Text = dtRequest.Rows[0]["Budget"].ToString();
                if (dtRequest.Rows[0]["Budget"].ToString() == "1")
                {
                   // txtbudget.Text = "<INR 25000";
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }

                else if (dtRequest.Rows[0]["Budget"].ToString() == "2")
                {
                   // txtbudget.Text = "INR 25000-1 Lac";
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }
                else if (dtRequest.Rows[0]["Budget"].ToString() == "3")
                {
                   // txtbudget.Text = "INR 1 Lac-10 Lacs";
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }
                else if (dtRequest.Rows[0]["Budget"].ToString() == "4")
                {
                   // txtbudget.Text = "INR 10-50 Lacs";
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }
                else if (dtRequest.Rows[0]["Budget"].ToString() == "5")
                {
                   // txtbudget.Text = "INR 50 Lacs +";
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }
                else if (dtRequest.Rows[0]["Budget"].ToString() == "6")
                {
                   // txtbudget.Text = "<USD 1000";
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }
                else if (dtRequest.Rows[0]["Budget"].ToString() == "7")
                {
                   // txtbudget.Text = "USD 1K-5K";
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }
                else if (dtRequest.Rows[0]["Budget"].ToString() == "8")
                {
                   // txtbudget.Text = "USD 5K-20K";
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }
                else if (dtRequest.Rows[0]["Budget"].ToString() == "9")
                {
                   // txtbudget.Text = "USD 20 K-100K";
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }
                else if (dtRequest.Rows[0]["Budget"].ToString() == "10")
                {
                  //  txtbudget.Text = "USD 100K+";
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }
                else
                {
                   // txtbudget.Text = dtRequest.Rows[0]["Budget"].ToString();
                    ddlbudget.SelectedValue = dtRequest.Rows[0]["Budget"].ToString();
                }
                }
                if(dtRequest.Rows[0]["BudgetType"]!=DBNull.Value)
                {
                    ddlBudgetType.SelectedValue = dtRequest.Rows[0]["BudgetType"].ToString();

                }
                if(dtRequest.Rows[0]["Urgency"]!=DBNull.Value)
                {
                    rblUrgency.SelectedValue = dtRequest.Rows[0]["Urgency"].ToString();
                    

                }
                if(dtRequest.Rows[0]["IsBudgetShard"]!=null)
                {
                    chkIsBudgetShared.Text = dtRequest.Rows[0]["IsBudgetShard"].ToString();

                }
                if(chkIsBudgetShared.Text=="1")
                {
                    chkIsBudgetShared.Checked = true;
                    chkIsBudgetShared.Text = "true";
                }
                else
                {
                    chkIsBudgetShared.Checked = false;
                    chkIsBudgetShared.Text = "false";
                }
                if (dtRequest.Rows[0]["QueryForPartner"] != DBNull.Value)
                {
                    txtQueryForPatner.Text = dtRequest.Rows[0]["QueryForPartner"].ToString();
                }

                if (dtRequest.Rows[0]["SkillRequired"] != DBNull.Value)
                {
                    txtSkills.Text = dtRequest.Rows[0]["SkillRequired"].ToString();
                }

                if(dtRequest.Rows[0]["Status"]!=DBNull.Value)
                {
                    ddlstatus.SelectedValue = dtRequest.Rows[0]["Status"].ToString();
                }
            if (dtRequest.Rows[0]["ProjectType"] != DBNull.Value)
            {
                chkblProjectType.ClearSelection();
                string[] arr = dtRequest.Rows[0]["ProjectType"].ToString().Split(',');
                for(int i = 0; i < chkblProjectType.Items.Count; i++)
                {
                    for(int j=0;j<arr.Length;j++)
                    {
                        if (chkblProjectType.Items[i].Value == arr[j])
                        {
                            chkblProjectType.Items[i].Selected = true;
                        }
                    }
                }
            }
                if (dtRequest.Rows[0]["StatusComment"] != DBNull.Value)
                {
                    //txtStatus.Text = dtRequest.Rows[0]["Status"].ToString();
                    txtStatusComment.Text = dtRequest.Rows[0]["StatusComment"].ToString();
                }

                if(dtRequest.Rows[0]["RequestId"] != DBNull.Value)
                {
                    int RequestId = 0;
                    RequestId = Convert.ToInt32(dtRequest.Rows[0]["RequestId"]);
                    DisplayDownloads(RequestId);
                }


            //}
        }

        private string PopulateBody()
        {
            string body = string.Empty;
            if (ddlOutsourceType.SelectedValue == "2")
            {
               
                using (StreamReader reader = new StreamReader(Server.MapPath("Project.html")))
                {
                    body = reader.ReadToEnd();
                }
                body = body.Replace("{RequestId}", lblRequestId.Text);
                body = body.Replace("{ServiceId}", ddlCategory.SelectedValue);
                body = body.Replace("{CreationDate}", lblDate.Text);
                body = body.Replace("{OutSourceType}", ddlOutsourceType.SelectedValue);
                body = body.Replace("{Title}", txtTitle.Text);
                body = body.Replace("{Description}", txtDescription.Text);
                body = body.Replace("{Duration}", txtDuration.Text);
                body = body.Replace("{OnsiteLocation}", ddlCities.SelectedValue);
                body = body.Replace("{SkillRequired}", txtSkills.Text);
                body = body.Replace("{Budget}", ddlbudget.SelectedValue);
                body = body.Replace("{BudgetType}", ddlBudgetType.SelectedValue);
                body = body.Replace("{IsBudgetShard}", chkIsBudgetShared.Checked==true?"1":"0");
                body = body.Replace("{QueryForPartner}", txtQueryForPatner.Text);
                body = body.Replace("{Status}", ddlstatus.SelectedValue);
                body = body.Replace("{Urgency}", rblUrgency.SelectedValue);
                body = body.Replace("{StatusComment}", txtStatusComment.Text);
                body = body.Replace("{projectId}", Session["projectid"].ToString());

            }
            else if (ddlOutsourceType.SelectedValue == "3") 
            {
                if(ddlTalentType.SelectedValue=="1")
                {
                    using (StreamReader reader = new StreamReader(Server.MapPath("FullTime.html")))
                    {
                        body = reader.ReadToEnd();
                    }
                    body = body.Replace("{RequestId}", lblRequestId.Text);
                    body = body.Replace("{ServiceId}", ddlCategory.SelectedValue);
                    body = body.Replace("{CreationDate}", lblDate.Text);
                    body = body.Replace("{OutSourceType}", ddlOutsourceType.SelectedValue);
                    body = body.Replace("{Title}", txtTitle.Text);
                    body = body.Replace("{Description}", txtDescription.Text);
                    body = body.Replace("{TalentType}", ddlTalentType.SelectedValue);
                    body = body.Replace("{Basic}", ddlBasic.SelectedValue);
                    body = body.Replace("{Intermediate}", ddlIntermediate.SelectedValue);
                    body = body.Replace("{Expert}", ddlExpert.SelectedValue);
                    body = body.Replace("{TalentCount}", HiddenField2.Value);
                    body = body.Replace("{Duration}", txtDurationFullTime.Text);
                    body = body.Replace("{WorkMode}", ddlWorkMode.SelectedValue);
                    body = body.Replace("{OnsiteLocation}", ddlCitiesFullTime.SelectedValue);
                    body = body.Replace("{SkillRequired}", txtSkills.Text);
                    body = body.Replace("{Budget}", ddlbudget.SelectedValue);
                    body = body.Replace("{BudgetType}", ddlBudgetType.SelectedValue);
                    body = body.Replace("{IsBudgetShard}", chkIsBudgetShared.Checked == true ? "1" : "0");
                    body = body.Replace("{QueryForPartner}", txtQueryForPatner.Text);
                    body = body.Replace("{Status}", ddlstatus.SelectedValue);
                    body = body.Replace("{Urgency}", rblUrgency.SelectedValue);
                    body = body.Replace("{StatusComment}", txtStatusComment.Text);
                    body = body.Replace("{projectId}", Session["projectid"].ToString());
                }
                else if(ddlTalentType.SelectedValue=="0")
                {
                    using (StreamReader reader = new StreamReader(Server.MapPath("PartTime.html")))
                    {
                        body = reader.ReadToEnd();
                    }
                    body = body.Replace("{RequestId}", lblRequestId.Text);
                    body = body.Replace("{ServiceId}", ddlCategory.SelectedValue);
                    body = body.Replace("{CreationDate}", lblDate.Text);
                    body = body.Replace("{OutSourceType}", ddlOutsourceType.SelectedValue);
                    body = body.Replace("{Title}", txtTitle.Text);
                    body = body.Replace("{Description}", txtDescription.Text);
                    body = body.Replace("{TalentType}", ddlTalentType.SelectedValue);
                    body = body.Replace("{Basic}", ddlBasicPartTime.SelectedValue);
                    body = body.Replace("{BasicHours}", ddlBasicPartTimeHours.SelectedValue);
                    body = body.Replace("{Intermediate}", ddlIntermediatePartTime.SelectedValue);
                    body = body.Replace("{IntermediateHours}", ddlIntermediatePartTimeHours.SelectedValue);
                    body = body.Replace("{Expert}", ddlExpertPartTime.SelectedValue);
                    body = body.Replace("{ExpertHours}", ddlExpertPartTimeHours.SelectedValue);
                    body = body.Replace("{TalentCount}", HiddenField2.Value);
                    body = body.Replace("{Duration}", txtDurationPartTime.Text);
                   // body = body.Replace("{WorkMode}", WorkMode);
                    body = body.Replace("{OnsiteLocation}", ddlCitiesPartTime.SelectedValue);
                    body = body.Replace("{SkillRequired}", txtSkills.Text);
                    body = body.Replace("{Budget}", ddlbudget.SelectedValue);
                    body = body.Replace("{BudgetType}", ddlBudgetType.SelectedValue);
                    body = body.Replace("{IsBudgetShard}", chkIsBudgetShared.Checked == true ? "1" : "0");
                    body = body.Replace("{QueryForPartner}", txtQueryForPatner.Text);
                    body = body.Replace("{Status}", ddlstatus.SelectedValue);
                    body = body.Replace("{Urgency}", rblUrgency.SelectedValue);
                    body = body.Replace("{StatusComment}", txtStatusComment.Text);
                    body = body.Replace("{projectId}", Session["projectid"].ToString());
                }
                else
                {

                }
            }
            else
            {


            }
            return body;
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
          server control at run time. */
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
       // int projectId;
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //string email = Session["Email"].ToString();
             DataTable dtNextRequest = new DataTable();
            if (rblPartnerManual.SelectedValue == "0")
            {
                ClsRequest rp = new ClsRequest();
                if (ddlstatus.SelectedValue == "6")
                {

                    rp.RequestId = Convert.ToInt32(lblRequestId.Text);
                    if (ddlSubCategory.SelectedValue == "0")
                    {
                        rp.ServiceId = Convert.ToInt32(ddlCategory.SelectedValue);
                    }
                    else
                    {
                        rp.ServiceId = Convert.ToInt32(ddlSubCategory.SelectedValue);
                    }
                    rp.Title = txtTitle.Text;
                    rp.Description = txtDescription.Text;
                    rp.OutsourceType = Convert.ToInt32(ddlOutsourceType.SelectedValue);



                    if (rp.OutsourceType == 3)
                    {
                        rp.TalentType = Convert.ToInt32(ddlTalentType.SelectedValue);

                        if (rp.TalentType == 1)
                        {
                            rp.Basic = Convert.ToInt32(ddlBasic.SelectedValue);
                            rp.Intermediate = Convert.ToInt32(ddlIntermediate.SelectedValue);
                            rp.Expert = Convert.ToInt32(ddlExpert.SelectedValue);
                            rp.TalentCount = Convert.ToInt32(HiddenField2.Value);
                            rp.Duration = txtDurationFullTime.Text;
                            rp.WorkMode = Convert.ToInt32(ddlWorkMode.SelectedValue);
                            rp.State = ddlStatesFullTime.SelectedValue;
                            rp.OnsiteLocation = ddlCitiesFullTime.SelectedValue;

                        }
                        else if (rp.TalentType == 0)
                        {
                            rp.Basic = Convert.ToInt32(ddlBasicPartTime.SelectedValue);
                            rp.Intermediate = Convert.ToInt32(ddlIntermediatePartTime.SelectedValue);
                            rp.Expert = Convert.ToInt32(ddlExpertPartTime.SelectedValue);

                            rp.BasicHours = Convert.ToInt32(ddlBasicPartTimeHours.SelectedValue);
                            rp.IntermediateHours = Convert.ToInt32(ddlIntermediatePartTimeHours.SelectedValue);
                            rp.ExpertHours = Convert.ToInt32(ddlExpertPartTimeHours.SelectedValue);
                            rp.TalentCount = Convert.ToInt32(HiddenField2.Value);
                            rp.Duration = txtDurationPartTime.Text;
                            rp.State = ddlStatesPartTime.SelectedValue;
                            rp.OnsiteLocation = ddlCitiesPartTime.SelectedValue;

                        }

                    }
                    else
                    {
                        rp.Duration = txtDuration.Text;


                        rp.State = ddlStates.SelectedValue;
                        rp.OnsiteLocation = ddlCities.SelectedValue;


                    }


                    if (ddlbudget.SelectedValue != string.Empty)
                    {
                        rp.Budget = int.Parse(ddlbudget.SelectedValue);
                    }
                    // rp.Budget =Convert.ToInt32( txtbudget.Text);

                    rp.BudgetType = Convert.ToInt32(ddlBudgetType.SelectedValue);
                    rp.SkillRequired = txtSkills.Text;
                    if (chkIsBudgetShared.Checked == true)
                    {
                        rp.IsBudgetShard = 1;
                    }
                    else
                    {
                        rp.IsBudgetShard = 0;
                    }
                    rp.QueryForPartner = txtQueryForPatner.Text;

                    string projectType = string.Empty;
                    for (int i = 0; i < chkblProjectType.Items.Count; i++)
                    {
                        if (chkblProjectType.Items[i].Selected == true)
                        {
                            projectType += chkblProjectType.Items[i].Value + ",";
                        }
                    }
                    projectType = projectType.TrimEnd(',');
                    rp.Status = Convert.ToInt32(ddlstatus.SelectedValue);
                    //if (Convert.ToInt32(ddlstatus.SelectedValue) == 6)
                    //{
                    //    rp.Status = 0;
                    //}
                    //else
                    //{
                    //    rp.Status = Convert.ToInt32(ddlstatus.SelectedValue);
                    //}
                    rp.Urgency = rblUrgency.SelectedValue;              //krishan add line
                    rp.StatusComment = txtStatusComment.Text;

                    Session["projectid"] = rp.SubmitProject(lblConsultantEmail.Text, projectType);
                    Session["serviceId"] = rp.ServiceId;

                  
                        Response.Redirect("Requests.aspx");
                   


                }
                else if (ddlstatus.SelectedValue == "7")    //Custome send email for approval
                {

                    rp.RequestId = Convert.ToInt32(lblRequestId.Text);
                    if (ddlSubCategory.SelectedValue == "0")
                    {
                        rp.ServiceId = Convert.ToInt32(ddlCategory.SelectedValue);
                    }
                    else
                    {
                        rp.ServiceId = Convert.ToInt32(ddlSubCategory.SelectedValue);
                    }
                    rp.Title = txtTitle.Text;
                    rp.Description = txtDescription.Text;
                    rp.OutsourceType = Convert.ToInt32(ddlOutsourceType.SelectedValue);



                    if (rp.OutsourceType == 3)
                    {
                        rp.TalentType = Convert.ToInt32(ddlTalentType.SelectedValue);

                        if (rp.TalentType == 1)
                        {
                            rp.Basic = Convert.ToInt32(ddlBasic.SelectedValue);
                            rp.Intermediate = Convert.ToInt32(ddlIntermediate.SelectedValue);
                            rp.Expert = Convert.ToInt32(ddlExpert.SelectedValue);
                            rp.TalentCount = Convert.ToInt32(HiddenField2.Value);
                            rp.Duration = txtDurationFullTime.Text;
                            rp.WorkMode = Convert.ToInt32(ddlWorkMode.SelectedValue);
                            rp.State = ddlStatesFullTime.SelectedValue;
                            rp.OnsiteLocation = ddlCitiesFullTime.SelectedValue;

                        }
                        else if (rp.TalentType == 0)
                        {
                            rp.Basic = Convert.ToInt32(ddlBasicPartTime.SelectedValue);
                            rp.Intermediate = Convert.ToInt32(ddlIntermediatePartTime.SelectedValue);
                            rp.Expert = Convert.ToInt32(ddlExpertPartTime.SelectedValue);

                            rp.BasicHours = Convert.ToInt32(ddlBasicPartTimeHours.SelectedValue);
                            rp.IntermediateHours = Convert.ToInt32(ddlIntermediatePartTimeHours.SelectedValue);
                            rp.ExpertHours = Convert.ToInt32(ddlExpertPartTimeHours.SelectedValue);
                            rp.TalentCount = Convert.ToInt32(HiddenField2.Value);
                            rp.Duration = txtDurationPartTime.Text;
                            rp.State = ddlStatesPartTime.SelectedValue;
                            rp.OnsiteLocation = ddlCitiesPartTime.SelectedValue;

                        }

                    }
                    else
                    {
                        rp.Duration = txtDuration.Text;


                        rp.State = ddlStates.SelectedValue;
                        rp.OnsiteLocation = ddlCities.SelectedValue;


                    }


                    if (ddlbudget.SelectedValue != string.Empty)
                    {
                        rp.Budget = int.Parse(ddlbudget.SelectedValue);
                    }
                    // rp.Budget =Convert.ToInt32( txtbudget.Text);

                    rp.BudgetType = Convert.ToInt32(ddlBudgetType.SelectedValue);
                    rp.SkillRequired = txtSkills.Text;
                    if (chkIsBudgetShared.Checked == true)
                    {
                        rp.IsBudgetShard = 1;
                    }
                    else
                    {
                        rp.IsBudgetShard = 0;
                    }
                    rp.QueryForPartner = txtQueryForPatner.Text;

                    string projectType = string.Empty;
                    for (int i = 0; i < chkblProjectType.Items.Count; i++)
                    {
                        if (chkblProjectType.Items[i].Selected == true)
                        {
                            projectType += chkblProjectType.Items[i].Value + ",";
                        }
                    }
                    projectType = projectType.TrimEnd(',');
                    rp.Status = Convert.ToInt32(ddlstatus.SelectedValue);
                    //if (Convert.ToInt32(ddlstatus.SelectedValue) == 6)
                    //{
                    //    rp.Status = 0;
                    //}
                    //else
                    //{
                    //    rp.Status = Convert.ToInt32(ddlstatus.SelectedValue);
                    //}
                    rp.Urgency = rblUrgency.SelectedValue;              //krishan add line
                    rp.StatusComment = txtStatusComment.Text;


                    Session["projectid"] = rp.SubmitProject(lblConsultantEmail.Text, projectType);
                    string body = this.PopulateBody();

                    ClsMail mail = new ClsMail();
                    mail.EmailTo = lblEmail.Text;
                    mail.Subject = "Project Title ";
                    mail.Body = body;
                    mail.SendHTMLMail();



                        Response.Redirect("Requests.aspx");
                   

                }

                else //No project created only request status updated
                {
                    rp.RequestId = Convert.ToInt32(lblRequestId.Text);
                    rp.Status = Convert.ToInt32(ddlstatus.SelectedValue);  //krishan update line
                    rp.StatusComment = txtStatusComment.Text;
                    dtNextRequest = rp.UpdateStatus(lblConsultantEmail.Text);
                    Response.Redirect("Requests.aspx");

                }
            }
            else
            {
                ClsRequest rp = new ClsRequest();
                if (ddlstatus.SelectedValue == "6")
                {

                    rp.RequestId = Convert.ToInt32(lblRequestId.Text);
                    if (ddlSubCategory.SelectedValue == "0")
                    {
                        rp.ServiceId = Convert.ToInt32(ddlCategory.SelectedValue);
                    }
                    else
                    {
                        rp.ServiceId = Convert.ToInt32(ddlSubCategory.SelectedValue);
                    }
                    rp.Title = txtTitle.Text;
                    rp.Description = txtDescription.Text;
                    rp.OutsourceType = Convert.ToInt32(ddlOutsourceType.SelectedValue);



                    if (rp.OutsourceType == 3)
                    {
                        rp.TalentType = Convert.ToInt32(ddlTalentType.SelectedValue);

                        if (rp.TalentType == 1)
                        {
                            rp.Basic = Convert.ToInt32(ddlBasic.SelectedValue);
                            rp.Intermediate = Convert.ToInt32(ddlIntermediate.SelectedValue);
                            rp.Expert = Convert.ToInt32(ddlExpert.SelectedValue);
                            rp.TalentCount = Convert.ToInt32(HiddenField2.Value);
                            rp.Duration = txtDurationFullTime.Text;
                            rp.WorkMode = Convert.ToInt32(ddlWorkMode.SelectedValue);
                            rp.State = ddlStatesFullTime.SelectedValue;
                            rp.OnsiteLocation = ddlCitiesFullTime.SelectedValue;

                        }
                        else if (rp.TalentType == 0)
                        {
                            rp.Basic = Convert.ToInt32(ddlBasicPartTime.SelectedValue);
                            rp.Intermediate = Convert.ToInt32(ddlIntermediatePartTime.SelectedValue);
                            rp.Expert = Convert.ToInt32(ddlExpertPartTime.SelectedValue);

                            rp.BasicHours = Convert.ToInt32(ddlBasicPartTimeHours.SelectedValue);
                            rp.IntermediateHours = Convert.ToInt32(ddlIntermediatePartTimeHours.SelectedValue);
                            rp.ExpertHours = Convert.ToInt32(ddlExpertPartTimeHours.SelectedValue);
                            rp.TalentCount = Convert.ToInt32(HiddenField2.Value);
                            rp.Duration = txtDurationPartTime.Text;
                            rp.State = ddlStatesPartTime.SelectedValue;
                            rp.OnsiteLocation = ddlCitiesPartTime.SelectedValue;

                        }

                    }
                    else
                    {
                        rp.Duration = txtDuration.Text;


                        rp.State = ddlStates.SelectedValue;
                        rp.OnsiteLocation = ddlCities.SelectedValue;


                    }


                    if (ddlbudget.SelectedValue != string.Empty)
                    {
                        rp.Budget = int.Parse(ddlbudget.SelectedValue);
                    }
                    // rp.Budget =Convert.ToInt32( txtbudget.Text);

                    rp.BudgetType = Convert.ToInt32(ddlBudgetType.SelectedValue);
                    rp.SkillRequired = txtSkills.Text;
                    if (chkIsBudgetShared.Checked == true)
                    {
                        rp.IsBudgetShard = 1;
                    }
                    else
                    {
                        rp.IsBudgetShard = 0;
                    }
                    rp.QueryForPartner = txtQueryForPatner.Text;

                    string projectType = string.Empty;
                    for (int i = 0; i < chkblProjectType.Items.Count; i++)
                    {
                        if (chkblProjectType.Items[i].Selected == true)
                        {
                            projectType += chkblProjectType.Items[i].Value + ",";
                        }
                    }
                    projectType = projectType.TrimEnd(',');
                    rp.Status = Convert.ToInt32(ddlstatus.SelectedValue);
                    //if (Convert.ToInt32(ddlstatus.SelectedValue) == 6)
                    //{
                    //    rp.Status = 0;
                    //}
                    //else
                    //{
                    //    rp.Status = Convert.ToInt32(ddlstatus.SelectedValue);
                    //}
                    rp.Urgency = rblUrgency.SelectedValue;              //krishan add line
                    rp.StatusComment = txtStatusComment.Text;
                    //Email
                    string customerName = string.Empty;
                    string customerEmail = string.Empty;
                    string partnerEmails = string.Empty;
                    string subCategory = string.Empty;

                    //End Email
                    Session["projectid"] = rp.SubmitProjectManual(lblConsultantEmail.Text, projectType,ref customerName,ref customerEmail,ref partnerEmails,ref subCategory);
                    Session["serviceId"] = rp.ServiceId;
                    Session["title"] = rp.Title;
                    Session["description"] = rp.Description;
                    Session["statusComment"] = rp.StatusComment;
                    Session["customerName"] = customerName;
                    Session["customerEmail"] = customerEmail;
                    Session["partnerEmail"] = partnerEmails;
                    Session["subcategory"] = subCategory;
                   

                        Response.Redirect("../Consultant/ManualProject.aspx");
                    


                }
                else if (ddlstatus.SelectedValue == "7")    //Custome send email for approval
                {

                    rp.RequestId = Convert.ToInt32(lblRequestId.Text);
                    if (ddlSubCategory.SelectedValue == "0")
                    {
                        rp.ServiceId = Convert.ToInt32(ddlCategory.SelectedValue);
                    }
                    else
                    {
                        rp.ServiceId = Convert.ToInt32(ddlSubCategory.SelectedValue);
                    }
                    Session["serviceId"] = rp.ServiceId;
                    rp.Title = txtTitle.Text;
                    rp.Description = txtDescription.Text;
                    rp.OutsourceType = Convert.ToInt32(ddlOutsourceType.SelectedValue);



                    if (rp.OutsourceType == 3)
                    {
                        rp.TalentType = Convert.ToInt32(ddlTalentType.SelectedValue);

                        if (rp.TalentType == 1)
                        {
                            rp.Basic = Convert.ToInt32(ddlBasic.SelectedValue);
                            rp.Intermediate = Convert.ToInt32(ddlIntermediate.SelectedValue);
                            rp.Expert = Convert.ToInt32(ddlExpert.SelectedValue);
                            rp.TalentCount = Convert.ToInt32(HiddenField2.Value);
                            rp.Duration = txtDurationFullTime.Text;
                            rp.WorkMode = Convert.ToInt32(ddlWorkMode.SelectedValue);
                            rp.State = ddlStatesFullTime.SelectedItem.Text;
                            rp.OnsiteLocation = ddlCitiesFullTime.SelectedItem.Text;

                        }
                        else if (rp.TalentType == 0)
                        {
                            rp.Basic = Convert.ToInt32(ddlBasicPartTime.SelectedValue);
                            rp.Intermediate = Convert.ToInt32(ddlIntermediatePartTime.SelectedValue);
                            rp.Expert = Convert.ToInt32(ddlExpertPartTime.SelectedValue);

                            rp.BasicHours = Convert.ToInt32(ddlBasicPartTimeHours.SelectedValue);
                            rp.IntermediateHours = Convert.ToInt32(ddlIntermediatePartTimeHours.SelectedValue);
                            rp.ExpertHours = Convert.ToInt32(ddlExpertPartTimeHours.SelectedValue);
                            rp.TalentCount = Convert.ToInt32(HiddenField2.Value);
                            rp.Duration = txtDurationPartTime.Text;
                            rp.State = ddlStatesPartTime.SelectedItem.Text;
                            rp.OnsiteLocation = ddlCitiesPartTime.SelectedItem.Text;

                        }

                    }
                    else
                    {
                        rp.Duration = txtDuration.Text;


                        rp.State = ddlCities.SelectedItem.Text;
                        rp.OnsiteLocation = ddlStates.SelectedItem.Text;


                    }


                    if (ddlbudget.SelectedValue != string.Empty)
                    {
                        rp.Budget = int.Parse(ddlbudget.SelectedValue);
                    }
                    // rp.Budget =Convert.ToInt32( txtbudget.Text);

                    rp.BudgetType = Convert.ToInt32(ddlBudgetType.SelectedValue);
                    rp.SkillRequired = txtSkills.Text;
                    if (chkIsBudgetShared.Checked == true)
                    {
                        rp.IsBudgetShard = 1;
                    }
                    else
                    {
                        rp.IsBudgetShard = 0;
                    }
                    rp.QueryForPartner = txtQueryForPatner.Text;


                    string projectType = string.Empty;
                    foreach (ListItem lst in chkblProjectType.Items)
                    {
                        if (lst.Selected == true)
                        {
                            projectType += lst.Value + ",";
                        }
                    }
                    projectType = projectType.TrimEnd(',');
                    rp.Status = Convert.ToInt32(ddlstatus.SelectedValue);
                    //if (Convert.ToInt32(ddlstatus.SelectedValue) == 6)
                    //{
                    //    rp.Status = 0;
                    //}
                    //else
                    //{
                    //    rp.Status = Convert.ToInt32(ddlstatus.SelectedValue);
                    //}
                    rp.Urgency = rblUrgency.SelectedValue;         //krishan add line
                    rp.StatusComment = txtStatusComment.Text;

                    Session["projectid"] = rp.SubmitProject(lblConsultantEmail.Text, projectType);
                    string body = this.PopulateBody();

                    ClsMail mail = new ClsMail();
                    mail.EmailTo = lblEmail.Text;
                    mail.Subject = "Project Title ";
                    mail.Body = body;
                    mail.SendHTMLMail();



                    //Session["projectId"]=Convert.ToInt32(ViewState["projectId"]);
                    Response.Redirect("Requests.aspx");


                }

                else //No project created only request status updated
                {
                    rp.RequestId = Convert.ToInt32(lblRequestId.Text);
                    rp.Status = Convert.ToInt32(ddlstatus.SelectedValue);  //krishan update line
                    rp.StatusComment = txtStatusComment.Text;
                    dtNextRequest = rp.UpdateStatus(lblConsultantEmail.Text);
                    Response.Redirect("Requests.aspx");

                }
            }
            //Approval
          
            
           
        }

        protected void ddlStates_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCities();
        }

        protected void ddlStatesFullTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCitiesFullTime();

        }

        protected void ddlStatesPartTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCitiesPartTime();
        }

        protected void lkbdelete_Click(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}
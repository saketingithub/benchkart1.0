using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Admin
{
    public partial class Request_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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


               
                DataTable dtRequest = new DataTable();
               
                // int requestId = Convert.ToInt32(Request.QueryString["id"].ToString());
                //  //int requestId = 1;
                //  ClsConsultant cn = new ClsConsultant();
                //dtRequest = cn.GetRequestDetails(requestId);
                //  DisplayRequest(dtRequest);
                DisplayBindProfile();
            }
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
            string parentId = string.Empty;
            string serviceId = string.Empty;
            ddlCategory.BorderWidth = 0;
            ddlCategory.Enabled = false;
            if (dtRequest.Rows[0]["ServiceId"] != DBNull.Value)
                {
                ddlCategory.BorderWidth = 0;
                ddlCategory.Enabled = false;
                    if (dtRequest.Rows[0]["ParentId"] == DBNull.Value)
                    {
                        serviceId = dtRequest.Rows[0]["ServiceId"].ToString();
                        ddlCategory.ClearSelection();
                        ddlCategory.Items.FindByValue(serviceId).Selected = true;
                        SetSubCategory(Convert.ToInt32(serviceId));
                        ddlSubCategory.Items.Insert(0, new ListItem("-Select SubCategory-", "0"));
                        ddlSubCategory.ClearSelection();
                        ddlSubCategory.Items.FindByValue("0").Selected = true;
                    ddlSubCategory.BorderWidth = 0;
                    ddlSubCategory.Enabled = false;
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
                    ddlSubCategory.BorderWidth = 0;
                    ddlSubCategory.Enabled = false;
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
                txtTitle.BorderWidth = 0;
                txtTitle.ReadOnly = true;
                }
                else
            {
                txtTitle.BorderWidth = 0;
                txtTitle.ReadOnly = true;
            }
                if (dtRequest.Rows[0]["Description"] != DBNull.Value)
                {
                    txtDescription.Text = dtRequest.Rows[0]["Description"].ToString();
                txtDescription.BorderWidth = 0;
                txtDescription.ReadOnly = true;
            }
            else
            {
                txtDescription.BorderWidth = 0;
                txtDescription.ReadOnly = true;
            }
                ddlOutsourceType.ClearSelection();
                if (dtRequest.Rows[0]["OutsourceType"] != DBNull.Value)
                {
                    ddlOutsourceType.Items.FindByValue(dtRequest.Rows[0]["OutsourceType"].ToString()).Selected = true;
                ddlOutsourceType.BorderWidth = 0;
                ddlOutsourceType.Enabled = false;
                }
            else
            {
                ddlOutsourceType.BorderWidth = 0;
                ddlOutsourceType.Enabled = false;
            }
                //If request is of "Talent" type
                if (dtRequest.Rows[0]["OutsourceType"].ToString() == "3")
                {
                    // pnlTalent.Style["display"] = "block";
                    if (dtRequest.Rows[0]["TalentType"] != DBNull.Value)
                    {
                        ddlTalentType.Items.FindByValue(dtRequest.Rows[0]["TalentType"].ToString()).Selected = true;
                    ddlTalentType.BorderWidth = 0;
                    ddlTalentType.Enabled = false;
                        if (dtRequest.Rows[0]["TalentType"].ToString() == "1")
                        {
                            ddlBasic.SelectedItem.Text = dtRequest.Rows[0]["Basic"].ToString();
                        ddlBasic.BorderWidth = 0;
                        ddlBasic.Enabled = false;
                            ddlIntermediate.SelectedItem.Text = dtRequest.Rows[0]["Intermediate"].ToString();
                        ddlIntermediate.BorderWidth = 0;
                        ddlIntermediate.Enabled = false;
                            ddlExpert.SelectedItem.Text = dtRequest.Rows[0]["Expert"].ToString();
                        ddlExpert.BorderWidth = 0;
                        ddlExpert.Enabled = false;
                            lblTotalCount.Text = dtRequest.Rows[0]["TalentCount"].ToString();
                        

                            txtDurationFullTime.Text = dtRequest.Rows[0]["Duration"].ToString();
                        txtDurationFullTime.BorderWidth = 0;
                        txtDurationFullTime.ReadOnly = true;
                            ddlWorkMode.SelectedItem.Text = dtRequest.Rows[0]["WorkMode"].ToString().ToString();
                        ddlWorkMode.BorderWidth = 0;
                        ddlWorkMode.Enabled = false;
                            txtLocationFullTime.Text = dtRequest.Rows[0]["OnsiteLocation"].ToString();
                        txtLocationFullTime.BorderWidth = 0;
                        txtLocationFullTime.ReadOnly = true;

                        }
                        else if (dtRequest.Rows[0]["TalentType"].ToString() == "0")
                        {
                            ddlBasicPartTime.SelectedItem.Text = dtRequest.Rows[0]["Basic"].ToString();
                        ddlBasicPartTime.BorderWidth = 0;
                        ddlBasicPartTime.Enabled = false;
                            ddlBasicPartTimeHours.SelectedItem.Text = dtRequest.Rows[0]["BasicHours"].ToString();
                        ddlBasicPartTimeHours.BorderWidth = 0;
                        ddlBasicPartTimeHours.Enabled = false;
                            ddlIntermediatePartTime.SelectedItem.Text = dtRequest.Rows[0]["Intermediate"].ToString();
                        ddlIntermediatePartTime.BorderWidth = 0;
                        ddlIntermediatePartTime.Enabled = false;
                      
                            ddlIntermediatePartTimeHours.SelectedItem.Text = dtRequest.Rows[0]["IntermediateHours"].ToString();
                        ddlIntermediatePartTimeHours.BorderWidth = 0;
                        ddlIntermediatePartTimeHours.Enabled = false;
                        ddlExpertPartTime.SelectedItem.Text = dtRequest.Rows[0]["Expert"].ToString();
                        ddlExpertPartTime.BorderWidth = 0;
                        ddlExpertPartTime.Enabled = false;
                            ddlExpertPartTimeHours.SelectedItem.Text = dtRequest.Rows[0]["ExpertHours"].ToString();
                        ddlExpertPartTimeHours.BorderWidth = 0;
                        ddlExpertPartTimeHours.Enabled = false;
                            lblPartTimeCount.Text = dtRequest.Rows[0]["TalentCount"].ToString();
                            txtDurationPartTime.Text = dtRequest.Rows[0]["Duration"].ToString();
                        txtDurationPartTime.BorderWidth = 0;
                        txtDurationPartTime.ReadOnly = true;
                        rblLocation.Enabled = false;
                            if (rblLocation.SelectedValue == "2")
                            {
                                txtOnsiteLoaction.Text = dtRequest.Rows[0]["OnsiteLocation"].ToString();
                            txtOnsiteLoaction.BorderWidth = 0;
                            txtOnsiteLoaction.ReadOnly = true;
                            }
                        }

                    }
                else
                {
                    ddlTalentType.BorderWidth = 0;
                    ddlTalentType.Enabled = false;
                }

                }
                else
                {
                    if (dtRequest.Rows[0]["Duration"] != DBNull.Value)
                    {
                        txtDuration.Text = dtRequest.Rows[0]["Duration"].ToString();
                    txtDuration.BorderWidth = 0;
                    txtDuration.ReadOnly = true;
                    }
                else
                {
                    txtDuration.BorderWidth = 0;
                    txtDuration.ReadOnly = true;
                }
                    if (dtRequest.Rows[0]["OnsiteLocation"] != DBNull.Value)
                    {
                        txtLocation.Text = dtRequest.Rows[0]["OnsiteLocation"].ToString();
                    txtLocation.BorderWidth = 0;
                    txtLocation.ReadOnly = true;
                    }
                else
                {
                    txtLocation.BorderWidth = 0;
                    txtLocation.ReadOnly = true;
                }
                }
            //    if(dtRequest.Rows[0]["Budget"]!=DBNull.Value)
            //{
            //    txtbudget.Text= dtRequest.Rows[0]["Budget"].ToString();
            //    txtbudget.BorderWidth = 0;
            //    txtbudget.ReadOnly = true;
            //}
            //else
            //{
            //    txtbudget.BorderWidth = 0;
            //    txtbudget.ReadOnly = true;
            //}
            txtbudget.BorderWidth = 0;
              txtbudget.ReadOnly = true;
            //if (dtRequest.Rows[0]["BudgetType"]!=DBNull.Value)
            //{
            //    ddlBudgetType.SelectedValue = dtRequest.Rows[0]["BudgetType"].ToString();
            //    ddlBudgetType.BorderWidth = 0;
            //    ddlBudgetType.Enabled = false;
            //}
            //    else
            //{
            //    ddlBudgetType.BorderWidth = 0;
            //    ddlBudgetType.Enabled = false;
            //}
            ddlBudgetType.BorderWidth = 0;
               ddlBudgetType.Enabled = false;
            if (dtRequest.Rows[0]["IsBudgetShard"] != null)
                {
                    chkIsBudgetShared.Text = dtRequest.Rows[0]["IsBudgetShard"].ToString();
                chkIsBudgetShared.Enabled = false;

                }
                if (chkIsBudgetShared.Text == "1")
                {
                    chkIsBudgetShared.Checked = true;
                    chkIsBudgetShared.Text = "true";
                chkIsBudgetShared.Enabled = false;
                }
                else
                {
                    chkIsBudgetShared.Checked = false;
                    chkIsBudgetShared.Text = "false";
                chkIsBudgetShared.Enabled = false;
            }
                if (dtRequest.Rows[0]["QueryForPartner"] != DBNull.Value)
                {
                    txtQueryForPatner.Text = dtRequest.Rows[0]["QueryForPartner"].ToString();
                txtQueryForPatner.BorderWidth = 0;
                txtQueryForPatner.ReadOnly = true;
                }
            else
            {
                txtQueryForPatner.BorderWidth = 0;
                txtQueryForPatner.ReadOnly = true;
            }

                if (dtRequest.Rows[0]["SkillRequired"] != DBNull.Value)
                {
                    txtSkillRequired.Text = dtRequest.Rows[0]["SkillRequired"].ToString();
                txtSkillRequired.BorderWidth = 0;
                txtSkillRequired.ReadOnly = true;
                }
                else
            {
                txtSkillRequired.BorderWidth = 0;
                txtSkillRequired.ReadOnly = true;
            }
            //    if(dtRequest.Rows[0]["Urgency"]!=DBNull.Value)
            //{
            //    rblUrgency.SelectedValue = dtRequest.Rows[0]["Urgency"].ToString();
            //    rblUrgency.Enabled = false;

            //}
            //else
            //{
            //    rblUrgency.Enabled = false;

            //}
            rblUrgency.Enabled = false;
            if (dtRequest.Rows[0]["Status"] != DBNull.Value)
                {
                    ddlstatus.SelectedItem.Text = dtRequest.Rows[0]["Status"].ToString();
                ddlstatus.BorderWidth = 0;
                ddlstatus.Enabled = false;
                }
            else
            {
                ddlstatus.BorderWidth = 0;
                ddlstatus.Enabled = false;
            }
                if (dtRequest.Rows[0]["StatusComment"] != DBNull.Value)
                {
                    //txtStatus.Text = dtRequest.Rows[0]["Status"].ToString();
                    txtStatusComment.Text = dtRequest.Rows[0]["StatusComment"].ToString();
                txtStatusComment.BorderWidth = 0;
                txtStatusComment.ReadOnly = true;
                }
            else
            {
                txtStatusComment.BorderWidth = 0;
                txtStatusComment.ReadOnly = true;
            }


            
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceId = Convert.ToInt32(ddlCategory.SelectedValue);
            SetSubCategory(serviceId);
            ddlSubCategory.Items.Insert(0, new ListItem("-Any SubCategory-", "0"));
            ddlSubCategory.ClearSelection();
            ddlSubCategory.Items.FindByValue("0").Selected = true;
            ddlSubCategory.BorderWidth = 0;
            ddlSubCategory.Enabled = false;
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
            Response.Redirect("~/Admin/Requests.aspx");
        }
    }
}
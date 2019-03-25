using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobManagementSystem._DAL___JMSTableAdapters;

namespace JobManagementSystem.Restricted
{
    public partial class JobView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                PageDataRefresh();
            }
        }

        private void PageDataRefresh()
        {
            string sJobID = (Request.QueryString["id"]);
            int iJobID = Convert.ToInt32(sJobID);
            if (sJobID == null || sJobID == "0")
            {
                sJobID = "0";
                fvJobView.ChangeMode(FormViewMode.Insert);
            }

            JobListTableAdapter jobListAdapter = new JobListTableAdapter();
            fvJobView.DataSource = jobListAdapter.GetByID(iJobID);
            fvJobView.DataBind();

            EventTableAdapter EventAdapter = new EventTableAdapter();
            LvEventList.DataSource = EventAdapter.GetByJobID(iJobID);
            LvEventList.DataBind();

            if(fvJobView.CurrentMode == FormViewMode.Insert)
            {
                ddlJobTypeIDRefresh();
                ddlClientIDRefresh();
                ddlAdminIDRefresh();
            }
            else if (fvJobView.CurrentMode == FormViewMode.ReadOnly || fvJobView.CurrentMode == FormViewMode.Edit)
            {
                string JobTypeID = DataBinder.Eval(fvJobView.DataItem, "JobTypeID").ToString();
                string ClientID = DataBinder.Eval(fvJobView.DataItem, "ClientID").ToString();
                string AdminID = DataBinder.Eval(fvJobView.DataItem, "AdminID").ToString();
                ddlJobTypeIDRefresh(JobTypeID);
                ddlClientIDRefresh(ClientID);
                ddlAdminIDRefresh(AdminID);
            }
        }

        protected void fvJobView_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "New":
                    Response.Redirect("~/Restricted/JobView.aspx?id=0");
                    break;
                case "Cancel":
                    fvJobView.ChangeMode(FormViewMode.ReadOnly);
                    PageDataRefresh();
                    break;
                case "ListView":
                    Response.Redirect("~/Restricted/JobList.aspx");
                    break;
            }
        }

        protected void fvJobView_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            fvJobView.ChangeMode((FormViewMode)e.NewMode);
            PageDataRefresh();
        }

        protected void fvJobView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            fvJobView_CallInsertOrUpdate("Insert");
        }

        protected void fvJobView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            fvJobView_CallInsertOrUpdate("Update");
        }

        private void fvJobView_CallInsertOrUpdate(string CallCommand)
        {
            DropDownList JobTypeID_ddl = (DropDownList)fvJobView.FindControl("ddlJobTypeID");
            DropDownList ClientID_ddl = (DropDownList)fvJobView.FindControl("ddlClientID");
            DropDownList AdminID_ddl = (DropDownList)fvJobView.FindControl("ddlAdminID");
            TextBox PlannedStartDate_txt = (TextBox)fvJobView.FindControl("txtPlannedStartDate");
            TextBox PlannedEndDate_txt = (TextBox)fvJobView.FindControl("txtPlannedEndDate");
            TextBox ClientType_txt = (TextBox)fvJobView.FindControl("txtClientType");
            TextBox ClientAddress_txt = (TextBox)fvJobView.FindControl("txtClientAddress");
            TextBox ClientContactDetails_txt = (TextBox)fvJobView.FindControl("txtClientContactDetails");
            TextBox AdminContactDetails_txt = (TextBox)fvJobView.FindControl("txtAdminContactDetails");

            int jobTypeID = Convert.ToInt32(JobTypeID_ddl.SelectedValue);
            int clientID = Convert.ToInt32(ClientID_ddl.SelectedValue);
            string AdminID = AdminID_ddl.Text;
            string PlannedStartDate = PlannedStartDate_txt.Text;
            string PlannedEndDate = PlannedEndDate_txt.Text;
            string ClientType = ClientType_txt.Text;
            string ClientAddress = ClientAddress_txt.Text;
            string ClientContactDetails = ClientContactDetails_txt.Text;
            string AdminContactDetails = AdminContactDetails_txt.Text;

            JobTableAdapter JobAdapter = new JobTableAdapter();

            try
            {
                if (CallCommand == "Update")
                {
                    int OriginalID = Convert.ToInt32(Request.QueryString["id"]);
                    JobAdapter.UpdateJob(jobTypeID, clientID, AdminID, PlannedStartDate, PlannedEndDate, OriginalID);
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Record Edited')</script>");
                    fvJobView.ChangeMode(FormViewMode.ReadOnly);
                    PageDataRefresh();
                }
                else if (CallCommand == "Insert")
                {
                    int newID = JobAdapter.InsertAndReturnID(jobTypeID, clientID, AdminID, PlannedStartDate, PlannedEndDate);
                    Response.Write("<script Language='JavaScript' >alert('Record Added')</script>");
                    Response.Redirect("~/Restricted/JobView.aspx?id=" + newID);
                }
            }
            catch (System.Exception ex)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR occurred connecting to the database. " + ex.Message + "')</script>");
            }
        }

        protected void fvJobView_DataBound(object sender, EventArgs e)
        {
            if (fvJobView.DataItemCount == 0)
            {
                fvJobView.ChangeMode(FormViewMode.Insert);
            }
            else
            {
                fvJobView.ChangeMode(FormViewMode.Edit);
            }
        }

        protected void LvEventList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Response.Redirect("~/Restricted/EventView.aspx?id=" + e.CommandArgument.ToString());
        }

        protected void btnNewEvent_Click(object sender, EventArgs e)
        {
            TextBox JobID_txt = (TextBox)fvJobView.FindControl("txtJobID");
            Response.Redirect("~/Restricted/EventView.aspx?jobid=" + JobID_txt.Text);
        }

        protected void ddlJobTypeID_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlJobTypeIDRefresh (string JobTypeIDValue = null, int JobTypeIDIndex = 0)
        {
            JobTypeTableAdapter JobListAdapter = new JobTypeTableAdapter();
            DropDownList ddlJobTypeID = (DropDownList)fvJobView.FindControl("ddlJobTypeID");
            ddlJobTypeID.DataSource = JobListAdapter.Get();
            ddlJobTypeID.DataValueField = "JobTypeID";
            ddlJobTypeID.DataTextField = "TypeDescription";

            if (JobTypeIDValue == "" || JobTypeIDValue == null)
            {
                ddlJobTypeID.SelectedIndex = JobTypeIDIndex;
            }
            else
            {
                ddlJobTypeID.SelectedValue = JobTypeIDValue;
            }

            ddlJobTypeID.DataBind();
        }

        protected void ddlClientID_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList) sender;
            ddlClientIDRefresh(ddl.SelectedValue);   
        }

        protected void ddlClientIDRefresh(string ClientIDValue = null, int ClientIDIndex = 0)
        {
            ClientTextTableAdapter ClientTextAdapter = new ClientTextTableAdapter();
            DropDownList ddlClientID = (DropDownList)fvJobView.FindControl("ddlClientID");
            ddlClientID.DataSource = ClientTextAdapter.Get();
            ddlClientID.DataValueField = "ClientID";
            ddlClientID.DataTextField = "ClientName";

            if (ClientIDValue == "" || ClientIDValue == null)
            {
                ddlClientID.SelectedIndex = ClientIDIndex;
            }
            else
            {
                ddlClientID.SelectedValue = ClientIDValue;
            }

            ddlClientID.DataBind();
        }

        protected void ddlAdminID_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            ddlAdminIDRefresh();
        }

        protected void ddlAdminIDRefresh(string AdminIDValue = null, int AdminIDIndex = 0)
        {
            AdminTableAdapter AdminAdapter = new AdminTableAdapter();
            DropDownList ddlAdminID = (DropDownList)fvJobView.FindControl("ddlAdminID");
            ddlAdminID.DataSource = AdminAdapter.Get();
            ddlAdminID.DataValueField = "AdminID";
            ddlAdminID.DataTextField = "AdminName";

            if (AdminIDValue == "" || AdminIDValue == null)
            {
                ddlAdminID.SelectedIndex = AdminIDIndex;
            }
            else
            {
                ddlAdminID.SelectedValue = AdminIDValue;
            }

            ddlAdminID.DataBind();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobManagementSystem._DAL___JMSTableAdapters;

namespace JobManagementSystem.Restricted
{
    public partial class EventView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                PageDataRefresh();
            }
        }

        protected void PageDataRefresh()
        {
            string jID = Request.QueryString["jobid"];
            if (jID == null || jID =="")
            {
                string eID = Request.QueryString["id"];
                bool idValid = Int32.TryParse(eID, out int id);
                if (id == 0)
                {
                    FvEventView.ChangeMode(FormViewMode.Insert);
                }
                EventTableAdapter eventAdapter = new EventTableAdapter();
                FvEventView.DataSource = eventAdapter.GetByID(id);
                FvEventView.DataBind();

                EventTimeCodeTableAdapter EventTimeCodeAdapter = new EventTimeCodeTableAdapter();
                lvPayList.DataSource = EventTimeCodeAdapter.GetByEventID(id);
                lvPayList.DataBind();
            }
            else
            {
                FvEventView.ChangeMode(FormViewMode.Insert);
                TextBox jobID_txt = (TextBox)FvEventView.FindControl("txtJobID");
                jobID_txt.Text = jID;
            }

            if (FvEventView.CurrentMode == FormViewMode.Insert)
            {
                ddlEngineerIDRefresh();
                ddlTimeCodeIDRefresh();
            }
            else if (FvEventView.CurrentMode == FormViewMode.ReadOnly || FvEventView.CurrentMode == FormViewMode.Edit)
            {
                string EngineerID = DataBinder.Eval(FvEventView.DataItem, "EngineerID").ToString();
                string TimeCodeID = DataBinder.Eval(FvEventView.DataItem, "TimeCodeID").ToString();
                ddlEngineerIDRefresh(EngineerID);
                ddlTimeCodeIDRefresh(TimeCodeID);
            }
            DatePickerRefresh();
        }

        protected void FvEventView_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "New":
                    Response.Redirect("~/Restricted/EventView.aspx?id=0");
                    break;
                case "Cancel":
                    FvEventView.ChangeMode(FormViewMode.ReadOnly);
                    PageDataRefresh();
                    break;
                case "ListView":
                    Response.Redirect("~/Restricted/EventList.aspx");
                    break;
            }
        }

        protected void FvEventView_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            FvEventView.ChangeMode((FormViewMode)e.NewMode);
            PageDataRefresh();
        }

        protected void FvEventView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FvEventView_CallInsertOrUpdate("Insert");
        }

        protected void FvEventView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            FvEventView_CallInsertOrUpdate("Update");
        }

        protected void FvEventView_CallInsertOrUpdate(string CallCommand)
        {
            TextBox eventID_txt = (TextBox)FvEventView.FindControl("txtEventID");
            TextBox jobID_txt = (TextBox)FvEventView.FindControl("txtJobID");
            TextBox engineerID_txt = (TextBox)FvEventView.FindControl("txtEngineerID");
            TextBox timeCodeID_txt = (TextBox)FvEventView.FindControl("txtTimeCodeID");
            TextBox startDate_txt = (TextBox)FvEventView.FindControl("txtStartDate");
            TextBox startTime_txt = (TextBox)FvEventView.FindControl("txtStartTime");
            TextBox endDate_txt = (TextBox)FvEventView.FindControl("txtEndDate");
            TextBox endTime_txt = (TextBox)FvEventView.FindControl("txtEndTime");

            string eventID = eventID_txt.Text;
            int jobID = Convert.ToInt32(jobID_txt);
            string engineerID = engineerID_txt.Text;
            int timeCodeID = Convert.ToInt32(timeCodeID_txt);
            string startDateTimeString = startDate_txt.Text + startTime_txt;
            string endDateTimeString = endDate_txt.Text + endTime_txt;

            DateTime startDateTime = DateTime.Today;
            DateTime endDateTime = DateTime.Today;
            DateTime.TryParse(startDateTimeString, out startDateTime);
            DateTime.TryParse(endDateTimeString, out endDateTime);

            EventTableAdapter eventAdapter = new EventTableAdapter();

            try
            {
                if (CallCommand == "Update")
                {
                    int originalID = Convert.ToInt32(Request.QueryString["id"]);

                    eventAdapter.UpdateEvent(jobID, engineerID, timeCodeID, startDateTime, endDateTime, originalID);

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Record Edited')</script>");
                }
                else if (CallCommand == "Insert")
                {
                    eventAdapter.InsertEvent(jobID, engineerID, timeCodeID, startDateTime, endDateTime);

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Record Added')</script>");

                    Response.Redirect("~/Restricted/EventView.aspx?id=" + eventID);
                }
            }
            catch (System.Exception ex)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR occurred connecting to the database'" + ex.Message + ")</script>");
            }
        }

        protected void FvEventView_DataBound(object sender, EventArgs e)
        {
            if (FvEventView.DataItemCount == 0)
            {
                FvEventView.ChangeMode(FormViewMode.Insert);
            }
            else
            {
                FvEventView.ChangeMode(FormViewMode.Edit);
            }
        }

        protected void ddlEngineerID_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            ddlEngineerIDRefresh(ddl.SelectedValue);
        }

        protected void ddlEngineerIDRefresh(string EngineerIDValue = null, int EngineerIDIndex = 0)
        {
            EngineerTableAdapter EngineerAdapter = new EngineerTableAdapter();
            DropDownList ddlEngineerID = (DropDownList)FvEventView.FindControl("ddlEngineerID");
            ddlEngineerID.DataSource = EngineerAdapter.Get();
            ddlEngineerID.DataValueField = "EngineerID";
            ddlEngineerID.DataTextField = "EngineerName";

            if (EngineerIDValue == "" || EngineerIDValue == null)
            {
                ddlEngineerID.SelectedIndex = EngineerIDIndex;
            }
            else
            {
                ddlEngineerID.SelectedValue = EngineerIDValue;
            }

            ddlEngineerID.DataBind();
        }

        protected void ddlTimeCodeID_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            ddlTimeCodeIDRefresh(ddl.SelectedValue);
        }

        protected void ddlTimeCodeIDRefresh(string TimeCodeIDValue = null, int TimeCodeIDIndex = 0)
        {
            TimeCodeTableAdapter TimeCodeAdapter = new TimeCodeTableAdapter();
            DropDownList ddlTimeCodeID = (DropDownList)FvEventView.FindControl("ddlTimeCodeID");
            ddlTimeCodeID.DataSource = TimeCodeAdapter.GetDataBasics();
            ddlTimeCodeID.DataValueField = "TimeCodeID";
            ddlTimeCodeID.DataTextField = "DescriptionRate";

            if (TimeCodeIDValue == "" || TimeCodeIDValue == null)
            {
                ddlTimeCodeID.SelectedIndex = TimeCodeIDIndex;
            }
            else
            {
                ddlTimeCodeID.SelectedValue = TimeCodeIDValue;
            }

            ddlTimeCodeID.DataBind();
        }

        protected void lvPayList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Response.Redirect("~/Restricted/EventView.aspx?id=" + e.CommandArgument.ToString());
        }

        protected void DateTimeTextBoxes_TextChanged(object sender, EventArgs e)
        {
            DatePickerRefresh();
        }

        protected void DatePickerRefresh()
        {
            TextBox txtStartDate = (TextBox)FvEventView.FindControl("txtStartDate");
            TextBox txtStartTime = (TextBox)FvEventView.FindControl("txtStartTime");
            TextBox txtEndDate = (TextBox)FvEventView.FindControl("txtEndDate");
            TextBox txtEndTime = (TextBox)FvEventView.FindControl("txtEndTime");

            DateTime NewDateTime = DateTime.Today;
            DateTime StartDateTime;
            DateTime EndDateTime;

            bool Valid_StartDate = DateTime.TryParse(txtStartDate.Text.Trim(), out StartDateTime);
            bool Valid_EndDate = DateTime.TryParse(txtEndDate.Text.Trim(), out EndDateTime);

            ReplaceDateTimeAttributes(ref txtStartDate, StartDateTime.ToString("yyyy-MM-dd"));
            ReplaceDateTimeAttributes(ref txtEndDate, EndDateTime.ToString("yyyy-MM-dd"));

            if (Valid_StartDate && txtStartTime.Text != "")
            {
                TimeSpan StartTime = TimeToTimeSpan(txtStartTime.Text);
                StartDateTime += StartTime;
            }
            else
            {
                Valid_StartDate = false;
            }
            if(Valid_EndDate && txtEndTime.Text != "")
            {
                TimeSpan EndTime = TimeToTimeSpan(txtEndTime.Text);
                EndDateTime += EndTime;
            }
            else
            {
                Valid_EndDate = false;
            }

        }

        private TimeSpan TimeToTimeSpan(string time)
        {
            int hours = 0;
            int minutes = 0;
            int seconds = 0;

            if(time != null && time.Length >= 3)
            {
                bool hasHours = int.TryParse(time.Substring(0, 2), out hours);
                bool hasMinutes = int.TryParse(time.Split(':')[1], out minutes);
            }

            return new TimeSpan(hours, minutes, seconds);
        }

        private void ReplaceDateTimeAttributes(ref TextBox textBox, string value = null)
        {
            if(value != null)
            {
                textBox.Attributes.Remove("value");
                textBox.Attributes.Add("value", value);
                textBox.Text = value;
            }
        }
    }
}
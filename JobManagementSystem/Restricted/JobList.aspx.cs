using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobManagementSystem._DAL___JMSTableAdapters;

namespace JobManagementSystem
{
    public partial class JobList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int.TryParse(txtSearchJobID.Text, out int sJobID);
            string sTypeDescription = txtSearchTypeDescription.Text.ToString();
            string sClientName = txtSearchClientName.Text.ToString();
            string sClientType = txtSearchClientType.Text.ToString();
            string sAdminName = txtSearchAdminName.Text.ToString();
            string sPlannedStartDate = txtSearchPlannedStartDate.Text.ToString();
            string sPlannedEndDate = txtSearchPlannedEndDate.Text.ToString();

            JobListTableAdapter JobListAdapter = new JobListTableAdapter();
            LvJobList.DataSource = JobListAdapter.GetByParameters(sJobID, 0, 0, "", sPlannedStartDate, sPlannedEndDate, sTypeDescription, sClientName, sClientType, "", "", sAdminName, "");
            LvJobList.DataBind();
        }

        protected void LVJobList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Response.Redirect("~/Restricted/JobView.aspx?id=" + e.CommandArgument.ToString());
        }
    }
}
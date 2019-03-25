using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobManagementSystem._DAL___JMSTableAdapters;

namespace JobManagementSystem.Admin
{
    public partial class StaffList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StaffTableAdapter StaffAdapter = new StaffTableAdapter();
            LvStaffList.DataSource = StaffAdapter.Get();
            LvStaffList.DataBind();
        }

        protected void LvStaffList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Response.Redirect("~/Admin/StaffView.aspx?id=" + e.CommandArgument.ToString());
        }
    }
}
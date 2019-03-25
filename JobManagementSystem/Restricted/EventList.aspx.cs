using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobManagementSystem._DAL___JMSTableAdapters;

namespace JobManagementSystem.Restricted
{
    public partial class EventList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EventTableAdapter EventAdapter = new EventTableAdapter();
            LvEventList.DataSource = EventAdapter.Get();
            LvEventList.DataBind();
        }

        protected void LvEventList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Response.Redirect("~/Restricted/EventView.aspx?id=" + e.CommandArgument.ToString());
        }
    }
}
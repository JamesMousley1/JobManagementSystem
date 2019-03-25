using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobManagementSystem._DAL___JMSTableAdapters;

namespace JobManagementSystem.Admin
{
    public partial class StaffView : System.Web.UI.Page
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
            string sID = Request.QueryString["id"];
            int ID = Convert.ToInt32(sID);
            if (sID == null || sID == "0")
            {
                sID = "0";
                fvStaffView.ChangeMode(FormViewMode.Insert);
            }
            StaffTableAdapter staffAdapter = new StaffTableAdapter();
            fvStaffView.DataSource = staffAdapter.GetByID(ID);
            fvStaffView.DataBind();
        }

        protected void fvStaffView_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            switch(e.CommandName)
            {
                case "New":
                    Response.Redirect("~/Admin/StaffView.aspx?id=0");
                    break;
                case "Cancel":
                    fvStaffView.ChangeMode(FormViewMode.ReadOnly);
                    PageDataRefresh();
                    break;
                case "ListView":
                    Response.Redirect("~/Admin/StaffView.aspx");
                    break;
            }
        }

        protected void fvStaffView_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            fvStaffView.ChangeMode((FormViewMode)e.NewMode);
            PageDataRefresh();
        }

        protected void fvStaffView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            fvStaffView_CallInsertOrUpdate("Insert");
        }

        protected void fvStaffView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            fvStaffView_CallInsertOrUpdate("Update");
        }

        protected void fvStaffView_CallInsertOrUpdate(string CallCommand)
        {
            TextBox StaffID_txt = (TextBox)fvStaffView.FindControl("txtStaffID");
            TextBox AdminID_txt = (TextBox)fvStaffView.FindControl("txtAdminID");
            TextBox AdminName_txt = (TextBox)fvStaffView.FindControl("txtAdminName");
            TextBox AdminContactDetails_txt = (TextBox)fvStaffView.FindControl("txtAdminContactDetails");
            TextBox EngineerID_txt = (TextBox)fvStaffView.FindControl("txtEngineerID");
            TextBox EngineerName_txt = (TextBox)fvStaffView.FindControl("txtEngineerName");

            string StaffID = StaffID_txt.Text;
            string AdminID = AdminID_txt.Text;
            string AdminName = AdminName_txt.Text;
            string AdminContactDetails = AdminContactDetails_txt.Text;
            string EngineerID = EngineerID_txt.Text;
            string EngineerName = EngineerName_txt.Text;

            StaffTableAdapter staffAdapter = new StaffTableAdapter();

            try
            {
                if (CallCommand == "Update")
                {
                    int originalID = Convert.ToInt32(Request.QueryString["id"]);

                    staffAdapter.UpdateStaff(AdminID, AdminName, AdminContactDetails, EngineerID, EngineerName, originalID);
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Record Added')</script>");
                    Response.Redirect("~/Admin/StaffView.aspx?id=" + StaffID);
                }
            }
            catch (System.Exception ex)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR occurred connecting to the database" + ex.Message);
            }
        }

        protected void fvStaffView_DataBound(object sender, EventArgs e)
        {
            if (fvStaffView.DataItemCount == 0)
            {
                fvStaffView.ChangeMode(FormViewMode.Insert);
            }
            else
            {
                fvStaffView.ChangeMode(FormViewMode.Edit);
            }
        }

        protected void LvStaffView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Response.Redirect("~/Admin/StaffView.aspx?id=" + e.CommandArgument.ToString());
        }

        protected void rbEngineer_CheckedChanged(object sender, EventArgs e)
        {
            TextBox AdminName_txt = (TextBox)fvStaffView.FindControl("txtAdminName");
            TextBox AdminContactDetails_txt = (TextBox)fvStaffView.FindControl("txtAdminContactDetails");
            AdminName_txt.Enabled = false;
            AdminContactDetails_txt.Enabled = false;

            TextBox EngineerName_txt = (TextBox)fvStaffView.FindControl("txtEngineerName");
            EngineerName_txt.Enabled = true;
        }

        protected void rbAdmin_CheckedChanged(object sender, EventArgs e)
        {
            TextBox EngineerName_txt = (TextBox)fvStaffView.FindControl("txtEngineerName");
            EngineerName_txt.Enabled = false;

            TextBox AdminName_txt = (TextBox)fvStaffView.FindControl("txtAdminName");
            TextBox AdminContactDetails_txt = (TextBox)fvStaffView.FindControl("txtAdminContactDetails");
            AdminName_txt.Enabled = true;
            AdminContactDetails_txt.Enabled = true;
        }
    }
}
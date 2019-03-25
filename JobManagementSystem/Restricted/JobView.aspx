<%@ Page Title="Job View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobView.aspx.cs" Inherits="JobManagementSystem.Restricted.JobView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="container">
        
        <asp:FormView 
            ID="fvJobView" 
            runat="server"
            CssClass="col-md-12"
            AllowPaging="false" 
            DataKeyNames="JobID" 
            OnItemCommand="fvJobView_ItemCommand"
            OnModeChanging="fvJobView_ModeChanging"
            OnItemInserting="fvJobView_ItemInserting"
            OnItemUpdating="fvJobView_ItemUpdating"
            OnDataBound="fvJobView_DataBound">

            <ItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                        <h3>Job View</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3>
                            <asp:LinkButton ID="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn" />
                            <asp:LinkButton ID="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn" />
                            <asp:LinkButton ID="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn" />
                        </h3>
                    </section>
                </section>

                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-condensed">
                            <tr><td>Job ID</td><td><asp:TextBox ID="txtJobID" runat="server" Enabled="False" Text='<%#Eval("JobID")%>'></asp:TextBox></td></tr>
                            <tr><td>Job Type</td><td colspan="4"><asp:DropDownList ID="ddlJobTypeID" Height="30px" Width="28%" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlJobTypeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Client Name</td><td colspan="4"><asp:DropDownList ID="ddlClientID" Height="30px" Width="28%" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlClientID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Client Type</td><td><asp:TextBox ID="txtClientType" runat="server" Enabled="False" Text='<%#Eval("ClientType")%>'></asp:TextBox></td></tr>
                            <tr><td>Client Address</td><td><asp:TextBox ID="txtClientAddress" runat="server" Enabled="False" Text='<%#Eval("ClientAddress")%>'></asp:TextBox></td></tr>
                            <tr><td>Client Contact Details</td><td><asp:TextBox ID="txtClientContactDetails" runat="server" Enabled="False" Text='<%#Eval("ClientContactDetails")%>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Planned Start Date</td><td><asp:TextBox ID="txtPlannedStartDate" runat="server" Enabled="False" Text='<%#Eval("PlannedStartDate")%>'></asp:TextBox></td></tr>
                            <tr><td>Planned End Date</td><td><asp:TextBox ID="txtPlannedEndDate" runat="server" Enabled="False" Text='<%#Eval("PlannedEndDate")%>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Admin Name</td><td colspan="4"><asp:DropDownList ID="ddlAdminID" Height="30px" Width="28%" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlAdminID_SelectedIndexChanged"></asp:DropDownList></td>
                            <tr><td>Admin Contact Details</td><td><asp:TextBox ID="txtAdminContactDetails" runat="server" Enabled="False" Text='<%#Eval("AdminContactDetails")%>'></asp:TextBox></td></tr>
                        </table>
                    </section>
                </section>

            </ItemTemplate>

            <EditItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                        <h3>Edit Job</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3>
                            <asp:LinkButton ID="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn" />
                            <asp:LinkButton ID="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil disabled btn" />
                            <asp:LinkButton ID="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn" />
                        </h3>
                    </section>
                </section>

                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-condensed">
                            <tr><td>Job ID</td><td><asp:TextBox ID="txtJobID" runat="server" Enabled="False" Text='<%#Bind("JobID")%>'></asp:TextBox></td></tr>
                            <tr><td>Job Type Name</td><td colspan="4"><asp:DropDownList ID="ddlJobTypeID" runat="server" Height="30px" Width="28%" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlJobTypeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Client Name</td><td colspan="4"><asp:DropDownList ID="ddlClientID" runat="server" Height="30px" Width="28%" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlClientID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Client Type</td><td><asp:TextBox ID="txtClientType" runat="server" Enabled="False" Text='<%#Bind("ClientType")%>'></asp:TextBox></td></tr>
                            <tr><td>Client Address</td><td><asp:TextBox ID="txtClientAddress" runat="server" Enabled="False" Text='<%#Bind("ClientAddress")%>'></asp:TextBox></td></tr>
                            <tr><td>Client Contact Details</td><td><asp:TextBox ID="txtClientContactDetails" runat="server" Enabled="False" Text='<%#Bind("ClientContactDetails")%>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Planned Start Date</td><td><asp:TextBox ID="txtPlannedStartDate" runat="server" Enabled="True" Text='<%#Bind("PlannedStartDate")%>'></asp:TextBox></td></tr>
                            <tr><td>Planned End Date</td><td><asp:TextBox ID="txtPlannedEndDate" runat="server" Enabled="True" Text='<%#Bind("PlannedEndDate")%>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Admin Name</td><td colspan="4"><asp:DropDownList ID="ddlAdminID" Height="30px" Width="28%" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlAdminID_SelectedIndexChanged"></asp:DropDownList></td>
                            <tr><td>Admin Contact Details</td><td><asp:TextBox ID="txtAdminContactDetails" runat="server" Enabled="False" Text='<%#Bind("AdminContactDetails")%>'></asp:TextBox></td></tr>

                            <tr><td></td><td><asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Save" CssClass="btn btn-primary" /></td></tr>
                        </table>
                    </section>
                </section>
            </EditItemTemplate>

            <InsertItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                        <h3>New Job</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3>
                            <asp:LinkButton ID="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus disabled btn" />
                            <asp:LinkButton ID="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil disabled btn" />
                            <asp:LinkButton ID="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn" />
                        </h3>
                    </section>
                </section>

                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-condensed">
                            <tr><td>Job ID</td><td><asp:TextBox ID="txtJobID" runat="server" Enabled="False" Text='<%#Bind("JobID")%>'></asp:TextBox></td></tr>
                            <tr><td>Job Type Description</td><td colspan="4"><asp:DropDownList ID="ddlJobTypeID" runat="server" Height="30px" Width="28%" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlJobTypeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Client Name</td><td colspan="4"><asp:DropDownList ID="ddlClientID" runat="server" Height="30px" Width="28%" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlClientID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Client Type</td><td><asp:TextBox ID="txtClientType" runat="server" Enabled="False" Text='<%#Bind("ClientType")%>'></asp:TextBox></td></tr>
                            <tr><td>Client Address</td><td><asp:TextBox ID="txtClientAddress" runat="server" Enabled="False" Text='<%#Bind("ClientAddress")%>'></asp:TextBox></td></tr>
                            <tr><td>Client Contact Details</td><td><asp:TextBox ID="txtClientContactDetails" runat="server" Enabled="False" Text='<%#Bind("ClientContactDetails")%>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Planned Start Date</td><td><asp:TextBox ID="txtPlannedStartDate" runat="server" Enabled="True" Text='<%#Bind("PlannedStartDate")%>'></asp:TextBox></td></tr>
                            <tr><td>Planned End Date</td><td><asp:TextBox ID="txtPlannedEndDate" runat="server" Enabled="True" Text='<%#Bind("PlannedEndDate")%>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Admin Name</td><td colspan="4"><asp:DropDownList ID="ddlAdminID" Height="30px" Width="28%" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlAdminID_SelectedIndexChanged"></asp:DropDownList></td>
                            <tr><td>Admin Contact Details</td><td><asp:TextBox ID="txtAdminContactDetails" runat="server" Enabled="False" Text='<%#Bind("AdminContactDetails")%>'></asp:TextBox></td></tr>

                            <tr><td></td><td><asp:LinkButton ID="btnInsert" runat="server" CommandName="Insert" Text="Submit" CssClass="btn btn-primary" /></td></tr>
                        </table>
                    </section>
                </section>
            </InsertItemTemplate>

            <EmptyDataTemplate>
                <section class="row">
                    <section class="col-xs-12">
                        <h3>(No record found)</h3>
                    </section>
                </section>
            </EmptyDataTemplate>

        </asp:FormView>

        <section class ="row">
            <section class = "col-xs-8">
                <h3>Engineers Assigned</h3>
            </section>
            <section>
                <h3><asp:LinkButton ID="btnAddNew" OnClick="btnNewEvent_Click" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus" /></h3>
            </section>
        </section>

        <section class = "row">
            <section class = "col-md-12">
                <asp:ListView ID="LvEventList" runat="server" OnItemCommand="LvEventList_ItemCommand">

                    <LayoutTemplate>
                        <table runat="server" id="tblEvents" class="table table-hover">
                            <tr runat="server">
                                <th>Event ID</th>
                                <th>Job ID</th>
                                <th>Engineer ID</th>
                                <th>Time Code ID</th>
                                <th>Start Date Time</th>
                                <th>End Date Time</th>
                                <th>View</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </LayoutTemplate>

                    <ItemTemplate>
                        <tr runat="server">
                            <td><asp:Label ID="lblEventID" runat="server" Text='<%#Eval("[EventID]")%>' /></td>
                            <td><asp:Label ID="lblJobID" runat="server" Text='<%#Eval("[JobID]")%>' /></td>
                            <td><asp:Label ID="lblEngineerID" runat="server" Text='<%#Eval("[EngineerID]")%>' /></td>
                            <td><asp:Label ID="lblTimeCode" runat="server" Text='<%#Eval("[TimeCodeID]")%>' /></td>
                            <td><asp:Label ID="lblStartDateTime" runat="server" Text='<%#Eval("[StartDateTime]")%>' /></td>
                            <td><asp:Label ID="lblEndDateTime" runat="server" Text='<%#Eval("[EndDateTime]")%>' /></td>
                            <td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandArgument='<%#Eval("EventID")%>' /></td>
                        </tr>
                    </ItemTemplate>

                    <EmptyDataTemplate>
                        <table runat="server" id="tblEvents" class="table">
                            <tr runat="server">
                                <th>Event ID</th>
                                <th>Job ID</th>
                                <th>Engineer ID</th>
                                <th>Time Code</th>
                                <th>Start Date Time</th>
                                <th>End Date Time</th>
                                <th>View</th>
                            </tr>
                            <tr>
                                <td colspan="4" class="text-center">No Events listed for this job</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                </asp:ListView>

            </section>
        </section>
    </section>

</asp:Content>

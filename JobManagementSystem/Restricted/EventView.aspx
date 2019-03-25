<%@ Page Title="Event View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventView.aspx.cs" Inherits="JobManagementSystem.Restricted.EventView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="container">

        <asp:FormView ID="FvEventView" runat="server" AllowPaging="false" DataKeyNames="EventID" OnItemCommand="FvEventView_ItemCommand" OnModeChanging="FvEventView_ModeChanging" OnItemInserting="FvEventView_ItemInserting" OnItemUpdating="FvEventView_ItemUpdating" OnDataBound="FvEventView_DataBound">
        
            <ItemTemplate>

                <section class="row">
                    <section class="col-xs-8">

                        <h3>Event View</h3>

                    </section>

                    <section class="col-xs-4 text-right">

                        <asp:linkbutton id="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn" />
                        <asp:linkbutton id="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn" />
                        <asp:linkbutton id="Linkbutton1" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn" />

                    </section>
                </section>

                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-condensed">
                            <tr><td>Event ID</td><td><asp:TextBox ID="txtEventID" runat="server" Enabled="False" Width="100%" Text='<%#Eval("EventID")%>'></asp:TextBox></td></tr>
                            <tr><td>Job ID</td><td><asp:TextBox ID="txtJobID" runat="server" Enabled="False" Width="100%" Text='<%#Eval("JobID")%>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Engineer Name</td><td colspan="4"><asp:DropDownList ID="ddlEngineerID" Height="30px" Width="100%" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlEngineerID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Time Code</td><td colspan="4"><asp:DropDownList ID="ddlTimeCodeID" Height="30px" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlTimeCodeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Start Date</td><td><asp:TextBox ID="txtStartDate" runat="server" Enabled="False" Width="100%" Text='<%#Bind("StartDateTime", "{0:dd/MM/yyyy}")%>' OnTextChanged="DateTimeTextBoxes_TextChanged"></asp:TextBox></td></tr>
                            <tr><td>Start Date</td><td><asp:TextBox ID="txtStartTime" runat="server" Enabled="False" Width="100%" Text='<%#Bind("StartDateTime", "{0:HH:mm}")%>' TextMode="Time" OnTextChanged="DateTimeTextBoxes_TextChanged"></asp:TextBox></td></tr>
                            <tr><td>End Date</td><td><asp:TextBox ID="txtEndDate"  runat="server" Enabled="False" Width="100%"  Text='<%#Bind("EndDateTime", "{0:dd/MM/yyyy}")%>' OnTextChanged="DateTimeTextBoxes_TextChanged"></asp:TextBox></td></tr>
                            <tr><td>End Date</td><td><asp:TextBox ID="txtEndTime"  runat="server" Enabled="False" Width="100%"  Text='<%#Bind("EndDateTime", "{0:HH:mm}")%>' TextMode="Time" OnTextChanged="DateTimeTextBoxes_TextChanged"></asp:TextBox></td></tr>
                        </table>
                    </section>

                </section>

            </ItemTemplate>

            <EditItemTemplate>

                <section class="row">
                    <section class="col-xs-8">

                        <h3>Edit Event</h3>

                    </section>

                    <section class="col-xs-4 text-right">
                      
                        <asp:linkbutton id="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn" />
                        <asp:linkbutton id="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn diabled" />
                        <asp:linkbutton id="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn" />

                    </section>
                </section>
                
                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-condensed">
                            <tr><td>Event ID</td><td><asp:TextBox ID="txtEventID" runat="server" Enabled="False" Width="100%" Text='<%#Bind("EventID")%>'></asp:TextBox></td></tr>
                            <tr><td>Job ID</td><td><asp:TextBox ID="txtJobID" runat="server" Enabled="False" Width="100%" Text='<%#Bind("JobID")%>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Engineer Name</td><td colspan="4"><asp:DropDownList ID="ddlEngineerID" Height="30px" Width="100%" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEngineerID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Time Code</td><td colspan="4"><asp:DropDownList ID="ddlTimeCodeID" Height="30px" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlTimeCodeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Start Date</td><td><asp:TextBox ID="txtStartDate" runat="server" Enabled="True" Width="100%" Text='<%#Bind("StartDateTime", "{0:yyyy-MM-dd}")%>' TextMode="Date" OnTextChanged="DateTimeTextBoxes_TextChanged" AutoPostBack="True"></asp:TextBox></td></tr>
                            <tr><td>Start Date</td><td><asp:TextBox ID="txtStartTime" runat="server" Enabled="True" Width="100%" Text='<%#Bind("StartDateTime", "{0:HH:mm}")%>' TextMode="Time" OnTextChanged="DateTimeTextBoxes_TextChanged" AutoPostBack="True"></asp:TextBox></td></tr>
                            <tr><td>End Date</td><td><asp:TextBox ID="txtEndDate"  runat="server" Enabled="True" Width="100%"  Text='<%#Bind("EndDateTime", "{0:yyyy-MM-dd}")%>' TextMode="Date" OnTextChanged="DateTimeTextBoxes_TextChanged" AutoPostBack="True"></asp:TextBox></td></tr>
                            <tr><td>End Date</td><td><asp:TextBox ID="txtEndTime"  runat="server" Enabled="True" Width="100%"  Text='<%#Bind("EndDateTime", "{0:HH:mm}")%>' TextMode="Time" OnTextChanged="DateTimeTextBoxes_TextChanged" AutoPostBack="True"></asp:TextBox></td></tr>

                            <tr><td></td><td><asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Save" CssClass="btn btn-primary" /></td></tr>
                        </table>
                    </section>

            </EditItemTemplate>

            <InsertItemTemplate>

                <section class="row">
                    <section class="col-xs-8">
                        <h3>New Event</h3>
                    </section>

                    <section class="col-xs-4 text-right">
                        
                        <asp:linkbutton id="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn disabled" />
                        <asp:linkbutton id="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn disabled" />
                        <asp:linkbutton id="Linkbutton1" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn" />

                    </section>
                </section>
             
                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-condensed">
                            <tr><td>Event ID</td><td><asp:TextBox ID="txtEventID" runat="server" Enabled="False" Width="100%" Text='<%#Bind("EventID")%>'></asp:TextBox></td></tr>
                            <tr><td>Job ID</td><td><asp:TextBox ID="txtJobID" runat="server" Enabled="False" Width="100%" Text='<%#Bind("JobID")%>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Engineer Name</td><td colspan="4"><asp:DropDownList ID="ddlEngineerID" Height="30px" Width="100%" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEngineerID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Time Code</td><td colspan="4"><asp:DropDownList ID="ddlTimeCodeID" Height="30px" runat="server" Enabled="true" AutoPostBack="True" OnSelectedIndexChanged="ddlTimeCodeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Start Date</td><td><asp:TextBox ID="txtStartDate" runat="server" Enabled="True" Width="100%" Text='<%#Bind("StartDateTime", "{0:yyyy-MM-dd}")%>' TextMode="Date" OnTextChanged="DateTimeTextBoxes_TextChanged"></asp:TextBox></td></tr>
                            <tr><td>Start Date</td><td><asp:TextBox ID="txtStartTime" runat="server" Enabled="True" Width="100%" Text='<%#Bind("StartDateTime", "{0:HH:mm}")%>' TextMode="Time" OnTextChanged="DateTimeTextBoxes_TextChanged"></asp:TextBox></td></tr>
                            <tr><td>End Date</td><td><asp:TextBox ID="txtEndDate"  runat="server" Enabled="True" Width="100%"  Text='<%#Bind("EndDateTime", "{0:yyyy-MM-dd}")%>' TextMode="Date" OnTextChanged="DateTimeTextBoxes_TextChanged"></asp:TextBox></td></tr>
                            <tr><td>End Date</td><td><asp:TextBox ID="txtEndTime"  runat="server" Enabled="True" Width="100%"  Text='<%#Bind("EndDateTime", "{0:HH:mm}")%>' TextMode="Time" OnTextChanged="DateTimeTextBoxes_TextChanged"></asp:TextBox></td></tr>

                            <tr><td></td><td><asp:LinkButton ID="btnInsert" runat="server" CommandName="Insert" Text="Submit" CssClass="btn btn-primary" /></td></tr>
                        </table>
                    </section>

            </InsertItemTemplate>

            <EmptyDataTemplate>

                <section class="row">
                    <section class="col-xs-12">
                        <h3>(No Record Found)</h3>
                    </section>
                </section>

            </EmptyDataTemplate>

        </asp:FormView>

        <section class ="row">
            <section class = "col-xs-8">
                <h3>Pay for Assignment</h3>
            </section>
        </section>

        <section class="row">
            <section class="col-md-12">
                <asp:ListView ID="lvPayList" runat="server" OnItemCommand="lvPayList_ItemCommand">

                    <LayoutTemplate>
                        <table runat="server" id="tblPay" class="table table-hover">
                            <tr runat="server">
                                <th>Rate Description</th>
                                <th>Rate</th>
                                <th>Hours</th>
                                <th>Total Pay</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </LayoutTemplate>

                    <ItemTemplate>
                        <tr runat="server">
                            <td><asp:Label ID="lblRateDescription" runat="server" Text='<%#Eval("[TimeCodeDescription]") %>'></asp:Label></td>
                            <td><asp:Label ID="lblRate" runat="server" Text='<%#Eval("[Rate]") %>'></asp:Label></td>
                            <td><asp:Label ID="lblHours" runat="server" Text='<%#Eval("[HoursWorked]") %>'></asp:Label></td>
                            <td><asp:Label ID="lblTotalPay" runat="server" Text='<%#Eval("[TotalPay]") %>'></asp:Label></td>
                        </tr>
                    </ItemTemplate>

                    <EmptyDataTemplate>
                        <table runat="server" id="tblPay" class="table">
                            <tr runat="server">
                                <th>Rate Description</th>
                                <th>Rate</th>
                                <th>Hours</th>
                                <th>Total Pay</th>
                            </tr>
                            <tr>
                                <td colspan="4" class="text-center">No Pay Data Avainable</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                </asp:ListView>

            </section>
        </section>
    </section>

</asp:Content>

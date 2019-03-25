<%@ Page Title="StaffView" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffView.aspx.cs" Inherits="JobManagementSystem.Admin.StaffView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="container">

        <asp:FormView 
            ID="fvStaffView" 
            runat="server" 
            AllowPaging="false" 
            DataKeyNames="AdminID" 
            OnItemCommand="fvStaffView_ItemCommand"
            OnModeChanging="fvStaffView_ModeChanging"
            OnItemInserting="fvStaffView_ItemInserting"
            OnItemUpdating="fvStaffView_ItemUpdating"
            OnDataBound="fvStaffView_DataBound">

            <ItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                        <h3>Staff View</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3>
                            <asp:LinkButton ID="btnIsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn" />
                            <asp:LinkButton ID="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn" />
                            <asp:LinkButton ID="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn" />
                        </h3>
                    </section>
                </section>

                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-condensed">
                            <tr><td>Staff ID:</td><td><asp:TextBox ID="txtStaffID" runat="server" Enabled="false" Text='<%#Eval("StaffID") %>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>
                                <asp:RadioButton ID="rbEngineer" runat="server" CssClass="checkbox disabled" Text="Engineer" GroupName="StaffRole" />
                                <asp:RadioButton ID="rbAdmin" runat="server" CssClass="checkbox disabled" Text="Admin" GroupName="StaffRole" />
                            </td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Admin Name:</td><td><asp:TextBox ID="txtAdminName" runat="server" Enabled="false" Text='<%#Eval("AdminName") %>'></asp:TextBox></td></tr>
                            <tr><td>Admin Contact Details:</td><td><asp:TextBox ID="txtAdminContactDetails" runat="server" Enabled="false" Text='<%#Eval("AdminContactDetails") %>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Engineer Name:</td><td><asp:TextBox ID="txtEngineerName" runat="server" Enabled="false" Text='<%#Eval("EngineerName") %>'></asp:TextBox></td></tr>
                        </table>
                    </section>
                </section>
            </ItemTemplate>

            <EditItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                        <h3>Edit Staff</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3>
                            <asp:LinkButton ID="btnIsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn" />
                            <asp:LinkButton ID="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn" />
                            <asp:LinkButton ID="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn" />
                        </h3>
                    </section>
                </section>

                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-condensed">
                            <tr><td>Staff ID:</td><td><asp:TextBox ID="txtStaffID" runat="server" Enabled="false" Text='<%#Eval("StaffID") %>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>
                                <asp:RadioButton ID="rbEngineer" runat="server" CssClass="checkbox" Text="Engineer" GroupName="StaffRole" AutoPostBack="true" OnCheckedChanged="rbEngineer_CheckedChanged"/>
                                <asp:RadioButton ID="rbAdmin" runat="server" CssClass="checkbox" Text="Admin" GroupName="StaffRole" AutoPostBack="true" OnCheckedChanged="rbAdmin_CheckedChanged"/>
                            </td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Admin Name:</td><td><asp:TextBox ID="txtAdminName" runat="server" Enabled="true" Text='<%#Eval("AdminName") %>'></asp:TextBox></td></tr>
                            <tr><td>Admin Contact Details:</td><td><asp:TextBox ID="txtAdminContactDetails" runat="server" Enabled="true" Text='<%#Eval("AdminContactDetails") %>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Engineer Name:</td><td><asp:TextBox ID="txtEngineerName" runat="server" Enabled="true" Text='<%#Eval("EngineerName") %>'></asp:TextBox></td></tr>

                            <tr><td></td><td><asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Save" CssClass="btn btn-primary" /></td></tr>
                        </table>
                    </section>
                </section>

            </EditItemTemplate>

            <InsertItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                        <h3>New Staff</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3>
                            <asp:LinkButton ID="btnIsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn" />
                            <asp:LinkButton ID="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn" />
                            <asp:LinkButton ID="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn" />
                        </h3>
                    </section>
                </section>
               
                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-condensed">
                            <tr><td>Staff ID:</td><td><asp:TextBox ID="txtStaffID" runat="server" Enabled="false" Text='<%#Eval("StaffID") %>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>
                                <asp:RadioButton ID="rbEngineer" runat="server" CssClass="checkbox" Text="Engineer" GroupName="StaffRole" AutoPostBack="true" OnCheckedChanged="rbEngineer_CheckedChanged"/>
                                <asp:RadioButton ID="rbAdmin" runat="server" CssClass="checkbox" Text="Admin" GroupName="StaffRole" AutoPostBack="true" OnCheckedChanged="rbAdmin_CheckedChanged"/>
                            </td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Admin Name:</td><td><asp:TextBox ID="txtAdminName" runat="server" Enabled="true" Text='<%#Eval("AdminName") %>'></asp:TextBox></td></tr>
                            <tr><td>Admin Contact Details:</td><td><asp:TextBox ID="txtAdminContactDetails" runat="server" Enabled="true" Text='<%#Eval("AdminContactDetails") %>'></asp:TextBox></td></tr>
                            <tr><td colspan=2><span class="row" /></td></tr>
                            <tr><td>Engineer Name:</td><td><asp:TextBox ID="txtEngineerName" runat="server" Enabled="true" Text='<%#Eval("EngineerName") %>'></asp:TextBox></td></tr>

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

    </section>

</asp:Content>

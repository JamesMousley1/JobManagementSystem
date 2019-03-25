<%@ Page Title="Job List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobList.aspx.cs" Inherits="JobManagementSystem.JobList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="container">
        <section class="row">

            <section class="col-md-8">

                <section class="row">
                    <section class="col-xs-8">
                        <h3>Job List</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3><asp:LinkButton ID="btnAddNew" PostBackUrl="~/Restricted/JobView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus" /></h3>
                    </section>
                </section>

                <section class="row">
                    <section class="col-md-12">

                        <asp:ListView ID="LvJobList" runat="server" OnItemCommand="LVJobList_ItemCommand">
                            <LayoutTemplate>
                                <table runat="server" id="tblJobList" class="table table-bordered">
                                    <tr runat="server" >
                                        <th>Job ID</th>
                                        <th>Job Type</th>
                                        <th>Client Name</th>
                                        <th>Client Type</th>
                                        <th>Admin Name</th>
                                        <th>Planned Start Date</th>
                                        <th>Planned End Date</th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder" ></tr>
                                </table>
                            </LayoutTemplate>
                            
                            <ItemTemplate>
                                <tr runat="server">
                                    <td><asp:Label ID="lblJobID" runat="server" Text='<%#Eval("[JobID]") %>' /></td>
                                    <td><asp:Label ID="lblTypeDesription" runat="server" Text='<%#Eval("[TypeDescription]") %>' /></td>
                                    <td><asp:Label ID="lblClientName" runat="server" Text='<%#Eval("[ClientName]") %>' /></td>
                                    <td><asp:Label ID="lblClientType" runat="server" Text='<%#Eval("[ClientType]") %>' /></td>
                                    <td><asp:Label ID="lblAdminName" runat="server" Text='<%#Eval("[AdminName]") %>' /></td>
                                    <td><asp:Label ID="lblPlannedStartDate" runat="server" Text='<%#Eval("[PlannedStartDate]") %>' /></td>
                                    <td><asp:Label ID="lblPlannedEndDate" runat="server" Text='<%#Eval("[PlannedEndDate]") %>' /></td>
                                    <td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%#Eval("JobID") %>'/></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>

                    </section>
                </section>
            </section>
            

                    <section class="col-md-4">
                        <h3>Search</h3>
                        <p><asp:TextBox ID="txtSearchJobID" runat="server" placeholder="Job ID"></asp:TextBox></p>
                        <p><asp:TextBox ID="txtSearchTypeDescription" runat="server" placeholder="Type Description"></asp:TextBox></p>
                        <p><asp:TextBox ID="txtSearchClientName" runat="server" placeholder="Client Name"></asp:TextBox></p>
                        <p><asp:TextBox ID="txtSearchClientType" runat="server" placeholder="Client Type"></asp:TextBox></p>
                        <p><asp:TextBox ID="txtSearchAdminName" runat="server" placeholder="Admin Name"></asp:TextBox></p>
                        <p><asp:TextBox ID="txtSearchPlannedStartDate" runat="server" placeholder="Planned Start Date"></asp:TextBox></p>
                        <p><asp:TextBox ID="txtSearchPlannedEndDate" runat="server" placeholder="Planned End Date"></asp:TextBox></p>
                        <p><asp:Button ID="btnSearchJob" runat="server" Text="Search" CssClass="btn btn-primary"/></p>
                    </section>
            
        </section>
    </section>
</asp:Content>

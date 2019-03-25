<%@ Page Title="Staff List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffList.aspx.cs" Inherits="JobManagementSystem.Admin.StaffList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <section class="container">
        <section class="row">
            <section class="col-md-8">
                <h3>Staff List</h3>
                <asp:ListView ID="LvStaffList" runat="server" OnItemCommand="LvStaffList_ItemCommand">

                    <LayoutTemplate>
                        <table runat="server" id="tblStaff" class="table table-bordered">
                            <tr runat="server">
                                <th>Staff ID</th>
                                <th>Admin ID</th>
                                <th>Admin Name</th>
                                <th>Admin Contact Details</th>
                                <th>Engineer ID</th>
                                <th>Engineer Name</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </LayoutTemplate>

                    <ItemTemplate>
                        <tr runat="server">
                            <td><asp:Label ID="lblStaffID" runat="server" Text='<%#Eval("StaffID") %>' /></td>
                            <td><asp:Label ID="lblAdminID" runat="server" Text='<%#Eval("AdminID") %>' /></td>
                            <td><asp:Label ID="lblAdminName" runat="server" Text='<%#Eval("AdminName") %>' /></td>
                            <td><asp:Label ID="lblAdminContactDetails" runat="server" Text='<%#Eval("AdminContactDetails") %>' /></td>
                            <td><asp:Label ID="lblEngineerID" runat="server" Text='<%#Eval("EngineerID") %>' /></td>
                            <td><asp:Label ID="lblEngineerName" runat="server" Text='<%#Eval("EngineerName") %>' /></td>
                            <td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%#Eval("StaffID") %>'/></td>
                        </tr>
                    </ItemTemplate>

                </asp:ListView>

            </section>

            <section class="col-md-4">

            </section>
        </section>
    </section>

</asp:Content>

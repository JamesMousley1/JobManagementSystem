<%@ Page Title="Event List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventList.aspx.cs" Inherits="JobManagementSystem.Restricted.EventList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <section class="container">
        <section class="row">
            <section class="col-md-8">
                <h3>Assignments List</h3>
                <asp:ListView ID="LvEventList" runat="server" OnItemCommand="LvEventList_ItemCommand">

                    <LayoutTemplate>
                        <table runat="server" id="tblEquipment" class="table table-bordered">
                            <tr runat="server">
                                <th>Event ID</th>
                                <th>Job ID</th>
                                <th>Engineer Name</th>
                                <th>Time Code ID</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </LayoutTemplate>

                    <ItemTemplate>
                        <tr runat="server">
                            <td><asp:Label ID="lblEventID" runat="server" Text='<%#Eval("EventID") %>' /></td>
                            <td><asp:Label ID="lblJobID" runat="server" Text='<%#Eval("JobID") %>' /></td>
                            <td><asp:Label ID="lblEngineerID" runat="server" Text='<%#Eval("EngineerID") %>' /></td>
                            <td><asp:Label ID="lblTimeCodeID" runat="server" Text='<%#Eval("TimeCodeID") %>' /></td>
                            <td><asp:Label ID="lblStartDateTime" runat="server" Text='<%#Eval("StartDateTime") %>' /></td>
                            <td><asp:Label ID="lblEndDateTime" runat="server" Text='<%#Eval("EndDateTime") %>' /></td>
                            <td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%#Eval("EventID") %>'/></td>
                        </tr>
                    </ItemTemplate>

                </asp:ListView>

            </section>

            <section class="col-md-4">

            </section>
        </section>
    </section>

</asp:Content>

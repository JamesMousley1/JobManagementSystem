<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JobManagementSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Jobs List</h1>
        <p class="lead">Extensive list of all of of our currently active, completed and pending jobs</p>
        <p><a href="http://localhost:63883/Restricted/JobList" class="btn btn-primary btn-lg">To Job List &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>New Job</h2>
            <p>
                Submit an application form for a new job
            </p>
            <p>
                <a class="btn btn-default" href="http://localhost:63883/Restricted/JobView">To New Job &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Assignments List</h2>
            <p>
                List of our engineers assigned jobs and tasks
            </p>
            <p>
                <a class="btn btn-default" href="http://localhost:63883/Restricted/EventList">To Assignments List &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Staff List</h2>
            <p>
                A comprehensive list of all of our engineers and admins
            </p>
            <p>
                <a class="btn btn-default" href="http://localhost:63883/Admin/StaffList">To Staff List &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>

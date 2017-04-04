<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CITAPPdb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>CITAPP</h1>
        <p class="lead">A fast and convenient way to book any medical appointment while keeping 
            track of your medical records, prescriptions, etc
        </p>
        <p><a href="/About" class="btn btn-warning btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Book Appointments</h2>
            <p>
                You can book you appointments in matter of seconds with CITAPP. Register now to build you patient 
                profile and start browsing for all the top medical profiles.
            </p>
        </div>
        <div class="col-md-4">
            <h2>Check your Medical History</h2>
            <p>
                With CITAPP, you can also keep record of your medical history through your app. 
                This information is confidential and protected.
            </p>
        </div>
        <div class="col-md-4">
            <h2>Print Prescriptions</h2>
            <p>
                Easily access your medical prescriptions through CITAPP. You can also print them for your convenience.

            </p>
        </div>
    </div>

</asp:Content>

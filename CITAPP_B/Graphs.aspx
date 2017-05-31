<%@ Page Title="Graphs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Graphs.aspx.cs" Inherits="Graphs" %>

<asp:Content ID="GraphBodyContent" ContentPlaceHolderID="MainContent" runat="server">
  

    <script src="https://code.highcharts.com/highcharts.src.js"></script>
    <script src="../../Scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/highcharts.js" type="text/javascript"></script>
    
    <div class="col-md-12"><%--1. PIE CHART FOR DOCTORS AVAILABLE APPOINTMENTS--%>
        <asp:Literal ID="DoctorAptChart" runat="server"></asp:Literal>
    </div>
    <hr />
    <div class="col-md-12"><%--2. SCATTER PLOT FOR PATIENTS AGE VS WEIGHT--%>
        <asp:Literal ID="PatientHeightWeightChart" runat="server"></asp:Literal>
    </div>
    <hr />
    <div class="col-md-12"><%--3. PIE CHART FOR DOCTORS SPECIALTIES--%>
        <asp:Literal ID="SpecialtiesChartLit" runat="server"></asp:Literal>
    </div>
    <hr />
     <div class="col-md-12"><%--4. soemthings soimethinsS--%>
        <asp:Literal ID="BloodTypeChart" runat="server"></asp:Literal>
    </div>
    <hr />
    <div class="col-md-12"><%--5. PIE CHART FOR PATIENTS COMMON ALLERGIES--%>
        <asp:Literal ID="AlergyChart" runat="server"></asp:Literal>
    </div>
     



</asp:Content>

 

 
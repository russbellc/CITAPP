<%@ Page Title="Views" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Views.aspx.cs" Inherits="Views" %>

<asp:Content ID="GraphBodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
    <style type="text/css">
        .pagination .current {
            background: #26B;
            color: #fff;
            border: solid 1px #AAE;
            
        }
        .pagination span{
            color:#0b75a5;
            font-weight:bold;
            font-size:16pt;
        }
    </style>

    <hr />
    <div class="col-md-12">
        <asp:Label ID="LabelButtons" runat="server" Text="Choose a table to display from the buttons below"></asp:Label>
    </div>
    <div class="col-md-4">
        <asp:Button ID="ButtonAllAppts" runat="server" Text="Global Appointments" BackColor="Gray" BorderStyle="Groove" ForeColor="#660066" OnClick="ButtonAllAppts_Click" Font-Bold="True" Font-Overline="False" Height="30px" Width="350px" />
    </div>
    <div class="col-md-4">
        <asp:Button ID="ButtonDocAppts" runat="server" Text="Appointments per Doctor Id" BackColor="Gray" BorderStyle="Groove" ForeColor="#660066" OnClick="ButtonDocAppts_Click" Font-Bold="True" Font-Overline="False" Height="30px" Width="350px" />
    </div>
    <div class="col-md-4">
        <asp:Button ID="ButtonPatientUsers" runat="server" Text="Global Patient Users" BackColor="Gray" BorderStyle="Groove" ForeColor="#660066" OnClick="ButtonPatientUsers_Click" Font-Bold="True" Font-Overline="False" Height="30px" Width="350px" />
    </div>
    <div class="col-md-4">
        <asp:Button ID="ButtonDoctorUsers" runat="server" Text="Global Doctor Users" BackColor="Gray" BorderStyle="Groove" ForeColor="#660066" OnClick="ButtonDoctorUsers_Click" Font-Bold="True" Font-Overline="False" Height="30px" Width="350px" />
    </div>
    <div class="col-md-4">
        <asp:Button ID="ButtonPatientVisits" runat="server" Text="Patient Visits per Patient Id" BackColor="Gray" BorderStyle="Groove" ForeColor="#660066" OnClick="ButtonPatientVisits_Click" Font-Bold="True" Font-Overline="False" Height="30px" Width="350px" />
    </div>
    <div class="col-md-4">
        <asp:Button ID="ButtonGlobalVisit" runat="server" Text="Global Completed Visits" BackColor="Gray" BorderStyle="Groove" ForeColor="#660066" OnClick="ButtonGlobalVisit_Click" Font-Bold="True" Font-Overline="False" Height="30px" Width="350px" />
    </div>
    <div class="col-md-4">
        <asp:Button ID="ButtonClear" runat="server" Text="Clear" BackColor="#99FF33" BorderStyle="Double" ForeColor="#000066" OnClick="ButtonClear_Click" Height="41px" Width="76px" />
    </div>
    <div class="col-md-8">
        <hr />
    </div>

    
    
    
    


    <hr />

    <div class="col-md-12">
        <asp:Label ID="LabelDocApptById" runat="server" Text="Check all existing appointments using Doctor Id"></asp:Label>
    </div>

    <div class="col-md-4">
        <asp:TextBox ID="SearchTextBox" runat="server" OnTextChanged="SearchTextBox_TextChanged" Width="227px"></asp:TextBox>
        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="SearchTextBox" ErrorMessage="Value must be a whole number" />
    </div>
    <div class="col-md-4">
        <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />
    </div>
    <div class="col-md-4">
    </div>




    <div class="col-md-12">
        <asp:Label ID="LabelAllAppts" runat="server" Text="All appointments"></asp:Label>
    </div>
    <div class="col-md-12"> <%--DISPLAY ALL GLOBAL APPOINTMENTS--%>
        <asp:GridView ID="GridViewGlobalAppts" CssClass="footable"  runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True" PageSize="25" OnPageIndexChanging="GridViewGlobalAppts_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="&amp;lt;&amp;lt; " Mode="NumericFirstLast" NextPageText="&amp;gt; &gt;" />
            <PagerStyle BackColor="#F7F7DE" CssClass="pagination" ForeColor="Black" HorizontalAlign="Center" Font-Bold="True" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>

    <div class="col-md-12">
        <asp:Label ID="LabelDocId" runat="server" Text="All appointments per Doctor"></asp:Label>
    </div>
    <div class="col-md-12"> <%--DISPLAY APPOINTMENTS FILTERED BY DOCTOR--%>
        <asp:GridView ID="GridViewDocIdAppt" CssClass="footable"  runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True" PageSize="25" OnPageIndexChanging="GridViewDocIdAppt_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="&amp;lt;&amp;lt; " Mode="NumericFirstLast" NextPageText="&amp;gt; &gt;" />
            <PagerStyle BackColor="#F7F7DE" CssClass="pagination" ForeColor="Black" HorizontalAlign="Center" Font-Bold="True" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>


    <div class="col-md-12">
        <asp:Label ID="LabelPatientUsers" runat="server" Text="All users of the type Patient with their information"></asp:Label>
    </div>
    <div class="col-md-12"> <%--DISPLAY ALL GLOBAL PATIENT USERS--%>
        <asp:GridView ID="GridViewPatientUsers" CssClass="footable"  runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True" PageSize="25" OnPageIndexChanging="GridViewPatientUsers_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="&amp;lt;&amp;lt; " Mode="NumericFirstLast" NextPageText="&amp;gt; &gt;" />
            <PagerStyle BackColor="#F7F7DE" CssClass="pagination" ForeColor="Black" HorizontalAlign="Center" Font-Bold="True" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>


    <div class="col-md-12">
        <asp:Label ID="LabelDocUser" runat="server" Text="All users of the type Doctor with their information"></asp:Label>
    </div>
    <div class="col-md-12"> <%--DISPLAY ALL GLOBAL DOCTOR USERS--%>
        <asp:GridView ID="GridViewDocUsers" CssClass="footable"  runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True" PageSize="25" OnPageIndexChanging="GridViewDocUsers_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="&amp;lt;&amp;lt; " Mode="NumericFirstLast" NextPageText="&amp;gt; &gt;" />
            <PagerStyle BackColor="#F7F7DE" CssClass="pagination" ForeColor="Black" HorizontalAlign="Center" Font-Bold="True" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>


    <div class="col-md-12">
        <asp:Label ID="LabelVisits" runat="server" Text="Get all completed appointment visits with diagnose"></asp:Label>
    </div>
    <div class="col-md-12"> <%--DISPLAY ALL COMPLETED VISITS--%>
        <asp:GridView ID="GridViewCompletedVisits" CssClass="footable"  runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True" PageSize="25" OnPageIndexChanging="GridViewCompletedVisits_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="&amp;lt;&amp;lt; " Mode="NumericFirstLast" NextPageText="&amp;gt; &gt;" />
            <PagerStyle BackColor="#F7F7DE" CssClass="pagination" ForeColor="Black" HorizontalAlign="Center" Font-Bold="True" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>

</asp:Content>

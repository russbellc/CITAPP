<%@ Page  Title="Appointment" Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="CITAPPdb.Account.Appointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" runat="server" href="~/">CITAPP</a>
                        </div>
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a runat="server" href="~/">Home</a></li>
                                <li><a runat="server" href="~/About">About</a></li>
                                <li><a runat="server" href="~/Contact">Contact</a></li>
                                <li><a runat="server" href="~/Account/ClientList">Clients</a></li>
                                <li><a runat="server" href="~/Account/Appointments">Appointments</a></li>
                            </ul>
                        </div>
                </div>
            </div>
        <div class ="row">
            <div class="col-md-12">
                <asp:Calendar Caption="Select a date for your appointment" ID="CalendarAppt" Font-Names="Arial" 
                    runat="server" SelectedDate='<%# Bind("ApptDate") %>' OnSelectionChanged="CalendarAppt_SelectionChanged">
                    <SelectedDayStyle BackColor="LightGray" Font-Bold="True"></SelectedDayStyle>
                </asp:Calendar>
            </div>

            <div class="col-md-12">
                <div class="form-horizontal">
                    <h4>Create a new appointment</h4>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ApptDate" CssClass="col-md-8 control-label">Selected Date</asp:Label>
                        <asp:Label ID="Label1" runat="server" CssClass="col-md-8 control-label" Text="Selected Patient"></asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="ApptDate" CssClass="form-control" OnTextChanged="ApptDate_TextChanged"/>
                            <asp:TextBox ID="TextBox1" runat="server" style="margin-bottom: 0px" Width="276px"></asp:TextBox>
                            <asp:FormView ID="FormView1" runat="server" DataSourceID="CITAPP">
                            </asp:FormView>
                        </div>
                    </div>
                    <div class ="form-group">
                        <asp:Label runat="server" AssociatedControlID="ListBoxPatients" CssClass="col-md-2 control-label">Patient</asp:Label>
                        <div class="col-md-8">
                            <asp:ListBox ID="ListBoxPatients" runat="server" DataSourceID="CITAPP" DataTextField="Patients" DataValueField="Patients" Width="285px" OnSelectedIndexChanged="ListBoxPatients_SelectedIndexChanged">
                            </asp:ListBox>    
                            <asp:SqlDataSource ID="CITAPP" runat="server" ConnectionString="<%$ ConnectionStrings:CITAPPConnectionString %>" SelectCommand="SELECT [first_name] + ' ' + [last_name] AS 'Patients' FROM [Clientes] ORDER BY [last_name]"></asp:SqlDataSource>
                            
                            <asp:Button ID="BookButton" runat="server" OnClick="BookButton_Click" Text="Book Appointment" Width="286px" />

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:TextBox ID="idBox" runat="server"></asp:TextBox>

    </form>
    <div class="container body-content">
                <footer>
                    <p>&copy; <%: DateTime.Now.Year %> - CITAPP</p>
                </footer>
    </div>
</body>
</html>

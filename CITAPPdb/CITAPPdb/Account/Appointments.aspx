<%@ Page  Title="Appointment" Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="CITAPPdb.Account.Appointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
                        <asp:Label runat="server" AssociatedControlID="ApptDate" CssClass="col-md-2 control-label">Selected Date</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="ApptDate" CssClass="form-control" OnTextChanged="ApptDate_TextChanged"/>
                        </div>
                    </div>
                    <div class ="form-group">
                        <asp:Label runat="server" AssociatedControlID="ListBoxPatients" CssClass="col-md-2 control-label">Patient</asp:Label>
                        <div class="col-md-8">
                            <asp:ListBox ID="ListBoxPatients" runat="server" DataSourceID="CITAPP" DataTextField="Patients" DataValueField="Patients" Width="285px">
                            </asp:ListBox>    
                            <asp:SqlDataSource ID="CITAPP" runat="server" ConnectionString="<%$ ConnectionStrings:CITAPPConnectionString %>" SelectCommand="SELECT [first_name] + ' ' +  [last_name] AS 'Patients' FROM [Clientes] ORDER BY [last_name]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>

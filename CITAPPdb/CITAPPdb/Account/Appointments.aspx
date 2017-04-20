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
</body>
</html>

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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                <EditItemTemplate>
                                    Patients:
                                    <asp:TextBox ID="PatientsTextBox" runat="server" Text='<%# Bind("Patients") %>' />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    Patients:
                                    <asp:TextBox ID="PatientsTextBox" runat="server" Text='<%# Bind("Patients") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    Patients:
                                    <asp:Label ID="PatientsLabel" runat="server" Text='<%# Bind("Patients") %>' />
                                    <br />

                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                    <div class ="form-group">
                        <asp:Label runat="server" AssociatedControlID="ListBoxPatients" CssClass="col-md-2 control-label">Patient</asp:Label>
                        <div class="col-md-8">
                            <asp:ListBox ID="ListBoxPatients" runat="server" DataSourceID="CITAPP" DataTextField="Patients" DataValueField="Patients" Width="285px" OnSelectedIndexChanged="ListBoxPatients_SelectedIndexChanged">
                            </asp:ListBox>    
                            <asp:SqlDataSource ID="CITAPP" runat="server" ConnectionString="<%$ ConnectionStrings:CITAPPConnectionString2 %>" SelectCommand="SELECT TOP 1000 [first_name] + ' ' + [last_name] AS 'Patients' FROM [Clientes] ORDER BY [last_name]"></asp:SqlDataSource>
                            
                            <asp:Button ID="BookButton" runat="server" OnClick="BookButton_Click" Text="Book Appointment" Width="286px" />

                            

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:TextBox ID="idBox" runat="server"></asp:TextBox>

        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View Previous Appointments" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="View Current Appointments" />
        <br />
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="Column1" Height="110px" Width="144px"></asp:ListBox>
        <br />
        <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="Column1" Height="110px" Width="144px"></asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CITAPPConnectionString2 %>" SelectCommand="SELECT 'Doctor: ' + doctor + ' Paciente: ' + paciente + ' Fecha: ' + convert(varchar(25), fecha, 120) FROM Citas AS cita WHERE fecha &gt; GETDATE() ORDER BY fecha ASC"></asp:SqlDataSource>

    </form>
</body>
</html>

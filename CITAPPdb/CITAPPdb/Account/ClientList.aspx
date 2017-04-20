<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientList.aspx.cs" Inherits="CITAPPdb.Account.ClientList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

  .col-md-2 {
    width: 16.666666666666664%;
  }
  .col-md-1,
  .col-md-2,
  .col-md-3,
  .col-md-4,
  .col-md-5,
  .col-md-6,
  .col-md-7,
  .col-md-8,
  .col-md-9,
  .col-md-10,
  .col-md-11 {
    float: left;
  }
  
.col-xs-1,
.col-xs-2,
.col-xs-3,
.col-xs-4,
.col-xs-5,
.col-xs-6,
.col-xs-7,
.col-xs-8,
.col-xs-9,
.col-xs-10,
.col-xs-11,
.col-xs-12,
.col-sm-1,
.col-sm-2,
.col-sm-3,
.col-sm-4,
.col-sm-5,
.col-sm-6,
.col-sm-7,
.col-sm-8,
.col-sm-9,
.col-sm-10,
.col-sm-11,
.col-sm-12,
.col-md-1,
.col-md-2,
.col-md-3,
.col-md-4,
.col-md-5,
.col-md-6,
.col-md-7,
.col-md-8,
.col-md-9,
.col-md-10,
.col-md-11,
.col-md-12,
.col-lg-1,
.col-lg-2,
.col-lg-3,
.col-lg-4,
.col-lg-5,
.col-lg-6,
.col-lg-7,
.col-lg-8,
.col-lg-9,
.col-lg-10,
.col-lg-11,
.col-lg-12 {
  position: relative;
  min-height: 1px;
  padding-right: 15px;
  padding-left: 15px;
}

label {
  display: inline-block;
  margin-bottom: 5px;
  font-weight: bold;
}

*,
*:before,
*:after {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}

  * {
    color: #000 !important;
    text-shadow: none !important;
    background: transparent !important;
    box-shadow: none !important;
  }
        .form-control {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        

    </div>
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Patients" DataValueField="Patients" Height="221px" Width="1260px"></asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CITAPPConnectionString2 %>" SelectCommand="SELECT TOP 5000 first_name  + ' ' + last_name + '. Doctor: ' + doctor AS 'Patients' FROM Clientes"></asp:SqlDataSource>
        <p>
                        <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 control-label" ID="Label1">Name</asp:Label>
                            <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" Width="295px"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button runat="server" OnClick="CreateUser_Click" Text="List My Clients" CssClass="btn btn-success" ID="Button1" />
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="List All Client" />
                    </p>
        <asp:ListBox ID="ListBox2" runat="server" Height="221px" Width="1260px"></asp:ListBox>
    </form>
</body>
</html>

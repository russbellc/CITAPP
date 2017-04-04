<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CITAPPdb.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-4">
        <h2><%: Title %>.</h2>
        <h3>Get in touch with us.</h3>
        <address>
            1234 Avenida Doctores<br />
            Tijuana, BC 22000<br />
            <abbr title="Phone">P:</abbr>
            664.555.0100
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@citapp.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@citapp.com</a>
        </address>
    </div>

    <div class="col-md-8">
        <img class="img-responsive" src="/image/Call.jpg"/>
    </div>
</asp:Content>

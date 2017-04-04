<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CITAPPdb.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="col-md-8">
        <div class="form-horizontal">
            <h4>Create a new account</h4>
            <hr />
            <asp:ValidationSummary runat="server" CssClass="text-danger" />
            <i style="font-size:23px" class="glyphicon glyphicon-user"></i><span style="font-size:25px"> NEW PATIENT</span>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 control-label">Name</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="FirstName" CssClass="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="LastName" CssClass="col-md-2 control-label">Last Name</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="LastName" CssClass="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Age" CssClass="col-md-2 control-label">Age</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="Age" CssClass="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Phone" CssClass="col-md-2 control-label">Phone</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="Phone" CssClass="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Address" CssClass="col-md-2 control-label">Address</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="Address" CssClass="form-control"/>
                </div>
            </div>
            <div class="checkbox">
                <label><input type="checkbox"> Create patient's medical history record</label>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <img class="img-responsive" src="/image/default-profile.png" />
        <asp:Button runat="server" OnClick="UploadPicture_Click" Text="Upload Profile Picture" CssClass="btn btn-default"/>
    </div>
    


    <div class="col-md-12">    
        <div class="col-md-12">
            <i style="font-size:23px" class="glyphicon glyphicon-lock"></i><span style="font-size:25px"> USER</span>
            <p>*Password must have at least one non letter or digit character.</p>
            <p>*Password must have at least one upper case and one lower case letter.</p>
        </div>
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="The password field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-offset-2 col-md-12">
            <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
        </div>
    </div>
</asp:Content>

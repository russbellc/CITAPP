using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views : System.Web.UI.Page
{
    private bool buttonDocClicked = false;
    private bool buttonVisitClicked = false;
    public void GlobalAppts()
    {
        GridViewGlobalAppts.DataSource = DbHelper.ExecuteDataTable("spGetAllAppointments");
        GridViewGlobalAppts.DataBind();
    }

    public void ApptsPerDocId(string SearchId)
    {
        GridViewDocIdAppt.DataSource = DBHelperWithParams.ExecuteDataTableParams("spGetOneDoctorsAppointments", SearchId);
        GridViewDocIdAppt.DataBind();
    }

    public void GlobalPatientUsers()
    {
        GridViewPatientUsers.DataSource = DbHelper.ExecuteDataTable("spGetPatientUsers");
        GridViewPatientUsers.DataBind();
    }

    public void GlobalDocUsers()
    {
        GridViewDocUsers.DataSource = DbHelper.ExecuteDataTable("spGetDoctorUsers");
        GridViewDocUsers.DataBind();
    }

    public void VisitPerPatient()
    {

    }

    public void CompletedVisits()
    {
        GridViewCompletedVisits.DataSource = DbHelper.ExecuteDataTable("spGetGlobalPatientVisits");
        GridViewCompletedVisits.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        GridViewGlobalAppts.Visible = false;
        GridViewPatientUsers.Visible = false;
        GridViewDocUsers.Visible = false;
        GridViewCompletedVisits.Visible = false;
        LabelVisits.Visible = false;
        LabelPatientUsers.Visible = false;
        LabelDocUser.Visible = false;
        SearchButton.Visible = false;
        SearchTextBox.Visible = false;
        LabelDocApptById.Visible = false;
        LabelAllAppts.Visible = false;
        GridViewDocIdAppt.Visible = false;
        LabelDocId.Visible = false;
    }

    protected void GridViewDocUsers_SelectedIndexChanged(object sender, GridViewPageEventArgs e)
    {
    }

    protected void GridViewDocUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewDocUsers.PageIndex = e.NewPageIndex;
        GlobalDocUsers();
    }

    protected void GridViewPatientUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewPatientUsers.PageIndex = e.NewPageIndex;
        GlobalPatientUsers();
    }

    protected void GridViewCompletedVisits_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewCompletedVisits.PageIndex = e.NewPageIndex;
        CompletedVisits();
    }

    protected void GridViewGlobalAppts_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       GridViewGlobalAppts.PageIndex = e.NewPageIndex;
       GlobalAppts();
    }

    protected void GridViewDocIdAppt_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewDocIdAppt.PageIndex = e.NewPageIndex;
        ApptsPerDocId(SearchTextBox.Text);
    }

    protected void ButtonAllAppts_Click(object sender, EventArgs e)
    {
        LabelButtons.Text = "Press the clear button to make another search";
        ButtonAllAppts.Visible = false;
        ButtonDocAppts.Visible = false;
        ButtonPatientUsers.Visible = false;
        ButtonDoctorUsers.Visible = false;
        ButtonPatientVisits.Visible = false;
        ButtonGlobalVisit.Visible = false;
        GridViewGlobalAppts.Visible = true;
        LabelAllAppts.Visible = true;
        GlobalAppts();
    }

    protected void ButtonDocAppts_Click(object sender, EventArgs e)
    {
        LabelButtons.Text = "Press the clear button to make another search";
        LabelDocApptById.Text = "Check Appointments per Doctor by using Doctor Id";
        ButtonAllAppts.Visible = false;
        ButtonPatientUsers.Visible = false;
        ButtonDoctorUsers.Visible = false;
        ButtonPatientVisits.Visible = false;
        ButtonGlobalVisit.Visible = false;
        ButtonDocAppts.Visible = false;
        SearchTextBox.Visible = true;
        SearchButton.Visible = true;
        LabelDocApptById.Visible = true;
        GridViewDocIdAppt.Visible = true;
        buttonDocClicked = true;

    }

    protected void ButtonPatientUsers_Click(object sender, EventArgs e)
    {
        LabelButtons.Text = "Press the clear button to make another search";
        ButtonAllAppts.Visible = false;
        ButtonDocAppts.Visible = false;
        ButtonDoctorUsers.Visible = false;
        ButtonPatientVisits.Visible = false;
        ButtonGlobalVisit.Visible = false;
        ButtonPatientUsers.Visible = false;
        GridViewPatientUsers.Visible = true;
        GlobalPatientUsers();
        LabelPatientUsers.Visible = true;
    }

    protected void ButtonDoctorUsers_Click(object sender, EventArgs e)
    {
        LabelButtons.Text = "Press the clear button to make another search";
        ButtonAllAppts.Visible = false;
        ButtonDocAppts.Visible = false;
        ButtonPatientUsers.Visible = false;
        ButtonPatientVisits.Visible = false;
        ButtonGlobalVisit.Visible = false;
        ButtonDoctorUsers.Visible = false;
        GridViewDocUsers.Visible = true;
        GlobalDocUsers();
        LabelDocUser.Visible = true;

    }

    protected void ButtonPatientVisits_Click(object sender, EventArgs e)
    {
        LabelButtons.Text = "Press the clear button to make another search";
        LabelDocApptById.Visible = true;
        LabelDocApptById.Text = "Check Patient Visits by using Patient Id";
        ButtonAllAppts.Visible = false;
        ButtonDocAppts.Visible = false;
        ButtonPatientUsers.Visible = false;
        ButtonDoctorUsers.Visible = false;
        ButtonGlobalVisit.Visible = false;
        ButtonPatientVisits.Visible = false;
        SearchTextBox.Text = String.Empty;
        SearchTextBox.Visible = true;
        SearchButton.Visible = true;
        buttonVisitClicked = true;
    }

    protected void ButtonGlobalVisit_Click(object sender, EventArgs e)
    {
        LabelButtons.Text = "Press the clear button to make another search";
        ButtonAllAppts.Visible = false;
        ButtonDocAppts.Visible = false;
        ButtonPatientUsers.Visible = false;
        ButtonDoctorUsers.Visible = false;
        ButtonPatientVisits.Visible = false;
        ButtonGlobalVisit.Visible = false;
        GridViewCompletedVisits.Visible = true;
        CompletedVisits();
        LabelVisits.Visible = true;
    }

    protected void ButtonClear_Click(object sender, EventArgs e)
    {
        ButtonAllAppts.Visible = true;
        ButtonDocAppts.Visible = true;
        ButtonPatientUsers.Visible = true;
        ButtonDoctorUsers.Visible = true;
        ButtonPatientVisits.Visible = true;
        ButtonGlobalVisit.Visible = true;
        GridViewDocUsers.Visible = false;
        GridViewCompletedVisits.Visible = false;
        GridViewPatientUsers.Visible = false;
        LabelVisits.Visible = false;
        LabelPatientUsers.Visible = false;
        LabelDocUser.Visible = false;
        GridViewGlobalAppts.Visible = false;
        SearchButton.Visible = false;
        SearchTextBox.Visible = false;
        LabelDocApptById.Visible = false;
        LabelAllAppts.Visible = false;
        LabelDocApptById.Visible = false;
        LabelButtons.Text = "Choose a table to display from the buttons below";
        GridViewDocIdAppt.Visible = false;
        SearchTextBox.Text = String.Empty;
        buttonDocClicked = false;
        buttonVisitClicked = false;
        GridViewDocIdAppt.DataBind();

    }

    protected void SearchTextBox_TextChanged(object sender, EventArgs e)
    {
        string SearchId = SearchTextBox.Text;
        return;
    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        GridViewDocIdAppt.Visible = true;
        ApptsPerDocId(SearchTextBox.Text);
        
        //try
        //{
        //    if (buttonDocClicked == true)
        //        ApptsPerDocId(Convert.ToInt32(SearchTextBox.Text));
        //    //        ApptsPerDocId(SearchTextBox.Text);
        //    //    else if (buttonVisitClicked)
        //    //        VisitPerPatient();
        //}
        //catch
        //{

        //}

        }
}
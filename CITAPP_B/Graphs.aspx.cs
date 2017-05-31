using DotNet.Highcharts.Enums;
using DotNet.Highcharts.Helpers;
using DotNet.Highcharts.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class Graphs : System.Web.UI.Page
{

    public class DoctorEntity
    {
        public string Name { get; set; }
        public int Value { get; set; }
    }

    public List<DoctorEntity> DoctorAppointments()
    {
        List<DoctorEntity> DoctorAppts = new List<DoctorEntity>();
        foreach (DataRow dr in DbHelper.ExecuteDataTable("spGetDoctors").Rows)
        {
            DoctorAppts.Add(new DoctorEntity
            {
                Name = dr["Name"].ToString(),
                Value = Convert.ToInt32(dr["Value"])
            });
        }
        return DoctorAppts;
    }

    public void DoctorAvailableAppointments()
    {
        // CREATE PIE CHART FOR AVAILABLE APPOITNMETS PER DOCTOR-----------------------------------------------------------------
        List<DoctorEntity> DocList = DoctorAppointments();
        object[] chartData = new object[DocList.Count];
        for (int index = 0; index < DocList.Count; index++)
        {
            chartData[index] = new object[] { DocList[index].Name, DocList[index].Value };
        }
        

        DotNet.Highcharts.Highcharts DoctorApptCount = new DotNet.Highcharts.Highcharts("DoctorApptCount")
        .InitChart(new Chart {Type = ChartTypes.Column })
        .SetPlotOptions(new PlotOptions
        {
            Column = new PlotOptionsColumn
            {
                AllowPointSelect = true,
                Cursor = Cursors.Pointer,
                DataLabels = new PlotOptionsColumnDataLabels
                {
                    Color = ColorTranslator.FromHtml("#000000"),
                    Formatter = "function() {return '<b>DocId '+ this.point.x + '</b>: '+ Highcharts.numberFormat(this.percentage, 2)  +' %'; }"
                }
            }
        })
        .SetYAxis(new YAxis
        {
            Title = new YAxisTitle
            {
                Text = "Available Appointments"
            }
        })
        .SetXAxis(new XAxis
        {
            Title = new XAxisTitle
            {
                Text = "Doctor Id"
            }

        })
        .SetTitle(new Title { Text = "Available Appointments Per Doctor" })
        .SetSeries(new Series
        {
            Name = "Appointments",
            Data = new Data(chartData)
        });
        DoctorAptChart.Text = DoctorApptCount.ToHtmlString();
    }

    public class Specialties
    {
        public string Name { get; set; }
        public int Value { get; set; }
    }

    public List<Specialties> DoctorSpecialtiesListing()
    {
        List<Specialties> DoctorSpecialtiesList = new List<Specialties>();
        foreach (DataRow dr in DbHelper.ExecuteDataTable("spGetDoctorsSpecialties").Rows)
        {
            DoctorSpecialtiesList.Add(new Specialties
            {
                Name = dr["Name"].ToString(),
                Value = Convert.ToInt32(dr["Value"])
            });
        }
        return DoctorSpecialtiesList;
    }

    public void DoctorSpecialtiesChart()
    {
        // CREATE PIE CHART FOR DIFFERENT DOCTOR SPECIALTIES-----------------------------------------------------------------
        List<Specialties> SpecialList = DoctorSpecialtiesListing();
        object[] chartData = new object[SpecialList.Count];
        for (int index = 0; index < SpecialList.Count; index++)
        {
            chartData[index] = new object[] { SpecialList[index].Name, SpecialList[index].Value };
        }
        DotNet.Highcharts.Highcharts SpecialChart = new DotNet.Highcharts.Highcharts("SpecialChart")
            .InitChart(new Chart { PlotShadow = false })
            .SetTitle(new Title { Text = "Medical Specialties" })
            .SetPlotOptions(new PlotOptions
            {
                Pie = new PlotOptionsPie
                {
                    AllowPointSelect = true,
                    Cursor = Cursors.Pointer,
                    DataLabels = new PlotOptionsPieDataLabels
                    {
                        Color = ColorTranslator.FromHtml("#000000"),
                        ConnectorColor = ColorTranslator.FromHtml("#000000"),
                        Formatter = "function() {return '<b>'+ this.point.name + '</b>: '+ Highcharts.numberFormat(this.percentage, 2)  +' %'; }"
                    }
                }
            })
            .SetSeries(new Series
            {
                Type = ChartTypes.Pie,
                Name = "Doctors",
                Data = new Data(chartData)
            });
        SpecialtiesChartLit.Text = SpecialChart.ToHtmlString();
    }

    public class Alergies
    {
        public string Name { get; set; }
        public int Value { get; set; }
    }

    public List<Alergies> AlergyListing()
    {
        List<Alergies> DoctorSpecialtiesList = new List<Alergies>();
        foreach (DataRow dr in DbHelper.ExecuteDataTable("spGetPatientAlegries").Rows)
        {
            DoctorSpecialtiesList.Add(new Alergies
            {
                Name = dr["Name"].ToString(),
                Value = Convert.ToInt32(dr["Value"])
            });
        }
        return DoctorSpecialtiesList;
    }

    public void PatientAlergiesChart()
    {

        // CREATE PIE CHART FOR DIFFERENT PATIENT ALERGIES-----------------------------------------------------------------
        List<Alergies> AlergyList = AlergyListing();
        object[] chartData = new object[AlergyList.Count];
        for (int index = 0; index < AlergyList.Count; index++)
        {
            chartData[index] = new object[] { AlergyList[index].Name, AlergyList[index].Value };
        }


            DotNet.Highcharts.Highcharts AlergiesHighchart = new DotNet.Highcharts.Highcharts("AlergiesHighchart")
            .InitChart(new Chart { PlotShadow = false })
            .SetTitle(new Title { Text = "All Patient Allergies" })
            .SetPlotOptions(new PlotOptions
            {
                Pie = new PlotOptionsPie
                {
                    AllowPointSelect = true,
                    Cursor = Cursors.Pointer,
                    DataLabels = new PlotOptionsPieDataLabels
                    {
                        Color = ColorTranslator.FromHtml("#000000"),
                        ConnectorColor = ColorTranslator.FromHtml("#000000"),
                        Formatter = "function() {return '<b>'+ this.point.name + '</b>: '+ Highcharts.numberFormat(this.percentage, 2)  +' %'; }"
                    }
                }
            })
            .SetSeries(new Series
            {
                Type = ChartTypes.Pie,
                Name = "Patients",
                Data = new Data(chartData)
            });
        AlergyChart.Text = AlergiesHighchart.ToHtmlString();
    }

    public class HeightWeight
    {
        public double Height { get; set; }
        public double Weight { get; set; }
    }

    public List<HeightWeight> HeightWeightListing()
    {
        List<HeightWeight> ListPatientsMeasurements = new List<HeightWeight>();
       
        foreach (DataRow dr in DbHelper.ExecuteDataTable("spGetPatientHeightWeight").Rows)
        {
            ListPatientsMeasurements.Add(new HeightWeight
            {
                Height = Convert.ToDouble(dr["Estatura"]),
                Weight = Convert.ToDouble(dr["Peso"])
            });
        }
        return ListPatientsMeasurements;
    }

    public void PatientMeasurements()
    {
        // CREATE PIE CHART FOR PATIENTS HEIGHT AND WEIGHT SCATTER PLOTTING-----------------------------------
        List<HeightWeight> MeasurementList = HeightWeightListing();
        object[] chartData = new object[MeasurementList.Count];
        for (int index = 0; index < MeasurementList.Count; index++)
        {
            chartData[index] = new object[] { MeasurementList[index].Height, MeasurementList[index].Weight };
        }

        object[] subjects = new object[6740];
        for (int i = 0; i < MeasurementList.Count; i++)
        {
            subjects[i] = new object[] { MeasurementList[i].Height, MeasurementList[i].Weight };

            Console.WriteLine(subjects[i]);
        }

        DotNet.Highcharts.Highcharts MeasurementChart = new DotNet.Highcharts.Highcharts("MeasurementChart")
            .InitChart(new Chart { PlotShadow = false })
            .SetTitle(new Title { Text = "Patients Height and Weight" })
            .SetXAxis(new XAxis {
                Title = new XAxisTitle
                {
                    Text = "Height (Mts)"
                },
                StartOnTick = true,
                EndOnTick = true,
                ShowLastLabel = true
            })
            .SetYAxis(new YAxis {

                Title = new YAxisTitle
                {
                    Text = "Weight (kg)"
                }
            })
            .SetPlotOptions(new PlotOptions
            {
                Scatter = new PlotOptionsScatter
                {
                    AllowPointSelect = true,
                    Cursor = Cursors.Pointer,
                    DataLabels = new PlotOptionsScatterDataLabels
                    {
                        Color = ColorTranslator.FromHtml("#000000"),
                        Formatter = "function() {return '<b>'+ this.point.x + '</b>: '+ this.point.y; }"
                    }
                }
            })
            .SetSeries(new Series
            {
                Type = ChartTypes.Scatter,
                Name = "Patients",
                Data = new Data(chartData)
            });
        PatientHeightWeightChart.Text = MeasurementChart.ToHtmlString();
    }

    public class BloodTypes
    {
        public string Name { get; set; }
        public int Value { get; set; }
    }

    public List<BloodTypes> BloodListing()
    {
        List<BloodTypes> BloodTypesList = new List<BloodTypes>();
        foreach (DataRow dr in DbHelper.ExecuteDataTable("spGetPatientBloodType").Rows)
        {
            BloodTypesList.Add(new BloodTypes
            {
                Name = dr["Name"].ToString(),
                Value = Convert.ToInt32(dr["Value"])
            });
        }
        return BloodTypesList;
    }

    public void BloodTypesChart()
    {
        List<BloodTypes> BloodList = BloodListing();
        List<BloodTypes> BloodName = BloodListing();
        List<BloodTypes> Bloodcount = BloodListing();
        object[] chartData = new object[BloodList.Count];
        for (int index = 0; index < BloodList.Count; index++)
        {
            chartData[index] = new object[] { BloodList[index].Value };
        }

        DotNet.Highcharts.Highcharts BloodChart = new DotNet.Highcharts.Highcharts("BloodChart")
        .SetYAxis(new YAxis {
            Title = new YAxisTitle
            {
                Text = "Amount of Patients"
            },
        })
        .SetXAxis(new XAxis
        {
            Title = new XAxisTitle
            {
                Text = "Blood Type"
            },
            Categories = new[] {
                BloodList[0].Name,
                BloodList[1].Name,
                BloodList[2].Name,
                BloodList[3].Name,
                BloodList[4].Name,
                BloodList[5].Name,
                BloodList[6].Name,
                BloodList[7].Name
            }
        })
        .SetTitle(new Title { Text = "Patient Blood Types" })
        .SetSeries(new Series
        {
            Name = "Patients",
            Data = new Data(chartData)
        });
        BloodTypeChart.Text = BloodChart.ToHtmlString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DoctorAvailableAppointments();
        PatientMeasurements();
        DoctorSpecialtiesChart();
        BloodTypesChart();
        PatientAlergiesChart();
    }


    
}
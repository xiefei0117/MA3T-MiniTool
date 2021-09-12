using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;

namespace MA3T_test1
{
    public partial class _MultiResults : System.Web.UI.Page
    {
        int numScenario;
        string[] scenarioID;
        string[] scenarioDescription;
        string[] scenarioName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["numScenario"] == null)
                    Response.Redirect("~/MiniTool");
                obtainValue();
                assignSummaryLabelScenarios();
                generateGraph();


            }
            if(IsPostBack)
            {

            }
        }

        protected void obtainValue()
        {
            numScenario = (int)Session["numScenario"];
            scenarioID = (String[])Session["scenarioID"];
            scenarioDescription = (String[])Session["scenarioDescription"];
            scenarioName = (String[])Session["scenarioName"];
        }


        protected void assignSummaryLabelScenarios()
        {
            labelScenario1.Text = scenarioName[0] + ": " + scenarioDescription[0];
            labelScenario2.Text = scenarioName[1] + ": " + scenarioDescription[1];

            if (numScenario >= 3)
            {
                labelScenario3.Text = scenarioName[2] + ": " + scenarioDescription[2];
                if(numScenario >= 4)
                {
                    labelScenario4.Text = scenarioName[3] + ": " + scenarioDescription[3];
                    if (numScenario >= 5)
                        labelScenario5.Text = scenarioName[4] + ": " + scenarioDescription[4];
                }

            }
        }

        protected void generateIndividualGraph(String scenarioName, String scenarioID, Chart chartName, string sql, OleDbConnection sqlConn, string xName, string yName)
        {
            chartName.Series.Add(scenarioName);
            chartName.Series[scenarioName].ChartType = SeriesChartType.Line;
            chartName.Series[scenarioName].BorderWidth = 2;

            using (OleDbCommand com = new OleDbCommand(sql, sqlConn))
            {
                com.Parameters.AddWithValue("@Scenario", scenarioID);
                OleDbDataReader myReader = com.ExecuteReader();
                chartName.DataBind();
                chartName.Series[scenarioName].Points.DataBindXY(myReader, xName, myReader, yName);
                com.Dispose();
            }
        }

        protected void generateGraph()
        {

            OleDbConnection sqlConn = new OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings["fuelEconomy"].ConnectionString);
            sqlConn.Open();
            string sqlEVSale = "SELECT Year, BEV FROM resultsSale WHERE Scenario = @Scenario";
            string sqlGasoline = "SELECT Year, [Gasoline (trillion BTU)] FROM resultsEnergy WHERE Scenario = @Scenario";
            string sqlElectricity = "SELECT Year, [Electricity (trillion BTU)] FROM resultsEnergy WHERE Scenario = @Scenario";

            generateIndividualGraph(scenarioName[0], scenarioID[0], chartEVMarket, sqlEVSale, sqlConn, "Year", "BEV");
            generateIndividualGraph(scenarioName[1], scenarioID[1], chartEVMarket, sqlEVSale, sqlConn, "Year", "BEV");
            generateIndividualGraph(scenarioName[0], scenarioID[0], chartGasoline, sqlGasoline, sqlConn, "Year", "Gasoline (trillion BTU)");
            generateIndividualGraph(scenarioName[1], scenarioID[1], chartGasoline, sqlGasoline, sqlConn, "Year", "Gasoline (trillion BTU)");
            generateIndividualGraph(scenarioName[0], scenarioID[0], chartElectricity, sqlElectricity, sqlConn, "Year", "Electricity (trillion BTU)");
            generateIndividualGraph(scenarioName[1], scenarioID[1], chartElectricity, sqlElectricity, sqlConn, "Year", "Electricity (trillion BTU)");


            if (numScenario>=3)
            {
                generateIndividualGraph(scenarioName[2], scenarioID[2], chartEVMarket, sqlEVSale, sqlConn, "Year", "BEV");
                generateIndividualGraph(scenarioName[2], scenarioID[2], chartGasoline, sqlGasoline, sqlConn, "Year", "Gasoline (trillion BTU)");
                generateIndividualGraph(scenarioName[2], scenarioID[2], chartElectricity, sqlElectricity, sqlConn, "Year", "Electricity (trillion BTU)");


                if (numScenario>=4)
                {
                    generateIndividualGraph(scenarioName[3], scenarioID[3], chartEVMarket, sqlEVSale, sqlConn, "Year", "BEV");
                    generateIndividualGraph(scenarioName[3], scenarioID[3], chartGasoline, sqlGasoline, sqlConn, "Year", "Gasoline (trillion BTU)");
                    generateIndividualGraph(scenarioName[3], scenarioID[3], chartElectricity, sqlElectricity, sqlConn, "Year", "Electricity (trillion BTU)");

                    if (numScenario == 5)
                    {
                        generateIndividualGraph(scenarioName[4], scenarioID[4], chartEVMarket, sqlEVSale, sqlConn, "Year", "BEV");
                        generateIndividualGraph(scenarioName[4], scenarioID[4], chartGasoline, sqlGasoline, sqlConn, "Year", "Gasoline (trillion BTU)");
                        generateIndividualGraph(scenarioName[4], scenarioID[4], chartElectricity, sqlElectricity, sqlConn, "Year", "Electricity (trillion BTU)");
                    }
                    
                }


            }

        }

    }
}
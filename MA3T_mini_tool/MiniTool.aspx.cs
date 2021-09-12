using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data.OleDb;
using Ionic.Zip;

namespace MA3T_test1
{

    public partial class _SingleMiniTool : Page
    {
        bool showScenario1;
        bool showScenario2;
        bool showScenario3;
        bool showScenario4;
        bool showScenario5;




        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                keepSession();
                Auto_Invisible();
                Auto_Display();
                checkToShowScenario();
                Session["currentScenario"] = labelSummaryString.Text;

            }
            if (IsPostBack)
            {
                Auto_Invisible();
                Auto_Display();
                if (ddlUtilitySegment.SelectedValue == "733")
                    chartResultsUtility.Titles.Add("CA.Central City.Early Adopters.ModestDriver.HomeChargeYes.WorkChargeYes");
                else
                    chartResultsUtility.Titles.Add("CA.Central City.Late Majority.FrequentDriver.HomeChargeYes.WorkChargeYes");
            }
        }

        private void keepSession()
        {
            if (Session["numScenario"] == null)
            {
                Session["numScenario"] = 0;
                return;
            }
            if((int) Session["numScenario"] > 0 && Session["aScenario1InnerText"] != null)
            {
                aScenario1.InnerText = (string) Session["aScenario1InnerText"];
                aScenario1.Title = (string)Session["aScenario1InnerText"];
                hiddenScenario1.Value = (string) Session["hiddenScenario1Value"];
                if((int)Session["numScenario"] > 1 && Session["aScenario2InnerText"] != null)
                {
                    aScenario2.InnerText = (string)Session["aScenario2InnerText"];
                    aScenario2.Title = (string)Session["aScenario2InnerText"];
                    hiddenScenario2.Value = (string)Session["hiddenScenario2Value"];
                    if ((int)Session["numScenario"] > 2 && Session["aScenario3InnerText"] != null)
                    {
                        aScenario3.InnerText = (string)Session["aScenario3InnerText"];
                        aScenario3.Title = (string)Session["aScenario3InnerText"];
                        hiddenScenario3.Value = (string)Session["hiddenScenario3Value"];
                        if ((int)Session["numScenario"] > 3 && Session["aScenario4InnerText"] != null)
                        {
                            aScenario4.InnerText = (string)Session["aScenario4InnerText"];
                            aScenario4.Title = (string)Session["aScenario4InnerText"];
                            hiddenScenario4.Value = (string)Session["hiddenScenario4Value"];
                            if ((int)Session["numScenario"] > 4 && Session["aScenario5InnerText"] != null)
                            {
                                aScenario5.InnerText = (string)Session["aScenario5InnerText"];
                                aScenario5.Title = (string)Session["aScenario5InnerText"];
                                hiddenScenario5.Value = (string)Session["hiddenScenario5Value"];
                            }
                        }
                    }
                }
            }
        }

        private void checkToShowScenario()
        {
            if ((int)Session["numScenario"] >= 1)
            {
                showScenario1 = true;
                divScenarioSummary.Visible = true;
                if ((int)Session["numScenario"] >= 2)
                {
                    showScenario2 = true;
                    if ((int)Session["numScenario"] >= 3)
                    {
                        showScenario3 = true;
                        if ((int)Session["numScenario"] >= 4)
                        {
                            showScenario4 = true;
                            if ((int)Session["numScenario"] >= 5)
                                showScenario5 = true;
                            else
                                showScenario5 = false;
                        }
                        else
                            showScenario4 = false;
                    }
                    else
                        showScenario3 = false;
                }
                else
                    showScenario2 = false;
            }
            else {
                showScenario1 = false;
                divScenarioSummary.Visible = false;
            }

            divScenario1.Visible = showScenario1;
            divScenario2.Visible = showScenario2;
            divScenario3.Visible = showScenario3;
            divScenario4.Visible = showScenario4;
            divScenario5.Visible = showScenario5;

            if ((int)Session["numScenario"] >= 2)
                btnCompare.Enabled = true;
            else
                btnCompare.Enabled = false;
        }

        private void Auto_Invisible()
        {
            ma3tTechnology.Visible = false;
            ma3tInfrastructure.Visible = false;
            ma3tPolicy.Visible = false;
            ma3tConsumer.Visible = false;
            ICECost.Visible = false;
            FCCost.Visible = false;
            BatteryCost.Visible = false;
            MotorCost.Visible = false;
            saleResults.Visible = false;
            populationResults.Visible = false;
            energyResults.Visible = false;
            utilityResults.Visible = false;
        }

        private void Auto_Display()
        {

            if (ddlSelectSheet.SelectedValue == "Technology")
            {
                ma3tTechnology.Visible = true;
                if (ddlTechnologySelection.SelectedValue == "ICE/Trans/EmissionC")
                    ICECost.Visible = true;
                else if (ddlTechnologySelection.SelectedValue == "Fuel Cell")
                    FCCost.Visible = true;
                else if (ddlTechnologySelection.SelectedValue == "Battery")
                    BatteryCost.Visible = true;
                else if (ddlTechnologySelection.SelectedValue == "Motor/Electronics")
                    MotorCost.Visible = true;
            }
            else if (ddlSelectSheet.SelectedValue == "Consumer")
                ma3tConsumer.Visible = true;
            else if (ddlSelectSheet.SelectedValue == "Policy")
                ma3tPolicy.Visible = true;
            else
                ma3tInfrastructure.Visible = true;
            if (ddlResultCategory.SelectedValue == "LDV Sale")
            {
                saleResults.Visible = true;
                populationResults.Visible = false;
                energyResults.Visible = false;
                utilityResults.Visible = false;
            }
            else if (ddlResultCategory.SelectedValue == "LDV Fleet Size")
            {
                saleResults.Visible = false;
                populationResults.Visible = true;
                energyResults.Visible = false;
                utilityResults.Visible = false;
            }
            else if (ddlResultCategory.SelectedValue == "Energy")
            {
                saleResults.Visible = false;
                populationResults.Visible = false;
                energyResults.Visible = true;
                utilityResults.Visible = false;
            }
            else 
            {
                saleResults.Visible = false;
                populationResults.Visible = false;
                energyResults.Visible = false;
                utilityResults.Visible = true;
            }
            
            labelSummaryString.Text = summaryWithScenario();
            if (txtScenarioName.Text == string.Empty || labelSummaryString.Text != (string)Session["currentScenario"])
            {
                txtScenarioName.Text = labelSummaryString.Text;
                Session["currentScenario"] = labelSummaryString.Text;
            }
        }


        protected void btReset_Click(object sender, EventArgs e)
        {
            ddlBatteryCost.SelectedIndex = 0;
            ddlFCCost.SelectedIndex = 0;
            ddlICECost.SelectedIndex = 0;
            ddlMotorCost.SelectedIndex = 0;
            ddlInstantRebate.SelectedIndex = 0;
            ddlHomeWorkCharging.SelectedIndex = 0;
            ddlPublicCharging.SelectedIndex = 0;
            labelSummaryString.Text = summaryWithScenario();
            txtScenarioName.Text = labelSummaryString.Text;
        }

        protected void ddlICECost_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlICECost.SelectedValue == "Default")
                LabelDescriptionICECost.Text = "MA3T baseline powertrain cost (from Autonomie data), including ICE engine cost, transmission cost, and emission control cost. The powertrain unit cost for Car-Conv-SI is $33.3/KW by year 2050.";
            else
                LabelDescriptionICECost.Text = "The powertrain (ICE engine/transmission/emission control) unit cost achieves further reduction over time. For example, the powertrain unit cost for Car-Conv-SI is lowered to $30/KW by year 2050.";
        }

        protected void ddlFCCost_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFCCost.SelectedValue == "Default")
                LabelDescriptionFCCost.Text = "MA3T baseline fuel cell unit cost (from Autonomie data). For example, the fuel cell unit cost for Car-FC HEV is $37.4/KW by year 2050.";
            else
                LabelDescriptionFCCost.Text = "The fuel cell unit cost achieves further reduction over time. For example, the fuel cell unit cost for Car-FC HEV is lowered to $30/KW by year 2050.";
        }

        protected void ddlBatteryCost_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBatteryCost.SelectedValue == "Default")
                LabelDescriptionBatteryCost.Text = "MA3T baseline battery unit cost (from Autonomie data). For example, the battery unit cost for Car-EV 100 is $175/KWh by year 2050.";
            else
                LabelDescriptionBatteryCost.Text = "The battery unit cost achieves further reduction over time. For example, the battery unit cost for Car-EV 100 is lowered to $100/KWh by year 2050.";
        }

        protected void ddlMotorCost_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMotorCost.SelectedValue == "Default")
                LabelDescriptionMotorCost.Text = "MA3T baseline motor unit cost (from Autonomie data). For example, the motor unit cost for Car-EV 100 is $10.4/KW by year 2050.";
            else
                LabelDescriptionMotorCost.Text = "The motor unit cost achieves further reduction over time. For example, the motor unit cost for Car-EV 100 is lowered to $8/KW by year 2050.";
        }

        protected void ddlHomeWorkCharging_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlHomeWorkCharging.SelectedValue == "Default")
                LabelDescriptionHomeWorkCharging.Text = "MA3T baseline home and workplace charging availability. ";
            else if (ddlHomeWorkCharging.SelectedValue == "Alternative1")
                LabelDescriptionHomeWorkCharging.Text = "The overall home and workplace charging availability for each state is further increased compared to the baseline case.";
            else
                LabelDescriptionHomeWorkCharging.Text = "The overall home and workplace charging availability for each state is further increased compared to the moderate case. Both of home (city, suburb, and rural) and workplace charging availabilities reach 80% by year 2050.";
        }

        protected void ddlInstantRebate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlInstantRebate.SelectedValue == "Default")
                LabelDescriptionInstantRebate.Text = "MA3T baseline instant rebate. ";
            else if (ddlInstantRebate.SelectedValue == "Alternative1")
                LabelDescriptionInstantRebate.Text = "In addition to the baseline instant rebate, a short term rebate of $5000/year is added, which starts in year 2015 and lasts for 10 years.";
            else if (ddlInstantRebate.SelectedValue == "Alternative2")
                LabelDescriptionInstantRebate.Text = "In addition to the baseline instant rebate, a long term rebate of $5000/year is added, which starts in year 2015 and lasts until year of 2050.";
            else
                LabelDescriptionInstantRebate.Text = "In addition to the baseline instant rebate, both short term rebate (+5K Short) and long term rebate (+5K Long) are added.";
        }

        protected void ddlPublicCharging_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPublicCharging.SelectedValue == "Default")
                LabelDescriptionPublicCharging.Text = "MA3T baseline public charging availability.";
            else if (ddlPublicCharging.SelectedValue == "Alternative1")
                LabelDescriptionPublicCharging.Text = "The overall public charging availability for each state is further increased compared to the baseline case.";
            else
                LabelDescriptionPublicCharging.Text = "The overall public charging availability for each state is further increased compared to the Moderate case. All city, suburb, and rural public charging availabilities reach 80% by year 2050.";
        }

        protected void chartResultsSale_Load(object sender, EventArgs e)
        {
            foreach (ListItem item in cblSaleTechnologySelect.Items)
            {
                if (item.Selected)
                    chartResultsSale.Series[item.Value].Enabled = true;
                else
                    chartResultsSale.Series[item.Value].Enabled = false;
            }

        }

        protected void chartResultsPopulation_Load(object sender, EventArgs e)
        {
            foreach (ListItem item in cblPopulationTechnologySelect.Items)
            {
                if (item.Selected)
                    chartResultsPopulation.Series[item.Value].Enabled = true;
                else
                    chartResultsPopulation.Series[item.Value].Enabled = false;
            }

        }

        protected void chartResultsEnergy_Load(object sender, EventArgs e)
        {
            foreach (ListItem item in cblEnergySelect.Items)
            {
                if (item.Selected)
                    chartResultsEnergy.Series[item.Value].Enabled = true;
                else
                    chartResultsEnergy.Series[item.Value].Enabled = false;
            }

        }

        protected void chartResultsUtility_Load(object sender, EventArgs e)
        {
            foreach (ListItem item in cblUtilityTechnologySelect.Items)
            {
                if (item.Selected)
                    chartResultsUtility.Series[item.Value].Enabled = true;
                else
                    chartResultsUtility.Series[item.Value].Enabled = false;
            }
        }

        protected void btnSelectAllSale_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in cblSaleTechnologySelect.Items)
                item.Selected = true;
            foreach (ListItem item in cblSaleTechnologySelect.Items)
            {
                if (item.Selected)
                    chartResultsSale.Series[item.Value].Enabled = true;
                else
                    chartResultsSale.Series[item.Value].Enabled = false;
            }
        }

        protected void btnDeSelectAllSale_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in cblSaleTechnologySelect.Items)
                item.Selected = false;
            foreach (ListItem item in cblSaleTechnologySelect.Items)
            {
                if (item.Selected)
                    chartResultsSale.Series[item.Value].Enabled = true;
                else
                    chartResultsSale.Series[item.Value].Enabled = false;
            }
        }

        protected void btnDeSelectAllPopulation_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in cblPopulationTechnologySelect.Items)
                item.Selected = false;
            foreach (ListItem item in cblPopulationTechnologySelect.Items)
            {
                if (item.Selected)
                    chartResultsPopulation.Series[item.Value].Enabled = true;
                else
                    chartResultsPopulation.Series[item.Value].Enabled = false;
            }
        }

        protected void btnSelectAllPopulation_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in cblPopulationTechnologySelect.Items)
                item.Selected = true;
            foreach (ListItem item in cblPopulationTechnologySelect.Items)
            {
                if (item.Selected)
                    chartResultsPopulation.Series[item.Value].Enabled = true;
                else
                    chartResultsPopulation.Series[item.Value].Enabled = false;
            }
        }

        protected void btnSelectAllEnergy_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in cblEnergySelect.Items)
                item.Selected = true;
            foreach (ListItem item in cblEnergySelect.Items)
            {
                if (item.Selected)
                    chartResultsEnergy.Series[item.Value].Enabled = true;
                else
                    chartResultsEnergy.Series[item.Value].Enabled = false;
            }
        }

        protected void btnDeSelectAllEnergy_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in cblEnergySelect.Items)
                item.Selected = false;
            foreach (ListItem item in cblEnergySelect.Items)
            {
                if (item.Selected)
                    chartResultsEnergy.Series[item.Value].Enabled = true;
                else
                    chartResultsEnergy.Series[item.Value].Enabled = false;
            }
        }



        protected void btnSelectAllUtility_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in cblUtilityTechnologySelect.Items)
                item.Selected = true;
            foreach (ListItem item in cblUtilityTechnologySelect.Items)
            {
                if (item.Selected)
                    chartResultsUtility.Series[item.Value].Enabled = true;
                else
                    chartResultsUtility.Series[item.Value].Enabled = false;
            }
        }

        protected void btnDeSelectAllUtility_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in cblUtilityTechnologySelect.Items)
                item.Selected = false;
            foreach (ListItem item in cblUtilityTechnologySelect.Items)
            {
                if (item.Selected)
                    chartResultsUtility.Series[item.Value].Enabled = true;
                else
                    chartResultsUtility.Series[item.Value].Enabled = false;
            }
        }

        protected string summaryWithScenario()
        {
            bool flag1 = false;
            string summary = String.Empty;
            if(ddlICECost.SelectedValue == "Default" && ddlFCCost.SelectedValue == "Default" && ddlBatteryCost.SelectedValue == "Default" && 
                ddlMotorCost.SelectedValue == "Default" && ddlHomeWorkCharging.SelectedValue == "Default" && ddlInstantRebate.SelectedValue == "Default" &&
                ddlPublicCharging.SelectedValue == "Default")
            {
                summary += "baseline ";
                return summary;
            }

            if (ddlICECost.SelectedValue == "Alternative1")
            {
                summary += "ICE/Trans/EmissionC(Optimistic) ";
                flag1 = true;
            }
            if(ddlFCCost.SelectedValue == "Alternative1")
            {
                if (flag1 == true)
                    summary += "+ ";
                summary += "Fuel cell(Optimistic) ";
                flag1 = true;
            }
            if(ddlBatteryCost.SelectedValue == "Alternative1")
            {
                if (flag1 == true)
                    summary += "+ ";
                summary += "Battery(Optimistic) ";
                flag1 = true;
            }
            if(ddlMotorCost.SelectedValue == "Alternative1")
            {
                if (flag1 == true)
                    summary += "+ ";
                summary += "Motor(Optimistic) ";
                flag1 = true;
            }
            if(ddlHomeWorkCharging.SelectedValue == "Alternative1")
            {
                if (flag1 == true)
                    summary += "+ ";
                summary += "Consumer(Moderate) ";
                flag1 = true;
            }
            if(ddlHomeWorkCharging.SelectedValue == "Alternative2")
            {
                if (flag1 == true)
                    summary += "+ ";
                summary += "Consumer(Optimistic) ";
                flag1 = true;
            }
            if(ddlInstantRebate.SelectedValue == "Alternative1")
            {
                if (flag1 == true)
                    summary += "+ ";
                summary += "Policy(+5k Short) ";
                flag1 = true;
            }
            if(ddlInstantRebate.SelectedValue == "Alternative2")
            {
                if (flag1 == true)
                    summary += "+ ";
                summary += "Policy(+5k Long) ";
                flag1 = true;
            }
            if(ddlInstantRebate.SelectedValue == "Alternative3")
            {
                if (flag1 == true)
                    summary += "+ ";
                summary += "Policy(+5k Short/5k Long) ";
                flag1 = true;
            }
            if(ddlPublicCharging.SelectedValue == "Alternative1")
            {
                if (flag1 == true)
                    summary += "+ ";
                summary += "Infrastructure(Moderate) ";
                flag1 = true;
            }
            if(ddlPublicCharging.SelectedValue == "Alternative2")
            {
                if (flag1 == true)
                    summary += "+ ";
                summary += "Infrastructure(Optimistic) ";
                flag1 = true;
            }
            if (ddlICECost.SelectedValue != "Default" && ddlFCCost.SelectedValue != "Default" && ddlBatteryCost.SelectedValue != "Default" &&
                ddlMotorCost.SelectedValue != "Default" && ddlHomeWorkCharging.SelectedValue != "Default" && ddlInstantRebate.SelectedValue != "Default" &&
                ddlPublicCharging.SelectedValue != "Default")
            {
                return summary;
            }
            else
            {
                summary += "+ Baseline";
                return summary;
            }
        }

        protected string modifyScenarioName(string scenarioName)
        {
            string updatedName = scenarioName;
            bool sign = false;
            for (; !sign;)
            {
                if (updatedName == aScenario1.InnerText || updatedName == aScenario2.InnerText || updatedName == aScenario3.InnerText || updatedName == aScenario4.InnerText || updatedName == aScenario5.InnerText)
                    updatedName += "-Copy";
                else
                    sign = true;
            }
            return updatedName;
        }

        protected void btnSaveScenario_Click(object sender, EventArgs e)
        {
            string scenarioID = assignLabels(ddlICECost.SelectedValue, ddlICECost.SelectedValue, ddlBatteryCost.SelectedValue, ddlMotorCost.SelectedValue, ddlHomeWorkCharging.SelectedValue, ddlInstantRebate.SelectedValue, ddlPublicCharging.SelectedValue);
            string scenarioDescription = labelSummaryString.Text;
            string scenarioName = txtScenarioName.Text;

            scenarioName = modifyScenarioName(scenarioName);

            int numScenario = (int)Session["numScenario"];

            if (numScenario == 0)
            {
                numScenario++;
                showScenario1 = true;
                aScenario1.InnerText = scenarioName;
                aScenario1.Title = scenarioDescription;
                hiddenScenario1.Value = scenarioID;
                Session["aScenario1InnerText"] = aScenario1.InnerText;       //for keeping session
                Session["aScenario1TitleText"] = aScenario1.Title;           //for keeping session
                Session["hiddenScenario1Value"] = hiddenScenario1.Value;     //for keeping session
            }
            else if (numScenario == 1)
            {
                numScenario++;
                showScenario2 = true;
                aScenario2.InnerText = scenarioName;
                aScenario2.Title = scenarioDescription;
                hiddenScenario2.Value = scenarioID;
                Session["aScenario2InnerText"] = aScenario2.InnerText;       //for keeping session
                Session["aScenario2TitleText"] = aScenario2.Title;           //for keeping session
                Session["hiddenScenario2Value"] = hiddenScenario2.Value;     //for keeping session
            }
            else if (numScenario == 2)
            {
                numScenario++;
                showScenario3 = true;
                aScenario3.InnerText = scenarioName;
                aScenario3.Title = scenarioDescription;
                hiddenScenario3.Value = scenarioID;
                Session["aScenario3InnerText"] = aScenario3.InnerText;       //for keeping session
                Session["aScenario3TitleText"] = aScenario3.Title;           //for keeping session
                Session["hiddenScenario3Value"] = hiddenScenario3.Value;     //for keeping session
            }
            else if (numScenario == 3)
            {
                numScenario++;
                showScenario4 = true;
                aScenario4.InnerText = scenarioName;
                aScenario4.Title = scenarioDescription;
                hiddenScenario4.Value = scenarioID;
                Session["aScenario4InnerText"] = aScenario4.InnerText;       //for keeping session
                Session["aScenario4TitleText"] = aScenario4.Title;           //for keeping session
                Session["hiddenScenario4Value"] = hiddenScenario4.Value;     //for keeping session
            }
            else
            {
                numScenario++;
                showScenario5 = true;
                aScenario5.InnerText = scenarioName;
                aScenario5.Title = scenarioDescription;
                hiddenScenario5.Value = scenarioID;
                Session["aScenario5InnerText"] = aScenario5.InnerText;       //for keeping session
                Session["aScenario5TitleText"] = aScenario5.Title;           //for keeping session
                Session["hiddenScenario5Value"] = hiddenScenario5.Value;     //for keeping session
            }

            Session["numScenario"] = numScenario;
            checkToShowScenario();
            if ((int)Session["numScenario"] >= 5)
            {
                btnSaveScenario.Enabled = false;
            }
            txtScenarioName.Text = labelSummaryString.Text;
        }

        protected void removeScenario5()
        {
            aScenario5.InnerText = String.Empty;
            aScenario5.Title = String.Empty;
            hiddenScenario5.Value = String.Empty;
            Session["aScenario5InnerText"] = null;           //for keeping session
            Session["aScenario5TitleText"] = null;           //for keeping session
            Session["hiddenScenario5Value"] = null;          //for keeping session
        }

        protected void removeScenario4()
        {
            int numScenario = (int)Session["numScenario"];
            if(numScenario == 4)
            {
                aScenario4.InnerText = String.Empty;
                aScenario4.Title = String.Empty;
                hiddenScenario4.Value = String.Empty;
                Session["aScenario4InnerText"] = null;           //for keeping session
                Session["aScenario4TitleText"] = null;           //for keeping session
                Session["hiddenScenario4Value"] = null;          //for keeping session
            }
            else if (numScenario > 4)
            {
                aScenario4.InnerText = aScenario5.InnerText;
                aScenario4.Title = aScenario5.Title;
                hiddenScenario4.Value = hiddenScenario5.Value;
                Session["aScenario4InnerText"] = aScenario4.InnerText;       //for keeping session
                Session["aScenario4TitleText"] = aScenario4.Title;           //for keeping session
                Session["hiddenScenario4Value"] = hiddenScenario4.Value;     //for keeping session
                removeScenario5();
            }
        }

        protected void removeScenario3()
        {
            int numScenario = (int)Session["numScenario"];
            if (numScenario == 3)
            {
                aScenario3.InnerText = String.Empty;
                aScenario3.Title = String.Empty;
                hiddenScenario3.Value = String.Empty;
                Session["aScenario3InnerText"] = null;           //for keeping session
                Session["aScenario3TitleText"] = null;           //for keeping session
                Session["hiddenScenario3Value"] = null;          //for keeping session
            }
            else if (numScenario > 3)
            {
                aScenario3.InnerText = aScenario4.InnerText;
                aScenario3.Title = aScenario4.Title;
                hiddenScenario3.Value = hiddenScenario4.Value;
                Session["aScenario3InnerText"] = aScenario3.InnerText;       //for keeping session
                Session["aScenario3TitleText"] = aScenario3.Title;           //for keeping session
                Session["hiddenScenario3Value"] = hiddenScenario3.Value;     //for keeping session
                removeScenario4();
            }
        }

        protected void removeScenario2()
        {
            int numScenario = (int)Session["numScenario"];
            if (numScenario == 2)
            {
                aScenario2.InnerText = String.Empty;
                aScenario2.Title = String.Empty;
                hiddenScenario2.Value = String.Empty;
                Session["aScenario2InnerText"] = null;           //for keeping session
                Session["aScenario2TitleText"] = null;           //for keeping session
                Session["hiddenScenario2Value"] = null;          //for keeping session
            }
            else if (numScenario > 2)
            {
                aScenario2.InnerText = aScenario3.InnerText;
                aScenario2.Title = aScenario3.Title;
                hiddenScenario2.Value = hiddenScenario3.Value;
                Session["aScenario2InnerText"] = aScenario2.InnerText;       //for keeping session
                Session["aScenario2TitleText"] = aScenario2.Title;           //for keeping session
                Session["hiddenScenario2Value"] = hiddenScenario2.Value;     //for keeping session
                removeScenario3();
            }
        }

        protected void removeScenario1()
        {
            int numScenario = (int)Session["numScenario"];
            if (numScenario == 1)
            {
                aScenario1.InnerText = String.Empty;
                aScenario1.Title = String.Empty;
                hiddenScenario1.Value = String.Empty;
                Session["aScenario1InnerText"] = null;           //for keeping session
                Session["aScenario1TitleText"] = null;           //for keeping session
                Session["hiddenScenario1Value"] = null;          //for keeping session
            }
            else if (numScenario > 1)
            {
                aScenario1.InnerText = aScenario2.InnerText;
                aScenario1.Title = aScenario2.Title;
                hiddenScenario1.Value = hiddenScenario2.Value;
                Session["aScenario1InnerText"] = aScenario1.InnerText;       //for keeping session
                Session["aScenario1TitleText"] = aScenario1.Title;           //for keeping session
                Session["hiddenScenario1Value"] = hiddenScenario1.Value;     //for keeping session
                removeScenario2();
            }
        }



        protected string assignLabels(String ICECostParam, String FCCostParam, String BatteryCostParam, String MotorCostParam, String ConsumerParam, String PolicyParam, String PublicChargingParam)
        {
            OleDbConnection sqlConn = new OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings["fuelEconomy"].ConnectionString);
            sqlConn.Open();
            string sql = "SELECT ID FROM resultsindex WHERE (PowerchainCost = @PowerchainCost) AND (FCCost = @FCCost) AND (BatteryCost = @BatteryCost) AND (MotorCost = @MotorCost) AND (HomeWorkCharging = @HomeWorkCharging) AND (Rebate = @Rebate) AND (PublicCharging= @PublicCharging);";
            using (OleDbCommand com = new OleDbCommand(sql, sqlConn))
            {
                com.Parameters.AddWithValue("@PowerchainCost", ICECostParam);
                com.Parameters.AddWithValue("@FCCost", FCCostParam);
                com.Parameters.AddWithValue("@BatteryCost", BatteryCostParam);
                com.Parameters.AddWithValue("@MotorCost", MotorCostParam);
                com.Parameters.AddWithValue("@HomeWorkCharging", ConsumerParam);
                com.Parameters.AddWithValue("@Rebate", PolicyParam);
                com.Parameters.AddWithValue("@PublicCharging", PublicChargingParam);
                string resultID = com.ExecuteScalar().ToString();
                sqlConn.Close();
                return resultID;
            }
        }

        protected string[] getAttributes(String ID)
        {
            string[] attributeString = new string[7];
            OleDbConnection sqlConn = new OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings["fuelEconomy"].ConnectionString);
            sqlConn.Open();
            OleDbDataReader rdr = null;
            string sql = "SELECT PowerchainCost, FCCost, BatteryCost, MotorCost, HomeWorkCharging, Rebate, PublicCharging FROM resultsindex WHERE ID = @ID;";
            using (OleDbCommand com = new OleDbCommand(sql, sqlConn))
            {
                com.Parameters.AddWithValue("@ID", ID);
                rdr = com.ExecuteReader();
                while(rdr.Read())
                {
                    attributeString[0] = rdr["PowerchainCost"].ToString();
                    attributeString[1] = rdr["FCCost"].ToString();
                    attributeString[2] = rdr["BatteryCost"].ToString();
                    attributeString[3] = rdr["MotorCost"].ToString();
                    attributeString[4] = rdr["HomeWorkCharging"].ToString();
                    attributeString[5] = rdr["Rebate"].ToString();
                    attributeString[6] = rdr["PublicCharging"].ToString();
                }
            }
            return attributeString;
        }

        protected void btnDeleteScenario1_Click(object sender, EventArgs e)
        {
            removeScenario1();
            Session["numScenario"] = (int) Session["numScenario"] -1;
            btnSaveScenario.Enabled = true;
            checkToShowScenario();
        }

        protected void btnDeleteScenario2_Click(object sender, EventArgs e)
        {
            removeScenario2();
            Session["numScenario"] = (int)Session["numScenario"] - 1;
            btnSaveScenario.Enabled = true;
            checkToShowScenario();
        }

        protected void btnDeleteScenario3_Click(object sender, EventArgs e)
        {
            removeScenario3();
            Session["numScenario"] = (int)Session["numScenario"] - 1;
            btnSaveScenario.Enabled = true;
            checkToShowScenario();
        }

        protected void btnDeleteScenario4_Click(object sender, EventArgs e)
        {
            removeScenario4();
            Session["numScenario"] = (int)Session["numScenario"] - 1;
            btnSaveScenario.Enabled = true;
            checkToShowScenario();
        }

        protected void btnDeleteScenario5_Click(object sender, EventArgs e)
        {
            removeScenario5();
            Session["numScenario"] = (int)Session["numScenario"] - 1;
            btnSaveScenario.Enabled = true;
            checkToShowScenario();
        }

        protected void btnCompare_Click(object sender, EventArgs e)
        {
            int numScenario = (int)Session["numScenario"];
            string[] scenarioID = new string[numScenario];
            string[] scenarioDescription = new string[numScenario];
            string[] scenarioName = new string[numScenario];

            scenarioID[0] = hiddenScenario1.Value;
            scenarioID[1] = hiddenScenario2.Value;
            scenarioDescription[0] = aScenario1.Title;
            scenarioDescription[1] = aScenario2.Title;
            scenarioName[0] = aScenario1.InnerText;
            scenarioName[1] = aScenario2.InnerText;

            if(numScenario >= 3)
            {
                scenarioID[2] = hiddenScenario3.Value;
                scenarioDescription[2] = aScenario3.Title;
                scenarioName[2] = aScenario3.InnerText;

                if(numScenario >= 4)
                {
                    scenarioID[3] = hiddenScenario4.Value;
                    scenarioDescription[3] = aScenario4.Title;
                    scenarioName[3] = aScenario4.InnerText;

                    if(numScenario == 5)
                    {
                        scenarioID[4] = hiddenScenario5.Value;
                        scenarioDescription[4] = aScenario5.Title;
                        scenarioName[4] = aScenario5.InnerText;
                    }
                }
            }

            Session["scenarioID"] = scenarioID;
            Session["scenarioDescription"] = scenarioDescription;
            Session["scenarioName"] = scenarioName;

            Response.Redirect("~/MultiResults");
        }

        protected void showScenario(String scenario)
        {
            String[] attributeString = getAttributes(scenario);
            ddlICECost.SelectedValue = attributeString[0];
            ddlFCCost.SelectedValue = attributeString[1];
            ddlBatteryCost.SelectedValue = attributeString[2];
            ddlMotorCost.SelectedValue = attributeString[3];
            ddlHomeWorkCharging.SelectedValue = attributeString[4];
            ddlInstantRebate.SelectedValue = attributeString[5];
            ddlPublicCharging.SelectedValue = attributeString[6];

            labelSummaryString.Text = summaryWithScenario();
            txtScenarioName.Text = labelSummaryString.Text;
            Session["currentScenario"] = labelSummaryString.Text;
        }

        protected void btnShowScenario1_Click(object sender, EventArgs e)
        {
            showScenario(hiddenScenario1.Value);
        }

        protected void btnShowScenario2_Click(object sender, EventArgs e)
        {
            showScenario(hiddenScenario2.Value);
        }

        protected void btnShowScenario3_Click(object sender, EventArgs e)
        {
            showScenario(hiddenScenario3.Value);
        }

        protected void btnShowScenario4_Click(object sender, EventArgs e)
        {
            showScenario(hiddenScenario4.Value);
        }

        protected void btnShowScenario5_Click(object sender, EventArgs e)
        {
            showScenario(hiddenScenario5.Value);
        }

        protected void btnDownloadScenario_Click(object sender, EventArgs e)
        {
            string id = assignLabels(ddlICECost.SelectedValue, ddlICECost.SelectedValue, ddlBatteryCost.SelectedValue, ddlMotorCost.SelectedValue, ddlHomeWorkCharging.SelectedValue, ddlInstantRebate.SelectedValue, ddlPublicCharging.SelectedValue);
            string pathInput = Server.MapPath("~/App_Data/download/input/");
            string pathOutput = Server.MapPath("~/App_Data/download/output/MA3T_Result_");
            string inputFileNewName = id + "_input.xlsx";
            string outputFileNewName = id + "_output.xlsx";

            Response.Clear();
            Response.BufferOutput = false;
            System.Web.HttpContext c = System.Web.HttpContext.Current;
            String ReadmeText = "Hi TEEM MA3T MiniTool Users,\n\n";
            string archiveName = txtScenarioName.Text;
            ReadmeText += "In this folder, there are MA3T input and output files corresponding to the scenario: " + archiveName + "\n";
            ReadmeText += "Descriptions of the two included files are as follows: \n";
            ReadmeText += "    1. " + inputFileNewName + ": this is the input file for the MA3T model \n";
            ReadmeText += "    2. " + outputFileNewName + ": this is the output file for the MA3T model \n\n";
            ReadmeText += "Should you have any question, please directly contact the TEEM manager, Zhenhong Lin, at linz@ornl.gov. Thanks! \n\n";
            ReadmeText += "TEEM";

            var downloadFileName = string.Format(id + "-{0}.zip", DateTime.Now.ToString("yyyy-MM-dd-HH_mm_ss"));
            Response.ContentType = "application/zip";
            Response.AddHeader("content-Disposition", "filename=" + downloadFileName);

            using (ZipFile zip = new ZipFile())
            {
                zip.AddFile(pathInput + id + ".xlsx", string.Empty).FileName = inputFileNewName;
                zip.AddFile(pathOutput + id + "_R1.xlsx", string.Empty).FileName = outputFileNewName;
                zip.AddEntry("Readme.txt", ReadmeText);
                zip.Save(Response.OutputStream);
            }
            Response.Close();
        }

    }
}


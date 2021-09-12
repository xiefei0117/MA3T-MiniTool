using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MA3T_test1
{
    public partial class _MultiMiniTool : System.Web.UI.Page
    {
        int numScenario;



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                auto_invisible();
            }
            if (IsPostBack)
                auto_invisible();
            {
                auto_display();
            }
        }

        protected void auto_invisible()
        {
            Scenario3.Visible = false;
            Scenario4.Visible = false;
            Scenario5.Visible = false;
            numScenario = 2;
        }

        protected void auto_display()
        {
            if (DropDownList1.SelectedValue == "3")
            {
                Scenario3.Visible = true;
                numScenario = 3;
            }
            if (DropDownList1.SelectedValue == "4")
            {
                Scenario3.Visible = true;
                Scenario4.Visible = true;
                numScenario = 4;
            }
            if (DropDownList1.SelectedValue == "5")
            {
                Scenario3.Visible = true;
                Scenario4.Visible = true;
                Scenario5.Visible = true;
                numScenario = 5;
            }

        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {

            storeScenario();
            Response.Redirect("~/MultiResults");
        }

        protected void storeScenario()
        {
            String[] ICECost = new String[numScenario];
            String[] FCCost = new String[numScenario];
            String[] BatteryCost = new String[numScenario];
            String[] MotorCost = new String[numScenario];
            String[] Consumer = new String[numScenario];
            String[] Policy = new String[numScenario];
            String[] PublicCharging = new String[numScenario];

            for (int i=0; i<numScenario; i++)
            {
                if (i==0)
                {
                    ICECost[i] = ddlICEScenario1.SelectedValue;
                    FCCost[i] = ddlFCScenario1.SelectedValue;
                    BatteryCost[i] = ddlBatteryScenario1.SelectedValue;
                    MotorCost[i] = ddlMotorScenario1.SelectedValue;
                    Consumer[i] = ddlConsumerScenario1.SelectedValue;
                    Policy[i] = ddlPolicyScenario1.SelectedValue;
                    PublicCharging[i] = ddlInfrastructureScenario1.SelectedValue;
                }
                else if (i==1)
                {
                    ICECost[i] = ddlICEScenario2.SelectedValue;
                    FCCost[i] = ddlFCScenario2.SelectedValue;
                    BatteryCost[i] = ddlBatteryScenario2.SelectedValue;
                    MotorCost[i] = ddlMotorScenario2.SelectedValue;
                    Consumer[i] = ddlConsumerScenario2.SelectedValue;
                    Policy[i] = ddlPolicyScenario2.SelectedValue;
                    PublicCharging[i] = ddlInfrastructureScenario2.SelectedValue;
                }
                else if (i==2)
                {
                    ICECost[i] = ddlICEScenario3.SelectedValue;
                    FCCost[i] = ddlFCScenario3.SelectedValue;
                    BatteryCost[i] = ddlBatteryScenario3.SelectedValue;
                    MotorCost[i] = ddlMotorScenario3.SelectedValue;
                    Consumer[i] = ddlConsumerScenario3.SelectedValue;
                    Policy[i] = ddlPolicyScenario3.SelectedValue;
                    PublicCharging[i] = ddlInfrastructureScenario3.SelectedValue;
                }
                else if (i == 3)
                {
                    ICECost[i] = ddlICEScenario4.SelectedValue;
                    FCCost[i] = ddlFCScenario4.SelectedValue;
                    BatteryCost[i] = ddlBatteryScenario4.SelectedValue;
                    MotorCost[i] = ddlMotorScenario4.SelectedValue;
                    Consumer[i] = ddlConsumerScenario4.SelectedValue;
                    Policy[i] = ddlPolicyScenario4.SelectedValue;
                    PublicCharging[i] = ddlInfrastructureScenario4.SelectedValue;
                }
                else if (i == 4)
                {
                    ICECost[i] = ddlICEScenario5.SelectedValue;
                    FCCost[i] = ddlFCScenario5.SelectedValue;
                    BatteryCost[i] = ddlBatteryScenario5.SelectedValue;
                    MotorCost[i] = ddlMotorScenario5.SelectedValue;
                    Consumer[i] = ddlConsumerScenario5.SelectedValue;
                    Policy[i] = ddlPolicyScenario5.SelectedValue;
                    PublicCharging[i] = ddlInfrastructureScenario5.SelectedValue;
                }

                Session["numScenario"] = numScenario;
                Session["ICECost"] = ICECost;
                Session["FCCost"] = FCCost;
                Session["BatteryCost"] = BatteryCost;
                Session["MotorCost"] = MotorCost;
                Session["Consumer"] = Consumer;
                Session["Policy"] = Policy;
                Session["PublicCharging"] = PublicCharging;
            }



        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlICEScenario1.SelectedIndex = 0;
            ddlFCScenario1.SelectedIndex = 0;
            ddlBatteryScenario1.SelectedIndex = 0;
            ddlMotorScenario1.SelectedIndex = 0;
            ddlConsumerScenario1.SelectedIndex = 0;
            ddlPolicyScenario1.SelectedIndex = 0;
            ddlInfrastructureScenario1.SelectedIndex = 0;

            ddlICEScenario2.SelectedIndex = 0;
            ddlFCScenario2.SelectedIndex = 0;
            ddlBatteryScenario2.SelectedIndex = 0;
            ddlMotorScenario2.SelectedIndex = 0;
            ddlConsumerScenario2.SelectedIndex = 0;
            ddlPolicyScenario2.SelectedIndex = 0;
            ddlInfrastructureScenario2.SelectedIndex = 0;

            ddlICEScenario3.SelectedIndex = 0;
            ddlFCScenario3.SelectedIndex = 0;
            ddlBatteryScenario3.SelectedIndex = 0;
            ddlMotorScenario3.SelectedIndex = 0;
            ddlConsumerScenario3.SelectedIndex = 0;
            ddlPolicyScenario3.SelectedIndex = 0;
            ddlInfrastructureScenario3.SelectedIndex = 0;

            ddlICEScenario4.SelectedIndex = 0;
            ddlFCScenario4.SelectedIndex = 0;
            ddlBatteryScenario4.SelectedIndex = 0;
            ddlMotorScenario4.SelectedIndex = 0;
            ddlConsumerScenario4.SelectedIndex = 0;
            ddlPolicyScenario4.SelectedIndex = 0;
            ddlInfrastructureScenario4.SelectedIndex = 0;

            ddlICEScenario5.SelectedIndex = 0;
            ddlFCScenario5.SelectedIndex = 0;
            ddlBatteryScenario5.SelectedIndex = 0;
            ddlMotorScenario5.SelectedIndex = 0;
            ddlConsumerScenario5.SelectedIndex = 0;
            ddlPolicyScenario5.SelectedIndex = 0;
            ddlInfrastructureScenario5.SelectedIndex = 0;


        }
    }
}
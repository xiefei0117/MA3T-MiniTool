<%@ Page Title="MiniTool Application" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="MiniTool.aspx.cs" Inherits="MA3T_test1._SingleMiniTool" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h1>MA<sup>3</sup>T MiniTool</h1>
        <div id="colorstrip"></div>
        <p style="float:right"><em>LDV sale by year, LDV fleet size by year, and utility by technology can be displayed for each scenario.</em></p>
        <br />
    </div>
    <div id="divScenarioSummary" runat="server" style="clear:both; padding-bottom:10px;">
        <div style="width:100%;">
            <asp:Label ID="labelStoredScenario" runat="server" CssClass="aspLabelControl" Text="Saved Scenarios: &nbsp &nbsp &nbsp"></asp:Label>
            
        </div>
        <div id="divScenario1" runat="server" style="padding-right:10px; float:left;">
            <a id="aScenario1" runat="server"></a>
            <asp:Button ID="btnShowScenario1" runat="server" class="btn-default" Text="Show" Font-Size="Smaller" OnClick="btnShowScenario1_Click" />
            <asp:Button ID="btnDeleteScenario1" runat="server" class="btn-default" Text="Delete" Font-Size="Smaller" OnClick="btnDeleteScenario1_Click" />
            <asp:HiddenField ID="hiddenScenario1" runat="server" />
        </div>
        <div id="divScenario2" runat="server" class="divScenario">
            <a id="aScenario2" runat="server"></a>
            <asp:Button ID="btnShowScenario2" runat="server" class="btn-default" Text="Show" Font-Size="Smaller" OnClick="btnShowScenario2_Click" />
            <asp:Button ID="btnDeleteScenario2" runat="server" class="btn-default" Text="Delete" Font-Size="Smaller" OnClick="btnDeleteScenario2_Click" />
            <asp:HiddenField ID="hiddenScenario2" runat="server" />
        </div>
        <div id="divScenario3" runat="server" class="divScenario">
            <a id="aScenario3" runat="server"></a>
            <asp:Button ID="btnShowScenario3" runat="server" class="btn-default" Text="Show" Font-Size="Smaller" OnClick="btnShowScenario3_Click" />
            <asp:Button ID="btnDeleteScenario3" runat="server" class="btn-default" Text="Delete" Font-Size="Smaller" OnClick="btnDeleteScenario3_Click" />
            <asp:HiddenField ID="hiddenScenario3" runat="server" />
        </div>
        <div id="divScenario4" runat="server" class="divScenario">
            <a id="aScenario4" runat="server"></a>
            <asp:Button ID="btnShowScenario4" runat="server" class="btn-default" Text="Show" Font-Size="Smaller" OnClick="btnShowScenario4_Click" />
            <asp:Button ID="btnDeleteScenario4" runat="server" class="btn-default" Text="Delete" Font-Size="Smaller" OnClick="btnDeleteScenario4_Click" />
            <asp:HiddenField ID="hiddenScenario4" runat="server" />
        </div>
        <div id="divScenario5" runat="server" class="divScenario">
            <a id="aScenario5" runat="server"></a>
            <asp:Button ID="btnShowScenario5" runat="server" class="btn-default" Text="Show" Font-Size="Smaller" OnClick="btnShowScenario5_Click" />
            <asp:Button ID="btnDeleteScenario5" runat="server" class="btn-default" Text="Delete" Font-Size="Smaller" OnClick="btnDeleteScenario5_Click" />
            <asp:HiddenField ID="hiddenScenario5" runat="server" />
        </div>
        <div style="clear:both; padding-top: 10px">
            <asp:Button ID="btnCompare" runat="server" class="btn-default" Text="Compare with Saved Scenarios" OnClick="btnCompare_Click" OnClientClick="target='_blank';" />
        </div>
    </div>
    <div style="width: 100%; clear:both; ">
        <asp:Label ID="labelSummary" runat="server" CssClass="aspLabelControl" Text="Summary of Selected Scenario:"></asp:Label>
        <br />
        <div style="min-width:20%; max-width:50%; float: left; padding-right: 5px;">
            <asp:Label ID="labelSummaryString" runat="server" CssClass="aspLabelControl" Text="Summary of Selected Scenario:"></asp:Label>
        </div>
        <div style="width: 45%; float: left; padding-left: 5px; ">
            <asp:Label ID="labelScenarioName" runat="server" CssClass="aspLabelControl" Text="Scenario Name:"></asp:Label>
            <asp:TextBox ID="txtScenarioName" runat="server"></asp:TextBox>
            <asp:Button ID="btnSaveScenario" runat="server" class="btn-default" Text="Save" Width="80px" OnClick="btnSaveScenario_Click" />
            <asp:Button ID="btnDownloadScenario" runat="server" class="btn-default" Text="Download" Width="80px" OnClick="btnDownloadScenario_Click" />
            <a href="#" data-toggle="popover"  data-trigger="focus"  data-content="The corresponding MA3T input/output files will be downloaded.">
                <span class="glyphicon glyphicon-info-sign"></span>
            </a>
        </div>
    </div>
<!--the whole main body section -->
    <div id="ma3tMainBody" style="width: 100%; clear:both;">

        <!--The ma3T MiniTool input section-->
        <div id="ma3tInput" style="min-height:530px; float:left; width:44%;">
            <div style="clear:both">
                <h3>Model Inputs:</h3>
            </div>
            <div style="clear:both; min-height:480px">
                
                <!--Input dropdown I - upper level categories-->
                <div class="divSelfDefine" style="clear:both">
                    <div style="float:left; width:30%;">
                        <asp:Label ID="LabelSelectSheet" runat="server" Text="Category:" CssClass="aspLabelControl"></asp:Label>
                    </div>
                    <div style="float:left; width:70%;">
                        <asp:DropDownList ID="ddlSelectSheet" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <asp:ListItem Selected="True">Technology</asp:ListItem>
                            <asp:ListItem>Consumer</asp:ListItem>
                            <asp:ListItem>Policy</asp:ListItem>
                            <asp:ListItem>Infrastructure</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <!--End Input dropdown I - upper level categories-->

                <asp:UpdatePanel ID="pnlInputSection" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlSelectSheet" EventName="SelectedIndexChanged" />
                    </Triggers>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="ddlHomeWorkCharging" />
                    </Triggers>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="ddlInstantRebate" />
                    </Triggers>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="ddlPublicCharging" />
                    </Triggers>
                    <ContentTemplate>
                        <!--Technology Input Section-->
                        <div runat="server" id="ma3tTechnology" style="clear: both">
                            <div style="float: left; width: 30%;" class="divSelfDefine">
                                <asp:Label ID="LabelSelectTechnology" runat="server" Text="Sub-Category:" CssClass="aspLabelControl"></asp:Label>
                            </div>

                            <!--Input dropdown II - lower level categories (Technology)-->
                            <div style="float: left; width: 70%;" class="divSelfDefine">
                                <asp:DropDownList ID="ddlTechnologySelection" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <asp:ListItem Selected="True">ICE/Trans/EmissionC</asp:ListItem>
                                    <asp:ListItem>Fuel Cell</asp:ListItem>
                                    <asp:ListItem>Battery</asp:ListItem>
                                    <asp:ListItem>Motor/Electronics</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <!--End Input dropdown II - lower level categories (Technology)-->

                            <asp:UpdatePanel ID="pnlma3TTechnology" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="ddlICECost" />
                                </Triggers>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="ddlFCCost" />
                                </Triggers>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="ddlBatteryCost" />
                                </Triggers>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="ddlMotorCost" />
                                </Triggers>
                                <ContentTemplate>
                                    <!--Powerchain cost input section-->
                                    <div runat="server" id="ICECost" style="clear: both">
                                        <div style="float: left; width: 30%;">
                                            <asp:Label ID="LabelICECost" runat="server" Text="Cost Scenarios:" CssClass="aspLabelControl"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 70%;">
                                            <asp:DropDownList ID="ddlICECost" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" OnSelectedIndexChanged="ddlICECost_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div style="float: left; width: 100%" class="divSelfDefine">
                                            <asp:Chart ID="chartICECost" runat="server" DataSourceID="sqlICECost">
                                                <Titles>
                                                    <asp:Title Text="Example: Car-Conv-SI"></asp:Title>
                                                </Titles>
                                                <Series>
                                                    <asp:Series Name="ICE Cost" XValueMember="Year" YValueMembers="Cost" BorderWidth="2" ChartType="Line" Color="0, 0, 192"></asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                        <AxisY Title="Powertrain unit cost ($/KW)" Minimum="0" Maximum="40">
                                                            <MajorGrid Enabled="False" />
                                                        </AxisY>
                                                        <AxisX Title="Year" Maximum="2050" Minimum="2005">
                                                            <MajorGrid Enabled="False" />
                                                        </AxisX>
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                            <asp:SqlDataSource ID="sqlICECost" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT * FROM [ICECost] WHERE ([Scenario] = ?)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlICECost" DefaultValue="Default" Name="Scenario" PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                        <div style="clear: both;">
                                            <asp:Label ID="LabelDescriptionICECost" runat="server" Style="float: left; width: 80%;" Text="MA3T baseline powertrain cost (from Autonomie data), including ICE engine cost, transmission cost, and emission control cost. The powertrain unit cost for Car-Conv-SI is $33.3/KW by year 2050."></asp:Label>
                                        </div>
                                    </div>
                                    <!--End Powerchain cost input section-->

                                    <!--Fuel Cell cost input section-->
                                    <div runat="server" id="FCCost" style="clear: both">
                                        <div style="float: left; width: 30%;">
                                            <asp:Label ID="LabelFCCost" runat="server" Text="Cost Scenarios:" CssClass="aspLabelControl"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 70%;">
                                            <asp:DropDownList ID="ddlFCCost" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" OnSelectedIndexChanged="ddlFCCost_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div style="float: left; width: 100%" class="divSelfDefine">
                                            <asp:Chart ID="chartFCCost" runat="server" DataSourceID="sqlFCCost">
                                                <Titles>
                                                    <asp:Title Text="Example: Car-FC HEV"></asp:Title>
                                                </Titles>
                                                <Series>
                                                    <asp:Series Name="FC Cost" XValueMember="Year" YValueMembers="Cost" BorderWidth="2" ChartType="Line" BorderColor="Red" Color="64, 64, 0"></asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                        <AxisY Title="Fuel cell unit cost ($/KW)" Minimum="0" Maximum="60">
                                                            <MajorGrid Enabled="False" />
                                                        </AxisY>
                                                        <AxisX Title="Year" Maximum="2050" Minimum="2005">
                                                            <MajorGrid Enabled="False" />
                                                        </AxisX>
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                            <asp:SqlDataSource ID="sqlFCCost" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT * FROM [FCCost] WHERE ([Scenario] = ?)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlFCCost" DefaultValue="Default" Name="Scenario" PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <div style="clear: both;">
                                            <asp:Label ID="LabelDescriptionFCCost" runat="server" Style="float: left; width: 80%;" Text="MA3T baseline fuel cell unit cost (from Autonomie data). For example, the fuel cell unit cost for Car-FC HEV is $37.4/KW by year 2050."></asp:Label>
                                        </div>
                                    </div>
                                    <!--End Fuel Cell cost input section-->

                                    <!--Battery cost input section-->
                                    <div runat="server" id="BatteryCost" style="clear: both">
                                        <div style="float: left; width: 30%;">
                                            <asp:Label ID="LabelBatteryCost" runat="server" Text="Cost Scenarios:" CssClass="aspLabelControl"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 70%;">
                                            <asp:DropDownList ID="ddlBatteryCost" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" OnSelectedIndexChanged="ddlBatteryCost_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div style="float: left; width: 100%" class="divSelfDefine">
                                            <asp:Chart ID="chartBatteryCost" runat="server" DataSourceID="sqlBatteryCost">
                                                <Series>
                                                    <asp:Series Name="Battery Unit Cost" XValueMember="Year" YValueMembers="Cost" BorderWidth="2" ChartType="Line" Color="Purple"></asp:Series>
                                                </Series>
                                                <Titles>
                                                    <asp:Title Text="Example: Car-EV 100"></asp:Title>
                                                </Titles>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                        <AxisY Title="Battery unit cost ($/KWh)" Minimum="0" Maximum="500">
                                                            <MajorGrid Enabled="False" />
                                                        </AxisY>
                                                        <AxisX Title="Year" Maximum="2050" Minimum="2005">
                                                            <MajorGrid Enabled="False" />
                                                        </AxisX>
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                            <asp:SqlDataSource ID="sqlBatteryCost" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT * FROM [BatteryCost] WHERE ([Scenario] = ?)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlBatteryCost" DefaultValue="Default" Name="Scenario" PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                        <div style="clear: both;">
                                            <asp:Label ID="LabelDescriptionBatteryCost" runat="server" Style="float: left; width: 80%;" Text="MA3T baseline battery unit cost (from Autonomie data). For example, the battery unit cost for Car-EV 100 is $175/KWh by year 2050. "></asp:Label>
                                        </div>
                                    </div>
                                    <!--End Battery cost input section-->

                                    <!--Motor cost input section-->
                                    <div runat="server" id="MotorCost" style="clear: both">
                                        <div style="float: left; width: 30%;">
                                            <asp:Label ID="LabelMotorCost" runat="server" Text="Cost Scenarios:" CssClass="aspLabelControl"></asp:Label>
                                        </div>
                                        <div style="float: left; width: 70%;">
                                            <asp:DropDownList ID="ddlMotorCost" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" OnSelectedIndexChanged="ddlMotorCost_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div style="float: left; width: 100%" class="divSelfDefine">
                                            <asp:Chart ID="chartMotorCost" runat="server" DataSourceID="sqlMotorCost">
                                                <Series>
                                                    <asp:Series Name="Motor Cost" XValueMember="Year" YValueMembers="Cost" BorderWidth="2" ChartType="Line" Color="Green"></asp:Series>
                                                </Series>
                                                <Titles>
                                                    <asp:Title Text="Example: Car-EV 100"></asp:Title>
                                                </Titles>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                        <AxisY Title="Motor unit cost: ($/KW)" Minimum="0" Maximum="20">
                                                            <MajorGrid Enabled="False" />
                                                        </AxisY>
                                                        <AxisX Title="Year" Maximum="2050" Minimum="2005">
                                                            <MajorGrid Enabled="False" />
                                                        </AxisX>
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                            <asp:SqlDataSource ID="sqlMotorCost" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT * FROM [MotorCost] WHERE ([Scenario] = ?)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlMotorCost" DefaultValue="Default" Name="Scenario" PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                        <div style="clear: both">
                                            <asp:Label ID="LabelDescriptionMotorCost" runat="server" Style="float: left; width: 80%;" Text="MA3T baseline motor unit cost (from Autonomie data). For example, the motor unit cost for Car-EV 100 is $10.4/KW by year 2050."></asp:Label>
                                        </div>
                                    </div>
                                    <!--End Motor cost input section-->
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <!--End Technology Input Section-->

                        <!--Consumer Input Section-->

                        <div runat="server" id="ma3tConsumer" style="clear: both">
                            <div style="float: left; width: 30%;" class="divSelfDefine">
                                <asp:Label ID="LabelConsumer" runat="server" Text="Sub-Category:" CssClass="aspLabelControl"></asp:Label>
                            </div>
                            <div style="float: left; width: 70%;" class="divSelfDefine">
                                <asp:Label ID="LabelConsumer2" runat="server" Text="Home/Work Charging" CssClass="aspLabelControl"></asp:Label>
                            </div>
                            <div runat="server" id="HomeWorkCharging" style="clear: both">
                                <div style="float: left; width: 30%;">
                                    <asp:Label ID="LabelHomeWorkCharging" runat="server" Text="Deployment Scenarios:" CssClass="aspLabelControl"></asp:Label>
                                </div>
                                <div style="float: left; width: 70%;" class="divSelfDefine">
                                    <asp:DropDownList ID="ddlHomeWorkCharging" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" OnSelectedIndexChanged="ddlHomeWorkCharging_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                        <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                        <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div style="float: left; width: 100%" class="divSelfDefine">
                                    <asp:Chart ID="chartHomeWorkCharging" runat="server" DataSourceID="sqlHomeWorkCharging" Width="410px">
                                        <Series>
                                            <asp:Series Name="Home-city" XValueMember="Year" YValueMembers="Home-city" ChartType="Line" Legend="Legend1" BorderWidth="2" Color="Green"></asp:Series>
                                            <asp:Series Name="Home-suburb" XValueMember="Year" YValueMembers="Home-suburb" ChartType="Line" Legend="Legend1" BorderWidth="2" Color="Red"></asp:Series>
                                            <asp:Series Name="Home-rural" XValueMember="Year" YValueMembers="Home-rural" ChartType="Line" Legend="Legend1" BorderWidth="2" Color="Blue"></asp:Series>
                                            <asp:Series Name="Workplace" XValueMember="Year" YValueMembers="Workplace" ChartType="Line" Legend="Legend1" BorderWidth="2" Color="Black"></asp:Series>
                                        </Series>
                                        <Legends>
                                            <asp:Legend Name="Legend1" IsDockedInsideChartArea="False">
                                            </asp:Legend>
                                        </Legends>
                                        <Titles>
                                            <asp:Title Text="Example: the State of Alabama"></asp:Title>
                                        </Titles>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                                <AxisY Title="Availability (%)" Maximum="100">
                                                    <MajorGrid Enabled="False" />
                                                </AxisY>
                                                <AxisX Title="Year" Maximum="2050" Minimum="2005">
                                                    <MajorGrid Enabled="False" />
                                                </AxisX>
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                    <asp:SqlDataSource ID="sqlHomeWorkCharging" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT * FROM [HomeWorkCharging] WHERE ([Scenario] = ?)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlHomeWorkCharging" DefaultValue="Default" Name="Scenario" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div style="clear: both">
                                    <asp:Label ID="LabelDescriptionHomeWorkCharging" runat="server" Style="float: left; width: 80%;" Text="The overall home and workplace charging availability for each state is further increased compared to the baseline case."></asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--End Consumer Input Section-->

                        <!--Policy Input Section-->
                        <div runat="server" id="ma3tPolicy" class="divSelfDefine">
                            <div style="clear: both">
                                <div style="float: left; width: 30%;" class="divSelfDefine">
                                    <asp:Label ID="LabelPolicy" runat="server" Text="Sub-Category:" CssClass="aspLabelControl"></asp:Label>
                                </div>
                                <div style="float: left; width: 70%;" class="divSelfDefine">
                                    <asp:Label ID="LabelPolicy2" runat="server" Text="Instant Rebate" CssClass="aspLabelControl"></asp:Label>
                                </div>
                            </div>
                            <div runat="server" id="InstantRebate" style="clear: both">
                                <div style="float: left; width: 30%;">
                                    <asp:Label ID="LabelInstantRebate" runat="server" Text="Instant Rebate Scenarios:" CssClass="aspLabelControl"></asp:Label>
                                </div>
                                <div style="float: left; width: 70%;" class="divSelfDefine">
                                    <asp:DropDownList ID="ddlInstantRebate" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" OnSelectedIndexChanged="ddlInstantRebate_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                        <asp:ListItem Value="Alternative1">+5k Short</asp:ListItem>
                                        <asp:ListItem Value="Alternative2">+5k Long</asp:ListItem>
                                        <asp:ListItem Value="Alternative3">+5k Short/5K Long</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div style="float: left; width: 100%" class="divSelfDefine">
                                    <asp:Chart ID="chartInstantRebate" runat="server" DataSourceID="sqlInstantRebate">
                                        <Series>
                                            <asp:Series Name="Rebate" XValueMember="Year" YValueMembers="Rebate"></asp:Series>
                                        </Series>
                                        <Titles>
                                            <asp:Title Text="Example: the State of California"></asp:Title>
                                        </Titles>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                                <AxisY Title="Rebate ($)" Minimum="0" Maximum="15000">
                                                    <MajorGrid Enabled="False" />
                                                </AxisY>
                                                <AxisX Title="Year" Maximum="2050" Minimum="2005">
                                                    <MajorGrid Enabled="False" />
                                                </AxisX>
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                    <asp:SqlDataSource ID="sqlInstantRebate" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT * FROM [Rebate] WHERE ([Scenario] = ?)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlInstantRebate" DefaultValue="Default" Name="Scenario" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div style="clear: both">
                                    <asp:Label ID="LabelDescriptionInstantRebate" runat="server" Style="float: left; width: 80%;" Text="MA3T baseline instant rebate."></asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--End Policy Input Section-->

                        <!--Infrastructure Input Section-->
                        <div runat="server" id="ma3tInfrastructure" style="clear: both">
                            <div style="float: left; width: 30%;" class="divSelfDefine">
                                <asp:Label ID="LabelInfrastructure" runat="server" Text="Sub-Category:" CssClass="aspLabelControl"></asp:Label>
                            </div>
                            <div style="float: left; width: 70%;" class="divSelfDefine">
                                <asp:Label ID="LabelInfrastructure2" runat="server" Text="Public Charging" CssClass="aspLabelControl"></asp:Label>
                            </div>
                            <div runat="server" id="PublicCharging" style="clear: both">
                                <div style="float: left; width: 30%;">
                                    <asp:Label ID="LabelPublicCharging" runat="server" Text="Deployment Scenarios:" CssClass="aspLabelControl"></asp:Label>
                                </div>
                                <div style="float: left; width: 70%;" class="divSelfDefine">
                                    <asp:DropDownList ID="ddlPublicCharging" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" OnSelectedIndexChanged="ddlPublicCharging_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                        <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                        <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div style="float: left; width: 100%" class="divSelfDefine">
                                    <asp:Chart ID="chartPublicCharging" runat="server" DataSourceID="sqlPublicCharging">
                                        <Series>
                                            <asp:Series Name="City/Suburb/Rural" XValueMember="Year" YValueMembers="City" ChartType="Line" BorderWidth="2" Color="0, 64, 64"></asp:Series>
                                        </Series>
                                        <Titles>
                                            <asp:Title Text="Example: the State of Alabama"></asp:Title>
                                        </Titles>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                                <AxisY Title="Availability (%)" Maximum="100">
                                                    <MajorGrid Enabled="False" />
                                                </AxisY>
                                                <AxisX Title="Year" Maximum="2050" Minimum="2005">
                                                    <MajorGrid Enabled="False" />
                                                </AxisX>
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                    <asp:SqlDataSource ID="sqlPublicCharging" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT * FROM [PublicCharging] WHERE ([Scenario] = ?)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlPublicCharging" DefaultValue="Default" Name="Scenario" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                                <div style="clear: both">
                                    <asp:Label ID="LabelDescriptionPublicCharging" runat="server" Style="float: left; width: 80%;" Text="MA3T baseline public charging availability."></asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--End Infrastructure Input Section-->
                    </ContentTemplate>
                </asp:UpdatePanel>              
            </div>
            
            <div class="divSelfDefine", style="clear:both;">
                <asp:Button ID="btReset" runat="server" Text="Reset All To Baseline" OnClick="btReset_Click" Width="160px" class="btn btn-default"/>
            </div>


        </div>
        <div runat="server" id="ma3tOutput" style="float:right; width:55%;">
            <asp:UpdatePanel runat="server" ID="pnlOutput" UpdateMode="Conditional">
                <ContentTemplate>
                <div>
                    <h3>Model Outputs:</h3>
                </div>
                <div class="divSelfDefine", style="clear:both;">
                    <div style="float:left; width: 17%;">
                        <asp:Label ID="labelResultCategory" runat="server" Text="Category:" CssClass="aspLabelControl"></asp:Label>
                    </div>
                    <div style="float:left; width: 83%;">
                        <asp:DropDownList ID="ddlResultCategory" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <asp:ListItem Selected="True">LDV Sale</asp:ListItem>
                            <asp:ListItem>LDV Fleet Size</asp:ListItem>
                            <asp:ListItem>Energy</asp:ListItem>
                            <asp:ListItem>Utility</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                
                </div>


                    <div runat="server" id="saleResults" class="divSelfDefine" style="clear: both;">
                        <asp:Label ID="labelOutputSale" runat="server" Text="The market shares are:" CssClass="aspLabelControl"></asp:Label>
                        <br />


                        <asp:SqlDataSource ID="sqlResultsSale" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT resultsSale.[Year], resultsSale.SI, resultsSale.CI, resultsSale.NG, resultsSale.[SI HEV], resultsSale.[CI HEV], resultsSale.[NG HEV], resultsSale.[SI PHEV], resultsSale.[H2 ICE], resultsSale.[FC HEV], resultsSale.[FC PHEV], resultsSale.BEV FROM (resultsSale INNER JOIN resultsindex ON resultsSale.Scenario = resultsindex.ID) WHERE (resultsindex.PowerchainCost = ?) AND (resultsindex.FCCost = ?) AND (resultsindex.BatteryCost = ?) AND (resultsindex.MotorCost = ?) AND (resultsindex.Rebate = ?) AND (resultsindex.HomeWorkCharging = ?) AND (resultsindex.PublicCharging = ?)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlICECost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlFCCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlBatteryCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlMotorCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlInstantRebate" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlHomeWorkCharging" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlPublicCharging" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:Chart ID="chartResultsSale" runat="server" DataSourceID="sqlResultsSale" Height="300px" Width="500px" Style="margin: 0 auto; display: block;" OnLoad="chartResultsSale_Load">
                            <Series>
                                <asp:Series Name="SI" XValueMember="Year" YValueMembers="SI" ChartType="StackedArea" Legend="Legend1" Color="RoyalBlue">
                                </asp:Series>
                                <asp:Series Name="CI" XValueMember="Year" YValueMembers="CI" ChartType="StackedArea" Legend="Legend1" Color="Black">
                                </asp:Series>
                                <asp:Series Name="SI HEV" XValueMember="Year" YValueMembers="SI HEV" ChartType="StackedArea" Legend="Legend1" BackHatchStyle="DarkUpwardDiagonal" Color="Green">
                                </asp:Series>
                                <asp:Series Name="CI HEV" XValueMember="Year" YValueMembers="CI HEV" ChartType="StackedArea" Legend="Legend1" BackHatchStyle="DarkDownwardDiagonal" Color="Green">
                                </asp:Series>
                                <asp:Series Name="SI PHEV" XValueMember="Year" YValueMembers="SI PHEV" ChartType="StackedArea" Legend="Legend1" Color="Indigo">
                                </asp:Series>
                                <asp:Series Name="BEV" XValueMember="Year" YValueMembers="BEV" ChartType="StackedArea" Legend="Legend1" Color="128, 64, 0">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisY Title="LDV Sale (thousands)" Minimum="0">
                                        <MajorGrid Enabled="False" />
                                    </AxisY>
                                    <AxisX Title="Year" Maximum="2050" Minimum="2005">
                                        <MajorGrid Enabled="False" />
                                    </AxisX>
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>

                        <div style="clear: both" class="divSelfDefine">
                            <div style="float: left; width: 70%;">
                                <asp:Label ID="labelSelectedTechnologySale" runat="server" Text="Selected Technology:" CssClass="aspLabelControl"></asp:Label>
                                <br />
                                <br />
                                <asp:CheckBoxList ID="cblSaleTechnologySelect" runat="server" AutoPostBack="true" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%" Style="margin: 0 auto;">
                                    <asp:ListItem Selected="True" Value="BEV"><a title="Bettery Electric Vehicle" style="color:#666666">BEV</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="SI PHEV"><a title="Spark Ignition Plug-in Hybrid Electric Vehicle" style="color:#666666">SI PHEV</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="CI HEV"><a title="Compression Ignition Hybrid Electric Vehicle" style="color:#666666">CI HEV</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="SI HEV"><a title="Spark Ignition Hybrid Electric Vehicle" style="color:#666666">SI HEV</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="CI"><a title="Compression Ignition Conventional Vehicle" style="color:#666666">CI</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="SI"><a title="Spark Ignition Conventional Vehicle" style="color:#666666">SI</a></asp:ListItem>
                                </asp:CheckBoxList>
                                <br />
                                <br />
                            </div>
                            <div style="float: right; clear: both; width: 60%;">
                                <asp:Button ID="btnSelectAllSale" runat="server" class="btn btn-default" Text="Select All" Width="140px" OnClick="btnSelectAllSale_Click" />
                                <asp:Button ID="btnDeSelectAllSale" runat="server" Style="margin-left: 2%" class="btn btn-default" Text="Deselect All" Width="140px" OnClick="btnDeSelectAllSale_Click" />
                            </div>
                        </div>

                    </div>
                    <div runat="server" id="populationResults" style="clear: both;" class="divSelfDefine">
                        <asp:Label ID="labelOutputPopulation" runat="server" Text="The market shares are:" CssClass="aspLabelControl"></asp:Label>
                        <br />


                        <asp:SqlDataSource ID="sqlResultsPopulation" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT resultsPopulation.[Year], resultsPopulation.SI, resultsPopulation.CI, resultsPopulation.NG, resultsPopulation.[SI HEV], resultsPopulation.[CI HEV], resultsPopulation.[NG HEV], resultsPopulation.[SI PHEV], resultsPopulation.[H2 ICE], resultsPopulation.[FC HEV], resultsPopulation.[FC PHEV], resultsPopulation.BEV FROM (resultsPopulation INNER JOIN resultsindex ON resultsPopulation.Scenario = resultsindex.ID) WHERE (resultsindex.PowerchainCost = ?) AND (resultsindex.FCCost = ?) AND (resultsindex.BatteryCost = ?) AND (resultsindex.MotorCost = ?) AND (resultsindex.Rebate = ?) AND (resultsindex.HomeWorkCharging = ?) AND (resultsindex.PublicCharging = a)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlICECost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlFCCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlBatteryCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlMotorCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlInstantRebate" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlHomeWorkCharging" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlPublicCharging" DefaultValue="Default" Name="a" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:Chart ID="chartResultsPopulation" runat="server" DataSourceID="sqlResultsPopulation" Height="300px" Width="500px" Style="margin: 0 auto; display: block;" OnLoad="chartResultsPopulation_Load">
                            <Series>
                                <asp:Series Name="SI" XValueMember="Year" YValueMembers="SI" ChartType="StackedArea" Legend="Legend1" Color="RoyalBlue">
                                </asp:Series>
                                <asp:Series Name="CI" XValueMember="Year" YValueMembers="CI" ChartType="StackedArea" Legend="Legend1" Color="Black">
                                </asp:Series>
                                <asp:Series Name="SI HEV" XValueMember="Year" YValueMembers="SI HEV" ChartType="StackedArea" Legend="Legend1" BackHatchStyle="DarkUpwardDiagonal" Color="Green">
                                </asp:Series>
                                <asp:Series Name="CI HEV" XValueMember="Year" YValueMembers="CI HEV" ChartType="StackedArea" Legend="Legend1" BackHatchStyle="DarkDownwardDiagonal" Color="Green">
                                </asp:Series>
                                <asp:Series Name="SI PHEV" XValueMember="Year" YValueMembers="SI PHEV" ChartType="StackedArea" Legend="Legend1" Color="Indigo">
                                </asp:Series>
                                <asp:Series Name="BEV" XValueMember="Year" YValueMembers="BEV" ChartType="StackedArea" Legend="Legend1" Color="128, 64, 0">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisY Title="LDV Fleet Size (thousands)" Minimum="0">
                                        <MajorGrid Enabled="False" />
                                    </AxisY>
                                    <AxisX Title="Year" Maximum="2050" Minimum="2005">
                                        <MajorGrid Enabled="False" />
                                    </AxisX>
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>

                        <div style="clear: both" class="divSelfDefine">
                            <div style="float: left; width: 70%;">
                                <asp:Label ID="labelSelectedTechnologyPopulation" runat="server" Text="Selected Technology:" CssClass="aspLabelControl"></asp:Label>
                                <br />
                                <br />
                                <asp:CheckBoxList ID="cblPopulationTechnologySelect" runat="server" AutoPostBack="true" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%" Style="margin: 0 auto;">
                                    <asp:ListItem Selected="True" Value="BEV"><a title="Bettery Electric Vehicle" style="color:#666666">BEV</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="SI PHEV"><a title="Spark Ignition Plug-in Hybrid Electric Vehicle" style="color:#666666">SI PHEV</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="CI HEV"><a title="Compression Ignition Hybrid Electric Vehicle" style="color:#666666">CI HEV</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="SI HEV"><a title="Spark Ignition Hybrid Electric Vehicle" style="color:#666666">SI HEV</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="CI"><a title="Compression Ignition Conventional Vehicle" style="color:#666666">CI</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="SI"><a title="Spark Ignition Conventional Vehicle" style="color:#666666">SI</a></asp:ListItem>
                                </asp:CheckBoxList>
                                <br />
                                <br />
                            </div>
                            <div style="float: right; clear: both; width: 60%;">
                                <asp:Button ID="btnSelectAllPopulation" runat="server" class="btn btn-default" Text="Select All" Width="140px" OnClick="btnSelectAllPopulation_Click" />
                                <asp:Button ID="btnDeSelectAllPopulation" runat="server" Style="margin-left: 2%" class="btn btn-default" Text="Deselect All" Width="140px" OnClick="btnDeSelectAllPopulation_Click" />

                            </div>
                        </div>

                    </div>



                    <div runat="server" id="energyResults" style="clear: both;" class="divSelfDefine">
                        <asp:Label ID="labelOutputEnergy" runat="server" Text="The energy shares are:" CssClass="aspLabelControl"></asp:Label>
                        <br />


                        <asp:SqlDataSource ID="sqlResultsEnergy" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT resultsEnergy.[Year], resultsEnergy.[Gasoline (trillion BTU)], resultsEnergy.[Diesel (trillion BTU)], resultsEnergy.[Natural Gas (trillion BTU)], resultsEnergy.[Hydrogen (trillion BTU)], resultsEnergy.[Electricity (trillion BTU)] FROM (resultsEnergy INNER JOIN resultsindex ON resultsEnergy.Scenario = resultsindex.ID) WHERE (resultsindex.PowerchainCost = ?) AND (resultsindex.FCCost = ?) AND (resultsindex.BatteryCost = ?) AND (resultsindex.MotorCost = ?) AND (resultsindex.Rebate = ?) AND (resultsindex.HomeWorkCharging = ?) AND (resultsindex.PublicCharging = ?)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlICECost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlFCCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlBatteryCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlMotorCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlInstantRebate" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlHomeWorkCharging" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlPublicCharging" DefaultValue="Default" Name="a" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:Chart ID="chartResultsEnergy" runat="server" DataSourceID="sqlResultsEnergy" Height="300px" Width="500px" Style="margin: 0 auto; display: block;" OnLoad="chartResultsEnergy_Load">
                            <Series>
                                <asp:Series Name="Gasoline" XValueMember="Year" YValueMembers="Gasoline (trillion BTU)" ChartType="StackedArea" Legend="Legend1" Color="RoyalBlue">
                                </asp:Series>
                                <asp:Series Name="Diesel" XValueMember="Year" YValueMembers="Diesel (trillion BTU)" ChartType="StackedArea" Legend="Legend1" Color="Black">
                                </asp:Series>
                                <asp:Series Name="Natural Gas" XValueMember="Year" YValueMembers="Natural Gas (trillion BTU)" ChartType="StackedArea" Legend="Legend1" BackHatchStyle="DarkUpwardDiagonal" Color="Green">
                                </asp:Series>
                                <asp:Series Name="Hydrogen" XValueMember="Year" YValueMembers="Hydrogen (trillion BTU)" ChartType="StackedArea" Legend="Legend1" BackHatchStyle="DarkDownwardDiagonal" Color="Green">
                                </asp:Series>
                                <asp:Series Name="Electricity" XValueMember="Year" YValueMembers="Electricity (trillion BTU)" ChartType="StackedArea" Legend="Legend1" Color="Red">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisY Title="Energy (trillion BTU)" Minimum="0">
                                        <MajorGrid Enabled="False" />
                                    </AxisY>
                                    <AxisX Title="Year" Maximum="2050" Minimum="2005">
                                        <MajorGrid Enabled="False" />
                                    </AxisX>
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>

                        <div style="clear: both" class="divSelfDefine">
                            <div style="float: left; width: 70%;">
                                <asp:Label ID="labelSelectedEnergy" runat="server" Text="Selected Energy Type:" CssClass="aspLabelControl"></asp:Label>
                                <br />
                                <br />
                                <asp:CheckBoxList ID="cblEnergySelect" runat="server" AutoPostBack="true" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%" Style="margin: 0 auto;">
                                    <asp:ListItem Selected="True" Value="Gasoline"><a title="Gasoline" style="color:#666666">Gasoline</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Diesel"><a title="Diesel" style="color:#666666">Diesel</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Natural Gas"><a title="Natural Gas" style="color:#666666">Natural Gas</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Hydrogen"><a title="Hydrogen" style="color:#666666">Hydrogen</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Electricity"><a title="Electricity" style="color:#666666">Electricity</a></asp:ListItem>
                                </asp:CheckBoxList>
                                <br />
                                <br />
                            </div>
                            <div style="float: right; clear: both; width: 60%;">
                                <asp:Button ID="btnSelectAllEnergy" runat="server" class="btn btn-default" Text="Select All" Width="140px" OnClick="btnSelectAllEnergy_Click" />
                                <asp:Button ID="btnDeSelectAllEnergy" runat="server" Style="margin-left: 2%" class="btn btn-default" Text="Deselect All" Width="140px" OnClick="btnDeSelectAllEnergy_Click" />

                            </div>
                        </div>

                    </div>


















                    <div runat="server" id="utilityResults" style="clear: both;" class="divSelfDefine">

                        <div style="clear: both;">
                            <div style="float: left; width: 17%;">
                                <asp:Label ID="labelUtilitySegment" runat="server" Text="Segment:" CssClass="aspLabelControl"></asp:Label>
                            </div>
                            <div style="float: left; width: 23%;">
                                <asp:DropDownList ID="ddlUtilitySegment" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <asp:ListItem Selected="True" Value="733">Segment A</asp:ListItem>
                                    <asp:ListItem Value="765">Segment B</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div style="float: left; width: 12%;">
                                <asp:Label ID="labelUtilityYear" runat="server" Text="Year:" CssClass="aspLabelControl"></asp:Label>
                            </div>
                            <div style="float: left; width: 20%;">
                                <asp:DropDownList ID="ddlUtilityYear" runat="server" AutoPostBack="True" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <asp:ListItem Selected="True">2015</asp:ListItem>
                                    <asp:ListItem>2025</asp:ListItem>
                                    <asp:ListItem>2045</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                        </div>
                        <asp:SqlDataSource ID="sqlResultsUtility" runat="server" ConnectionString="<%$ ConnectionStrings:fuelEconomy %>" ProviderName="<%$ ConnectionStrings:fuelEconomy.ProviderName %>" SelectCommand="SELECT resultsUtility.Technology, resultsUtility.[Year], resultsUtility.Segment, resultsUtility.[Vehicle Price], resultsUtility.[Resale Value], resultsUtility.[Fuel Cost], resultsUtility.[Rental Cost], resultsUtility.[Electricity Cost], resultsUtility.[Maintainance Cost], resultsUtility.Acceleration, resultsUtility.Cargo, resultsUtility.Towing, resultsUtility.[Accessory Cost], resultsUtility.Refueling, resultsUtility.HomeBackUPV2G, resultsUtility.[Risk Premium], resultsUtility.[Model Availability], resultsUtility.Parking, resultsUtility.HOV, resultsUtility.[Purchase Subsidy], resultsUtility.[ARRA Tax Credit], resultsUtility.[Home Upgrade], resultsUtility.Constant, resultsUtility.[Generalized Cost] FROM (resultsUtility INNER JOIN resultsindex ON resultsUtility.Scenario = resultsindex.ID) WHERE (resultsindex.PowerchainCost = ?) AND (resultsindex.FCCost = ?) AND (resultsindex.BatteryCost = ?) AND (resultsindex.MotorCost = ?) AND (resultsindex.Rebate = ?) AND (resultsindex.HomeWorkCharging = ?) AND (resultsindex.PublicCharging = ?) AND (resultsUtility.[Year] = ?) AND (resultsUtility.Segment = ?)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlICECost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlFCCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlBatteryCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlMotorCost" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlInstantRebate" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlHomeWorkCharging" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlPublicCharging" DefaultValue="Default" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlUtilityYear" DefaultValue="2015" Name="Year" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlUtilitySegment" DefaultValue="733" Name="Segment" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:Chart ID="chartResultsUtility" runat="server" Height="350px" Width="600px" DataSourceID="sqlResultsUtility" OnLoad="chartResultsUtility_Load">
                            <Series>
                                <asp:Series ChartType="StackedColumn" Name="Vehicle" XValueMember="Technology" YValueMembers="Vehicle Price" Legend="Legend1" BackHatchStyle="BackwardDiagonal" Color="0, 192, 192">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Resale" XValueMember="Technology" YValueMembers="Resale Value" Legend="Legend1" Color="Red">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Fuel" XValueMember="Technology" YValueMembers="Fuel Cost" Legend="Legend1" Color="192, 0, 192">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Rental" XValueMember="Technology" YValueMembers="Rental Cost" Legend="Legend1" Color="Maroon">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Elec" XValueMember="Technology" YValueMembers="Electricity Cost" Legend="Legend1" Color="0, 64, 64">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Maint" XValueMember="Technology" YValueMembers="Maintainance Cost" Legend="Legend1" BackHatchStyle="ZigZag" BorderColor="White" Color="DarkGray">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Accel" XValueMember="Technology" YValueMembers="Acceleration" Legend="Legend1" Color="192, 192, 0">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Cargo" XValueMember="Technology" YValueMembers="Cargo" Legend="Legend1" BackHatchStyle="DottedDiamond" Color="Blue">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Towing" XValueMember="Technology" YValueMembers="Towing" Legend="Legend1" Color="64, 0, 0">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Accessory" XValueMember="Technology" YValueMembers="Accessory Cost" Legend="Legend1" BorderColor="Transparent" Color="255, 128, 255">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Refuel" XValueMember="Technology" YValueMembers="Refueling" Legend="Legend1" Color="MenuHighlight">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="HomeV2G" XValueMember="Technology" YValueMembers="HomeBackUPV2G" Legend="Legend1" Color="255, 224, 192">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="RiskPrem" XValueMember="Technology" YValueMembers="Risk Premium" Legend="Legend1" Color="Gray">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="ModelAvail" XValueMember="Technology" YValueMembers="Model Availability" Legend="Legend1" BackHatchStyle="DarkDownwardDiagonal" Color="Red">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Parking" XValueMember="Technology" YValueMembers="Parking" Legend="Legend1" Color="LawnGreen">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="HOV" XValueMember="Technology" YValueMembers="HOV" Legend="Legend1" Color="64, 64, 0">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Subsidy" XValueMember="Technology" YValueMembers="Purchase Subsidy" Legend="Legend1" Color="Teal">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="ARRA" XValueMember="Technology" YValueMembers="ARRA Tax Credit" Legend="Legend1" BackHatchStyle="WideUpwardDiagonal" Color="192, 192, 0">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="HomeUp" XValueMember="Technology" YValueMembers="Home Upgrade" Legend="Legend1" Color="Black">
                                </asp:Series>
                                <asp:Series ChartType="StackedColumn" Name="Const" XValueMember="Technology" YValueMembers="Constant" Legend="Legend1" Color="Silver">
                                </asp:Series>
                                <asp:Series ChartType="Point" Name="Total" XValueMember="Technology" YValueMembers="Generalized Cost" Legend="Legend1" BorderWidth="2" Color="Black">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisX Interval="1">
                                        <MajorGrid LineWidth="0" />
                                    </AxisX>
                                    <AxisY Title="Generalized Cost($)">
                                    </AxisY>
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Docking="right" IsDockedInsideChartArea="False" Name="Legend1" ItemColumnSpacing="5">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>
                        <div style="clear: both">
                            <div style="float: left; width: 100%;">
                                <asp:Label ID="labelSelectedTechnologyUtility" runat="server" Text="Selected cost components:" CssClass="aspLabelControl"></asp:Label>
                                <br />
                                <asp:CheckBoxList ID="cblUtilityTechnologySelect" runat="server" AutoPostBack="true" RepeatColumns="7" RepeatDirection="Horizontal" Width="100%" Style="margin: 0 auto;">
                                    <asp:ListItem Selected="True" Value="Vehicle"><a title="Vehicle price" style="color:#666666">Vehicle</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Resale"><a title="Vehicle resale value" style="color:#666666">Resale</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Fuel"><a title="Fuel cost" style="color:#666666">Fuel</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Rental"><a title="Vehicle rental cost" style="color:#666666">Rental</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Elec"><a title="Electricity cost" style="color:#666666">Elec</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Maint"><a title="Vehicle maintainance cost" style="color:#666666">Maint</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Accel"><a title="Value of vehicle acceleration" style="color:#666666">Accel</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Cargo"><a title="Value of cargo" style="color:#666666">Cargo</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Towing"><a title="Value of towing" style="color:#666666">Towing</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Accessory"><a title="Accessory cost" style="color:#666666">Accessory</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Refuel"><a title="Refueling cost" style="color:#666666">Refuel</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="HomeV2G"><a title="HomeBackUPV2G" style="color:#666666">HomeV2G</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="RiskPrem"><a title="Risk premium" style="color:#666666">RiskPrem</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="ModelAvail"><a title="Model availability" style="color:#666666">ModelAvail</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Parking"><a title="Value of free parking" style="color:#666666">Parking</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="HOV"><a title="Value of HOV lane access" style="color:#666666">HOV</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Subsidy"><a title="Purchase subsidy" style="color:#666666">Subsidy</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="ARRA"><a title="ARRA tax credit" style="color:#666666">ARRA</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="HomeUp"><a title="Home upgrade cost" style="color:#666666">HomeUp</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Const"><a title="Constant" style="color:#666666">Const</a></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Total"><a title="Total generalized cost" style="color:#666666">Total</a></asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                            <div style="float: right; clear: both; width: 60%;">
                                <asp:Button ID="btnSelectAllUtility" runat="server" class="btn btn-default" Text="Select All" Width="140px" OnClick="btnSelectAllUtility_Click" />
                                <asp:Button ID="btnDeSelectAllUtility" runat="server" Style="margin-left: 2%" class="btn btn-default" Text="Deselect All" Width="140px" OnClick="btnDeSelectAllUtility_Click" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
       
    </div>
    
    <script>
        $(document).ready(function(){
        $('[data-toggle="popover"]').popover();   
        });
    </script>

    <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-81892610-1', 'auto');
          ga('send', 'pageview');

    </script>

    </asp:Content>

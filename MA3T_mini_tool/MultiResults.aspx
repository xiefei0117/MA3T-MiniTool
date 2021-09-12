<%@ Page Title="Results of Multiple Scenarios' Comparison" Language="C#" AutoEventWireup="true" CodeBehind="MultiResults.aspx.cs" MasterPageFile="~/Site.Master" Inherits="MA3T_test1._MultiResults" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="TitleDiv">
        <h1>MiniTool with Multiple Scenarios</h1>
        <div id="colorstrip"></div>
        <p style="float: right"><em>Comparison in EV sale, gasoline use, and electricity use.</em></p>
        <br />
    </div>

    <div id="ResultsLabelsDiv" style="width: 100%;">
        <div style="clear: both">
            <h3>Summary of Selected Scenarios:</h3>
        </div>
        <div id="SummaryScenarioDiv" style="width: 100%">
            <asp:Label ID="labelScenario1" runat="server" Width="100%"></asp:Label>
            <asp:Label ID="labelScenario2" runat="server" Width="100%"></asp:Label>
            <asp:Label ID="labelScenario3" runat="server" Width="100%"></asp:Label>
            <asp:Label ID="labelScenario4" runat="server" Width="100%"></asp:Label>
            <asp:Label ID="labelScenario5" runat="server" Width="100%"></asp:Label>
        </div>
    </div>
    <div id="ResultsDiv">
        <div style="clear: both">
            <h3>Comparison Results between Scenarios:</h3>
        </div>
        <div id="EVSaleResultsDiv" style="width:50%; float:left">
            <asp:Label ID="EVMarket" runat="server" Width="100%" CssClass="aspLabelControl" Font-Size="Large">Electric vehicle market share (sale):</asp:Label>
            <asp:Chart ID="chartEVMarket" runat="server" Height="300px" Width="500px">
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Sale (thousands)" Minimum="0">
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
        </div>
        <div id="GasolineUseDiv" style="width:50%; float:left">
            <asp:Label ID="labelGasolineUse" runat="server" Width="100%" CssClass="aspLabelControl" Font-Size="Large">Gasoline use:</asp:Label>
            <asp:Chart ID="chartGasoline" runat="server" Height="300px" Width="500px">
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Gasoline use (trillion BTU)" Minimum="0">
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
        </div>

        <div id="ElectricityUseDiv" style="width:50%; float:left">
            <asp:Label ID="labelElectricityUse" runat="server" Width="100%" CssClass="aspLabelControl" Font-Size="Large">Electricity use:</asp:Label>
            <asp:Chart ID="chartElectricity" runat="server" Height="300px" Width="500px">
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Electricity use (trillion BTU)" Minimum="0">
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
        </div>

        <asp:HiddenField ID="HiddenFieldScenario1" runat="server" />
        <asp:HiddenField ID="HiddenFieldScenario2" runat="server" />
        <asp:HiddenField ID="HiddenFieldScenario3" runat="server" />
        <asp:HiddenField ID="HiddenFieldScenario4" runat="server" />
        <asp:HiddenField ID="HiddenFieldScenario5" runat="server" />




    </div>

    <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-81892610-1', 'auto');
          ga('send', 'pageview');

    </script>

</asp:Content>


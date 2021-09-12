<%@ Page Language="C#" Title="MiniTool Documentation" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Documentation.aspx.cs" Inherits="MA3T_test1.Documentation" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div>
		<h1>Documentation</h1>
		<div id="colorstrip"></div>
		<p style="float: right"><em>Information, acronyms, and tutorials for the MiniTool.</em></p>
	</div>

	<h3>What is MA<sup>3</sup>T?</h3>
	<p>
		MA<sup>3</sup>T (Market Acceptance for Advanced Automotive Technologies) is a market dynamics model, developed by ORNL to estimate demands for advanced vehicle 
		powertrain technologies in response to assumptions on technology, infrastructure, consumers and policies. For additional information, please see <a href="../publications.shtml">TEEM Publications</a>.
	</p>

	<h3>What is MA<sup>3</sup>T MiniTool?</h3>

	<p>
		MA<sup>3</sup>T MiniTool is a web-based lite version of MA<sup>3</sup>T, providing a more user-friendly interface for non-technical users to quickly use the model. Using a web browser, 
		users of the MiniTool can easily modify input scenarios, such as battery cost or infrastructure deployment, and immediately observe the effect on market shares. 
		Furthermore, users can save customized inputs into a set of scenarios and compare market shares and energy use across scenarios, all without the burden to learn and run the core model.
	</p>

	<h3>Functions of MiniTool</h3>
	<ul>
		<li>Users can dynamically define scenarios by changing key parameter inputs (e.g., battery cost) and MA<sup>3</sup>T results will be updated accordingly.</li>
		<li>Each scenario yields MA<sup>3</sup>T outputs including LDV sales by technology and year, LDV fleet sizes by technology and year, total energy use by fuel type and year, utility by component, segment and year.</li>
		<li>Users can temporally save, delete, and show user-defined scenarios (up to 5 scenarios) for further comparison.</li>
		<li>Cross comparison between saved scenarios are allowed, and comparison outputs include EV market share in sale by year, gasoline use by year, and electricity use by year.</li>
	</ul>

	<h3>Notes for MiniTool Users</h3>
	<ul>
		<li><strong>Demonstration Figures in the Input Section:</strong><br />
			The MiniTool has demonstration figures for the input section. The figures are expected to help users to understand different scenarios for each input, and we may use examples 
			(e.g., the state of Alabama) for demonstration. Note that, the MiniTool’s scope is at the entire national LDV fleet, and separate calculations are actually made for each state which is not shown in the figures.
		</li>
		<li><strong>Text Explanations:</strong><br />
			For users’ convenience, the MiniTool has text explanations for different parts. For example, by mouseover the text “BEV” under “Selected Technology” in the sale output section, 
			an explanatory text will appear showing “Battery Electric Vehicle”.
		</li>
		<li><strong>Cross Comparison between Scenarios:</strong><br />
			The button “Compare with Saved Scenarios” is only activated when at least 2 scenarios are saved.
		</li>
	</ul>

	<h3>Acronyms</h3>
	<dl class="dl-horizontal">
		<dt>AC</dt>
		<dd>Alternating Current</dd>
		<dt>AEO</dt>
		<dd>Annual Energy Outlook</dd>
		<dt>Autonomie</dt>
		<dd>Vehicle simulation model developed by Argonne National Laboratory</dd>
		<dt>CD</dt>
		<dd>Charge-Depleting</dd>
		<dt>CS</dt>
		<dd>Charge-Sustaining</dd>
		<dt>CNG</dt>
		<dd>Compressed Natural Gas</dd>
		<dt>BEV</dt>
		<dd>Battery Electric Vehicle</dd>
		<dt>EREV</dt>
		<dd>Extended-Range Electric Vehicle</dd>
		<dt>FC</dt>
		<dd>Fuel Cell</dd>
		<dt>GPM</dt>
		<dd>Gallon Per Mile</dd>
		<dt>H2</dt>
		<dd>Hydrogen</dd>
		<dt>HEV</dt>
		<dd>Hybrid Electric Vehicle</dd>
		<dt>LDV</dt>
		<dd>Light-Duty Vehicle</dd>
		<dt>PHEV</dt>
		<dd>Plug-In Hybrid Electric Vehicle</dd>
	</dl>
    <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-81892610-1', 'auto');
          ga('send', 'pageview');

    </script>
</asp:Content>

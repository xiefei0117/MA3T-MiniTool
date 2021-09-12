<%@ Page Title="MiniTool with Multiple Scenarios" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MultiMiniTool.aspx.cs" Inherits="MA3T_test1._MultiMiniTool" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>MiniTool with Multiple Scenarios</h1>
        <div id="colorstrip"></div>
        <p style="float: right"><em>Comparisons in results can be displayed between multiple scenarios.</em></p>
        <br />
    </div>
    <div style="width: 100%">
    </div>

    <div id="MultiMain" style="width: 100%;">
        <div id="inputDiv">
            <asp:Label ID="labelNumberOfScenarios" runat="server" CssClass="aspLabelControl" Text="# of Scenarios:"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" AutoPostBack="True" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" Width="98px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Selected="True" Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
            </asp:DropDownList>
            <hr />
            <div style="min-height:320px">
                <asp:Table ID="tableInput" runat="server" Width="100%">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell Width="10%">Scenario<sup>1</sup></asp:TableHeaderCell>
                        <asp:TableHeaderCell Width="12.5%">ICE/Trans/ EmissionC Cost<sup>2</sup></asp:TableHeaderCell>
                        <asp:TableHeaderCell Width="12.5%">Fuel Cell Cost<sup>2</sup></asp:TableHeaderCell>
                        <asp:TableHeaderCell Width="12.5%">Battery Cost<sup>2</sup></asp:TableHeaderCell>
                        <asp:TableHeaderCell Width="12.5%">Motor/Electronics Cost<sup>2</sup></asp:TableHeaderCell>
                        <asp:TableHeaderCell Width="12.5%">Home/Work Charging Level<sup>2</sup></asp:TableHeaderCell>
                        <asp:TableHeaderCell Width="15%">Instant Rebate Level<sup>2</sup></asp:TableHeaderCell>
                        <asp:TableHeaderCell Width="12.5%">Public Charging Level<sup>2</sup></asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow ID="Scenario1" Height="50px">
                        <asp:TableCell>
                        #1
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlICEScenario1" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlFCScenario1" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlBatteryScenario1" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlMotorScenario1" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlConsumerScenario1" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlPolicyScenario1" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">+5K Short</asp:ListItem>
                                <asp:ListItem Value="Alternative2">+5K Long</asp:ListItem>
                                <asp:ListItem Value="Alternative3">+5K Short/5K Long</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlInfrastructureScenario1" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="Scenario2" Height="50px" Visible="true">
                        <asp:TableCell>
                        #2
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlICEScenario2" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlFCScenario2" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlBatteryScenario2" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlMotorScenario2" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlConsumerScenario2" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlPolicyScenario2" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">+5K Short</asp:ListItem>
                                <asp:ListItem Value="Alternative2">+5K Long</asp:ListItem>
                                <asp:ListItem Value="Alternative3">+5K Short/5K Long</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlInfrastructureScenario2" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow ID="Scenario3" Height="50px" Visible="false">
                        <asp:TableCell>
                        #3
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlICEScenario3" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlFCScenario3" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlBatteryScenario3" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlMotorScenario3" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlConsumerScenario3" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlPolicyScenario3" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">+5K Short</asp:ListItem>
                                <asp:ListItem Value="Alternative2">+5K Long</asp:ListItem>
                                <asp:ListItem Value="Alternative3">+5K Short/5K Long</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlInfrastructureScenario3" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow ID="Scenario4" Height="50px" Visible="false">
                        <asp:TableCell>
                        #4
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlICEScenario4" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlFCScenario4" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlBatteryScenario4" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlMotorScenario4" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlConsumerScenario4" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlPolicyScenario4" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">+5K Short</asp:ListItem>
                                <asp:ListItem Value="Alternative2">+5K Long</asp:ListItem>
                                <asp:ListItem Value="Alternative3">+5K Short/5K Long</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlInfrastructureScenario4" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow ID="Scenario5" Height="50px" Visible="false">
                        <asp:TableCell>
                        #5
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlICEScenario5" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlFCScenario5" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlBatteryScenario5" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlMotorScenario5" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlConsumerScenario5" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlPolicyScenario5" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">+5K Short</asp:ListItem>
                                <asp:ListItem Value="Alternative2">+5K Long</asp:ListItem>
                                <asp:ListItem Value="Alternative3">+5K Short/5K Long</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlInfrastructureScenario5" runat="server" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="Default">Baseline</asp:ListItem>
                                <asp:ListItem Value="Alternative1">Moderate</asp:ListItem>
                                <asp:ListItem Value="Alternative2">Optimistic</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                </asp:Table>
            </div>
        </div>
        <div>
            <asp:Label ID="labelFootNote" runat="server" CssClass="aspLabelControl" Text="Note:"></asp:Label>
            <p>1. Users can compare up to 5 scenarios at one time.<br />2. For detailed visualizations of input scenarios, users can refer to the <a runat="server" target="_blank" href="~/SingleMiniTool">single scenario</a> version of the MiniTool.</p>
            <br />
            <asp:Button ID="btnCalculate" runat="server" class="btn btn-default" Text="Compare" Width="160px" OnClick="btnCalculate_Click" />
            <asp:Button ID="btnReset" runat="server" Style="margin-left: 2%"  class="btn btn-default" Text="Reset All To Baseline" Width="160px" OnClick="btnReset_Click"/>
        </div>
    </div>
</asp:Content>

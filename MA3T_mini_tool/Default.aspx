<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MA3T_test1._Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>MA<sup>3</sup>T MiniTool</h1>
        <p>MA<sup>3</sup>T MiniTool is a web-based lite version of the <a href="http://teem.ornl.gov/">MA<sup>3</sup>T model</a>. The MiniTool is a collection of pre-determined scenario results and is dedicated for both technical and 
            non technical users. For technical users, the MiniTool allows quick query across multiple scenario results without running the complete MA<sup>3</sup>T model. For non-technical users
            , the MiniTool performs as an educational tool and helps users to understand major functionalities of the MA<sup>3</sup>T model.   
        </p>
    </div>
<!--the whole main body section -->
    <div style="float:left; width:9%;  min-height:400px;"></div>
    <div id="buttondiv" style="float:left; width:33%; padding-top:20px;">
        
       <asp:Button ID="btnMiniTool" runat="server" class="btn btn-default" Text="MiniTool" Width="100%"  OnClick="btnMiniTool_Click"/>
        <hr />
       <asp:Button ID="btnDocumentation" runat="server" class="btn btn-default" Text="Documentation" Width="100%" OnClick="btnDocumentation_Click" />
        <hr />
       <asp:Button ID="btnContact" runat="server" class="btn btn-default" Text="Contact Us" Width="100%" OnClick="btnContact_Click" />   
        <hr />
        <asp:Button ID="btnTEEM" runat="server" class="btn btn-default" Text="TEEM Website (under construction)" Width="100%"/>   
    </div>
    <div style="float:left; width:5%; min-height:100px; "></div>
    <div id="middlebar" style="float:left; width:3%; min-height:100px;">
    </div>
    <div id="MA3TGraog" style="float:left; width:40%;  min-height:100px;">
        <div style="min-height:100px">
            <asp:Image ID="imageMulti" runat="server" ImageUrl="~/Content/images/MiniTool.PNG" Width="100%" />
        </div>  
    </div>
    <div style="float:left; width:7%;  min-height:100px;"></div>
    <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-81892610-1', 'auto');
          ga('send', 'pageview');

    </script>
</asp:Content>

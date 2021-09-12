<%@ Page Title="Contact us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MA3T_test1.Contact" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h1>Contact Us</h1>
        <div id="colorstrip"></div>
        <p style="float: right"><em>Send inquires or comments through the following form.</em></p>
        <br />
    </div>


    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
        <asp:Label ID="labelContact" runat="server" CssClass="aspLabelControl">Please forward your questions or comments with the following form, or send your request directly to the TEEM manager, <a href="mailto:linz@ornl.gov">Zhenhong Lin.</a></asp:Label>

        <p>
            <br />
            Your name:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
            ControlToValidate="YourName" ValidationGroup="save" /><br />
            <asp:TextBox ID="YourName" runat="server" Width="250px" /><br />
            Your email address:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
            ControlToValidate="YourEmail" ValidationGroup="save" /><br />
            <asp:TextBox ID="YourEmail" runat="server" Width="250px" />
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator23"
                SetFocusOnError="true" Text="Example: username@gmail.com" ControlToValidate="YourEmail"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                ValidationGroup="save" /><br />
            Subject:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
            ControlToValidate="YourSubject" ValidationGroup="save" /><br />
            <asp:TextBox ID="YourSubject" runat="server" Width="400px" /><br />
            Your Question:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
            ControlToValidate="Comments" ValidationGroup="save" /><br />
            <asp:TextBox ID="Comments" runat="server"
                TextMode="MultiLine" Rows="10" Width="400px" />
        </p>
        <p>
            <asp:Button ID="btnSubmit" class="btn btn-default" runat="server" Text="Submit" Width="170px"
                OnClick="Button1_Click" ValidationGroup="save" enabled="true"/>
        </p>
    </asp:Panel>
    <p>
        <asp:Label ID="DisplayMessage" runat="server" Visible="false" />
    </p>

    <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-81892610-1', 'auto');
          ga('send', 'pageview');

    </script>

</asp:Content>

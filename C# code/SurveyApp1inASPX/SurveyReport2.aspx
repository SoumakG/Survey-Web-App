<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyReport2.aspx.cs"
    Inherits="SurveyApp1inASPX.SurveyReport2" %>

<!DOCTYPE HTML>
<html lang="en">
<head id="Head1" runat="server">
    <title>Survey Report</title>
    <link href="Styles/Survey.css" rel="stylesheet" type="text/css" />
    <script src="jquery/jquery-1.9.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="jquery/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <script src="jquery/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
       
    </script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

        // Load the Visualization API and the piechart package.
        google.load('visualization', '1.0', { 'packages': ['corechart'] });

        // Set a callback to run when the Google Visualization API is loaded.
        google.setOnLoadCallback(drawChart);

            function drawChart() {
        var webServiceUrl = "SurveyReport2.aspx/getOptions";
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: webServiceUrl,
            data: '{}',
            success: function (resultData) {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Options');
                data.addColumn('number', 'Vote Count');
                for (var i = 0; i < resultData.d.length; i++) {
                    data.addRow([resultData.d[i].Description, resultData.d[i].Count]);
                }
                // Set chart options
                var options = { is3D: true, 'title': '', chartArea: { left: 150, top: 0, width: "100%", height: "100%" }, height: 400, width: 500 };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        });     
        
           
        }
    </script>
</head>
<body>
    <header>
        <table style="width: 100%">
            <tbody>
                <tr>
                    <td>
                        <img src="/Images/logoIonsurvey.jpg" alt="Welcome" height="55" width="132">
                    </td>
                    <td style="text-align: right">
                        Welcome XYZ<br />
                        23-Nov-2014
                    </td>
                </tr>
            </tbody>
        </table>
        <div>
            <img src="Images/topbar.jpg" alt="toolbar" width="100%" height="30" />
        </div>
    </header>
    <div class="left_nav">
        <div id="button">
            <ul>
                <li><a href="AdminHome.aspx">Home</a></li>
                <li><a href="AddNewSurvey.aspx">Add New Survey</a></li>
                <li><a class="selected" href="SurveyReport1.aspx">Reports</a></li>
                <li><a href="#">Log Out</a></li>
            </ul>
        </div>
    </div>
    <div class="SIU1" style=" width: 70%; padding-left: 5%; margin-top: 1%; ">
        <div>
            <h2 >
                Home >> Reports >> Report Bar Graph</h2>
            <h4 style="float: right;">
                <asp:Label ID="lblSurveyDate" runat="server" Text="Label" Visible="False"></asp:Label></h4>
        </div>
        <div class="SIU2" style="width: 62%">
            <h3>
                <asp:Label ID="lblSurveyQues" runat="server" Text="Label"></asp:Label></h3>
            <div id="chart_div">
            </div>
        </div>
    </div>
   <footer>
        <div style="height: 90px; text-align: center">
            <div class="smalltxt">
                <img src="Images/smenudiv.jpg" alt="border" height="3" width="100%" />
                <a href="#">QUALITY MANAGEMENT SYSTEM </a>
                | <a href="#">
                    HELPDESK </a>| <a href="#">IONSurvey
                        WEBMAIL </a>| <a href="#">IONSurvey DIRECTORY
                        </a>| <a href="#">HR &amp; PAYROLL</a>
                | <a href="#">
                    IONSurvey POLICY </a>
            </div>
            <img src="Images/copyright1.jpg" alt="copyright" style="margin-left: 120px" />
        </div>
    </footer>
</body>
</html>

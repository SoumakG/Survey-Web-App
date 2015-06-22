<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyReport1.aspx.cs" Inherits="SurveyApp1inASPX.SurveyReport1" %>

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
        $(function () {
            $("#dtpStartDate").datepicker({
                showOn: "button",
                buttonImage: "images/calendar.gif",
                buttonImageOnly: true,
                buttonText: "",
                minDate: 0,
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#dtpEndDate").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#dtpEndDate").datepicker({
                showOn: "button",
                buttonImage: "images/calendar.gif",
                buttonImageOnly: true,
                buttonText: "",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#dtpStartDate").datepicker("option", "maxDate", selectedDate);
                }
            });
        });

         $(function() { $( 'td' ).tooltip();});
           $(document).ready(function () {
            var webServiceUrl = "AdminHome.aspx/getData";
            $.ajax({
                type: "POST",
                url: webServiceUrl,
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: SuccessCallBack,
                error: FailureCallBack
                  });
        });

        function SuccessCallBack(data) {
            var table = document.createElement('table');
            var str = '<table>';
            str += '<tr><th>ID</th><th>Question</th><th>Question Type</th><th>Start Date</th><th>End Date</th></tr>';

            for (var i = 0; i < data.d.length; i++) {
                var j = i + 1;
                str += '<tr><td scope="row" class="spec">' + data.d[i].ID + '</td><td title="'+data.d[i].Question_Detail+'"><a href=" http://localhost:51641/SurveyReport2.aspx?field1= ' + data.d[i].ID + '">' + Truncate(data.d[i].Question_Detail) + '</a></td><td>' + ChangeQuesTypeFormat(data.d[i].Question_Type) + '</td><td>' + ChangeDateFormat(data.d[i].Start_Date) + '</td><td>' + ChangeDateFormat(data.d[i].End_Date) + '</td></tr>';
            }
            str += '</table>';
            //return str;

            var existingDiv = document.getElementById('mytable');
            existingDiv.innerHTML = str;
        }
        function FailureCallBack(data) {
            alert(data.staus + " : " + data.statusText);
        }
      //  changing date format
        function ChangeDateFormat(jsondate) {
            jsondate = jsondate.replace("/Date(", "").replace(")/", "");
            if (jsondate.indexOf("+") > 0) {
                jsondate = jsondate.substring(0, jsondate.indexOf("+"));
            }
            else if (jsondate.indexOf("-") > 0) {
                jsondate = jsondate.substring(0, jsondate.indexOf("-"));
            }

            var date = new Date(parseInt(jsondate, 10));
            var month = date.getMonth() + 1 < 10 ?
		"0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            return currentDate + "-" + month + "-" + date.getFullYear();
        }

       function Truncate(input) {
         if (input.length > 18)
        { input = input.substring(0, 18) + "..."; 
            return input;
           }
           else return input;
           }
      function ChangeQuesTypeFormat(quesType)
      {
      if (quesType=="optionMCSingle" )
      {
       quesType= "Multiple Choice - Single Answer";
       return quesType;
      }
      else if (quesType == "optionMCMultiple")
      {
      quesType = "Multiple Choice - Multiple Answer";
      return quesType;
      }
      else if (quesType == "optionAgree")
      {
      quesType = "True/False";
      return quesType;
      }
      

      }
    /// seacrh button click
      
      $('btnGenerate').click(function () {
         
          var strtDate = document.getElementById("dtpStartDate").value;
          var endDate = document.getElementById("dtpEndDate").value;
          var quesType = document.getElementById("cmbQuestionType").value;
    var webServiceUrl = "AdminHome.aspx/getData";
            $.ajax({
                type: "POST",
                url: webServiceUrl,
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: SuccessCallBack1,
                error: FailureCallBack
                  });
        });

        function SuccessCallBack1(data) {
            var table = document.createElement('table');
            var str = '<table>';
            str += '<tr><th>ID</th><th>Question</th><th>Question Type</th><th>Start Date</th><th>End Date</th></tr>';

            for (var i = 0; i < data.d.length; i++) {
                if(strtDate == data.d[i].Start_Date || endDate == data.d[i].End_Date || quesType == data.d[i].Question_Type)
                {
                    str += '<tr><td scope="row" class="spec"></td><td title="' + data.d[i].Question_Detail + '"><a href=" http://localhost:51641/SurveyReport2.aspx?field1= ' + data.d[i].ID + '">' + Truncate(data.d[i].Question_Detail) + '</a> </td><td>' + ChangeQuesTypeFormat(data.d[i].Question_Type) + '</td><td>' + ChangeDateFormat(data.d[i].Start_Date) + '</td><td>' + ChangeDateFormat(data.d[i].End_Date) + '</td></tr>';
                   }
            }
            str += '</table>';
            //return str;

            var existingDiv = document.getElementById('mytable');
            existingDiv.innerHTML = str;
        }
       ' + data.d[i].ID + '
     

     
    </script>
</head>
<body>
     <header>
       <table style="width:100%">
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
                <li><a class="selected" href="">Reports</a></li>
                <li><a href="#">Log Out</a></li>
            </ul>
        </div>
    </div>
    <div class="SIU1" style=" padding-right: 18%; ">
        <h2>
           Home >> Reports</h2>
        <div class="SIU2" style="width: 97%;">
            <h2>
                Survey Report</h2>
            <table style="width: 133%; margin-top: 30px" cellpadding="3" cellspacing="3">
                <tr>
                    <td class="tdRight rptLabel">
                        Start Date
                    </td>
                    <td>
                        <input id="dtpStartDate" class="txtbox width100" type="text" />
                        <label class="tdRight rptLabel">
                            &nbsp;&nbsp; End Date
                        </label>
                        &nbsp;&nbsp;
                        <input id="dtpEndDate" class="txtbox width100" type="text" />
                    </td>
                </tr>
                <tr>
                    <td class="tdRight rptLabel">
                        Question Type
                    </td>
                    <td class="tdLeft ">
                        <select id="cmbQuestionType" class="ddlselect">
                        <option id="option3">All</option>
                            <option id="optionAgree">True / False</option>
                            <option id="option1">Multiple Choice - Single Answer</option>
                            <option id="option2">Multiple Choice - Multiple Answer</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <input id="btnGenerate" type="button" value="Generate" class="button-container" />
                    </td>
                </tr>
            </table>
            <br />

            <table id="mytable" class="table1" style="width: 100%;" cellspacing="0">
                <tr>
                    <th scope="col" id="Sl No.">
                        Sl No.
                    </th>
                    <th scope="col" id="Question Type">
                        Question Type
                    </th>
                    <th scope="col" id="Question">
                        Question
                    </th>
                    <th scope="col" id="Start_Date">
                        Start Date
                    </th>
                    <th scope="col" id="End_Date">
                        End Date
                    </th>
                    <th scope="col" id="Status">
                        Status
                    </th>
                </tr>
                <tr>
                    <th scope="row" class="spec">
                        1
                    </th>
                    <td>
                        True/False
                    </td>
                    <td>
                        Who will win this election?
                    </td>
                    <td>
                        1-Nov-2014
                    </td>
                    <td>
                        12-Nov-2014
                    </td>
                    <td>
                        Completed
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="spec">
                        2
                    </th>
                    <td>
                        Multiple Choice - Single Answer
                    </td>
                    <td>
                        Who will be the next President??
                    </td>
                    <td>
                        13-Nov-2014
                    </td>
                    <td>
                        14-Nov-2014
                    </td>
                    <td>
                        Incomplete
                    </td>
                </tr>
            </table>
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

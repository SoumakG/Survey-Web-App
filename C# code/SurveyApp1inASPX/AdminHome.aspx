<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="SurveyApp1inASPX.AdminHome" %>

<!DOCTYPE HTML>
<html lang="en">
<head id="Head1" runat="server">
    <title>Home</title>
    <link href="Styles/Survey.css" rel="stylesheet" type="text/css" />
    <script src="jquery/jquery-1.9.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="jquery/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <script src="jquery/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function() {
    $( 'td' ).tooltip();
  });
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
                str += '<tr><td scope="row" class="spec">' + data.d[i].ID + '</td><td title="'+data.d[i].Question_Detail+'">' + Truncate(data.d[i].Question_Detail) + '</td><td>' + ChangeQuesTypeFormat(data.d[i].Question_Type) + '</td><td>' + ChangeDateFormat(data.d[i].Start_Date) + '</td><td>' + ChangeDateFormat(data.d[i].End_Date) + '</td></tr>';
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
         if (input.length > 15)
        { input = input.substring(0, 15) + "..."; 
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
    <div>
        <div class="left_nav">
            <div id="button">
                <ul>
                    <li><a class="selected" href="">Home</a></li>
                    <li><a href="AddNewSurvey.aspx">Add New Survey</a></li>
                    <li><a href="SurveyReport1.aspx">Reports</a></li>
                    <li><a href="#">Log Out</a></li></ul>
            </div>
        </div>
        <div class="SIU1" style=" padding-right: 135px; padding-left: 90px; margin-top: 11px;" ">
            <h2>
                Home</h2>
            <div class="SIU2" style="width: 73%; padding-left:61px">
                <h2>
                    Survey Details</h2>
              
                <table id="mytable" class="table1" style="width: 80%;" cellspacing="0">
                    <%-- <tr>
                    <th scope="col" id="Sl no.">
                        Sl No.
                    </th>
                    <th scope="col" id="Question">
                        Question
                    </th>
                    <th scope="col" id="Question Type">
                        Question Type
                    </th>
                    <th scope="col" id="Start_Date">
                        Start Date
                    </th>
                    <th scope="col" id="End_Date">
                        End Date
                    </th>
                </tr>
                <tr>
                    <th scope="row" class="spec">
                        1
                    </th>
                    <td>
                        Who will win this election?
                    </td>
                    <td>
                        True / False
                    </td>
                    <td>
                        1-Nov-2014
                    </td>
                    <td>
                        12-Nov-2014
                    </td>
                </tr>--%>
                </table>
                
            </div>
        </div>
    </div>
    <br />
    <br />
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

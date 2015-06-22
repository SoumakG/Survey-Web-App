<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EndUser.aspx.cs" Inherits="SurveyApp1inASPX.EndUser" %>

<!DOCTYPE HTML>
<html lang="en">
<head id="Head1" runat="server">
    <title>ION Survey</title>
    <link href="Styles/Survey.css" rel="stylesheet" type="text/css" />
    <script src="jquery/jquery-1.9.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="jquery/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <script src="jquery/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
           $(document).ready(function () {
            var webServiceUrl = "EndUser.aspx/getOptions";
            $.ajax({
                type: "POST",
                url: webServiceUrl,
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: SuccessCallBack,
                error: FailureCallBack,
                  });
        });

        function SuccessCallBack(data) {
            var table = document.createElement('table');
            var str = '<table>';
            var surveyType= document.getElementById("hdnFldSurveyType").value;
            if (surveyType!= "optionMCMultiple"){
            for(var i = 0; i < data.d.length; i++) {
             str += '<tr><td class="tdRight"><input type="radio" name="options" id="options" value="'+data.d[i].Description+'" ></td><td><p class="optionsText">' + data.d[i].Description + '</p></td></tr>';
            }}
            else
            {
            for(var i = 0; i < data.d.length; i++) {
             str += '<tr><td class="tdRight"><input type="checkbox" name="options" id="options" value="'+data.d[i].Description+'" ></td><td><p class="optionsText">' + data.d[i].Description + '</p></td></tr>';
            }
            }
            str += '</table>';
            //return str;

            var existingDiv = document.getElementById('mytable');
            existingDiv.innerHTML = str;
        }
        function FailureCallBack(data) {
            alert(data.staus + " : " + data.statusText);
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
                    </td>
                </tr>
            </tbody>
        </table>
        <div>
            <img src="Images/topbar.jpg" alt="toolbar" width="100%" height="30" />
        </div>
    </header>
    <div class="left_nav" style="visibility: hidden;">
        <div id="button">
        </div>
    </div>
    <div class="SIU1">
        <h2>
            Ion <strong style="color: Red">Survey</strong></h2>
        <div class="SIU2" style="width: 65%">
            <div style="padding-bottom: 40px;">
                <h4 style="float: left">
                    Survey ID : <asp:Label ID="lblSurveyID" runat="server" Text="Label"></asp:Label></h4>
                <h4 style="float: right;">
                    Survey Date :<asp:Label ID="lblSurveyDate" runat="server" Text="Label"></asp:Label></h4>
            </div>
            <form id="formEndUserSurvey" action="EndUser.aspx" runat="server" method="post">
            <h3>
                <asp:Label ID="lblSurveyQues" runat="server" Text="Label">Who will win this election?</asp:Label>
            </h3>
            <div id="options">
                <table id="mytable" style="width: 100%;">
                  <%--  <tr>
                        <td class="tdRight">
                            <input id="Radio1" name="answer" type="radio" />
                        </td>
                        <td>
                            <p class="optionsText">
                                Democratic Party
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdRight">
                            <input id="Radio2" name="answer" type="radio" />
                        </td>
                        <td>
                            <p class="optionsText">
                                Republican Party</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdRight">
                            <input id="Radio3" name="answer" type="radio" />
                        </td>
                        <td>
                            <p class="optionsText">
                                Others</p>
                        </td>
                    </tr>
                    <tr><td class="tdCenter" colspan="2" id="tdSubmit"></td></tr>--%>
                </table>
                <div style=" margin-left: 175px">
                <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="button-container tdCenter"  />
                </div>
                <asp:HiddenField ID="hdnFldSurveyType" runat="server" />
            </div>
            </form>
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

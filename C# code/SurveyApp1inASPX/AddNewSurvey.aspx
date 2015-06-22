<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewSurvey.aspx.cs" Inherits="SurveyApp1inASPX.AddNewSurvey" %>

<!DOCTYPE HTML>
<html lang="en">
<head id="Head1" runat="server">
    <title>Add New Survey</title>
    <link href="Styles/Survey.css" rel="stylesheet" type="text/css" />
    <script src="jquery/jquery-1.9.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="jquery/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <script src="jquery/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        // datepicker
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
        });</script>
    <script type="text/javascript">
        // required field validators
        function validateForm() {
            var x = document.forms["NewSurveyForm"]["txtQuestionDetails"].value;
            if (x == null || x == "") {
                alert("Question Details must be filled out");
                return false;
            }
            var x = document.forms["NewSurveyForm"]["dtpStartDate"].value;
            if (x == null || x == "") {
                alert("Survey Start Date must be filled ");
                return false;
            }
            var x = document.forms["NewSurveyForm"]["dtpEndDate"].value;
            if (x == null || x == "") {
                alert("Survey End Date must be filled ");
                return false;
            }

        }</script>
    <script type="text/javascript">
        //resests the input fields
        function resetForm() {
            document.getElementById("txtQuestionDetails").value = null;
            document.getElementById("dtpStartDate").value = null;
            document.getElementById("dtpEndDate").value = null;

        }</script>
    <script type="text/javascript">
        $(document).ready(function () {

            var counter = 1;
            //adds option textbox
            $("#btnAddOption").click(function (e) {
                e.preventDefault();

                if (counter > 10) {
                    alert("Only 10 textboxes allowed");
                    return false;
                }

                var newTextBoxDiv = $(document.createElement('div')).attr("id", 'OptionDiv' + counter);
                newTextBoxDiv.after().html('<label>Option' + counter + ' : </label>' + '<input type="text" name="options' + counter + '" id="options' + counter + '" value="" >');
                newTextBoxDiv.appendTo("#OptionGroup");
                $("#hdnOptionCount").val(counter);
                counter++;

            });
            //removes option textbox
            $("#btnRemoveOption").click(function (e) {
                e.preventDefault();
                if (counter == 1) {
                    alert("No more textbox to remove");
                    return false;
                }
                --counter;
                $("#OptionDiv" + counter).remove();
                $("#hdnOptionCount").val(counter);
            });
            // dropdownlist change
            $(function () {
                var selectedVal = $('#cmbQuestionType :selected').text();
                if (selectedVal == "Agree/Disagree") {
                    for (counter = 1; counter < 3; counter++) {
                        if (counter == 1) {
                            var newTextBoxDiv = $(document.createElement('div')).attr("id", 'OptionDiv' + counter);
                            newTextBoxDiv.after().html('<label>True Option  :  </label>' + '<input type="text" name="options' + counter + '" id="options' + counter + '" value="" >');
                            newTextBoxDiv.appendTo("#OptionGroup");
                        }
                        else {
                            var newTextBoxDiv = $(document.createElement('div')).attr("id", 'OptionDiv' + counter);
                            newTextBoxDiv.after().html('<label>False Option : </label>' + '<input type="text" name="options' + counter + '" id="options' + counter + '" value="" >');
                            newTextBoxDiv.appendTo("#OptionGroup");
                        }
                        $("#hdnOptionCount").val(counter);
                    }
                    $("#btnAddOption").hide();
                    $("#btnRemoveOption").hide();
                }
                else {
                    counter = 1;
                    $('#OptionGroup').empty();
                    $("#btnAddOption").show();
                    $("#btnRemoveOption").show();
                }

            });

            $("#cmbQuestionType").change(function () {
                var selectedVal = $('#cmbQuestionType :selected').text();
                if (selectedVal == "Agree/Disagree") {
                    if (counter > 0)
                        $('#OptionGroup').empty();
                    for (counter = 1; counter < 3; counter++) {
                        if (counter == 1) {
                            var newTextBoxDiv = $(document.createElement('div')).attr("id", 'OptionDiv' + counter);
                            newTextBoxDiv.after().html('<label>True Option  :  </label>' + '<input type="text" name="options' + counter + '" id="options' + counter + '" value="" >');
                            newTextBoxDiv.appendTo("#OptionGroup");
                        }
                        else {
                            
                            var newTextBoxDiv = $(document.createElement('div')).attr("id", 'OptionDiv' + counter);
                            newTextBoxDiv.after().html('<label>False Option : </label>' + '<input type="text" name="options' + counter + '" id="options' + counter + '" value="" >');
                            newTextBoxDiv.appendTo("#OptionGroup");
                        }
                        $("#hdnOptionCount").val(counter);
                    }
                    $("#btnAddOption").hide();
                    $("#btnRemoveOption").hide();
                    
                }
                else {
                    counter = 1;
                    $('#OptionGroup').empty();
                    $("#btnAddOption").show();
                    $("#btnRemoveOption").show();
                    $("#hdnOptionCount").val(counter);
                }

            });
        }); 
        
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
                <li><a class="selected" href="">Add New Survey</a></li>
                <li><a href="SurveyReport1.aspx">Reports</a></li>
                <li><a href="#">Log Out</a></li>
            </ul>
        </div>
    </div>
    <div class="SIU1" style="width: 70%;padding-left: 40px;padding-right: 40px;margin-top: 7px;">
        <h2>
            Home >> Add New Survey</h2>
        <div class="SIU2">
            <h2>
                Add New Survey</h2>
            <form id="NewSurveyForm" action="AddNewSurvey.aspx" runat="server" method="post" onsubmit="return validateForm()">
            <div style="width: 80%; margin-top: 30px"></div>
            <table style="width: 80%; margin-top: 30px" cellpadding="3" cellspacing="3">
                <tr>
                    <td class="tdLeft rptLabel">
                        Survey Question
                    </td>
                    <td class="tdLeft">
                        <textarea id="txtQuestionDetails" name="txtQuestionDetails" class="txtbox" cols="20"  rows="2"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="tdRight rptLabel">
                        Start Date
                    </td>
                    <td>
                        <input id="dtpStartDate" name="dtpStartDate" class="txtbox width100" type="text" />
                        <label class="tdRight rptLabel">
                            &nbsp;&nbsp; End Date
                        </label>
                        &nbsp;&nbsp;
                        <input id="dtpEndDate" name="dtpEndDate" class="txtbox width100" type="text" />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="tdRight rptLabel">
                        Question Type
                    </td>
                    <td class="tdLeft ">
                        <select id="cmbQuestionType" name="cmbQuestionType" class="select ddlselect">
                            <option selected value="optionAgree">Agree/Disagree</option>
                            <option value="optionMCSingle">Multiple Choice Single Answer</option>
                            <option value="optionMCMultiple">Multiple Choice Multiple Answer</option>
                        </select>
                    </td>
                </tr>
                <tr>
                <td></td>
                    <td id="OptionGroup">
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <input id="btnAddOption" type="submit" value="Add Option" class="button-container" />
                        <input id="btnRemoveOption" type="submit" value="Remove Option" class="button-container" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="padding: 20px">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="button-container" />
                        <input id="btnReset" type="button" value="Reset" onclick="resetForm()" class="button-container" />
                    </td>
                </tr>
            </table>
            <div>
                
                <input id="hdnOptionCount" runat="server"  hidden="hidden" value="1">
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

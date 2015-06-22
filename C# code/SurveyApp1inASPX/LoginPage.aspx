<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="SurveyApp1inASPX.LoginPage" %>

<!DOCTYPE HTML>
<html lang="en">
<head id="Head1" runat="server">
    <title>ION Survey</title>
    <link href="Styles/Survey.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <table style="width: 100%">
            <tbody>
                <tr>
                    <td>
                        <img src="/Images/logoIonsurvey.jpg" alt="Welcome" height="55" width="132">
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
    <div class="SIU1" style="margin: 90px; margin-left: 14%;">
        <h2>
            Ion <strong style="color: Red">Survey</strong> Login</h2>
        <div class="SIU2" style="width: 42%">
            <table style="margin-top: 37%; margin-left: -15%;">
                <tr>
                    <td class="tdLeft rptLabel">
                        User Name:
                    </td>
                    <td>
                        <input id="userName" class="txtbox" type="text" />
                    </td>
                </tr>
                <tr>
                    <td class="tdLeft rptLabel">
                        Password:
                    </td>
                    <td>
                        <input id="password" class="txtbox" type="text" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input id="btnLogin" class="button-container" type="button" value="Login" style="margin-left: 38%;" />
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

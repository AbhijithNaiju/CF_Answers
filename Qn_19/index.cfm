<html>
<head>
<title>Qn 19</title>
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
<body class = "w-100" >
    <form method="POST" class = " m-5 p-5  d-flex flex-column align-items-center border border-dark">
        <div class = "border-bottom border-dark pb-2" >
            19. ColdFusion Cookies<br>
                --------------------<br>
                Create a web page that will have one submit button. When submitted, the page
                will post to self.
                Create a cookie named 'VisitsCounter' and every time the submit button is
                clicked and the page is posted, the 'VisitsCounter' should be increased by 1 and
                the increased value is shown on the page.
        </div>
        <div class = "w-100 m-4" >
            <input type="submit" name="submit">
        </div>
        <cfif isDefined("form.submit")>
            <cfoutput>
                <cfset newObject = createObject("component", "components.question_19")>
                <cfset result = newObject.cookieCounter()>
                #result# 
            </cfoutput>
        <cfelse>
                <cfoutput>Click submit to count</cfoutput>
        </cfif>
    </form>
</body>
</html>
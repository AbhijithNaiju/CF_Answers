<html>
<head>
<title>Qn 4</title>
<link rel="stylesheet" href="../bootstrap-5.3.3-dist/css/bootstrap.min.css">
</head>
<body class = "w-100" >
        <div class = " m-5 p-5  d-flex flex-column align-items-center border border-dark border-bottom border-dark pb-2" >
            4. Show below details in a page
                Today's date, current Month in numeric, current month in word, Last friday
                date, Last day of month. Show Last 5 days date & day like below.
                Sunday should be red,<br>
                Monday - green,<br>
                Tuesday - orange,<br>
                Wednesday - yellow,<br>
                Thursday - bold black,<br>
                Friday - blue,<br>
                Saturday - bold red<br>
                02-Dec-2010 - Thursday<br>
                01-Dec-2010 - Wednesday<br>
                30-Nov-2010 - Tuesday<br>
                29-Dec-2010 - Monday<br>
                28-Dec-2010 - Sunday<br>

            <cfset newObject = createObject("component", "components.question_4")>
            <cfset printDateResult = newObject.printdate()>
            <cfoutput>
                <p>Today's date = #printDateResult["Today's date"]#</p>
                <p>Current Month in numeric = #printDateResult["Current Month in numeric"]#</p>
                <p>Current month in word = #printDateResult["Current month in word"]#</p>
                <p>Last friday date = #printDateResult["Last friday date"]#</p>
                <p>Last day of month = #printDateResult["Last day of month"]#</p>
            </cfoutput>
             <cfset lastFive = newObject.lastFive()>
        <cfloop collection="#lastFive#" item="i">
            <cfoutput>
            <p style="color:#i#">
                #lastFive[i]#
            </p>
            </cfoutput>
        </cfloop>
        </div> 
</body>
</html>

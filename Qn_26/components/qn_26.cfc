<cfcomponent>
    <cffunction  name="insertValues" returntype="string">
        <cfargument  name="inputText" type="string">
        <cfloop list="#arguments.inputText#" item="i" delimiters = " .">
            <cfquery name="wordExist"  datasource="TESTDS">
                select count(word) as wordCount from wordsTable where word = '#i#'
            </cfquery>
            <cfif NOT wordExist.wordCount>
                <cfquery name="formInput"  datasource="TESTDS">
                    insert into wordsTable(word) values('#i#');
                </cfquery>
            </cfif>
        </cfloop>
        <cfreturn "Text inserted successfully">
    </cffunction>
</cfcomponent>
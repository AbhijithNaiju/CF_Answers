<cfcomponent>
    <cffunction  name = "insertValues" returntype = "struct">

        <cfargument  name = "inputText" type="string">

        <cfset local.structResult = structNew()>

        <cfloop list = "#arguments.inputText#" item = "i" delimiters = " .">

            <cfset i = trim(i)>

            <cfquery name = "wordExist">
                SELECT count(word) 
                AS wordCount 
                FROM wordsTable 
                WHERE word = <cfqueryparam value='#i#' cfsqltype="cf_sql_varchar">;
            </cfquery>

            <cfif wordExist.wordCount EQ 0>
                <cfquery name = "formInput">
                    INSERT INTO wordsTable(word) 
                    VALUES(<cfqueryparam value='#i#' cfsqltype="cf_sql_varchar">);
                </cfquery>
            </cfif>

        </cfloop>
        <cfset local.structResult["succes"] = "Text inserted successfully">
        <cfreturn local.structResult>
    </cffunction>
</cfcomponent>
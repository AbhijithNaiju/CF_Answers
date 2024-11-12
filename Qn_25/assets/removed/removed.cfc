    <cffunction  name="getwords" returntype="struct">
        <cfset local.structResult = structNew()>
        <cfquery name="queryEmailCheck" datasource="TESTDS">
            select word,count('word') as wordcount from wordsTable GROUP BY word;
        </cfquery>
        <cfloop query="#queryEmailCheck#">
            <cfif(len(queryEmailCheck.word) GE 3)>
                <cfset local.structResult[queryEmailCheck.word] = queryEmailCheck.wordcount>
            </cfif>
        </cfloop>
        <cfset local.structResult=StructToSorted(local.structResult,"text","asc")>
        <cfreturn structResult>
    </cffunction>
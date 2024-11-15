<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Login </title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" href="style/form.css">
	</head>
	<body class="d-flex">
        <cfoutput>
            <form method="POST">

                <div class = "form_group" >
                    <label for="user_name">User Name</label>
                    <input type="text" name="userName" id="user_name" placeholder=""  class="form-control">
                    <span class="text-danger" id="user_name_error"></span>
                </div>

                <div class = "form_group" >
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" placeholder="" class="form-control">
                    <span id="password_error" class="text-danger"></span>
                </div>

                <div class = "form_group" >
                    <label for="userRole">Select Role</label>
                    <select name="userRole" id="userRole" class = "form-control" >
                        <option value="User">User</option>
                        <option value="Editer">Editer</option>
                        <option value="Admin">Admin</option>
                    </select>
                </div>

                <div class = "d-flex" >
                    <span class = "w-50 align-items-center justify-content-evenly d-flex " >
                        Dont have an account<a href = "./signUp.cfm" >Sign Up</a>
                    </span>
                    <button type="submit" onclick="login_form_validate()" name = "submitBtn" class = "btn btn-secondary my-2 w-50" >
                        Login
                    </button>
                </div>

                <cfif isDefined("form.submitBtn")>
                    <cfset local.newObject = createObject("component", "components.question_28")>
                    <cfset local.result = local.newObject.userLogin(form.userName,form.password,form.userRole)>
                    <cfif structKeyExists(local, "result")>
                        <div class = "text-center text-danger" >#local.result#</div>
                    </cfif>
                </cfif>

            </form>
        </cfoutput>
        <script src="../Jquery/jquery-3.7.1.js"></script>
	    <script src="js/form_validation.js"></script>
	</body>
</html>
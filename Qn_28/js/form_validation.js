function printOutput(printLocation,printValue)
{
	document.getElementById(printLocation).innerHTML = printValue;
}

function form_validate(event1)
{
	let name=document.getElementById("user_name").value;
	let password=document.getElementById("password").value;
	let confirm_password=document.getElementById("confirm_password").value;
	var name_check=/[^a-zA-Z0-9\s]/;
	var match_space=/\s/;
	if(name.trim().length==0){
		user_name_error= "Please enter your user name";
	}
	else if(name_check.test(name)){
		user_name_error = "Name should not contain any special charector";	
	}
	else if(match_space.test(name)){
		user_name_error = "User name should not contain any whitespace";	
	}
	else{
		user_name_error = ""
	}
	if(user_name_error == "")
	{
		$.ajax({
			type:"POST",
			url:"./components/question_28.cfc?method=userNameExists",
			data: {userName:name},
			success: function(result) {
				if(result)
				{
					printOutput("user_name_error","Username already exists");
					document.getElementById("submit_button").type="button";
				}
				else
				{
					document.getElementById("submit_button").type="submit";
				}
			}
		});
	}

	if(password.trim().length==0){
		var password_error = "Please enter the password";
	}
	else if(match_space.test(password)){
		var password_error = "Password should not contain any whitespace";	
	}
	else if(password.length<3){
		var password_error = "Password must be 8 charectors long";
	}
	else{
		var password_error = "";
	}

	if(confirm_password.length==0){
		var confirm_password_error = "Please confirm your password";
	}
	else if(confirm_password != password){
		var confirm_password_error = "Passwords do not match";
	}
	else{
		var confirm_password_error = "";
	}
	printOutput("user_name_error",user_name_error);
	printOutput("confirm_password_error",confirm_password_error);
	printOutput("password_error",password_error);

	if(user_name_error != "" || password_error != "" || confirm_password_error != "")
	{
		event.preventDefault();
	}
}

function login_form_validate()
{
	let name=document.getElementById("user_name").value;
	let password=document.getElementById("password").value;

	if(name.trim().length==0){
		user_name_error= "Please enter your user name";
	}
	else{
		user_name_error = ""
	}

	if(password.length==0){
		var password_error = "Please enter the password";
	}
	else{
		var password_error = "";
	}

	printOutput("user_name_error",user_name_error);
	printOutput("password_error",password_error);

	if(user_name_error != "" || password_error != "")
	{
		event.preventDefault();
	}
}

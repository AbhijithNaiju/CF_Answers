function form_validate()
{
	let name=document.getElementById("first_name").value;
	let email=document.getElementById("email").value;
	let number=document.getElementById("number").value;
	let password=document.getElementById("password").value;
	let confirm_password=document.getElementById("confirm_password").value;
	let date=document.getElementById("date").value;

	var name_check=/[^a-zA-Z0-9\s]/;
	var email_match=/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	var password_match_space=/\s/;
	var password_match_small_letter=/[a-z]/;	
	var password_match_capital_letter=/[A-Z]/;
	var password_match_special=/[^a-zA-Z0-9]/;
	var password_match_digit=/[0-9]/;

	if(name.length==0)
	{
		document.getElementById("first_name_error").innerHTML = "Please enter your first name";
	}
	else if(name_check.test(name))
	{
		document.getElementById("first_name_error").innerHTML = "Name should not contain any special charector";	
	}
	else
	{
		document.getElementById("first_name_error").innerHTML = "";
	}

	if(email.length==0)
	{
		document.getElementById("email_error").innerHTML = "Please enter the email";
	}
	else if(email_match.test(email)!=true)
	{
		document.getElementById("email_error").innerHTML = "Please enter a valid email";
	}
	else
	{
		document.getElementById("email_error").innerHTML = "";
	}

	if(number.length==0)
	{
		document.getElementById("number_error").innerHTML = "Please enter the phone number";
	}
	else if(isNaN(number))
	{
		document.getElementById("number_error").innerHTML = "Please Enter a valid number";
	}
	else if(number.length!=10)
	{
		document.getElementById("number_error").innerHTML = "Phone number must be 10 letters";
	}
	else
	{
		document.getElementById("number_error").innerHTML = "";
	}

	if(password.length==0)
	{
		document.getElementById("password_error").innerHTML = "Please enter the password";
	}
	else if(password_match_space.test(password))
	{
		document.getElementById("password_error").innerHTML = "Password does not contain any whitespace";	
	}
	else if(!password_match_small_letter.test(password))
	{
		document.getElementById("password_error").innerHTML = "Password must contain 1 smaller case letter";	
	}
	else if(!password_match_capital_letter.test(password))
	{
		document.getElementById("password_error").innerHTML = "Password must contain 1 capital letter";	
	}
	else if(!password_match_special.test(password))
	{
		document.getElementById("password_error").innerHTML = "Password must contain 1 special charector";	
	}
	else if(!password_match_digit.test(password))
	{
		document.getElementById("password_error").innerHTML = "Password must contain 1 digit";	
	}
	else if(password.length<8)
	{
		document.getElementById("password_error").innerHTML = "Password must be 8 charectors long";
	}
	else
	{
		document.getElementById("password_error").innerHTML = "";
	}

	if(confirm_password.length==0)
	{
		document.getElementById("confirm_password_error").innerHTML = "Please confirm your password";
	}
	else if(confirm_password != password)
	{
		document.getElementById("confirm_password_error").innerHTML = "Passwords do not match";
	}
	else
	{
		document.getElementById("confirm_password_error").innerHTML = "";
	}

	if(document.getElementById("male").checked || document.getElementById("female").checked)
	{
		document.getElementById("gender_error").innerHTML = "";
	}
	else
	{
		document.getElementById("gender_error").innerHTML = "Please select your gender";
	}

	if(date=="")
	{
		document.getElementById("date_error").innerHTML = "Please select your DOB";
	}
	else
	{
		document.getElementById("date_error").innerHTML = "";
	}
	if(document.getElementById("android").checked || document.getElementById("ios").checked || document.getElementById("other_device").checked)
	{

		document.getElementById("device_error").innerHTML = "";
	}
	else
	{
		document.getElementById("device_error").innerHTML = "Please select your device type";
	}
}
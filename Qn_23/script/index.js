function printOutput(printLocation,printValue)
{
	document.getElementById(printLocation).innerHTML = printValue;
}
function isUrlValid(string) {
    try {
      new URL(string);
      return true;
    } catch (err) {
      return false;
    }
   }
function validate()
{
    let positionApplying=document.getElementById("positionApplying");
    let firstName=document.getElementById("firstName");
	let email=document.getElementById("email");
	let number1=document.getElementById("number1").value;
	let number2=document.getElementById("number2").value;
	let number3=document.getElementById("number3").value;
    let startDate=document.getElementById("startDate");
    var name_check=/[^a-zA-Z0-9\s]/;
	var email_match=/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if(firstName.value.length==0)
	{
       nameError="Please enter your first name";
       $(firstName).parent().parent().addClass("error_element");
	}
	else if(name_check.test(firstName.value))
	{
        nameError="Name should not contain any special charector";
        $(firstName).parent().parent().addClass("error_element");
	}
	else
	{
        nameError="";
        $(firstName).parent().parent().removeClass("error_element");
	}
    printOutput("nameError",nameError);
    if(email.value.length==0)
    {
        emailError = "Please enter the email";
        $(email).parent().addClass("error_element");
    }
    else if(email_match.test(email.value)!=true)
    {
        emailError = "Please enter a valid email";
        $(email).parent().addClass("error_element");
    }
    else
    {
        emailError = "";
        $(email).parent().removeClass("error_element");
    }
    printOutput("emailError",emailError);
    var number=number1+number2+number3
    if(number.length==0)
    {
        phoneError = "Please enter the phone number";
        $(".phone_number_container").parent().addClass("error_element");
    }
    else if(isNaN(number))
    {
        phoneError = "Please Enter a valid number";
        $(".phone_number_container").parent().addClass("error_element");
    }
    else if(number.length!=10)
    {
        phoneError = "Phone number must be 10 letters";
        $(".phone_number_container").parent().addClass("error_element");
    }
    else
    {
        phoneError = "";
        $(".phone_number_container").parent().removeClass("error_element");
    }
    printOutput("phoneError",phoneError);
    if(startDate.value=="")
    {
        dateError = "Please select the date you can start";
        $(startDate).parent().addClass("error_element");
    }
    else
    {
        dateError = "";
        $(startDate).parent().removeClass("error_element");
    }
    printOutput("dateError",dateError);
    if(positionApplying.value=="")
    {
        positionError = "Please select  position you are applying for";
        $(positionApplying).parent().addClass("error_element");
    }
    else
    {
        positionError = "";
        $(positionApplying).parent().removeClass("error_element");

    }
    printOutput("positionError",positionError);
    if(document.getElementById("relocateYes").checked || document.getElementById("relocateNo").checked )
    {

        relocateError = "";
        $("#relocateYes").parent().parent().removeClass("error_element");

    }
    else
    {
        relocateError = "Pleases select one";
        $("#relocateYes").parent().parent().addClass("error_element");
    }
    printOutput("relocateError",relocateError);

    if(nameError != "" || emailError != "" || phoneError != "" || dateError != "" || relocateError != "" || positionError != "")
    {
        event.preventDefault();
        $(".error_div").removeClass("display_none");
    }
    else
    {
        $(".error_div").addClass("display_none");
    }
}

function validateLength3(inputValue) {
    if (inputValue.value.length >= 3){
        $(inputValue).next().focus();
    }
    if (inputValue.value.length <= 0){
        $(inputValue).prev().focus();
    }
  }

$(".input_field").click(function(){
    $(".form_element").removeClass("selected_element");
    $(this).parent().addClass("selected_element");
    })
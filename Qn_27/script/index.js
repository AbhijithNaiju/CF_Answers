function logout()
{
    if(confirm("You will log out of this page and need to authenticate again to login"))
    {
        $.ajax({
            type:"POST",
            url:"./components/question_27.cfc?method=logout",
            success: function() {
                window.location.href = "index.cfm";
            }
        });
    }
}
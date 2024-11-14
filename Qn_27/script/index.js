function logout()
{
    if(confirm("Are you sure to logout?"))
    {
        $.ajax({
            type:"POST",
            url:"./components/question_27.cfc?method=logout",
            success: function() {
                location.reload();
            }
        });
    }
}
function checkForm(form) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (form.username.value === '') {
        var userName = document.getElementById("usernameError");
        userName.innerHTML = "Error: Username cannot be blank";
        userName.style.color = "red";
        form.username.focus();
        return false;
    } else if (form.email.value === '') {
        var emailError = document.getElementById("emailError");
        emailError.innerHTML = "Error: Password cannot be blank!";
        emailError.style.color = "red";
        form.email.focus();
        return false;
    } else if (form.username.value.length < 6) {
        var usernameError = document.getElementById("usernameError");
        usernameError.innerHTML = "Error: Username must contain at least six characters!";
        usernameError.style.color = "red";
        form.username.focus();
        return false;
    } else if (form.email.value === form.username.value) {
        var usernameError = document.getElementById("usernameError");
        usernameError.innerHTML = "Error: Username must be different from Email!";
        usernameError.style.color = "red";
        form.username.focus();
        return false;
    } else if (!re.test(form.email.value)) {
        var emailError = document.getElementById("emailError");
        emailError.innerHTML = "Error: Email must contain at least one number (0-9)!";
        emailError.style.color = "red";
        form.email.focus();
        return false;
    } else {
        login(form.email.value);
        return false;
    }

    return true;
}
function login(email) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST", "createuser", true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("email=" + email);
    var emailError = document.getElementById("emailError");
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {
            emailError.innerHTML = xmlhttp.responseText.toString();
            emailError.style.color = "red";
            form.email.focus();
        }

    }
}
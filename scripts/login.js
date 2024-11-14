// Log in functionality

// Define an example user account
account = {
    user: "admin",
    pass: "secure123"
}

// Check the inputted credentials against the stored ones (above)
function checkLogin() {
    const input_user = document.querySelector("#user").value;
    const input_pass = document.querySelector("#pass").value;

    if ((input_user == account.user) && (input_pass == account.pass)) { 
        return true; 
    }
    else { 
        return false; 
    }
}

function submitLogin(event) {
    event.preventDefault();
    if (checkLogin()) {
        location.href = "mood.html";
    }
    else {
        alert("Incorrect credentials. Please try again.")
    }
}

document.querySelector("#login").addEventListener("submit", submitLogin);
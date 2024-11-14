// Create account functionality (WIP)
let account = {
    email: null,
    password: null
}

function createAccount(email, password) {
    account.email = email;
    account.password = password;
}

console.log(account);

// Create an account with an example email and password
createAccount("example@email.com", "secret1234");

console.log(account);
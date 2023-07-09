bool emailValidation(String email) {
  const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
  final regex = RegExp(pattern);
  return regex.hasMatch(email);
}

bool passwordValidation(String password) {
  return password.length > 7;
}

bool usernameValidation(String username) {
  return username.length > 7;
}

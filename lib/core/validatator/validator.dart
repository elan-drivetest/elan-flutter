String? validateName(String? value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "Name is required";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  } else if (value.length < 6) {
    return "password must 6 digits";
  }
  return null;
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "Email is required";
  } else if (!regExp.hasMatch(value)) {
    return "Invalid Email";
  } else {
    return null;
  }
}

String? validateAddress(String? value) {
  if (value == null || value.isEmpty) {
    return "Address is required";
  }
  return null;
}

String? validatePlaceCode(String? value) {
  if (value == null || value.isEmpty) {
    return "PlaceCode is required";
  }
  return null;
}

String? validateReason(String? value) {
  if (value == null || value.isEmpty) {
    return "Place update reason is required";
  }
  return null;
}

String? validateThana(String? value) {
  if (value == null || value.isEmpty) {
    return "Thana is required";
  }
  return null;
}

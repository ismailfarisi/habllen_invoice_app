String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter company name";
  }
  return null;
}

String? addressValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter address";
  }
  return null;
}

String? gstValidator(String? value) {
  if (value == null || value.length != 15) {
    return "Please enter valid GSTIN";
  }
  return null;
}

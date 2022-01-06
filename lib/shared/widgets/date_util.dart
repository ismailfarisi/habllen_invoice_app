extension DateString on DateTime {
  String toDateString() {
    final day = this.day;
    final month = this.month;
    final year = this.year;
    final date = "$day/$month/$year";
    return date;
  }
}

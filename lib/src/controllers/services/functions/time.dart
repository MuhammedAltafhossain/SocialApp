DateTime adjustMinutesToNextMultipleOfFive(DateTime dateTime) {
  int minutes = dateTime.minute;
  int moduloResult = minutes % 5;

  DateTime newDateTime = dateTime.add(Duration(minutes: 5 - moduloResult));
  if (newDateTime.isAfter(dateTime)) return dateTime;
  return newDateTime;
}

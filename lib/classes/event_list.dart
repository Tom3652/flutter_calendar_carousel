class EventList<T> {
  Map<String, List<T>> events;

  EventList({
    required this.events,
  });

  void add(DateTime date, T event) {
    final eventsOfDate = events[DateAdapter.buildDateAsString(date)];
    if (eventsOfDate == null)
      events[DateAdapter.buildDateAsString(date)] = [event];
    else
      eventsOfDate.add(event);
  }

  void addAll(DateTime date, List<T> events) {
    final eventsOfDate = this.events[DateAdapter.buildDateAsString(date)];
    if (eventsOfDate == null)
      this.events[DateAdapter.buildDateAsString(date)] = events;
    else
      eventsOfDate.addAll(events);
  }

  bool remove(DateTime date, T event) {
    final eventsOfDate = events[DateAdapter.buildDateAsString(date)];
    return eventsOfDate != null ? eventsOfDate.remove(event) : false;
  }

  List<T> removeAll(DateTime date) {
    return events.remove(DateAdapter.buildDateAsString(date)) ?? [];
  }

  void clear() {
    events.clear();
  }

  List<T> getEvents(DateTime date) {
    return events[DateAdapter.buildDateAsString(date)] ?? [];
  }
}

class DateAdapter {

  static DateTime getDateFromString(String date) {
    List<String> tempList = date.split(".");
    int year = int.parse(tempList.first);
    int month = int.parse(tempList[1]);
    int day = int.parse(tempList.last);
    return DateTime(year, month, day);
  }

  static String buildDateAsString(DateTime dateTime) {
    return "${dateTime.year}.${dateTime.month}.${dateTime.day}";
  }


  static String getDateFromDateTime(DateTime date,{bool showDay = false}) {
    //final now = DateTime.now();
    //final date = DateTime.fromMillisecondsSinceEpoch(millis);

    int day = date.day;
    int month = date.month;
    int year = date.year;

  /*  if (day == now.day && month == now.month && year == now.year && showToday) {
      return "Aujourd'hui";
    }*/

    return "${showDay ? "$day " : ""}${getMonthFromInt(month)} $year";
  }

  static String getMonthFromInt(int monthNumber) {
    switch (monthNumber) {
      case 1:
        return "Janvier";
      case 2:
        return "Février";
      case 3:
        return "Mars";
      case 4:
        return "Avril";
      case 5:
        return "Mai";
      case 6:
        return "Juin";
      case 7:
        return "Juillet";
      case 8:
        return "Août";
      case 9:
        return "Septembre";
      case 10:
        return "Octobre";
      case 11:
        return "Novembre";
      case 12:
        return "Décembre";
      default:
        return "";
    }
  }

}
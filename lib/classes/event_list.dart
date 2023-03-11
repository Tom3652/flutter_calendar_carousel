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

}
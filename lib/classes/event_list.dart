class EventList<T> {

  Map<int, List<T>> events;

  EventList({
    required this.events,
  });

  void add(DateTime date, T event) {
    events.removeWhere((key, value) => key == date.millisecondsSinceEpoch);
    events[date.millisecondsSinceEpoch] = [event];
  }

  /*
  void addAll(DateTime date, List<T> events) {
    final eventsOfDate = this.events[date.millisecondsSinceEpoch];
    if (eventsOfDate == null)
      this.events[date.millisecondsSinceEpoch] = events;
    else
      eventsOfDate.addAll(events);
  }

   */

  /*
  bool remove(DateTime date, T event) {
    final eventsOfDate = events[date.millisecondsSinceEpoch];
    return eventsOfDate != null ? eventsOfDate.remove(event) : false;
  }

   */

  List<T> removeAll(DateTime date) {
    return events.remove(date.millisecondsSinceEpoch) ?? [];
  }

  void clear() {
    events.clear();
  }

  List<T> getEvents(DateTime date) {
    return events[date.millisecondsSinceEpoch] ?? [];
  }
}

class WorkSession {
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final Duration travelDuration;

  const WorkSession({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.travelDuration,
  });

  Duration get workDuration => endTime.difference(startTime);
}

class NoteInsert {
  String lat;
  String lon;
  String note;

  NoteInsert(
    {
      required this.lat,
      required this.lon,
      required this.note
    }
  );

  Map<String, dynamic> toJson() {
    return {
      "lat": lat,
      "lon": lon,
      "text":note
    };
  }
}
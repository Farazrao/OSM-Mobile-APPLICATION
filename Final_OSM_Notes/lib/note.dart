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

   //latitue,longitude and the text feild for creat the user note in flutter and show on  OSM,

  Map<String, dynamic> toJson() {
    return {
      "lat": lat,
      "lon": lon,
      "text":note
    };
  }
}
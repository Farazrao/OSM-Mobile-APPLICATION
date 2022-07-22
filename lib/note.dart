
//Here simple i created the class NoteInsert 

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

   //latitude, longitude, and the text field for creating the user note in flutter and show on  OSM,
   //I just map the data in json form

  Map<String, dynamic> toJson() {
    return {
      "lat": lat,
      "lon": lon,
      "text":note
    };
  }
}
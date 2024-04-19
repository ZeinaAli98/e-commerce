
import 'dart:ui';

class EventModel {
  bool? success;
  List<dynamic?>? result;
  String? message;

  EventModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool;
    result =List<Event>.from(json['result'].map((x) => Event.fromJson(x)));
    message = json['message'] as String;
  }


}


class Event {
   String ?text="";
   String ?alert="";

  Event(String s, String redPoint, {this.text, this.alert});
  Event.fromJson(Map<String, dynamic> json){
  text=json['text'];
  alert =json['alert'];
  }

}

class StoryItems {
  final String title;
  final Duration duration;
  final Color backgroundColor;

  StoryItems({required this.title, required this.duration, required this.backgroundColor});

  factory StoryItems.fromJson(Map<String, dynamic> json) {
    return StoryItems(
      title: json['title'],
      duration: Duration(seconds: json['duration']),
      backgroundColor: Color(json['backgroundColor']),
    );
  }
}






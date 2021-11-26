class Note {
  String title;
  String content;

  Note({this.title = "", this.content = ""})
      : assert(title != "", content != "");
}

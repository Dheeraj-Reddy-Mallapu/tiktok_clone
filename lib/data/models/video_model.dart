class Video {
  String url;
  String title;
  String videoRef;
  int likes;
  int messages;
  int bookmarks;
  int shares;

  Video({
    required this.url,
    required this.title,
    required this.videoRef,
    required this.likes,
    required this.messages,
    required this.bookmarks,
    required this.shares,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        url: json["url"],
        title: json["title"],
        videoRef: json["videoRef"],
        likes: json["likes"],
        messages: json["messages"],
        bookmarks: json["bookmarks"],
        shares: json["shares"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "title": title,
        "videoRef": videoRef,
        "likes": likes,
        "messages": messages,
        "bookmarks": bookmarks,
        "shares": shares,
      };
}

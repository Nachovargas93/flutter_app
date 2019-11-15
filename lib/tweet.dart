class Tweet {
  String id;
  String content;

  Tweet({this.id, this.content});

  factory Tweet.fromJson(key, json) {
    return Tweet(
      id: key,
      content: json['content'],
    );
  }
}

class StationData {
  final String name;
  final String imageUrl;
  final List<String>? transfers;

  const StationData({
    required this.name,
    required this.imageUrl,
    this.transfers,
  });

  static StationData fromJson(json) => StationData(
        name: json['name'],
        imageUrl: json['imageUrl'],
        transfers: json['transfers'] != null
            ? List<String>.from(json['transfers'])
            : null,
      );
}

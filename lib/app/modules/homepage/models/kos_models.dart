class KosModel {
  final String id;
  final String name;
  final String address;
  final String price;
  final String imageUrl;
  final List<String> facilities;
  final String type;

  KosModel({
    required this.id,
    required this.name,
    required this.address,
    required this.price,
    required this.imageUrl,
    required this.facilities,
    required this.type,
  });

  // Jika perlu konversi dari JSON
  factory KosModel.fromJson(Map<String, dynamic> json) {
    return KosModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      facilities: List<String>.from(json['facilities']),
      type: json['type'],
    );
  }

  get location => null;

  get rating => null;
}
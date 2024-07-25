class Categories_list{

final int id;
// final ImageData image;
final String bottle_name;
final String size;
final int prize;

Categories_list({
required this.id,
  // required this.image,
  required this.bottle_name,
  required this.size,
  required this.prize
});

factory Categories_list.fromJson(Map<String, dynamic> json) {
  return Categories_list(
      id: json['id'] ?? 'N/A',
      bottle_name: json['bottle_name'] ?? 'N/A',
      size: json['bottle_size'] ?? 'N/A',
    prize: json['bottle_prize'] ?? 'N/A',
    // image: json['image']

  );
}


}
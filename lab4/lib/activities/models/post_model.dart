class PostModel {
   //final List<String> categories;
   final String created_at;
   final String icon_url;
   final String id;
   final String updated_at;
   final String url;
   final String value;

  const PostModel({
    // required this.categories,
    required this.created_at,
    required this.icon_url,
    required this.id,
    required this.updated_at,
    required this.url,
    required this.value});

   factory PostModel.fromJson(Map<String, dynamic> json) {
     return switch (json) {
       {
         //'categories': List<String> categories,
         'created_at': String created_at,
         'icon_url': String icon_url,
         'id': String id,
         'updated_at': String updated_at,
         'url': String url,
         'value': String value,
       } =>
           PostModel(
             //categories: categories,
             created_at: created_at,
             icon_url: icon_url,
             id: id,
             updated_at: updated_at,
             url: url,
             value: value,
           ),
       _ => throw const FormatException('Failed to load album.'),
     };
   }

}

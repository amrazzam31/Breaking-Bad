class Character {
  final int? charId;
  final String? name;
  final String? birthday;
  final List<String>? occupation;
  final String? img;
  final String? status;
  final String? nickname;
  final List<int>? appearance;
  final String? portrayed;
  final String? category;
  final List<dynamic>? betterCallSaulAppearance;

  Character({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,
    this.betterCallSaulAppearance,
  });

  Character.fromJson(Map<String, dynamic> json)
      : charId = json['char_id'] as int?,
        name = json['name'] as String?,
        birthday = json['birthday'] as String?,
        occupation = (json['occupation'] as List?)?.map((dynamic e) => e as String).toList(),
        img = json['img'] as String?,
        status = json['status'] as String?,
        nickname = json['nickname'] as String?,
        appearance = (json['appearance'] as List?)?.map((dynamic e) => e as int).toList(),
        portrayed = json['portrayed'] as String?,
        category = json['category'] as String?,
        betterCallSaulAppearance = json['better_call_saul_appearance'] as List?;


}
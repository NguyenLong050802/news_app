// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Source {
  String? id;
  String? name;
  Source({
    this.id,
    this.name,
  });

  Source copyWith({
    String? id,
    String? name,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Source(id: $id, name: $name)';

  @override
  bool operator ==(covariant Source other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

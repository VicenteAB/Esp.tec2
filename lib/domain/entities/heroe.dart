class Heroe {
  Heroe({
    this.nombre,
    this.poder,
    this.icon,
    this.color,
  });

  String? nombre;
  String? poder;
  String? icon;
  String? color;

  Heroe.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    this.nombre = json['nombre'] as String?;
    this.poder = json['poder'] as String?;
    this.icon = json['icon'] as String?;
    this.color = json['color'] as String?;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    if (nombre != null) json['nombre'] = nombre;
    if (poder != null) json['poder'] = poder;
    if (icon != null) json['icon'] = icon;
    if (color != null) json['color'] = color;
    return json;
  }
}

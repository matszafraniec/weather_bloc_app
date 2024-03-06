import 'package:json_annotation/json_annotation.dart';

part 'area_remote.g.dart';

@JsonSerializable()
class AreaRemote {
  @JsonKey(name: 'LocalizedName')
  final String name;

  AreaRemote({
    required this.name,
  });

  factory AreaRemote.fromJson(Map<String, dynamic> json) =>
      _$AreaRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$AreaRemoteToJson(this);
}

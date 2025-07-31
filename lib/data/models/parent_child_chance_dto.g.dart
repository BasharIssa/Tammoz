// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_child_chance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentChildChanceDto _$ParentChildChanceDtoFromJson(
        Map<String, dynamic> json) =>
    ParentChildChanceDto(
      parentId: (json['parentId'] as num).toInt(),
      childId: (json['childId'] as num).toInt(),
    );

Map<String, dynamic> _$ParentChildChanceDtoToJson(
        ParentChildChanceDto instance) =>
    <String, dynamic>{
      'parentId': instance.parentId,
      'childId': instance.childId,
    };

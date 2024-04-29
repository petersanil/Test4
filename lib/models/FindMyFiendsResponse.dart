/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:aquaventure/models/PartyLocation.dart';

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the FindMyFiendsResponse type in your schema. */
class FindMyFiendsResponse {
  final String? _status;
  final String? _message;
  final List<PartyLocation>? _data;

  String? get status {
    return _status;
  }
  
  String? get message {
    return _message;
  }
  
  List<PartyLocation>? get data {
    return _data;
  }
  
  const FindMyFiendsResponse._internal({status, message, data}): _status = status, _message = message, _data = data;
  
  factory FindMyFiendsResponse({String? status, String? message, List<PartyLocation>? data}) {
    return FindMyFiendsResponse._internal(
      status: status,
      message: message,
      data: data != null ? List<PartyLocation>.unmodifiable(data) : data);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FindMyFiendsResponse &&
      _status == other._status &&
      _message == other._message &&
      DeepCollectionEquality().equals(_data, other._data);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FindMyFiendsResponse {");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("message=" + "$_message" + ", ");
    buffer.write("data=" + (_data != null ? _data!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FindMyFiendsResponse copyWith({String? status, String? message, List<PartyLocation>? data}) {
    return FindMyFiendsResponse._internal(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data);
  }
  

  
  FindMyFiendsResponse.fromJson(Map<String, dynamic> json)  
    : _status = json['status'],
      _message = json['message'],
      _data = json['data'] is List
        ? (json['data'] as List)
          .where((e) => e != null)
          .map((e) => PartyLocation.fromJson(e))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'status': _status, 'message': _message, 'data': _data?.map((PartyLocation? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'status': _status,
    'message': _message,
    'data': _data
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FindMyFiendsResponse";
    modelSchemaDefinition.pluralName = "FindMyFiendsResponses";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'message',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'data',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'PartyLocation')
    ));
  });
}
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

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;

/** This is an auto generated class representing the OrderItems type in your schema. */
class OrderItems extends amplify_core.Model {
  static const classType = const _OrderItemsModelType();
  final String id;
  final String? _plu;
  final String? _orderId;
  final int? _quantity;
  final double? _price;
  final String? _name;
  final int? _eventId;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  OrderItemsModelIdentifier get modelIdentifier {
    return OrderItemsModelIdentifier(id: id);
  }

  String get plu {
    try {
      return _plu!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get orderId {
    try {
      return _orderId!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  int get quantity {
    try {
      return _quantity!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  double get price {
    try {
      return _price!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get name {
    try {
      return _name!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  int? get eventId {
    return _eventId;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const OrderItems._internal(
      {required this.id,
      required plu,
      required orderId,
      required quantity,
      required price,
      required name,
      eventId,
      createdAt,
      updatedAt})
      : _plu = plu,
        _orderId = orderId,
        _quantity = quantity,
        _price = price,
        _name = name,
        _eventId = eventId,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory OrderItems(
      {String? id,
      required String plu,
      required String orderId,
      required int quantity,
      required double price,
      required String name,
      int? eventId}) {
    return OrderItems._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        plu: plu,
        orderId: orderId,
        quantity: quantity,
        price: price,
        name: name,
        eventId: eventId);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderItems &&
        id == other.id &&
        _plu == other._plu &&
        _orderId == other._orderId &&
        _quantity == other._quantity &&
        _price == other._price &&
        _name == other._name &&
        _eventId == other._eventId;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("OrderItems {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("plu=" + "$_plu" + ", ");
    buffer.write("orderId=" + "$_orderId" + ", ");
    buffer.write("quantity=" +
        (_quantity != null ? _quantity!.toString() : "null") +
        ", ");
    buffer.write(
        "price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write(
        "eventId=" + (_eventId != null ? _eventId!.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  OrderItems copyWith(
      {String? plu,
      String? orderId,
      int? quantity,
      double? price,
      String? name,
      int? eventId}) {
    return OrderItems._internal(
        id: id,
        plu: plu ?? this.plu,
        orderId: orderId ?? this.orderId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        name: name ?? this.name,
        eventId: eventId ?? this.eventId);
  }

  OrderItems.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _plu = json['plu'],
        _orderId = json['orderId'],
        _quantity = (json['quantity'] as num?)?.toInt(),
        _price = (json['price'] as num?)?.toDouble(),
        _name = json['name'],
        _eventId = (json['eventId'] as num?)?.toInt(),
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'plu': _plu,
        'orderId': _orderId,
        'quantity': _quantity,
        'price': _price,
        'name': _name,
        'eventId': _eventId,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'plu': _plu,
        'orderId': _orderId,
        'quantity': _quantity,
        'price': _price,
        'name': _name,
        'eventId': _eventId,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<OrderItemsModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<OrderItemsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final PLU = amplify_core.QueryField(fieldName: "plu");
  static final ORDERID = amplify_core.QueryField(fieldName: "orderId");
  static final QUANTITY = amplify_core.QueryField(fieldName: "quantity");
  static final PRICE = amplify_core.QueryField(fieldName: "price");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final EVENTID = amplify_core.QueryField(fieldName: "eventId");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "OrderItems";
    modelSchemaDefinition.pluralName = "OrderItems";

    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.PUBLIC,
          operations: const [
            amplify_core.ModelOperation.READ,
            amplify_core.ModelOperation.UPDATE,
            amplify_core.ModelOperation.CREATE
          ])
    ];

    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["orderId"], name: "byOrder")
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: OrderItems.PLU,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: OrderItems.ORDERID,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: OrderItems.QUANTITY,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: OrderItems.PRICE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: OrderItems.NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: OrderItems.EVENTID,
        isRequired: false,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'createdAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'updatedAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));
  });
}

class _OrderItemsModelType extends amplify_core.ModelType<OrderItems> {
  const _OrderItemsModelType();

  @override
  OrderItems fromJson(Map<String, dynamic> jsonData) {
    return OrderItems.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'OrderItems';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [OrderItems] in your schema.
 */
class OrderItemsModelIdentifier
    implements amplify_core.ModelIdentifier<OrderItems> {
  final String id;

  /** Create an instance of OrderItemsModelIdentifier using [id] the primary key. */
  const OrderItemsModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'OrderItemsModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is OrderItemsModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

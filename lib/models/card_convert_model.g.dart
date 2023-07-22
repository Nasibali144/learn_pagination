// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_convert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) => CreditCard(
      cardName: json['card_name'] as String,
      cardNumber: const DecryptString().fromJson(json['card_number'] as String),
      cardDate: const DecryptString().fromJson(json['card_date'] as String),
    );

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) =>
    <String, dynamic>{
      'card_name': instance.cardName,
      'card_number': const DecryptString().toJson(instance.cardNumber),
      'card_date': const DecryptString().toJson(instance.cardDate),
    };

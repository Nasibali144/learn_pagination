
import 'package:json_annotation/json_annotation.dart';

part 'card_convert_model.g.dart';
final convert = {
  "card_name": "Nasibali Abdiyev",
  "card_number": "agyedt263edg3467dg2udtku762w3gedu72g",
  "card_date": "qrw621e126w",
};

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CreditCard {
  final String cardName;
  @DecryptString()
  final String cardNumber;
  @DecryptString()
  final String cardDate;

  const CreditCard({
    required this.cardName,
    required this.cardNumber,
    required this.cardDate,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) => _$CreditCardFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardToJson(this);
}

// <client, server>
class DecryptString implements JsonConverter<String, String> {
  const DecryptString();

  @override
  String fromJson(String json) => decryptedAlgorithm(json);

  @override
  String toJson(String object) {
    return encryptedAlgorithm(object);
  }
}

String decryptedAlgorithm(String text) {
  return "hello";
}

String encryptedAlgorithm(String text) {
  return "lehol";
}
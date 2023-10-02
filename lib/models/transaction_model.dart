import 'package:renters_io_taws/models/product_model.dart';
import './charge_frequency_enum.dart';

class TransactionModel {
  String id;
  String entrepreneushipId;
  String listStockRented;
  DateTime startDate;
  DateTime endDate;
  ChargeFrequency chargeFrequency;
  String clientName;
  String clientNumber;
  String notes;

  TransactionModel({
    required this.id,
    required this.entrepreneushipId,
    required this.listStockRented,
    required this.startDate,
    required this.endDate,
    required this.chargeFrequency,
    required this.clientName,
    required this.clientNumber,
    required this.notes,
  });

  TransactionModel.fromMap(Map<String, dynamic> map) :
    id = map['id'],
    entrepreneushipId = map['idEntrepreneurship'],
    listStockRented = map['listStockRented'],
    startDate = map['startDate'],
    endDate = map['endDate'],
    chargeFrequency = map['chargeFrequency'],
    clientName = map['clientName'],
    clientNumber = map['clientNumber'],
    notes = map['notes'];

  Map<String, dynamic> toMap() {
  return {
    'id': id,
    'idEntrepreneurship': entrepreneushipId,
    'listStockRented': listStockRented,
    'startDate': startDate.toIso8601String(),
    'endDate': endDate.toIso8601String(),
    'chargeFrequency': chargeFrequency.toString(),
    'clientName': clientName,
    'clientNumber': clientNumber,
    'notes': notes,
  };
}
}
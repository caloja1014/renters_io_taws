import 'package:renters_io_taws/models/product_model.dart';
import './charge_frequency_enum.dart';

class TransactionModel {
  String id;
  String entrepreneushipId;
  List<ProductModel> listStockRented;
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
}
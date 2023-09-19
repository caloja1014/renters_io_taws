import './stock_model.dart';
import './charge_frequency_enum.dart';

class TransactionModel {
  String id;
  List<StockModel> listStockRented;
  DateTime startDate;
  DateTime endDate;
  ChargeFrequency chargeFrequency;
  String clientName;
  String clientNumber;
  String notes;

  TransactionModel({
    required this.listStockRented,
    required this.startDate,
    required this.endDate,
    required this.chargeFrequency,
    required this.clientName,
    required this.clientNumber,
    required this.notes,
    required this.id,
  });
}
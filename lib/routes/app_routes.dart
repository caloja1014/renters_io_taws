// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const STOCK = _Paths.STOCK;
  static const ADD_PRODUCT = _Paths.ADD_PRODUCT;
  static const TRANSACTION = _Paths.TRANSACTION;
  // static const ADD_TRANSACTION = _Paths.ADD_TRANSACTION;
  static const TRANSACTION_CONFIRMATION = _Paths.TRANSACTION_CONFIRMATION;
  static const LIST_TRANSACTIONS = _Paths.LIST_TRANSACTIONS;
  static const ACTIVE_TRANSACTIONS = _Paths.ACTIVE_TRANSACTIONS;
}

abstract class _Paths {
  static const HOME = '/home';
  static const STOCK = '/stock';
  static const ADD_PRODUCT = '/add-product';
  static const TRANSACTION = '/transaction';
  // static const ADD_TRANSACTION = '/add-transaction';
  static const TRANSACTION_CONFIRMATION = '/transaction-confirmation';
  static const LIST_TRANSACTIONS = '/list-transactions';
  static const ACTIVE_TRANSACTIONS = '/active-transactions';
}

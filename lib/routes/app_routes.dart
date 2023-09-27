// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const STOCK = _Paths.STOCK;
  static const ADD_PRODUCT = _Paths.ADD_PRODUCT;
  static const TRANSACTION = _Paths.TRANSACTION;
  static const ADD_TRANSACTION = _Paths.ADD_TRANSACTION;
}

abstract class _Paths {
  static const HOME = '/home';
  static const STOCK = '/stock';
  static const ADD_PRODUCT = '/add-product';
  static const TRANSACTION = '/transaction';
  static const ADD_TRANSACTION = '/add-transaction';
}

import 'dart:io';

import 'package:renters_io_taws/models/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

class SqliteService {
  static Database? _database;

  Future<void> initializeDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "database.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      _database = await openDatabase(
        path,
        onCreate: (database, version) async {
          await database.execute(
            "CREATE TABLE Products (id VARCHAR(36) PRIMARY KEY, idEntrepreneurship VARCHAR(36), name VARCHAR(255) NOT NULL, category TEXT NOT NULL CHECK(category IN ('metal', 'plastic', 'wood', 'glass', 'paper', 'tools')), quantity INT NOT NULL, price DECIMAL(10, 2) NOT NULL, infractionCost DECIMAL(10, 2) NOT NULL, imageRoute VARCHAR(255) NOT NULL)",
          );

          // Insert initial data
          // await database.rawInsert(
          //   "INSERT INTO Products (id, idEntrepreneurship, name, category, quantity, price, infractionCost, imageRoute) VALUES ('1', '1', 'Abrazadera para manguera de 3/4 pulgadas', 'metal', 50, 0.45, 0.10, 'assets/images/abrazadera.png')",
          // );
          // await database.rawInsert(
          //   "INSERT INTO Products (id, idEntrepreneurship, name, category, quantity, price, infractionCost, imageRoute) VALUES ('2', '2', 'Abrazadera para manguera de 1/2 pulgada', 'metal', 100, 0.25, 0.05, 'assets/images/abrazadera.png')",
          // );
        },
        version: 1,
        readOnly: false,
      );
    } else {
      _database = await openDatabase(
        path,
        version: 1,
        readOnly: false,
      );
    }
  }

  static SqliteService? _instance;

  SqliteService._internal() {
    _instance = this;
  }

  factory SqliteService() => _instance ?? SqliteService._internal();

  Future<Database> getDatabase() async {
    if (_database == null) {
      await initializeDB();
    }
    return _database!;
  }

  Future<int> createProduct(ProductModel product) async {
    final Database db = await getDatabase();
    final id = await db.insert(
      'Products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<List<ProductModel>> getProducts() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Products');

    return List.generate(maps.length, (i) {
      return ProductModel.fromMap(maps[i]);
    });
  }

  Future<List<ProductModel>> getProductsFromEntrepreneurship(String id) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Products',
      where: "idEntrepreneurship = ?",
      whereArgs: [id],
    );

    return List.generate(maps.length, (i) {
      return ProductModel.fromMap(maps[i]);
    });
  }

  Future<void> deleteProduct(String id) async {
    final db = await getDatabase();

    await db.delete(
      'Products',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

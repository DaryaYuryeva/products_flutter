import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/cart/shopping_cart_item.dart';

/// A class responsible for managing local database operations related to the shopping cart.
class CartLocalDatabase {
  static const _tableName = 'shopping_cart';

  /// Opens the database or creates it if it doesn't exist.
  Future<Database> _getCartDatabase() async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(
      join(dbPath, 'cart.db'),
      onCreate: (db, version) {
        // Creates the shopping_cart table if it doesn't exist.
        return db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY,
            title TEXT,
            description TEXT,
            price REAL,
            images TEXT,
            thumbnail TEXT,
            quantity INTEGER
          )
        ''');
      },
      version: 1,
    );
    return db;
  }

  /// Retrieves all items from the database.
  Future<List<ShoppingCartItem>> getCartItems() async {
    final db = await _getCartDatabase();
    final data = await db.query(_tableName);

    if (data.isNotEmpty) {
      return data.map((map) => ShoppingCartItem.fromMap(map)).toList();
    } else {
      return [];
    }
  }

  /// Inserts the given item into the shopping cart table.
  /// If an item with the same id already exists, it will be replaced.
  Future<void> addCartItem(ShoppingCartItem item) async {
    final db = await _getCartDatabase();
    await db.insert(
      _tableName,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Updates an existing item in the database.
  Future<void> updateCartItem(ShoppingCartItem item) async {
    final db = await _getCartDatabase();
    await db.update(
      _tableName,
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.product.id],
    );
  }

  /// Deletes the cart item that matches the given id from the database.
  Future<void> deleteCartItem(int id) async {
    final db = await _getCartDatabase();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

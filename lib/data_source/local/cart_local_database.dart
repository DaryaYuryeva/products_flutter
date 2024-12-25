import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/cart/shopping_cart_item.dart';

class CartLocalDatabase {
static const _tableName = 'shopping_cart';

  Future<Database> _getCartDatabase() async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(
      join(dbPath, 'cart.db'),
      onCreate: (db, version) {
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

  Future<List<ShoppingCartItem>> getCartItems() async {
    final db = await _getCartDatabase();
    final data = await db.query(_tableName);

    if (data.isNotEmpty) {
      return data.map((map) => ShoppingCartItem.fromMap(map)).toList();
    } else {
      return [];
    }
  }

  Future<void> addCartItem(ShoppingCartItem item) async {
    final db = await _getCartDatabase();
    await db.insert(
      _tableName,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateCartItem(ShoppingCartItem item) async {
    final db = await _getCartDatabase();
    await db.update(
      _tableName,
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.product.id],
    );
  }

  Future<void> deleteCartItem(int id) async {
    final db = await _getCartDatabase();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

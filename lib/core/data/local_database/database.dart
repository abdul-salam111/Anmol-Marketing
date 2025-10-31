import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

/// Database handler class for Anmol Marketing application
/// This class manages all database operations including initialization,
/// table creation, and database versioning
class AnmolMarketingDatabase {
  // Private static variable to hold the database instance (Singleton pattern)
  static Database? _db;

  // Database configuration constants
  static const String _databaseName = "anmol_marketing_database.db";
  static const int _databaseVersion = 1;

  /// Getter method to access the database instance
  /// Returns existing database or creates a new one if it doesn't exist
  /// This implements the Singleton pattern to ensure only one database connection
  Future<Database?> get database async {
    // If database already exists, return it
    if (_db != null) return _db;

    // Otherwise, initialize a new database
    _db = await initializeDatabase();
    return _db;
  }

  /// Initializes the database by creating the database file and setting up tables
  /// Returns: Database instance
  /// Throws: Exception if database creation fails
  Future<Database> initializeDatabase() async {
    try {
      // Get the application's documents directory
      // This is where we'll store our database file
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();

      // Create the full path to our database file
      String path = join(documentDirectory.path, _databaseName);

      // Open/create the database with specified configuration
      var db = await openDatabase(
        path, // Database file path
        version: _databaseVersion, // Database schema version
        onCreate: _onCreate, // Function to call when creating new database
        onUpgrade: _onUpgrade, // Function to call when upgrading database
      );

      return db;
    } catch (e) {
      if (kDebugMode) {
        print("Database Error: $e");
      }
      rethrow; // Re-throw the error so calling code can handle it
    }
  }

  /// Creates all database tables when the database is first created
  /// This method is called automatically by SQLite when a new database is created
  ///
  /// Parameters:
  /// - db: The database instance
  /// - version: The database version number
  Future<void> _onCreate(Database db, int version) async {
    // Create companies table to store company information
    await _createCompaniesTable(db);

    // Create catalog table to store product catalog information
    await _createCatalogTable(db);

    // Create orders-related tables
    await _createOrdersTable(db);
    await _createOrderCompaniesTable(db);
    await _createOrderProductsTable(db);
  }

  /// Creates the companies table
  /// Stores basic company information including ID, name, and logo
  Future<void> _createCompaniesTable(Database db) async {
    await db.execute('''
      CREATE TABLE companies(
        id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Auto-incrementing primary key
        CompanyId INTEGER NOT NULL,            -- Unique company identifier
        CompanyName TEXT NOT NULL,             -- Company name (required)
        CompanyLogo TEXT NOT NULL              -- Path/URL to company logo (required)
      )
    ''');
  }

  /// Creates the catalog table
  /// Stores product catalog information for each company
  /// Note: This appears to duplicate company info - consider if this is intentional
  Future<void> _createCatalogTable(Database db) async {
    await db.execute('''
      CREATE TABLE catalog(
        id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Auto-incrementing primary key
        CompanyId INTEGER NOT NULL,            -- Reference to company
        CompanyName TEXT NOT NULL,             -- Company name (duplicated from companies table)
        CompanyLogo TEXT NOT NULL              -- Company logo (duplicated from companies table)
      )
    ''');
  }

  /// Creates the orders table
  /// Stores main order information including totals and dates
  Future<void> _createOrdersTable(Database db) async {
    await db.execute('''
      CREATE TABLE orders(
        id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Auto-incrementing primary key
        orderId TEXT NOT NULL,                 -- Unique order identifier (string format)
        orderDate TEXT NOT NULL,               -- Order date (stored as text - consider DATE format)
        grandTotal REAL NOT NULL,              -- Total amount for entire order
        totalProducts INTEGER NOT NULL         -- Total number of products in order
      )
    ''');
  }

  /// Creates the order_companies table
  /// Stores company-wise breakdown of each order
  /// This allows tracking which companies contributed to each order
  Future<void> _createOrderCompaniesTable(Database db) async {
    await db.execute('''
      CREATE TABLE order_companies(
        id INTEGER PRIMARY KEY AUTOINCREMENT,    -- Auto-incrementing primary key
        orderId TEXT NOT NULL,                   -- Reference to orders table
        companyId INTEGER NOT NULL,              -- Company identifier
        companyName TEXT NOT NULL,               -- Company name
        companyLogo TEXT NOT NULL,               -- Company logo
        companyTotal REAL NOT NULL,              -- Total amount from this company in the order
        totalProducts INTEGER NOT NULL,          -- Number of products from this company
        FOREIGN KEY(orderId) REFERENCES orders(orderId)  -- Foreign key constraint
      )
    ''');
  }

  /// Creates the order_products table
  /// Stores individual product details for each order
  /// This is the most detailed table containing all product-specific information
  Future<void> _createOrderProductsTable(Database db) async {
    await db.execute('''
      CREATE TABLE order_products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,      -- Auto-incrementing primary key
        orderId TEXT NOT NULL,                     -- Reference to orders table
        companyId INTEGER NOT NULL,                -- Reference to company
        productId INTEGER NOT NULL,                -- Unique product identifier
        productName TEXT NOT NULL,                 -- Product name
        productLogo TEXT NOT NULL,                 -- Product logo/image
        pack TEXT NOT NULL,                        -- Product packaging information
        productStock TEXT NOT NULL,                -- Stock status/quantity available
        tradePrice REAL NOT NULL,                  -- Wholesale/trade price
        salePrice REAL NOT NULL,                   -- Retail/sale price
        quantity INTEGER NOT NULL,                 -- Quantity ordered
        totalPrice REAL NOT NULL,                  -- Total price for this product line (quantity × price)
        
        -- Foreign key constraints to maintain data integrity
        FOREIGN KEY(orderId) REFERENCES orders(orderId),
        FOREIGN KEY(companyId) REFERENCES order_companies(companyId)
      )
    ''');
  }

  /// Handles database schema upgrades when version number increases
  /// This method is called when the database version is updated
  ///
  /// Parameters:
  /// - db: The database instance
  /// - oldVersion: Previous database version
  /// - newVersion: New database version to upgrade to
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (kDebugMode) {
      print("Upgrading database from version $oldVersion to $newVersion");
    }

    // Example of how to handle version upgrades:
    // Each version upgrade should be handled incrementally

    if (oldVersion < 2) {
      // Example: Add new column in version 2
      // await db.execute('ALTER TABLE companies ADD COLUMN email TEXT');
    }

    if (oldVersion < 3) {
      // Example: Create new table in version 3
      // await db.execute('CREATE TABLE customers(...)');
    }

    // Add more version checks as needed
    // Always use incremental upgrades to avoid data loss
  }

  /// Closes the database connection
  /// Should be called when the app is shutting down to free up resources
  Future<void> closeDatabase() async {
    Database? db = await database;
    if (db != null) {
      await db.close();
      _db = null; // Reset the static variable
    }
  }

  /// Deletes the entire database file
  /// WARNING: This will permanently delete all data
  /// Use with extreme caution - typically only for testing or complete reset
  Future<void> deleteDatabase() async {
    try {
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentDirectory.path, _databaseName);

      // Close existing connection before deleting
      await closeDatabase();

      // Delete the database file
      await databaseFactory.deleteDatabase(path);
      if (kDebugMode) {
        print("Database deleted successfully");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error deleting database: $e");
      }
      rethrow;
    }
  }
}

/*
DATABASE SCHEMA OVERVIEW:
========================

1. COMPANIES TABLE
   - Stores basic company information
   - Fields: id, CompanyId, CompanyName, CompanyLogo

2. CATALOG TABLE  
   - Stores product catalog (seems to duplicate company info)
   - Consider if this needs additional product fields

3. ORDERS TABLE
   - Main orders table with summary information
   - Fields: id, orderId, orderDate, grandTotal, totalProducts

4. ORDER_COMPANIES TABLE
   - Company breakdown for each order
   - Links orders to companies with company-specific totals
   - Fields: id, orderId, companyId, companyName, companyLogo, companyTotal, totalProducts

5. ORDER_PRODUCTS TABLE
   - Detailed product information for each order
   - Contains pricing, quantity, and product details
   - Fields: id, orderId, companyId, productId, productName, productLogo, 
            pack, productStock, tradePrice, salePrice, quantity, totalPrice

USAGE NOTES:
============
- This class implements the Singleton pattern for database access
- Always use try-catch blocks when calling database methods
- Remember to close database connections when app shuts down
- Consider adding indexes for frequently queried columns (orderId, companyId, etc.)
- The catalog table might need restructuring to include actual product information
*/

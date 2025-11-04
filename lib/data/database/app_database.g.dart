// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _costPriceMeta =
      const VerificationMeta('costPrice');
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
      'cost_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _sellingPriceMeta =
      const VerificationMeta('sellingPrice');
  @override
  late final GeneratedColumn<double> sellingPrice = GeneratedColumn<double>(
      'selling_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
      'stock', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _minStockMeta =
      const VerificationMeta('minStock');
  @override
  late final GeneratedColumn<int> minStock = GeneratedColumn<int>(
      'min_stock', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        sku,
        barcode,
        costPrice,
        sellingPrice,
        stock,
        minStock,
        categoryId,
        description,
        imageUrl,
        isActive,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<ProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta));
    }
    if (data.containsKey('selling_price')) {
      context.handle(
          _sellingPriceMeta,
          sellingPrice.isAcceptableOrUnknown(
              data['selling_price']!, _sellingPriceMeta));
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    }
    if (data.containsKey('min_stock')) {
      context.handle(_minStockMeta,
          minStock.isAcceptableOrUnknown(data['min_stock']!, _minStockMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku']),
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      costPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost_price'])!,
      sellingPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}selling_price'])!,
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock'])!,
      minStock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_stock'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final String id;
  final String name;
  final String? sku;
  final String? barcode;
  final double costPrice;
  final double sellingPrice;
  final int stock;
  final int minStock;
  final String? categoryId;
  final String? description;
  final String? imageUrl;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ProductData(
      {required this.id,
      required this.name,
      this.sku,
      this.barcode,
      required this.costPrice,
      required this.sellingPrice,
      required this.stock,
      required this.minStock,
      this.categoryId,
      this.description,
      this.imageUrl,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['cost_price'] = Variable<double>(costPrice);
    map['selling_price'] = Variable<double>(sellingPrice);
    map['stock'] = Variable<int>(stock);
    map['min_stock'] = Variable<int>(minStock);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      costPrice: Value(costPrice),
      sellingPrice: Value(sellingPrice),
      stock: Value(stock),
      minStock: Value(minStock),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sku: serializer.fromJson<String?>(json['sku']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
      sellingPrice: serializer.fromJson<double>(json['sellingPrice']),
      stock: serializer.fromJson<int>(json['stock']),
      minStock: serializer.fromJson<int>(json['minStock']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      description: serializer.fromJson<String?>(json['description']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sku': serializer.toJson<String?>(sku),
      'barcode': serializer.toJson<String?>(barcode),
      'costPrice': serializer.toJson<double>(costPrice),
      'sellingPrice': serializer.toJson<double>(sellingPrice),
      'stock': serializer.toJson<int>(stock),
      'minStock': serializer.toJson<int>(minStock),
      'categoryId': serializer.toJson<String?>(categoryId),
      'description': serializer.toJson<String?>(description),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProductData copyWith(
          {String? id,
          String? name,
          Value<String?> sku = const Value.absent(),
          Value<String?> barcode = const Value.absent(),
          double? costPrice,
          double? sellingPrice,
          int? stock,
          int? minStock,
          Value<String?> categoryId = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ProductData(
        id: id ?? this.id,
        name: name ?? this.name,
        sku: sku.present ? sku.value : this.sku,
        barcode: barcode.present ? barcode.value : this.barcode,
        costPrice: costPrice ?? this.costPrice,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        stock: stock ?? this.stock,
        minStock: minStock ?? this.minStock,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        description: description.present ? description.value : this.description,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ProductData copyWithCompanion(ProductsCompanion data) {
    return ProductData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sku: data.sku.present ? data.sku.value : this.sku,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      sellingPrice: data.sellingPrice.present
          ? data.sellingPrice.value
          : this.sellingPrice,
      stock: data.stock.present ? data.stock.value : this.stock,
      minStock: data.minStock.present ? data.minStock.value : this.minStock,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      description:
          data.description.present ? data.description.value : this.description,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('costPrice: $costPrice, ')
          ..write('sellingPrice: $sellingPrice, ')
          ..write('stock: $stock, ')
          ..write('minStock: $minStock, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      sku,
      barcode,
      costPrice,
      sellingPrice,
      stock,
      minStock,
      categoryId,
      description,
      imageUrl,
      isActive,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.name == this.name &&
          other.sku == this.sku &&
          other.barcode == this.barcode &&
          other.costPrice == this.costPrice &&
          other.sellingPrice == this.sellingPrice &&
          other.stock == this.stock &&
          other.minStock == this.minStock &&
          other.categoryId == this.categoryId &&
          other.description == this.description &&
          other.imageUrl == this.imageUrl &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductsCompanion extends UpdateCompanion<ProductData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> sku;
  final Value<String?> barcode;
  final Value<double> costPrice;
  final Value<double> sellingPrice;
  final Value<int> stock;
  final Value<int> minStock;
  final Value<String?> categoryId;
  final Value<String?> description;
  final Value<String?> imageUrl;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sku = const Value.absent(),
    this.barcode = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.sellingPrice = const Value.absent(),
    this.stock = const Value.absent(),
    this.minStock = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required String name,
    this.sku = const Value.absent(),
    this.barcode = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.sellingPrice = const Value.absent(),
    this.stock = const Value.absent(),
    this.minStock = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<ProductData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? sku,
    Expression<String>? barcode,
    Expression<double>? costPrice,
    Expression<double>? sellingPrice,
    Expression<int>? stock,
    Expression<int>? minStock,
    Expression<String>? categoryId,
    Expression<String>? description,
    Expression<String>? imageUrl,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sku != null) 'sku': sku,
      if (barcode != null) 'barcode': barcode,
      if (costPrice != null) 'cost_price': costPrice,
      if (sellingPrice != null) 'selling_price': sellingPrice,
      if (stock != null) 'stock': stock,
      if (minStock != null) 'min_stock': minStock,
      if (categoryId != null) 'category_id': categoryId,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? sku,
      Value<String?>? barcode,
      Value<double>? costPrice,
      Value<double>? sellingPrice,
      Value<int>? stock,
      Value<int>? minStock,
      Value<String?>? categoryId,
      Value<String?>? description,
      Value<String?>? imageUrl,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      barcode: barcode ?? this.barcode,
      costPrice: costPrice ?? this.costPrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      stock: stock ?? this.stock,
      minStock: minStock ?? this.minStock,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (sellingPrice.present) {
      map['selling_price'] = Variable<double>(sellingPrice.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (minStock.present) {
      map['min_stock'] = Variable<int>(minStock.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('costPrice: $costPrice, ')
          ..write('sellingPrice: $sellingPrice, ')
          ..write('stock: $stock, ')
          ..write('minStock: $minStock, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, isActive, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final String id;
  final String name;
  final String? description;
  final bool isActive;
  final DateTime createdAt;
  const CategoryData(
      {required this.id,
      required this.name,
      this.description,
      required this.isActive,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CategoryData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          bool? isActive,
          DateTime? createdAt}) =>
      CategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
      );
  CategoryData copyWithCompanion(CategoriesCompanion data) {
    return CategoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class CategoriesCompanion extends UpdateCompanion<CategoryData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<CategoryData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, CustomerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _provinceMeta =
      const VerificationMeta('province');
  @override
  late final GeneratedColumn<String> province = GeneratedColumn<String>(
      'province', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _postalCodeMeta =
      const VerificationMeta('postalCode');
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
      'postal_code', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _idCardNumberMeta =
      const VerificationMeta('idCardNumber');
  @override
  late final GeneratedColumn<String> idCardNumber = GeneratedColumn<String>(
      'id_card_number', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _idCardImageUrlMeta =
      const VerificationMeta('idCardImageUrl');
  @override
  late final GeneratedColumn<String> idCardImageUrl = GeneratedColumn<String>(
      'id_card_image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _creditLimitMeta =
      const VerificationMeta('creditLimit');
  @override
  late final GeneratedColumn<double> creditLimit = GeneratedColumn<double>(
      'credit_limit', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalDebtMeta =
      const VerificationMeta('totalDebt');
  @override
  late final GeneratedColumn<double> totalDebt = GeneratedColumn<double>(
      'total_debt', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalTransactionsMeta =
      const VerificationMeta('totalTransactions');
  @override
  late final GeneratedColumn<int> totalTransactions = GeneratedColumn<int>(
      'total_transactions', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(3));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _isBlacklistedMeta =
      const VerificationMeta('isBlacklisted');
  @override
  late final GeneratedColumn<bool> isBlacklisted = GeneratedColumn<bool>(
      'is_blacklisted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_blacklisted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastTransactionDateMeta =
      const VerificationMeta('lastTransactionDate');
  @override
  late final GeneratedColumn<DateTime> lastTransactionDate =
      GeneratedColumn<DateTime>('last_transaction_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        phone,
        email,
        address,
        city,
        province,
        postalCode,
        idCardNumber,
        idCardImageUrl,
        creditLimit,
        totalDebt,
        totalTransactions,
        rating,
        notes,
        isActive,
        isBlacklisted,
        createdAt,
        updatedAt,
        lastTransactionDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('province')) {
      context.handle(_provinceMeta,
          province.isAcceptableOrUnknown(data['province']!, _provinceMeta));
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code']!, _postalCodeMeta));
    }
    if (data.containsKey('id_card_number')) {
      context.handle(
          _idCardNumberMeta,
          idCardNumber.isAcceptableOrUnknown(
              data['id_card_number']!, _idCardNumberMeta));
    }
    if (data.containsKey('id_card_image_url')) {
      context.handle(
          _idCardImageUrlMeta,
          idCardImageUrl.isAcceptableOrUnknown(
              data['id_card_image_url']!, _idCardImageUrlMeta));
    }
    if (data.containsKey('credit_limit')) {
      context.handle(
          _creditLimitMeta,
          creditLimit.isAcceptableOrUnknown(
              data['credit_limit']!, _creditLimitMeta));
    }
    if (data.containsKey('total_debt')) {
      context.handle(_totalDebtMeta,
          totalDebt.isAcceptableOrUnknown(data['total_debt']!, _totalDebtMeta));
    }
    if (data.containsKey('total_transactions')) {
      context.handle(
          _totalTransactionsMeta,
          totalTransactions.isAcceptableOrUnknown(
              data['total_transactions']!, _totalTransactionsMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('is_blacklisted')) {
      context.handle(
          _isBlacklistedMeta,
          isBlacklisted.isAcceptableOrUnknown(
              data['is_blacklisted']!, _isBlacklistedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('last_transaction_date')) {
      context.handle(
          _lastTransactionDateMeta,
          lastTransactionDate.isAcceptableOrUnknown(
              data['last_transaction_date']!, _lastTransactionDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
      province: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}province']),
      postalCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal_code']),
      idCardNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_card_number']),
      idCardImageUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}id_card_image_url']),
      creditLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}credit_limit'])!,
      totalDebt: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_debt'])!,
      totalTransactions: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}total_transactions'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      isBlacklisted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_blacklisted'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      lastTransactionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_transaction_date']),
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class CustomerData extends DataClass implements Insertable<CustomerData> {
  final String id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final String? city;
  final String? province;
  final String? postalCode;
  final String? idCardNumber;
  final String? idCardImageUrl;
  final double creditLimit;
  final double totalDebt;
  final int totalTransactions;
  final int rating;
  final String? notes;
  final bool isActive;
  final bool isBlacklisted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastTransactionDate;
  const CustomerData(
      {required this.id,
      required this.name,
      this.phone,
      this.email,
      this.address,
      this.city,
      this.province,
      this.postalCode,
      this.idCardNumber,
      this.idCardImageUrl,
      required this.creditLimit,
      required this.totalDebt,
      required this.totalTransactions,
      required this.rating,
      this.notes,
      required this.isActive,
      required this.isBlacklisted,
      required this.createdAt,
      required this.updatedAt,
      this.lastTransactionDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || province != null) {
      map['province'] = Variable<String>(province);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    if (!nullToAbsent || idCardNumber != null) {
      map['id_card_number'] = Variable<String>(idCardNumber);
    }
    if (!nullToAbsent || idCardImageUrl != null) {
      map['id_card_image_url'] = Variable<String>(idCardImageUrl);
    }
    map['credit_limit'] = Variable<double>(creditLimit);
    map['total_debt'] = Variable<double>(totalDebt);
    map['total_transactions'] = Variable<int>(totalTransactions);
    map['rating'] = Variable<int>(rating);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['is_blacklisted'] = Variable<bool>(isBlacklisted);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || lastTransactionDate != null) {
      map['last_transaction_date'] = Variable<DateTime>(lastTransactionDate);
    }
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      province: province == null && nullToAbsent
          ? const Value.absent()
          : Value(province),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      idCardNumber: idCardNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(idCardNumber),
      idCardImageUrl: idCardImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(idCardImageUrl),
      creditLimit: Value(creditLimit),
      totalDebt: Value(totalDebt),
      totalTransactions: Value(totalTransactions),
      rating: Value(rating),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isActive: Value(isActive),
      isBlacklisted: Value(isBlacklisted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastTransactionDate: lastTransactionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastTransactionDate),
    );
  }

  factory CustomerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      city: serializer.fromJson<String?>(json['city']),
      province: serializer.fromJson<String?>(json['province']),
      postalCode: serializer.fromJson<String?>(json['postalCode']),
      idCardNumber: serializer.fromJson<String?>(json['idCardNumber']),
      idCardImageUrl: serializer.fromJson<String?>(json['idCardImageUrl']),
      creditLimit: serializer.fromJson<double>(json['creditLimit']),
      totalDebt: serializer.fromJson<double>(json['totalDebt']),
      totalTransactions: serializer.fromJson<int>(json['totalTransactions']),
      rating: serializer.fromJson<int>(json['rating']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isBlacklisted: serializer.fromJson<bool>(json['isBlacklisted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      lastTransactionDate:
          serializer.fromJson<DateTime?>(json['lastTransactionDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
      'city': serializer.toJson<String?>(city),
      'province': serializer.toJson<String?>(province),
      'postalCode': serializer.toJson<String?>(postalCode),
      'idCardNumber': serializer.toJson<String?>(idCardNumber),
      'idCardImageUrl': serializer.toJson<String?>(idCardImageUrl),
      'creditLimit': serializer.toJson<double>(creditLimit),
      'totalDebt': serializer.toJson<double>(totalDebt),
      'totalTransactions': serializer.toJson<int>(totalTransactions),
      'rating': serializer.toJson<int>(rating),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'isBlacklisted': serializer.toJson<bool>(isBlacklisted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'lastTransactionDate': serializer.toJson<DateTime?>(lastTransactionDate),
    };
  }

  CustomerData copyWith(
          {String? id,
          String? name,
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> city = const Value.absent(),
          Value<String?> province = const Value.absent(),
          Value<String?> postalCode = const Value.absent(),
          Value<String?> idCardNumber = const Value.absent(),
          Value<String?> idCardImageUrl = const Value.absent(),
          double? creditLimit,
          double? totalDebt,
          int? totalTransactions,
          int? rating,
          Value<String?> notes = const Value.absent(),
          bool? isActive,
          bool? isBlacklisted,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> lastTransactionDate = const Value.absent()}) =>
      CustomerData(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        address: address.present ? address.value : this.address,
        city: city.present ? city.value : this.city,
        province: province.present ? province.value : this.province,
        postalCode: postalCode.present ? postalCode.value : this.postalCode,
        idCardNumber:
            idCardNumber.present ? idCardNumber.value : this.idCardNumber,
        idCardImageUrl:
            idCardImageUrl.present ? idCardImageUrl.value : this.idCardImageUrl,
        creditLimit: creditLimit ?? this.creditLimit,
        totalDebt: totalDebt ?? this.totalDebt,
        totalTransactions: totalTransactions ?? this.totalTransactions,
        rating: rating ?? this.rating,
        notes: notes.present ? notes.value : this.notes,
        isActive: isActive ?? this.isActive,
        isBlacklisted: isBlacklisted ?? this.isBlacklisted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        lastTransactionDate: lastTransactionDate.present
            ? lastTransactionDate.value
            : this.lastTransactionDate,
      );
  CustomerData copyWithCompanion(CustomersCompanion data) {
    return CustomerData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
      city: data.city.present ? data.city.value : this.city,
      province: data.province.present ? data.province.value : this.province,
      postalCode:
          data.postalCode.present ? data.postalCode.value : this.postalCode,
      idCardNumber: data.idCardNumber.present
          ? data.idCardNumber.value
          : this.idCardNumber,
      idCardImageUrl: data.idCardImageUrl.present
          ? data.idCardImageUrl.value
          : this.idCardImageUrl,
      creditLimit:
          data.creditLimit.present ? data.creditLimit.value : this.creditLimit,
      totalDebt: data.totalDebt.present ? data.totalDebt.value : this.totalDebt,
      totalTransactions: data.totalTransactions.present
          ? data.totalTransactions.value
          : this.totalTransactions,
      rating: data.rating.present ? data.rating.value : this.rating,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isBlacklisted: data.isBlacklisted.present
          ? data.isBlacklisted.value
          : this.isBlacklisted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastTransactionDate: data.lastTransactionDate.present
          ? data.lastTransactionDate.value
          : this.lastTransactionDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('province: $province, ')
          ..write('postalCode: $postalCode, ')
          ..write('idCardNumber: $idCardNumber, ')
          ..write('idCardImageUrl: $idCardImageUrl, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('totalDebt: $totalDebt, ')
          ..write('totalTransactions: $totalTransactions, ')
          ..write('rating: $rating, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('isBlacklisted: $isBlacklisted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastTransactionDate: $lastTransactionDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      phone,
      email,
      address,
      city,
      province,
      postalCode,
      idCardNumber,
      idCardImageUrl,
      creditLimit,
      totalDebt,
      totalTransactions,
      rating,
      notes,
      isActive,
      isBlacklisted,
      createdAt,
      updatedAt,
      lastTransactionDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.address == this.address &&
          other.city == this.city &&
          other.province == this.province &&
          other.postalCode == this.postalCode &&
          other.idCardNumber == this.idCardNumber &&
          other.idCardImageUrl == this.idCardImageUrl &&
          other.creditLimit == this.creditLimit &&
          other.totalDebt == this.totalDebt &&
          other.totalTransactions == this.totalTransactions &&
          other.rating == this.rating &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.isBlacklisted == this.isBlacklisted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.lastTransactionDate == this.lastTransactionDate);
}

class CustomersCompanion extends UpdateCompanion<CustomerData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> city;
  final Value<String?> province;
  final Value<String?> postalCode;
  final Value<String?> idCardNumber;
  final Value<String?> idCardImageUrl;
  final Value<double> creditLimit;
  final Value<double> totalDebt;
  final Value<int> totalTransactions;
  final Value<int> rating;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<bool> isBlacklisted;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> lastTransactionDate;
  final Value<int> rowid;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.province = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.idCardNumber = const Value.absent(),
    this.idCardImageUrl = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.totalDebt = const Value.absent(),
    this.totalTransactions = const Value.absent(),
    this.rating = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isBlacklisted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastTransactionDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomersCompanion.insert({
    required String id,
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.province = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.idCardNumber = const Value.absent(),
    this.idCardImageUrl = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.totalDebt = const Value.absent(),
    this.totalTransactions = const Value.absent(),
    this.rating = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isBlacklisted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastTransactionDate = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<CustomerData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? city,
    Expression<String>? province,
    Expression<String>? postalCode,
    Expression<String>? idCardNumber,
    Expression<String>? idCardImageUrl,
    Expression<double>? creditLimit,
    Expression<double>? totalDebt,
    Expression<int>? totalTransactions,
    Expression<int>? rating,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<bool>? isBlacklisted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? lastTransactionDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (province != null) 'province': province,
      if (postalCode != null) 'postal_code': postalCode,
      if (idCardNumber != null) 'id_card_number': idCardNumber,
      if (idCardImageUrl != null) 'id_card_image_url': idCardImageUrl,
      if (creditLimit != null) 'credit_limit': creditLimit,
      if (totalDebt != null) 'total_debt': totalDebt,
      if (totalTransactions != null) 'total_transactions': totalTransactions,
      if (rating != null) 'rating': rating,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (isBlacklisted != null) 'is_blacklisted': isBlacklisted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (lastTransactionDate != null)
        'last_transaction_date': lastTransactionDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomersCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? address,
      Value<String?>? city,
      Value<String?>? province,
      Value<String?>? postalCode,
      Value<String?>? idCardNumber,
      Value<String?>? idCardImageUrl,
      Value<double>? creditLimit,
      Value<double>? totalDebt,
      Value<int>? totalTransactions,
      Value<int>? rating,
      Value<String?>? notes,
      Value<bool>? isActive,
      Value<bool>? isBlacklisted,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? lastTransactionDate,
      Value<int>? rowid}) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      province: province ?? this.province,
      postalCode: postalCode ?? this.postalCode,
      idCardNumber: idCardNumber ?? this.idCardNumber,
      idCardImageUrl: idCardImageUrl ?? this.idCardImageUrl,
      creditLimit: creditLimit ?? this.creditLimit,
      totalDebt: totalDebt ?? this.totalDebt,
      totalTransactions: totalTransactions ?? this.totalTransactions,
      rating: rating ?? this.rating,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      isBlacklisted: isBlacklisted ?? this.isBlacklisted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastTransactionDate: lastTransactionDate ?? this.lastTransactionDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (province.present) {
      map['province'] = Variable<String>(province.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (idCardNumber.present) {
      map['id_card_number'] = Variable<String>(idCardNumber.value);
    }
    if (idCardImageUrl.present) {
      map['id_card_image_url'] = Variable<String>(idCardImageUrl.value);
    }
    if (creditLimit.present) {
      map['credit_limit'] = Variable<double>(creditLimit.value);
    }
    if (totalDebt.present) {
      map['total_debt'] = Variable<double>(totalDebt.value);
    }
    if (totalTransactions.present) {
      map['total_transactions'] = Variable<int>(totalTransactions.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isBlacklisted.present) {
      map['is_blacklisted'] = Variable<bool>(isBlacklisted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (lastTransactionDate.present) {
      map['last_transaction_date'] =
          Variable<DateTime>(lastTransactionDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('province: $province, ')
          ..write('postalCode: $postalCode, ')
          ..write('idCardNumber: $idCardNumber, ')
          ..write('idCardImageUrl: $idCardImageUrl, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('totalDebt: $totalDebt, ')
          ..write('totalTransactions: $totalTransactions, ')
          ..write('rating: $rating, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('isBlacklisted: $isBlacklisted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastTransactionDate: $lastTransactionDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _transactionNumberMeta =
      const VerificationMeta('transactionNumber');
  @override
  late final GeneratedColumn<String> transactionNumber =
      GeneratedColumn<String>('transaction_number', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 50),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('credit'));
  static const VerificationMeta _subtotalMeta =
      const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
      'subtotal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _downPaymentMeta =
      const VerificationMeta('downPayment');
  @override
  late final GeneratedColumn<double> downPayment = GeneratedColumn<double>(
      'down_payment', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _remainingAmountMeta =
      const VerificationMeta('remainingAmount');
  @override
  late final GeneratedColumn<double> remainingAmount = GeneratedColumn<double>(
      'remaining_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _tenorMeta = const VerificationMeta('tenor');
  @override
  late final GeneratedColumn<int> tenor = GeneratedColumn<int>(
      'tenor', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _interestRateMeta =
      const VerificationMeta('interestRate');
  @override
  late final GeneratedColumn<double> interestRate = GeneratedColumn<double>(
      'interest_rate', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _interestAmountMeta =
      const VerificationMeta('interestAmount');
  @override
  late final GeneratedColumn<double> interestAmount = GeneratedColumn<double>(
      'interest_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _adminFeeMeta =
      const VerificationMeta('adminFee');
  @override
  late final GeneratedColumn<double> adminFee = GeneratedColumn<double>(
      'admin_fee', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _monthlyInstallmentMeta =
      const VerificationMeta('monthlyInstallment');
  @override
  late final GeneratedColumn<double> monthlyInstallment =
      GeneratedColumn<double>('monthly_installment', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalPayableMeta =
      const VerificationMeta('totalPayable');
  @override
  late final GeneratedColumn<double> totalPayable = GeneratedColumn<double>(
      'total_payable', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalPaidMeta =
      const VerificationMeta('totalPaid');
  @override
  late final GeneratedColumn<double> totalPaid = GeneratedColumn<double>(
      'total_paid', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _remainingDebtMeta =
      const VerificationMeta('remainingDebt');
  @override
  late final GeneratedColumn<double> remainingDebt = GeneratedColumn<double>(
      'remaining_debt', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paidInstallmentsMeta =
      const VerificationMeta('paidInstallments');
  @override
  late final GeneratedColumn<int> paidInstallments = GeneratedColumn<int>(
      'paid_installments', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _remainingInstallmentsMeta =
      const VerificationMeta('remainingInstallments');
  @override
  late final GeneratedColumn<int> remainingInstallments = GeneratedColumn<int>(
      'remaining_installments', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _downPaymentMethodMeta =
      const VerificationMeta('downPaymentMethod');
  @override
  late final GeneratedColumn<String> downPaymentMethod =
      GeneratedColumn<String>('down_payment_method', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firstPaymentDateMeta =
      const VerificationMeta('firstPaymentDate');
  @override
  late final GeneratedColumn<DateTime> firstPaymentDate =
      GeneratedColumn<DateTime>('first_payment_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastPaymentDateMeta =
      const VerificationMeta('lastPaymentDate');
  @override
  late final GeneratedColumn<DateTime> lastPaymentDate =
      GeneratedColumn<DateTime>('last_payment_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nextPaymentDueMeta =
      const VerificationMeta('nextPaymentDue');
  @override
  late final GeneratedColumn<DateTime> nextPaymentDue =
      GeneratedColumn<DateTime>('next_payment_due', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>('transaction_date', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        transactionNumber,
        customerId,
        userId,
        type,
        subtotal,
        downPayment,
        remainingAmount,
        tenor,
        interestRate,
        interestAmount,
        adminFee,
        monthlyInstallment,
        totalPayable,
        totalPaid,
        remainingDebt,
        paidInstallments,
        remainingInstallments,
        status,
        downPaymentMethod,
        firstPaymentDate,
        lastPaymentDate,
        nextPaymentDue,
        notes,
        transactionDate,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('transaction_number')) {
      context.handle(
          _transactionNumberMeta,
          transactionNumber.isAcceptableOrUnknown(
              data['transaction_number']!, _transactionNumberMeta));
    } else if (isInserting) {
      context.missing(_transactionNumberMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('down_payment')) {
      context.handle(
          _downPaymentMeta,
          downPayment.isAcceptableOrUnknown(
              data['down_payment']!, _downPaymentMeta));
    }
    if (data.containsKey('remaining_amount')) {
      context.handle(
          _remainingAmountMeta,
          remainingAmount.isAcceptableOrUnknown(
              data['remaining_amount']!, _remainingAmountMeta));
    } else if (isInserting) {
      context.missing(_remainingAmountMeta);
    }
    if (data.containsKey('tenor')) {
      context.handle(
          _tenorMeta, tenor.isAcceptableOrUnknown(data['tenor']!, _tenorMeta));
    }
    if (data.containsKey('interest_rate')) {
      context.handle(
          _interestRateMeta,
          interestRate.isAcceptableOrUnknown(
              data['interest_rate']!, _interestRateMeta));
    }
    if (data.containsKey('interest_amount')) {
      context.handle(
          _interestAmountMeta,
          interestAmount.isAcceptableOrUnknown(
              data['interest_amount']!, _interestAmountMeta));
    }
    if (data.containsKey('admin_fee')) {
      context.handle(_adminFeeMeta,
          adminFee.isAcceptableOrUnknown(data['admin_fee']!, _adminFeeMeta));
    }
    if (data.containsKey('monthly_installment')) {
      context.handle(
          _monthlyInstallmentMeta,
          monthlyInstallment.isAcceptableOrUnknown(
              data['monthly_installment']!, _monthlyInstallmentMeta));
    } else if (isInserting) {
      context.missing(_monthlyInstallmentMeta);
    }
    if (data.containsKey('total_payable')) {
      context.handle(
          _totalPayableMeta,
          totalPayable.isAcceptableOrUnknown(
              data['total_payable']!, _totalPayableMeta));
    } else if (isInserting) {
      context.missing(_totalPayableMeta);
    }
    if (data.containsKey('total_paid')) {
      context.handle(_totalPaidMeta,
          totalPaid.isAcceptableOrUnknown(data['total_paid']!, _totalPaidMeta));
    }
    if (data.containsKey('remaining_debt')) {
      context.handle(
          _remainingDebtMeta,
          remainingDebt.isAcceptableOrUnknown(
              data['remaining_debt']!, _remainingDebtMeta));
    } else if (isInserting) {
      context.missing(_remainingDebtMeta);
    }
    if (data.containsKey('paid_installments')) {
      context.handle(
          _paidInstallmentsMeta,
          paidInstallments.isAcceptableOrUnknown(
              data['paid_installments']!, _paidInstallmentsMeta));
    }
    if (data.containsKey('remaining_installments')) {
      context.handle(
          _remainingInstallmentsMeta,
          remainingInstallments.isAcceptableOrUnknown(
              data['remaining_installments']!, _remainingInstallmentsMeta));
    } else if (isInserting) {
      context.missing(_remainingInstallmentsMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('down_payment_method')) {
      context.handle(
          _downPaymentMethodMeta,
          downPaymentMethod.isAcceptableOrUnknown(
              data['down_payment_method']!, _downPaymentMethodMeta));
    }
    if (data.containsKey('first_payment_date')) {
      context.handle(
          _firstPaymentDateMeta,
          firstPaymentDate.isAcceptableOrUnknown(
              data['first_payment_date']!, _firstPaymentDateMeta));
    }
    if (data.containsKey('last_payment_date')) {
      context.handle(
          _lastPaymentDateMeta,
          lastPaymentDate.isAcceptableOrUnknown(
              data['last_payment_date']!, _lastPaymentDateMeta));
    }
    if (data.containsKey('next_payment_due')) {
      context.handle(
          _nextPaymentDueMeta,
          nextPaymentDue.isAcceptableOrUnknown(
              data['next_payment_due']!, _nextPaymentDueMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date']!, _transactionDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      transactionNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transaction_number'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      subtotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}subtotal'])!,
      downPayment: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}down_payment'])!,
      remainingAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}remaining_amount'])!,
      tenor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tenor'])!,
      interestRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}interest_rate'])!,
      interestAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}interest_amount'])!,
      adminFee: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}admin_fee'])!,
      monthlyInstallment: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}monthly_installment'])!,
      totalPayable: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_payable'])!,
      totalPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_paid'])!,
      remainingDebt: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}remaining_debt'])!,
      paidInstallments: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}paid_installments'])!,
      remainingInstallments: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}remaining_installments'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      downPaymentMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}down_payment_method']),
      firstPaymentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}first_payment_date']),
      lastPaymentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_payment_date']),
      nextPaymentDue: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_payment_due']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      transactionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transaction_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class TransactionData extends DataClass implements Insertable<TransactionData> {
  final String id;
  final String transactionNumber;
  final String customerId;
  final String userId;
  final String type;
  final double subtotal;
  final double downPayment;
  final double remainingAmount;
  final int tenor;
  final double interestRate;
  final double interestAmount;
  final double adminFee;
  final double monthlyInstallment;
  final double totalPayable;
  final double totalPaid;
  final double remainingDebt;
  final int paidInstallments;
  final int remainingInstallments;
  final String status;
  final String? downPaymentMethod;
  final DateTime? firstPaymentDate;
  final DateTime? lastPaymentDate;
  final DateTime? nextPaymentDue;
  final String? notes;
  final DateTime transactionDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TransactionData(
      {required this.id,
      required this.transactionNumber,
      required this.customerId,
      required this.userId,
      required this.type,
      required this.subtotal,
      required this.downPayment,
      required this.remainingAmount,
      required this.tenor,
      required this.interestRate,
      required this.interestAmount,
      required this.adminFee,
      required this.monthlyInstallment,
      required this.totalPayable,
      required this.totalPaid,
      required this.remainingDebt,
      required this.paidInstallments,
      required this.remainingInstallments,
      required this.status,
      this.downPaymentMethod,
      this.firstPaymentDate,
      this.lastPaymentDate,
      this.nextPaymentDue,
      this.notes,
      required this.transactionDate,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['transaction_number'] = Variable<String>(transactionNumber);
    map['customer_id'] = Variable<String>(customerId);
    map['user_id'] = Variable<String>(userId);
    map['type'] = Variable<String>(type);
    map['subtotal'] = Variable<double>(subtotal);
    map['down_payment'] = Variable<double>(downPayment);
    map['remaining_amount'] = Variable<double>(remainingAmount);
    map['tenor'] = Variable<int>(tenor);
    map['interest_rate'] = Variable<double>(interestRate);
    map['interest_amount'] = Variable<double>(interestAmount);
    map['admin_fee'] = Variable<double>(adminFee);
    map['monthly_installment'] = Variable<double>(monthlyInstallment);
    map['total_payable'] = Variable<double>(totalPayable);
    map['total_paid'] = Variable<double>(totalPaid);
    map['remaining_debt'] = Variable<double>(remainingDebt);
    map['paid_installments'] = Variable<int>(paidInstallments);
    map['remaining_installments'] = Variable<int>(remainingInstallments);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || downPaymentMethod != null) {
      map['down_payment_method'] = Variable<String>(downPaymentMethod);
    }
    if (!nullToAbsent || firstPaymentDate != null) {
      map['first_payment_date'] = Variable<DateTime>(firstPaymentDate);
    }
    if (!nullToAbsent || lastPaymentDate != null) {
      map['last_payment_date'] = Variable<DateTime>(lastPaymentDate);
    }
    if (!nullToAbsent || nextPaymentDue != null) {
      map['next_payment_due'] = Variable<DateTime>(nextPaymentDue);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      transactionNumber: Value(transactionNumber),
      customerId: Value(customerId),
      userId: Value(userId),
      type: Value(type),
      subtotal: Value(subtotal),
      downPayment: Value(downPayment),
      remainingAmount: Value(remainingAmount),
      tenor: Value(tenor),
      interestRate: Value(interestRate),
      interestAmount: Value(interestAmount),
      adminFee: Value(adminFee),
      monthlyInstallment: Value(monthlyInstallment),
      totalPayable: Value(totalPayable),
      totalPaid: Value(totalPaid),
      remainingDebt: Value(remainingDebt),
      paidInstallments: Value(paidInstallments),
      remainingInstallments: Value(remainingInstallments),
      status: Value(status),
      downPaymentMethod: downPaymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(downPaymentMethod),
      firstPaymentDate: firstPaymentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(firstPaymentDate),
      lastPaymentDate: lastPaymentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPaymentDate),
      nextPaymentDue: nextPaymentDue == null && nullToAbsent
          ? const Value.absent()
          : Value(nextPaymentDue),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      transactionDate: Value(transactionDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TransactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionData(
      id: serializer.fromJson<String>(json['id']),
      transactionNumber: serializer.fromJson<String>(json['transactionNumber']),
      customerId: serializer.fromJson<String>(json['customerId']),
      userId: serializer.fromJson<String>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      downPayment: serializer.fromJson<double>(json['downPayment']),
      remainingAmount: serializer.fromJson<double>(json['remainingAmount']),
      tenor: serializer.fromJson<int>(json['tenor']),
      interestRate: serializer.fromJson<double>(json['interestRate']),
      interestAmount: serializer.fromJson<double>(json['interestAmount']),
      adminFee: serializer.fromJson<double>(json['adminFee']),
      monthlyInstallment:
          serializer.fromJson<double>(json['monthlyInstallment']),
      totalPayable: serializer.fromJson<double>(json['totalPayable']),
      totalPaid: serializer.fromJson<double>(json['totalPaid']),
      remainingDebt: serializer.fromJson<double>(json['remainingDebt']),
      paidInstallments: serializer.fromJson<int>(json['paidInstallments']),
      remainingInstallments:
          serializer.fromJson<int>(json['remainingInstallments']),
      status: serializer.fromJson<String>(json['status']),
      downPaymentMethod:
          serializer.fromJson<String?>(json['downPaymentMethod']),
      firstPaymentDate:
          serializer.fromJson<DateTime?>(json['firstPaymentDate']),
      lastPaymentDate: serializer.fromJson<DateTime?>(json['lastPaymentDate']),
      nextPaymentDue: serializer.fromJson<DateTime?>(json['nextPaymentDue']),
      notes: serializer.fromJson<String?>(json['notes']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'transactionNumber': serializer.toJson<String>(transactionNumber),
      'customerId': serializer.toJson<String>(customerId),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<String>(type),
      'subtotal': serializer.toJson<double>(subtotal),
      'downPayment': serializer.toJson<double>(downPayment),
      'remainingAmount': serializer.toJson<double>(remainingAmount),
      'tenor': serializer.toJson<int>(tenor),
      'interestRate': serializer.toJson<double>(interestRate),
      'interestAmount': serializer.toJson<double>(interestAmount),
      'adminFee': serializer.toJson<double>(adminFee),
      'monthlyInstallment': serializer.toJson<double>(monthlyInstallment),
      'totalPayable': serializer.toJson<double>(totalPayable),
      'totalPaid': serializer.toJson<double>(totalPaid),
      'remainingDebt': serializer.toJson<double>(remainingDebt),
      'paidInstallments': serializer.toJson<int>(paidInstallments),
      'remainingInstallments': serializer.toJson<int>(remainingInstallments),
      'status': serializer.toJson<String>(status),
      'downPaymentMethod': serializer.toJson<String?>(downPaymentMethod),
      'firstPaymentDate': serializer.toJson<DateTime?>(firstPaymentDate),
      'lastPaymentDate': serializer.toJson<DateTime?>(lastPaymentDate),
      'nextPaymentDue': serializer.toJson<DateTime?>(nextPaymentDue),
      'notes': serializer.toJson<String?>(notes),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TransactionData copyWith(
          {String? id,
          String? transactionNumber,
          String? customerId,
          String? userId,
          String? type,
          double? subtotal,
          double? downPayment,
          double? remainingAmount,
          int? tenor,
          double? interestRate,
          double? interestAmount,
          double? adminFee,
          double? monthlyInstallment,
          double? totalPayable,
          double? totalPaid,
          double? remainingDebt,
          int? paidInstallments,
          int? remainingInstallments,
          String? status,
          Value<String?> downPaymentMethod = const Value.absent(),
          Value<DateTime?> firstPaymentDate = const Value.absent(),
          Value<DateTime?> lastPaymentDate = const Value.absent(),
          Value<DateTime?> nextPaymentDue = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? transactionDate,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TransactionData(
        id: id ?? this.id,
        transactionNumber: transactionNumber ?? this.transactionNumber,
        customerId: customerId ?? this.customerId,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        subtotal: subtotal ?? this.subtotal,
        downPayment: downPayment ?? this.downPayment,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        tenor: tenor ?? this.tenor,
        interestRate: interestRate ?? this.interestRate,
        interestAmount: interestAmount ?? this.interestAmount,
        adminFee: adminFee ?? this.adminFee,
        monthlyInstallment: monthlyInstallment ?? this.monthlyInstallment,
        totalPayable: totalPayable ?? this.totalPayable,
        totalPaid: totalPaid ?? this.totalPaid,
        remainingDebt: remainingDebt ?? this.remainingDebt,
        paidInstallments: paidInstallments ?? this.paidInstallments,
        remainingInstallments:
            remainingInstallments ?? this.remainingInstallments,
        status: status ?? this.status,
        downPaymentMethod: downPaymentMethod.present
            ? downPaymentMethod.value
            : this.downPaymentMethod,
        firstPaymentDate: firstPaymentDate.present
            ? firstPaymentDate.value
            : this.firstPaymentDate,
        lastPaymentDate: lastPaymentDate.present
            ? lastPaymentDate.value
            : this.lastPaymentDate,
        nextPaymentDue:
            nextPaymentDue.present ? nextPaymentDue.value : this.nextPaymentDue,
        notes: notes.present ? notes.value : this.notes,
        transactionDate: transactionDate ?? this.transactionDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  TransactionData copyWithCompanion(TransactionsCompanion data) {
    return TransactionData(
      id: data.id.present ? data.id.value : this.id,
      transactionNumber: data.transactionNumber.present
          ? data.transactionNumber.value
          : this.transactionNumber,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      downPayment:
          data.downPayment.present ? data.downPayment.value : this.downPayment,
      remainingAmount: data.remainingAmount.present
          ? data.remainingAmount.value
          : this.remainingAmount,
      tenor: data.tenor.present ? data.tenor.value : this.tenor,
      interestRate: data.interestRate.present
          ? data.interestRate.value
          : this.interestRate,
      interestAmount: data.interestAmount.present
          ? data.interestAmount.value
          : this.interestAmount,
      adminFee: data.adminFee.present ? data.adminFee.value : this.adminFee,
      monthlyInstallment: data.monthlyInstallment.present
          ? data.monthlyInstallment.value
          : this.monthlyInstallment,
      totalPayable: data.totalPayable.present
          ? data.totalPayable.value
          : this.totalPayable,
      totalPaid: data.totalPaid.present ? data.totalPaid.value : this.totalPaid,
      remainingDebt: data.remainingDebt.present
          ? data.remainingDebt.value
          : this.remainingDebt,
      paidInstallments: data.paidInstallments.present
          ? data.paidInstallments.value
          : this.paidInstallments,
      remainingInstallments: data.remainingInstallments.present
          ? data.remainingInstallments.value
          : this.remainingInstallments,
      status: data.status.present ? data.status.value : this.status,
      downPaymentMethod: data.downPaymentMethod.present
          ? data.downPaymentMethod.value
          : this.downPaymentMethod,
      firstPaymentDate: data.firstPaymentDate.present
          ? data.firstPaymentDate.value
          : this.firstPaymentDate,
      lastPaymentDate: data.lastPaymentDate.present
          ? data.lastPaymentDate.value
          : this.lastPaymentDate,
      nextPaymentDue: data.nextPaymentDue.present
          ? data.nextPaymentDue.value
          : this.nextPaymentDue,
      notes: data.notes.present ? data.notes.value : this.notes,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionData(')
          ..write('id: $id, ')
          ..write('transactionNumber: $transactionNumber, ')
          ..write('customerId: $customerId, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('subtotal: $subtotal, ')
          ..write('downPayment: $downPayment, ')
          ..write('remainingAmount: $remainingAmount, ')
          ..write('tenor: $tenor, ')
          ..write('interestRate: $interestRate, ')
          ..write('interestAmount: $interestAmount, ')
          ..write('adminFee: $adminFee, ')
          ..write('monthlyInstallment: $monthlyInstallment, ')
          ..write('totalPayable: $totalPayable, ')
          ..write('totalPaid: $totalPaid, ')
          ..write('remainingDebt: $remainingDebt, ')
          ..write('paidInstallments: $paidInstallments, ')
          ..write('remainingInstallments: $remainingInstallments, ')
          ..write('status: $status, ')
          ..write('downPaymentMethod: $downPaymentMethod, ')
          ..write('firstPaymentDate: $firstPaymentDate, ')
          ..write('lastPaymentDate: $lastPaymentDate, ')
          ..write('nextPaymentDue: $nextPaymentDue, ')
          ..write('notes: $notes, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        transactionNumber,
        customerId,
        userId,
        type,
        subtotal,
        downPayment,
        remainingAmount,
        tenor,
        interestRate,
        interestAmount,
        adminFee,
        monthlyInstallment,
        totalPayable,
        totalPaid,
        remainingDebt,
        paidInstallments,
        remainingInstallments,
        status,
        downPaymentMethod,
        firstPaymentDate,
        lastPaymentDate,
        nextPaymentDue,
        notes,
        transactionDate,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionData &&
          other.id == this.id &&
          other.transactionNumber == this.transactionNumber &&
          other.customerId == this.customerId &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.subtotal == this.subtotal &&
          other.downPayment == this.downPayment &&
          other.remainingAmount == this.remainingAmount &&
          other.tenor == this.tenor &&
          other.interestRate == this.interestRate &&
          other.interestAmount == this.interestAmount &&
          other.adminFee == this.adminFee &&
          other.monthlyInstallment == this.monthlyInstallment &&
          other.totalPayable == this.totalPayable &&
          other.totalPaid == this.totalPaid &&
          other.remainingDebt == this.remainingDebt &&
          other.paidInstallments == this.paidInstallments &&
          other.remainingInstallments == this.remainingInstallments &&
          other.status == this.status &&
          other.downPaymentMethod == this.downPaymentMethod &&
          other.firstPaymentDate == this.firstPaymentDate &&
          other.lastPaymentDate == this.lastPaymentDate &&
          other.nextPaymentDue == this.nextPaymentDue &&
          other.notes == this.notes &&
          other.transactionDate == this.transactionDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransactionsCompanion extends UpdateCompanion<TransactionData> {
  final Value<String> id;
  final Value<String> transactionNumber;
  final Value<String> customerId;
  final Value<String> userId;
  final Value<String> type;
  final Value<double> subtotal;
  final Value<double> downPayment;
  final Value<double> remainingAmount;
  final Value<int> tenor;
  final Value<double> interestRate;
  final Value<double> interestAmount;
  final Value<double> adminFee;
  final Value<double> monthlyInstallment;
  final Value<double> totalPayable;
  final Value<double> totalPaid;
  final Value<double> remainingDebt;
  final Value<int> paidInstallments;
  final Value<int> remainingInstallments;
  final Value<String> status;
  final Value<String?> downPaymentMethod;
  final Value<DateTime?> firstPaymentDate;
  final Value<DateTime?> lastPaymentDate;
  final Value<DateTime?> nextPaymentDue;
  final Value<String?> notes;
  final Value<DateTime> transactionDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.transactionNumber = const Value.absent(),
    this.customerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.downPayment = const Value.absent(),
    this.remainingAmount = const Value.absent(),
    this.tenor = const Value.absent(),
    this.interestRate = const Value.absent(),
    this.interestAmount = const Value.absent(),
    this.adminFee = const Value.absent(),
    this.monthlyInstallment = const Value.absent(),
    this.totalPayable = const Value.absent(),
    this.totalPaid = const Value.absent(),
    this.remainingDebt = const Value.absent(),
    this.paidInstallments = const Value.absent(),
    this.remainingInstallments = const Value.absent(),
    this.status = const Value.absent(),
    this.downPaymentMethod = const Value.absent(),
    this.firstPaymentDate = const Value.absent(),
    this.lastPaymentDate = const Value.absent(),
    this.nextPaymentDue = const Value.absent(),
    this.notes = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required String transactionNumber,
    required String customerId,
    required String userId,
    this.type = const Value.absent(),
    required double subtotal,
    this.downPayment = const Value.absent(),
    required double remainingAmount,
    this.tenor = const Value.absent(),
    this.interestRate = const Value.absent(),
    this.interestAmount = const Value.absent(),
    this.adminFee = const Value.absent(),
    required double monthlyInstallment,
    required double totalPayable,
    this.totalPaid = const Value.absent(),
    required double remainingDebt,
    this.paidInstallments = const Value.absent(),
    required int remainingInstallments,
    this.status = const Value.absent(),
    this.downPaymentMethod = const Value.absent(),
    this.firstPaymentDate = const Value.absent(),
    this.lastPaymentDate = const Value.absent(),
    this.nextPaymentDue = const Value.absent(),
    this.notes = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        transactionNumber = Value(transactionNumber),
        customerId = Value(customerId),
        userId = Value(userId),
        subtotal = Value(subtotal),
        remainingAmount = Value(remainingAmount),
        monthlyInstallment = Value(monthlyInstallment),
        totalPayable = Value(totalPayable),
        remainingDebt = Value(remainingDebt),
        remainingInstallments = Value(remainingInstallments);
  static Insertable<TransactionData> custom({
    Expression<String>? id,
    Expression<String>? transactionNumber,
    Expression<String>? customerId,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<double>? subtotal,
    Expression<double>? downPayment,
    Expression<double>? remainingAmount,
    Expression<int>? tenor,
    Expression<double>? interestRate,
    Expression<double>? interestAmount,
    Expression<double>? adminFee,
    Expression<double>? monthlyInstallment,
    Expression<double>? totalPayable,
    Expression<double>? totalPaid,
    Expression<double>? remainingDebt,
    Expression<int>? paidInstallments,
    Expression<int>? remainingInstallments,
    Expression<String>? status,
    Expression<String>? downPaymentMethod,
    Expression<DateTime>? firstPaymentDate,
    Expression<DateTime>? lastPaymentDate,
    Expression<DateTime>? nextPaymentDue,
    Expression<String>? notes,
    Expression<DateTime>? transactionDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionNumber != null) 'transaction_number': transactionNumber,
      if (customerId != null) 'customer_id': customerId,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (subtotal != null) 'subtotal': subtotal,
      if (downPayment != null) 'down_payment': downPayment,
      if (remainingAmount != null) 'remaining_amount': remainingAmount,
      if (tenor != null) 'tenor': tenor,
      if (interestRate != null) 'interest_rate': interestRate,
      if (interestAmount != null) 'interest_amount': interestAmount,
      if (adminFee != null) 'admin_fee': adminFee,
      if (monthlyInstallment != null) 'monthly_installment': monthlyInstallment,
      if (totalPayable != null) 'total_payable': totalPayable,
      if (totalPaid != null) 'total_paid': totalPaid,
      if (remainingDebt != null) 'remaining_debt': remainingDebt,
      if (paidInstallments != null) 'paid_installments': paidInstallments,
      if (remainingInstallments != null)
        'remaining_installments': remainingInstallments,
      if (status != null) 'status': status,
      if (downPaymentMethod != null) 'down_payment_method': downPaymentMethod,
      if (firstPaymentDate != null) 'first_payment_date': firstPaymentDate,
      if (lastPaymentDate != null) 'last_payment_date': lastPaymentDate,
      if (nextPaymentDue != null) 'next_payment_due': nextPaymentDue,
      if (notes != null) 'notes': notes,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? transactionNumber,
      Value<String>? customerId,
      Value<String>? userId,
      Value<String>? type,
      Value<double>? subtotal,
      Value<double>? downPayment,
      Value<double>? remainingAmount,
      Value<int>? tenor,
      Value<double>? interestRate,
      Value<double>? interestAmount,
      Value<double>? adminFee,
      Value<double>? monthlyInstallment,
      Value<double>? totalPayable,
      Value<double>? totalPaid,
      Value<double>? remainingDebt,
      Value<int>? paidInstallments,
      Value<int>? remainingInstallments,
      Value<String>? status,
      Value<String?>? downPaymentMethod,
      Value<DateTime?>? firstPaymentDate,
      Value<DateTime?>? lastPaymentDate,
      Value<DateTime?>? nextPaymentDue,
      Value<String?>? notes,
      Value<DateTime>? transactionDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      transactionNumber: transactionNumber ?? this.transactionNumber,
      customerId: customerId ?? this.customerId,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      subtotal: subtotal ?? this.subtotal,
      downPayment: downPayment ?? this.downPayment,
      remainingAmount: remainingAmount ?? this.remainingAmount,
      tenor: tenor ?? this.tenor,
      interestRate: interestRate ?? this.interestRate,
      interestAmount: interestAmount ?? this.interestAmount,
      adminFee: adminFee ?? this.adminFee,
      monthlyInstallment: monthlyInstallment ?? this.monthlyInstallment,
      totalPayable: totalPayable ?? this.totalPayable,
      totalPaid: totalPaid ?? this.totalPaid,
      remainingDebt: remainingDebt ?? this.remainingDebt,
      paidInstallments: paidInstallments ?? this.paidInstallments,
      remainingInstallments:
          remainingInstallments ?? this.remainingInstallments,
      status: status ?? this.status,
      downPaymentMethod: downPaymentMethod ?? this.downPaymentMethod,
      firstPaymentDate: firstPaymentDate ?? this.firstPaymentDate,
      lastPaymentDate: lastPaymentDate ?? this.lastPaymentDate,
      nextPaymentDue: nextPaymentDue ?? this.nextPaymentDue,
      notes: notes ?? this.notes,
      transactionDate: transactionDate ?? this.transactionDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (transactionNumber.present) {
      map['transaction_number'] = Variable<String>(transactionNumber.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (downPayment.present) {
      map['down_payment'] = Variable<double>(downPayment.value);
    }
    if (remainingAmount.present) {
      map['remaining_amount'] = Variable<double>(remainingAmount.value);
    }
    if (tenor.present) {
      map['tenor'] = Variable<int>(tenor.value);
    }
    if (interestRate.present) {
      map['interest_rate'] = Variable<double>(interestRate.value);
    }
    if (interestAmount.present) {
      map['interest_amount'] = Variable<double>(interestAmount.value);
    }
    if (adminFee.present) {
      map['admin_fee'] = Variable<double>(adminFee.value);
    }
    if (monthlyInstallment.present) {
      map['monthly_installment'] = Variable<double>(monthlyInstallment.value);
    }
    if (totalPayable.present) {
      map['total_payable'] = Variable<double>(totalPayable.value);
    }
    if (totalPaid.present) {
      map['total_paid'] = Variable<double>(totalPaid.value);
    }
    if (remainingDebt.present) {
      map['remaining_debt'] = Variable<double>(remainingDebt.value);
    }
    if (paidInstallments.present) {
      map['paid_installments'] = Variable<int>(paidInstallments.value);
    }
    if (remainingInstallments.present) {
      map['remaining_installments'] =
          Variable<int>(remainingInstallments.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (downPaymentMethod.present) {
      map['down_payment_method'] = Variable<String>(downPaymentMethod.value);
    }
    if (firstPaymentDate.present) {
      map['first_payment_date'] = Variable<DateTime>(firstPaymentDate.value);
    }
    if (lastPaymentDate.present) {
      map['last_payment_date'] = Variable<DateTime>(lastPaymentDate.value);
    }
    if (nextPaymentDue.present) {
      map['next_payment_due'] = Variable<DateTime>(nextPaymentDue.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('transactionNumber: $transactionNumber, ')
          ..write('customerId: $customerId, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('subtotal: $subtotal, ')
          ..write('downPayment: $downPayment, ')
          ..write('remainingAmount: $remainingAmount, ')
          ..write('tenor: $tenor, ')
          ..write('interestRate: $interestRate, ')
          ..write('interestAmount: $interestAmount, ')
          ..write('adminFee: $adminFee, ')
          ..write('monthlyInstallment: $monthlyInstallment, ')
          ..write('totalPayable: $totalPayable, ')
          ..write('totalPaid: $totalPaid, ')
          ..write('remainingDebt: $remainingDebt, ')
          ..write('paidInstallments: $paidInstallments, ')
          ..write('remainingInstallments: $remainingInstallments, ')
          ..write('status: $status, ')
          ..write('downPaymentMethod: $downPaymentMethod, ')
          ..write('firstPaymentDate: $firstPaymentDate, ')
          ..write('lastPaymentDate: $lastPaymentDate, ')
          ..write('nextPaymentDue: $nextPaymentDue, ')
          ..write('notes: $notes, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionItemsTable extends TransactionItems
    with TableInfo<$TransactionItemsTable, TransactionItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
      'transaction_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _costPriceMeta =
      const VerificationMeta('costPrice');
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
      'cost_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _sellingPriceMeta =
      const VerificationMeta('sellingPrice');
  @override
  late final GeneratedColumn<double> sellingPrice = GeneratedColumn<double>(
      'selling_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _subtotalMeta =
      const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
      'subtotal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        transactionId,
        productId,
        productName,
        costPrice,
        sellingPrice,
        quantity,
        subtotal,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta));
    } else if (isInserting) {
      context.missing(_costPriceMeta);
    }
    if (data.containsKey('selling_price')) {
      context.handle(
          _sellingPriceMeta,
          sellingPrice.isAcceptableOrUnknown(
              data['selling_price']!, _sellingPriceMeta));
    } else if (isInserting) {
      context.missing(_sellingPriceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transaction_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      costPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost_price'])!,
      sellingPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}selling_price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      subtotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}subtotal'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TransactionItemsTable createAlias(String alias) {
    return $TransactionItemsTable(attachedDatabase, alias);
  }
}

class TransactionItemData extends DataClass
    implements Insertable<TransactionItemData> {
  final String id;
  final String transactionId;
  final String productId;
  final String productName;
  final double costPrice;
  final double sellingPrice;
  final int quantity;
  final double subtotal;
  final DateTime createdAt;
  const TransactionItemData(
      {required this.id,
      required this.transactionId,
      required this.productId,
      required this.productName,
      required this.costPrice,
      required this.sellingPrice,
      required this.quantity,
      required this.subtotal,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['transaction_id'] = Variable<String>(transactionId);
    map['product_id'] = Variable<String>(productId);
    map['product_name'] = Variable<String>(productName);
    map['cost_price'] = Variable<double>(costPrice);
    map['selling_price'] = Variable<double>(sellingPrice);
    map['quantity'] = Variable<int>(quantity);
    map['subtotal'] = Variable<double>(subtotal);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransactionItemsCompanion toCompanion(bool nullToAbsent) {
    return TransactionItemsCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      productId: Value(productId),
      productName: Value(productName),
      costPrice: Value(costPrice),
      sellingPrice: Value(sellingPrice),
      quantity: Value(quantity),
      subtotal: Value(subtotal),
      createdAt: Value(createdAt),
    );
  }

  factory TransactionItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionItemData(
      id: serializer.fromJson<String>(json['id']),
      transactionId: serializer.fromJson<String>(json['transactionId']),
      productId: serializer.fromJson<String>(json['productId']),
      productName: serializer.fromJson<String>(json['productName']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
      sellingPrice: serializer.fromJson<double>(json['sellingPrice']),
      quantity: serializer.fromJson<int>(json['quantity']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'transactionId': serializer.toJson<String>(transactionId),
      'productId': serializer.toJson<String>(productId),
      'productName': serializer.toJson<String>(productName),
      'costPrice': serializer.toJson<double>(costPrice),
      'sellingPrice': serializer.toJson<double>(sellingPrice),
      'quantity': serializer.toJson<int>(quantity),
      'subtotal': serializer.toJson<double>(subtotal),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TransactionItemData copyWith(
          {String? id,
          String? transactionId,
          String? productId,
          String? productName,
          double? costPrice,
          double? sellingPrice,
          int? quantity,
          double? subtotal,
          DateTime? createdAt}) =>
      TransactionItemData(
        id: id ?? this.id,
        transactionId: transactionId ?? this.transactionId,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        costPrice: costPrice ?? this.costPrice,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        quantity: quantity ?? this.quantity,
        subtotal: subtotal ?? this.subtotal,
        createdAt: createdAt ?? this.createdAt,
      );
  TransactionItemData copyWithCompanion(TransactionItemsCompanion data) {
    return TransactionItemData(
      id: data.id.present ? data.id.value : this.id,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      sellingPrice: data.sellingPrice.present
          ? data.sellingPrice.value
          : this.sellingPrice,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionItemData(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('costPrice: $costPrice, ')
          ..write('sellingPrice: $sellingPrice, ')
          ..write('quantity: $quantity, ')
          ..write('subtotal: $subtotal, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, transactionId, productId, productName,
      costPrice, sellingPrice, quantity, subtotal, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionItemData &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.productId == this.productId &&
          other.productName == this.productName &&
          other.costPrice == this.costPrice &&
          other.sellingPrice == this.sellingPrice &&
          other.quantity == this.quantity &&
          other.subtotal == this.subtotal &&
          other.createdAt == this.createdAt);
}

class TransactionItemsCompanion extends UpdateCompanion<TransactionItemData> {
  final Value<String> id;
  final Value<String> transactionId;
  final Value<String> productId;
  final Value<String> productName;
  final Value<double> costPrice;
  final Value<double> sellingPrice;
  final Value<int> quantity;
  final Value<double> subtotal;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TransactionItemsCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productName = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.sellingPrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionItemsCompanion.insert({
    required String id,
    required String transactionId,
    required String productId,
    required String productName,
    required double costPrice,
    required double sellingPrice,
    required int quantity,
    required double subtotal,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        transactionId = Value(transactionId),
        productId = Value(productId),
        productName = Value(productName),
        costPrice = Value(costPrice),
        sellingPrice = Value(sellingPrice),
        quantity = Value(quantity),
        subtotal = Value(subtotal);
  static Insertable<TransactionItemData> custom({
    Expression<String>? id,
    Expression<String>? transactionId,
    Expression<String>? productId,
    Expression<String>? productName,
    Expression<double>? costPrice,
    Expression<double>? sellingPrice,
    Expression<int>? quantity,
    Expression<double>? subtotal,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (productId != null) 'product_id': productId,
      if (productName != null) 'product_name': productName,
      if (costPrice != null) 'cost_price': costPrice,
      if (sellingPrice != null) 'selling_price': sellingPrice,
      if (quantity != null) 'quantity': quantity,
      if (subtotal != null) 'subtotal': subtotal,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? transactionId,
      Value<String>? productId,
      Value<String>? productName,
      Value<double>? costPrice,
      Value<double>? sellingPrice,
      Value<int>? quantity,
      Value<double>? subtotal,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return TransactionItemsCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      costPrice: costPrice ?? this.costPrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      quantity: quantity ?? this.quantity,
      subtotal: subtotal ?? this.subtotal,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (sellingPrice.present) {
      map['selling_price'] = Variable<double>(sellingPrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionItemsCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('costPrice: $costPrice, ')
          ..write('sellingPrice: $sellingPrice, ')
          ..write('quantity: $quantity, ')
          ..write('subtotal: $subtotal, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments
    with TableInfo<$PaymentsTable, PaymentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paymentNumberMeta =
      const VerificationMeta('paymentNumber');
  @override
  late final GeneratedColumn<String> paymentNumber = GeneratedColumn<String>(
      'payment_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
      'transaction_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _installmentNumberMeta =
      const VerificationMeta('installmentNumber');
  @override
  late final GeneratedColumn<int> installmentNumber = GeneratedColumn<int>(
      'installment_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _paymentTypeMeta =
      const VerificationMeta('paymentType');
  @override
  late final GeneratedColumn<String> paymentType = GeneratedColumn<String>(
      'payment_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('installment'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('completed'));
  static const VerificationMeta _paymentProofMeta =
      const VerificationMeta('paymentProof');
  @override
  late final GeneratedColumn<String> paymentProof = GeneratedColumn<String>(
      'payment_proof', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _referenceNumberMeta =
      const VerificationMeta('referenceNumber');
  @override
  late final GeneratedColumn<String> referenceNumber = GeneratedColumn<String>(
      'reference_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isLateMeta = const VerificationMeta('isLate');
  @override
  late final GeneratedColumn<bool> isLate = GeneratedColumn<bool>(
      'is_late', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_late" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lateDaysMeta =
      const VerificationMeta('lateDays');
  @override
  late final GeneratedColumn<int> lateDays = GeneratedColumn<int>(
      'late_days', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lateFeeMeta =
      const VerificationMeta('lateFee');
  @override
  late final GeneratedColumn<double> lateFee = GeneratedColumn<double>(
      'late_fee', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        paymentNumber,
        transactionId,
        customerId,
        userId,
        amount,
        paymentMethod,
        installmentNumber,
        paymentType,
        status,
        paymentProof,
        referenceNumber,
        isLate,
        lateDays,
        lateFee,
        notes,
        paymentDate,
        dueDate,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(Insertable<PaymentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('payment_number')) {
      context.handle(
          _paymentNumberMeta,
          paymentNumber.isAcceptableOrUnknown(
              data['payment_number']!, _paymentNumberMeta));
    } else if (isInserting) {
      context.missing(_paymentNumberMeta);
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('installment_number')) {
      context.handle(
          _installmentNumberMeta,
          installmentNumber.isAcceptableOrUnknown(
              data['installment_number']!, _installmentNumberMeta));
    } else if (isInserting) {
      context.missing(_installmentNumberMeta);
    }
    if (data.containsKey('payment_type')) {
      context.handle(
          _paymentTypeMeta,
          paymentType.isAcceptableOrUnknown(
              data['payment_type']!, _paymentTypeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('payment_proof')) {
      context.handle(
          _paymentProofMeta,
          paymentProof.isAcceptableOrUnknown(
              data['payment_proof']!, _paymentProofMeta));
    }
    if (data.containsKey('reference_number')) {
      context.handle(
          _referenceNumberMeta,
          referenceNumber.isAcceptableOrUnknown(
              data['reference_number']!, _referenceNumberMeta));
    }
    if (data.containsKey('is_late')) {
      context.handle(_isLateMeta,
          isLate.isAcceptableOrUnknown(data['is_late']!, _isLateMeta));
    }
    if (data.containsKey('late_days')) {
      context.handle(_lateDaysMeta,
          lateDays.isAcceptableOrUnknown(data['late_days']!, _lateDaysMeta));
    }
    if (data.containsKey('late_fee')) {
      context.handle(_lateFeeMeta,
          lateFee.isAcceptableOrUnknown(data['late_fee']!, _lateFeeMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      paymentNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_number'])!,
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transaction_id'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      installmentNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}installment_number'])!,
      paymentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_type'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      paymentProof: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_proof']),
      referenceNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reference_number']),
      isLate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_late'])!,
      lateDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}late_days'])!,
      lateFee: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}late_fee'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class PaymentData extends DataClass implements Insertable<PaymentData> {
  final String id;
  final String paymentNumber;
  final String transactionId;
  final String customerId;
  final String userId;
  final double amount;
  final String paymentMethod;
  final int installmentNumber;
  final String paymentType;
  final String status;
  final String? paymentProof;
  final String? referenceNumber;
  final bool isLate;
  final int lateDays;
  final double lateFee;
  final String? notes;
  final DateTime paymentDate;
  final DateTime? dueDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PaymentData(
      {required this.id,
      required this.paymentNumber,
      required this.transactionId,
      required this.customerId,
      required this.userId,
      required this.amount,
      required this.paymentMethod,
      required this.installmentNumber,
      required this.paymentType,
      required this.status,
      this.paymentProof,
      this.referenceNumber,
      required this.isLate,
      required this.lateDays,
      required this.lateFee,
      this.notes,
      required this.paymentDate,
      this.dueDate,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['payment_number'] = Variable<String>(paymentNumber);
    map['transaction_id'] = Variable<String>(transactionId);
    map['customer_id'] = Variable<String>(customerId);
    map['user_id'] = Variable<String>(userId);
    map['amount'] = Variable<double>(amount);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['installment_number'] = Variable<int>(installmentNumber);
    map['payment_type'] = Variable<String>(paymentType);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || paymentProof != null) {
      map['payment_proof'] = Variable<String>(paymentProof);
    }
    if (!nullToAbsent || referenceNumber != null) {
      map['reference_number'] = Variable<String>(referenceNumber);
    }
    map['is_late'] = Variable<bool>(isLate);
    map['late_days'] = Variable<int>(lateDays);
    map['late_fee'] = Variable<double>(lateFee);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['payment_date'] = Variable<DateTime>(paymentDate);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      paymentNumber: Value(paymentNumber),
      transactionId: Value(transactionId),
      customerId: Value(customerId),
      userId: Value(userId),
      amount: Value(amount),
      paymentMethod: Value(paymentMethod),
      installmentNumber: Value(installmentNumber),
      paymentType: Value(paymentType),
      status: Value(status),
      paymentProof: paymentProof == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentProof),
      referenceNumber: referenceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceNumber),
      isLate: Value(isLate),
      lateDays: Value(lateDays),
      lateFee: Value(lateFee),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      paymentDate: Value(paymentDate),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PaymentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentData(
      id: serializer.fromJson<String>(json['id']),
      paymentNumber: serializer.fromJson<String>(json['paymentNumber']),
      transactionId: serializer.fromJson<String>(json['transactionId']),
      customerId: serializer.fromJson<String>(json['customerId']),
      userId: serializer.fromJson<String>(json['userId']),
      amount: serializer.fromJson<double>(json['amount']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      installmentNumber: serializer.fromJson<int>(json['installmentNumber']),
      paymentType: serializer.fromJson<String>(json['paymentType']),
      status: serializer.fromJson<String>(json['status']),
      paymentProof: serializer.fromJson<String?>(json['paymentProof']),
      referenceNumber: serializer.fromJson<String?>(json['referenceNumber']),
      isLate: serializer.fromJson<bool>(json['isLate']),
      lateDays: serializer.fromJson<int>(json['lateDays']),
      lateFee: serializer.fromJson<double>(json['lateFee']),
      notes: serializer.fromJson<String?>(json['notes']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'paymentNumber': serializer.toJson<String>(paymentNumber),
      'transactionId': serializer.toJson<String>(transactionId),
      'customerId': serializer.toJson<String>(customerId),
      'userId': serializer.toJson<String>(userId),
      'amount': serializer.toJson<double>(amount),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'installmentNumber': serializer.toJson<int>(installmentNumber),
      'paymentType': serializer.toJson<String>(paymentType),
      'status': serializer.toJson<String>(status),
      'paymentProof': serializer.toJson<String?>(paymentProof),
      'referenceNumber': serializer.toJson<String?>(referenceNumber),
      'isLate': serializer.toJson<bool>(isLate),
      'lateDays': serializer.toJson<int>(lateDays),
      'lateFee': serializer.toJson<double>(lateFee),
      'notes': serializer.toJson<String?>(notes),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PaymentData copyWith(
          {String? id,
          String? paymentNumber,
          String? transactionId,
          String? customerId,
          String? userId,
          double? amount,
          String? paymentMethod,
          int? installmentNumber,
          String? paymentType,
          String? status,
          Value<String?> paymentProof = const Value.absent(),
          Value<String?> referenceNumber = const Value.absent(),
          bool? isLate,
          int? lateDays,
          double? lateFee,
          Value<String?> notes = const Value.absent(),
          DateTime? paymentDate,
          Value<DateTime?> dueDate = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      PaymentData(
        id: id ?? this.id,
        paymentNumber: paymentNumber ?? this.paymentNumber,
        transactionId: transactionId ?? this.transactionId,
        customerId: customerId ?? this.customerId,
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        installmentNumber: installmentNumber ?? this.installmentNumber,
        paymentType: paymentType ?? this.paymentType,
        status: status ?? this.status,
        paymentProof:
            paymentProof.present ? paymentProof.value : this.paymentProof,
        referenceNumber: referenceNumber.present
            ? referenceNumber.value
            : this.referenceNumber,
        isLate: isLate ?? this.isLate,
        lateDays: lateDays ?? this.lateDays,
        lateFee: lateFee ?? this.lateFee,
        notes: notes.present ? notes.value : this.notes,
        paymentDate: paymentDate ?? this.paymentDate,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  PaymentData copyWithCompanion(PaymentsCompanion data) {
    return PaymentData(
      id: data.id.present ? data.id.value : this.id,
      paymentNumber: data.paymentNumber.present
          ? data.paymentNumber.value
          : this.paymentNumber,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      amount: data.amount.present ? data.amount.value : this.amount,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      installmentNumber: data.installmentNumber.present
          ? data.installmentNumber.value
          : this.installmentNumber,
      paymentType:
          data.paymentType.present ? data.paymentType.value : this.paymentType,
      status: data.status.present ? data.status.value : this.status,
      paymentProof: data.paymentProof.present
          ? data.paymentProof.value
          : this.paymentProof,
      referenceNumber: data.referenceNumber.present
          ? data.referenceNumber.value
          : this.referenceNumber,
      isLate: data.isLate.present ? data.isLate.value : this.isLate,
      lateDays: data.lateDays.present ? data.lateDays.value : this.lateDays,
      lateFee: data.lateFee.present ? data.lateFee.value : this.lateFee,
      notes: data.notes.present ? data.notes.value : this.notes,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentData(')
          ..write('id: $id, ')
          ..write('paymentNumber: $paymentNumber, ')
          ..write('transactionId: $transactionId, ')
          ..write('customerId: $customerId, ')
          ..write('userId: $userId, ')
          ..write('amount: $amount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('installmentNumber: $installmentNumber, ')
          ..write('paymentType: $paymentType, ')
          ..write('status: $status, ')
          ..write('paymentProof: $paymentProof, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('isLate: $isLate, ')
          ..write('lateDays: $lateDays, ')
          ..write('lateFee: $lateFee, ')
          ..write('notes: $notes, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      paymentNumber,
      transactionId,
      customerId,
      userId,
      amount,
      paymentMethod,
      installmentNumber,
      paymentType,
      status,
      paymentProof,
      referenceNumber,
      isLate,
      lateDays,
      lateFee,
      notes,
      paymentDate,
      dueDate,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentData &&
          other.id == this.id &&
          other.paymentNumber == this.paymentNumber &&
          other.transactionId == this.transactionId &&
          other.customerId == this.customerId &&
          other.userId == this.userId &&
          other.amount == this.amount &&
          other.paymentMethod == this.paymentMethod &&
          other.installmentNumber == this.installmentNumber &&
          other.paymentType == this.paymentType &&
          other.status == this.status &&
          other.paymentProof == this.paymentProof &&
          other.referenceNumber == this.referenceNumber &&
          other.isLate == this.isLate &&
          other.lateDays == this.lateDays &&
          other.lateFee == this.lateFee &&
          other.notes == this.notes &&
          other.paymentDate == this.paymentDate &&
          other.dueDate == this.dueDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PaymentsCompanion extends UpdateCompanion<PaymentData> {
  final Value<String> id;
  final Value<String> paymentNumber;
  final Value<String> transactionId;
  final Value<String> customerId;
  final Value<String> userId;
  final Value<double> amount;
  final Value<String> paymentMethod;
  final Value<int> installmentNumber;
  final Value<String> paymentType;
  final Value<String> status;
  final Value<String?> paymentProof;
  final Value<String?> referenceNumber;
  final Value<bool> isLate;
  final Value<int> lateDays;
  final Value<double> lateFee;
  final Value<String?> notes;
  final Value<DateTime> paymentDate;
  final Value<DateTime?> dueDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.paymentNumber = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.amount = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.installmentNumber = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentProof = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.isLate = const Value.absent(),
    this.lateDays = const Value.absent(),
    this.lateFee = const Value.absent(),
    this.notes = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentsCompanion.insert({
    required String id,
    required String paymentNumber,
    required String transactionId,
    required String customerId,
    required String userId,
    required double amount,
    required String paymentMethod,
    required int installmentNumber,
    this.paymentType = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentProof = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.isLate = const Value.absent(),
    this.lateDays = const Value.absent(),
    this.lateFee = const Value.absent(),
    this.notes = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        paymentNumber = Value(paymentNumber),
        transactionId = Value(transactionId),
        customerId = Value(customerId),
        userId = Value(userId),
        amount = Value(amount),
        paymentMethod = Value(paymentMethod),
        installmentNumber = Value(installmentNumber);
  static Insertable<PaymentData> custom({
    Expression<String>? id,
    Expression<String>? paymentNumber,
    Expression<String>? transactionId,
    Expression<String>? customerId,
    Expression<String>? userId,
    Expression<double>? amount,
    Expression<String>? paymentMethod,
    Expression<int>? installmentNumber,
    Expression<String>? paymentType,
    Expression<String>? status,
    Expression<String>? paymentProof,
    Expression<String>? referenceNumber,
    Expression<bool>? isLate,
    Expression<int>? lateDays,
    Expression<double>? lateFee,
    Expression<String>? notes,
    Expression<DateTime>? paymentDate,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (paymentNumber != null) 'payment_number': paymentNumber,
      if (transactionId != null) 'transaction_id': transactionId,
      if (customerId != null) 'customer_id': customerId,
      if (userId != null) 'user_id': userId,
      if (amount != null) 'amount': amount,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (installmentNumber != null) 'installment_number': installmentNumber,
      if (paymentType != null) 'payment_type': paymentType,
      if (status != null) 'status': status,
      if (paymentProof != null) 'payment_proof': paymentProof,
      if (referenceNumber != null) 'reference_number': referenceNumber,
      if (isLate != null) 'is_late': isLate,
      if (lateDays != null) 'late_days': lateDays,
      if (lateFee != null) 'late_fee': lateFee,
      if (notes != null) 'notes': notes,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (dueDate != null) 'due_date': dueDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentsCompanion copyWith(
      {Value<String>? id,
      Value<String>? paymentNumber,
      Value<String>? transactionId,
      Value<String>? customerId,
      Value<String>? userId,
      Value<double>? amount,
      Value<String>? paymentMethod,
      Value<int>? installmentNumber,
      Value<String>? paymentType,
      Value<String>? status,
      Value<String?>? paymentProof,
      Value<String?>? referenceNumber,
      Value<bool>? isLate,
      Value<int>? lateDays,
      Value<double>? lateFee,
      Value<String?>? notes,
      Value<DateTime>? paymentDate,
      Value<DateTime?>? dueDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PaymentsCompanion(
      id: id ?? this.id,
      paymentNumber: paymentNumber ?? this.paymentNumber,
      transactionId: transactionId ?? this.transactionId,
      customerId: customerId ?? this.customerId,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      installmentNumber: installmentNumber ?? this.installmentNumber,
      paymentType: paymentType ?? this.paymentType,
      status: status ?? this.status,
      paymentProof: paymentProof ?? this.paymentProof,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      isLate: isLate ?? this.isLate,
      lateDays: lateDays ?? this.lateDays,
      lateFee: lateFee ?? this.lateFee,
      notes: notes ?? this.notes,
      paymentDate: paymentDate ?? this.paymentDate,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (paymentNumber.present) {
      map['payment_number'] = Variable<String>(paymentNumber.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (installmentNumber.present) {
      map['installment_number'] = Variable<int>(installmentNumber.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<String>(paymentType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (paymentProof.present) {
      map['payment_proof'] = Variable<String>(paymentProof.value);
    }
    if (referenceNumber.present) {
      map['reference_number'] = Variable<String>(referenceNumber.value);
    }
    if (isLate.present) {
      map['is_late'] = Variable<bool>(isLate.value);
    }
    if (lateDays.present) {
      map['late_days'] = Variable<int>(lateDays.value);
    }
    if (lateFee.present) {
      map['late_fee'] = Variable<double>(lateFee.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('paymentNumber: $paymentNumber, ')
          ..write('transactionId: $transactionId, ')
          ..write('customerId: $customerId, ')
          ..write('userId: $userId, ')
          ..write('amount: $amount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('installmentNumber: $installmentNumber, ')
          ..write('paymentType: $paymentType, ')
          ..write('status: $status, ')
          ..write('paymentProof: $paymentProof, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('isLate: $isLate, ')
          ..write('lateDays: $lateDays, ')
          ..write('lateFee: $lateFee, ')
          ..write('notes: $notes, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pinMeta = const VerificationMeta('pin');
  @override
  late final GeneratedColumn<String> pin = GeneratedColumn<String>(
      'pin', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 6),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('cashier'));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastLoginAtMeta =
      const VerificationMeta('lastLoginAt');
  @override
  late final GeneratedColumn<DateTime> lastLoginAt = GeneratedColumn<DateTime>(
      'last_login_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        username,
        password,
        pin,
        fullName,
        email,
        phone,
        role,
        isActive,
        createdAt,
        updatedAt,
        lastLoginAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('pin')) {
      context.handle(
          _pinMeta, pin.isAcceptableOrUnknown(data['pin']!, _pinMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('last_login_at')) {
      context.handle(
          _lastLoginAtMeta,
          lastLoginAt.isAcceptableOrUnknown(
              data['last_login_at']!, _lastLoginAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      pin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin']),
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      lastLoginAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_login_at']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final String id;
  final String username;
  final String password;
  final String? pin;
  final String fullName;
  final String? email;
  final String? phone;
  final String role;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastLoginAt;
  const UserData(
      {required this.id,
      required this.username,
      required this.password,
      this.pin,
      required this.fullName,
      this.email,
      this.phone,
      required this.role,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      this.lastLoginAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    if (!nullToAbsent || pin != null) {
      map['pin'] = Variable<String>(pin);
    }
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['role'] = Variable<String>(role);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || lastLoginAt != null) {
      map['last_login_at'] = Variable<DateTime>(lastLoginAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      pin: pin == null && nullToAbsent ? const Value.absent() : Value(pin),
      fullName: Value(fullName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      role: Value(role),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastLoginAt: lastLoginAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLoginAt),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      pin: serializer.fromJson<String?>(json['pin']),
      fullName: serializer.fromJson<String>(json['fullName']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      role: serializer.fromJson<String>(json['role']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      lastLoginAt: serializer.fromJson<DateTime?>(json['lastLoginAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'pin': serializer.toJson<String?>(pin),
      'fullName': serializer.toJson<String>(fullName),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'role': serializer.toJson<String>(role),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'lastLoginAt': serializer.toJson<DateTime?>(lastLoginAt),
    };
  }

  UserData copyWith(
          {String? id,
          String? username,
          String? password,
          Value<String?> pin = const Value.absent(),
          String? fullName,
          Value<String?> email = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          String? role,
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> lastLoginAt = const Value.absent()}) =>
      UserData(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        pin: pin.present ? pin.value : this.pin,
        fullName: fullName ?? this.fullName,
        email: email.present ? email.value : this.email,
        phone: phone.present ? phone.value : this.phone,
        role: role ?? this.role,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        lastLoginAt: lastLoginAt.present ? lastLoginAt.value : this.lastLoginAt,
      );
  UserData copyWithCompanion(UsersCompanion data) {
    return UserData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      pin: data.pin.present ? data.pin.value : this.pin,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      role: data.role.present ? data.role.value : this.role,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastLoginAt:
          data.lastLoginAt.present ? data.lastLoginAt.value : this.lastLoginAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('pin: $pin, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastLoginAt: $lastLoginAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, password, pin, fullName, email,
      phone, role, isActive, createdAt, updatedAt, lastLoginAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.pin == this.pin &&
          other.fullName == this.fullName &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.role == this.role &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.lastLoginAt == this.lastLoginAt);
}

class UsersCompanion extends UpdateCompanion<UserData> {
  final Value<String> id;
  final Value<String> username;
  final Value<String> password;
  final Value<String?> pin;
  final Value<String> fullName;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String> role;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> lastLoginAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.pin = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.role = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastLoginAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String username,
    required String password,
    this.pin = const Value.absent(),
    required String fullName,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.role = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastLoginAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        username = Value(username),
        password = Value(password),
        fullName = Value(fullName);
  static Insertable<UserData> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? pin,
    Expression<String>? fullName,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? role,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? lastLoginAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (pin != null) 'pin': pin,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (role != null) 'role': role,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (lastLoginAt != null) 'last_login_at': lastLoginAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? username,
      Value<String>? password,
      Value<String?>? pin,
      Value<String>? fullName,
      Value<String?>? email,
      Value<String?>? phone,
      Value<String>? role,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? lastLoginAt,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      pin: pin ?? this.pin,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (pin.present) {
      map['pin'] = Variable<String>(pin.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (lastLoginAt.present) {
      map['last_login_at'] = Variable<DateTime>(lastLoginAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('pin: $pin, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastLoginAt: $lastLoginAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses
    with TableInfo<$ExpensesTable, ExpenseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _receiptImageMeta =
      const VerificationMeta('receiptImage');
  @override
  late final GeneratedColumn<String> receiptImage = GeneratedColumn<String>(
      'receipt_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _expenseDateMeta =
      const VerificationMeta('expenseDate');
  @override
  late final GeneratedColumn<DateTime> expenseDate = GeneratedColumn<DateTime>(
      'expense_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        amount,
        category,
        paymentMethod,
        userId,
        receiptImage,
        expenseDate,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(Insertable<ExpenseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('receipt_image')) {
      context.handle(
          _receiptImageMeta,
          receiptImage.isAcceptableOrUnknown(
              data['receipt_image']!, _receiptImageMeta));
    }
    if (data.containsKey('expense_date')) {
      context.handle(
          _expenseDateMeta,
          expenseDate.isAcceptableOrUnknown(
              data['expense_date']!, _expenseDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      receiptImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receipt_image']),
      expenseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expense_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class ExpenseData extends DataClass implements Insertable<ExpenseData> {
  final String id;
  final String title;
  final String? description;
  final double amount;
  final String category;
  final String paymentMethod;
  final String userId;
  final String? receiptImage;
  final DateTime expenseDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ExpenseData(
      {required this.id,
      required this.title,
      this.description,
      required this.amount,
      required this.category,
      required this.paymentMethod,
      required this.userId,
      this.receiptImage,
      required this.expenseDate,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['amount'] = Variable<double>(amount);
    map['category'] = Variable<String>(category);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || receiptImage != null) {
      map['receipt_image'] = Variable<String>(receiptImage);
    }
    map['expense_date'] = Variable<DateTime>(expenseDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      amount: Value(amount),
      category: Value(category),
      paymentMethod: Value(paymentMethod),
      userId: Value(userId),
      receiptImage: receiptImage == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptImage),
      expenseDate: Value(expenseDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ExpenseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      amount: serializer.fromJson<double>(json['amount']),
      category: serializer.fromJson<String>(json['category']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      userId: serializer.fromJson<String>(json['userId']),
      receiptImage: serializer.fromJson<String?>(json['receiptImage']),
      expenseDate: serializer.fromJson<DateTime>(json['expenseDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'amount': serializer.toJson<double>(amount),
      'category': serializer.toJson<String>(category),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'userId': serializer.toJson<String>(userId),
      'receiptImage': serializer.toJson<String?>(receiptImage),
      'expenseDate': serializer.toJson<DateTime>(expenseDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ExpenseData copyWith(
          {String? id,
          String? title,
          Value<String?> description = const Value.absent(),
          double? amount,
          String? category,
          String? paymentMethod,
          String? userId,
          Value<String?> receiptImage = const Value.absent(),
          DateTime? expenseDate,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ExpenseData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        amount: amount ?? this.amount,
        category: category ?? this.category,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        userId: userId ?? this.userId,
        receiptImage:
            receiptImage.present ? receiptImage.value : this.receiptImage,
        expenseDate: expenseDate ?? this.expenseDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ExpenseData copyWithCompanion(ExpensesCompanion data) {
    return ExpenseData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      amount: data.amount.present ? data.amount.value : this.amount,
      category: data.category.present ? data.category.value : this.category,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      userId: data.userId.present ? data.userId.value : this.userId,
      receiptImage: data.receiptImage.present
          ? data.receiptImage.value
          : this.receiptImage,
      expenseDate:
          data.expenseDate.present ? data.expenseDate.value : this.expenseDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('userId: $userId, ')
          ..write('receiptImage: $receiptImage, ')
          ..write('expenseDate: $expenseDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, amount, category,
      paymentMethod, userId, receiptImage, expenseDate, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.amount == this.amount &&
          other.category == this.category &&
          other.paymentMethod == this.paymentMethod &&
          other.userId == this.userId &&
          other.receiptImage == this.receiptImage &&
          other.expenseDate == this.expenseDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ExpensesCompanion extends UpdateCompanion<ExpenseData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<double> amount;
  final Value<String> category;
  final Value<String> paymentMethod;
  final Value<String> userId;
  final Value<String?> receiptImage;
  final Value<DateTime> expenseDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.category = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.userId = const Value.absent(),
    this.receiptImage = const Value.absent(),
    this.expenseDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpensesCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    required double amount,
    required String category,
    required String paymentMethod,
    required String userId,
    this.receiptImage = const Value.absent(),
    this.expenseDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        amount = Value(amount),
        category = Value(category),
        paymentMethod = Value(paymentMethod),
        userId = Value(userId);
  static Insertable<ExpenseData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<double>? amount,
    Expression<String>? category,
    Expression<String>? paymentMethod,
    Expression<String>? userId,
    Expression<String>? receiptImage,
    Expression<DateTime>? expenseDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (category != null) 'category': category,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (userId != null) 'user_id': userId,
      if (receiptImage != null) 'receipt_image': receiptImage,
      if (expenseDate != null) 'expense_date': expenseDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpensesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<double>? amount,
      Value<String>? category,
      Value<String>? paymentMethod,
      Value<String>? userId,
      Value<String?>? receiptImage,
      Value<DateTime>? expenseDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      userId: userId ?? this.userId,
      receiptImage: receiptImage ?? this.receiptImage,
      expenseDate: expenseDate ?? this.expenseDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (receiptImage.present) {
      map['receipt_image'] = Variable<String>(receiptImage.value);
    }
    if (expenseDate.present) {
      map['expense_date'] = Variable<DateTime>(expenseDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('userId: $userId, ')
          ..write('receiptImage: $receiptImage, ')
          ..write('expenseDate: $expenseDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StoreSettingsTable extends StoreSettings
    with TableInfo<$StoreSettingsTable, StoreSettingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoreSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _storeNameMeta =
      const VerificationMeta('storeName');
  @override
  late final GeneratedColumn<String> storeName = GeneratedColumn<String>(
      'store_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Toko Saya'));
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _logoUrlMeta =
      const VerificationMeta('logoUrl');
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
      'logo_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiptHeaderMeta =
      const VerificationMeta('receiptHeader');
  @override
  late final GeneratedColumn<String> receiptHeader = GeneratedColumn<String>(
      'receipt_header', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiptFooterMeta =
      const VerificationMeta('receiptFooter');
  @override
  late final GeneratedColumn<String> receiptFooter = GeneratedColumn<String>(
      'receipt_footer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiptPaperSizeMeta =
      const VerificationMeta('receiptPaperSize');
  @override
  late final GeneratedColumn<int> receiptPaperSize = GeneratedColumn<int>(
      'receipt_paper_size', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(58));
  static const VerificationMeta _useStockMeta =
      const VerificationMeta('useStock');
  @override
  late final GeneratedColumn<bool> useStock = GeneratedColumn<bool>(
      'use_stock', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("use_stock" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _allowNegativeStockMeta =
      const VerificationMeta('allowNegativeStock');
  @override
  late final GeneratedColumn<bool> allowNegativeStock = GeneratedColumn<bool>(
      'allow_negative_stock', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("allow_negative_stock" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _defaultInterestRateMeta =
      const VerificationMeta('defaultInterestRate');
  @override
  late final GeneratedColumn<double> defaultInterestRate =
      GeneratedColumn<double>('default_interest_rate', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(2.0));
  static const VerificationMeta _defaultAdminFeeMeta =
      const VerificationMeta('defaultAdminFee');
  @override
  late final GeneratedColumn<double> defaultAdminFee = GeneratedColumn<double>(
      'default_admin_fee', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _currencySymbolMeta =
      const VerificationMeta('currencySymbol');
  @override
  late final GeneratedColumn<String> currencySymbol = GeneratedColumn<String>(
      'currency_symbol', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Rp'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        storeName,
        address,
        phone,
        email,
        logoUrl,
        receiptHeader,
        receiptFooter,
        receiptPaperSize,
        useStock,
        allowNegativeStock,
        defaultInterestRate,
        defaultAdminFee,
        currencySymbol,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'store_settings';
  @override
  VerificationContext validateIntegrity(Insertable<StoreSettingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('store_name')) {
      context.handle(_storeNameMeta,
          storeName.isAcceptableOrUnknown(data['store_name']!, _storeNameMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('logo_url')) {
      context.handle(_logoUrlMeta,
          logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta));
    }
    if (data.containsKey('receipt_header')) {
      context.handle(
          _receiptHeaderMeta,
          receiptHeader.isAcceptableOrUnknown(
              data['receipt_header']!, _receiptHeaderMeta));
    }
    if (data.containsKey('receipt_footer')) {
      context.handle(
          _receiptFooterMeta,
          receiptFooter.isAcceptableOrUnknown(
              data['receipt_footer']!, _receiptFooterMeta));
    }
    if (data.containsKey('receipt_paper_size')) {
      context.handle(
          _receiptPaperSizeMeta,
          receiptPaperSize.isAcceptableOrUnknown(
              data['receipt_paper_size']!, _receiptPaperSizeMeta));
    }
    if (data.containsKey('use_stock')) {
      context.handle(_useStockMeta,
          useStock.isAcceptableOrUnknown(data['use_stock']!, _useStockMeta));
    }
    if (data.containsKey('allow_negative_stock')) {
      context.handle(
          _allowNegativeStockMeta,
          allowNegativeStock.isAcceptableOrUnknown(
              data['allow_negative_stock']!, _allowNegativeStockMeta));
    }
    if (data.containsKey('default_interest_rate')) {
      context.handle(
          _defaultInterestRateMeta,
          defaultInterestRate.isAcceptableOrUnknown(
              data['default_interest_rate']!, _defaultInterestRateMeta));
    }
    if (data.containsKey('default_admin_fee')) {
      context.handle(
          _defaultAdminFeeMeta,
          defaultAdminFee.isAcceptableOrUnknown(
              data['default_admin_fee']!, _defaultAdminFeeMeta));
    }
    if (data.containsKey('currency_symbol')) {
      context.handle(
          _currencySymbolMeta,
          currencySymbol.isAcceptableOrUnknown(
              data['currency_symbol']!, _currencySymbolMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoreSettingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoreSettingData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      storeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}store_name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      logoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logo_url']),
      receiptHeader: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receipt_header']),
      receiptFooter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receipt_footer']),
      receiptPaperSize: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}receipt_paper_size'])!,
      useStock: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}use_stock'])!,
      allowNegativeStock: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}allow_negative_stock'])!,
      defaultInterestRate: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}default_interest_rate'])!,
      defaultAdminFee: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}default_admin_fee'])!,
      currencySymbol: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}currency_symbol'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $StoreSettingsTable createAlias(String alias) {
    return $StoreSettingsTable(attachedDatabase, alias);
  }
}

class StoreSettingData extends DataClass
    implements Insertable<StoreSettingData> {
  final int id;
  final String storeName;
  final String? address;
  final String? phone;
  final String? email;
  final String? logoUrl;
  final String? receiptHeader;
  final String? receiptFooter;
  final int receiptPaperSize;
  final bool useStock;
  final bool allowNegativeStock;
  final double defaultInterestRate;
  final double defaultAdminFee;
  final String currencySymbol;
  final DateTime updatedAt;
  const StoreSettingData(
      {required this.id,
      required this.storeName,
      this.address,
      this.phone,
      this.email,
      this.logoUrl,
      this.receiptHeader,
      this.receiptFooter,
      required this.receiptPaperSize,
      required this.useStock,
      required this.allowNegativeStock,
      required this.defaultInterestRate,
      required this.defaultAdminFee,
      required this.currencySymbol,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['store_name'] = Variable<String>(storeName);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    if (!nullToAbsent || receiptHeader != null) {
      map['receipt_header'] = Variable<String>(receiptHeader);
    }
    if (!nullToAbsent || receiptFooter != null) {
      map['receipt_footer'] = Variable<String>(receiptFooter);
    }
    map['receipt_paper_size'] = Variable<int>(receiptPaperSize);
    map['use_stock'] = Variable<bool>(useStock);
    map['allow_negative_stock'] = Variable<bool>(allowNegativeStock);
    map['default_interest_rate'] = Variable<double>(defaultInterestRate);
    map['default_admin_fee'] = Variable<double>(defaultAdminFee);
    map['currency_symbol'] = Variable<String>(currencySymbol);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  StoreSettingsCompanion toCompanion(bool nullToAbsent) {
    return StoreSettingsCompanion(
      id: Value(id),
      storeName: Value(storeName),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      receiptHeader: receiptHeader == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptHeader),
      receiptFooter: receiptFooter == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptFooter),
      receiptPaperSize: Value(receiptPaperSize),
      useStock: Value(useStock),
      allowNegativeStock: Value(allowNegativeStock),
      defaultInterestRate: Value(defaultInterestRate),
      defaultAdminFee: Value(defaultAdminFee),
      currencySymbol: Value(currencySymbol),
      updatedAt: Value(updatedAt),
    );
  }

  factory StoreSettingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoreSettingData(
      id: serializer.fromJson<int>(json['id']),
      storeName: serializer.fromJson<String>(json['storeName']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      receiptHeader: serializer.fromJson<String?>(json['receiptHeader']),
      receiptFooter: serializer.fromJson<String?>(json['receiptFooter']),
      receiptPaperSize: serializer.fromJson<int>(json['receiptPaperSize']),
      useStock: serializer.fromJson<bool>(json['useStock']),
      allowNegativeStock: serializer.fromJson<bool>(json['allowNegativeStock']),
      defaultInterestRate:
          serializer.fromJson<double>(json['defaultInterestRate']),
      defaultAdminFee: serializer.fromJson<double>(json['defaultAdminFee']),
      currencySymbol: serializer.fromJson<String>(json['currencySymbol']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'storeName': serializer.toJson<String>(storeName),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'receiptHeader': serializer.toJson<String?>(receiptHeader),
      'receiptFooter': serializer.toJson<String?>(receiptFooter),
      'receiptPaperSize': serializer.toJson<int>(receiptPaperSize),
      'useStock': serializer.toJson<bool>(useStock),
      'allowNegativeStock': serializer.toJson<bool>(allowNegativeStock),
      'defaultInterestRate': serializer.toJson<double>(defaultInterestRate),
      'defaultAdminFee': serializer.toJson<double>(defaultAdminFee),
      'currencySymbol': serializer.toJson<String>(currencySymbol),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  StoreSettingData copyWith(
          {int? id,
          String? storeName,
          Value<String?> address = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> logoUrl = const Value.absent(),
          Value<String?> receiptHeader = const Value.absent(),
          Value<String?> receiptFooter = const Value.absent(),
          int? receiptPaperSize,
          bool? useStock,
          bool? allowNegativeStock,
          double? defaultInterestRate,
          double? defaultAdminFee,
          String? currencySymbol,
          DateTime? updatedAt}) =>
      StoreSettingData(
        id: id ?? this.id,
        storeName: storeName ?? this.storeName,
        address: address.present ? address.value : this.address,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
        receiptHeader:
            receiptHeader.present ? receiptHeader.value : this.receiptHeader,
        receiptFooter:
            receiptFooter.present ? receiptFooter.value : this.receiptFooter,
        receiptPaperSize: receiptPaperSize ?? this.receiptPaperSize,
        useStock: useStock ?? this.useStock,
        allowNegativeStock: allowNegativeStock ?? this.allowNegativeStock,
        defaultInterestRate: defaultInterestRate ?? this.defaultInterestRate,
        defaultAdminFee: defaultAdminFee ?? this.defaultAdminFee,
        currencySymbol: currencySymbol ?? this.currencySymbol,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  StoreSettingData copyWithCompanion(StoreSettingsCompanion data) {
    return StoreSettingData(
      id: data.id.present ? data.id.value : this.id,
      storeName: data.storeName.present ? data.storeName.value : this.storeName,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      receiptHeader: data.receiptHeader.present
          ? data.receiptHeader.value
          : this.receiptHeader,
      receiptFooter: data.receiptFooter.present
          ? data.receiptFooter.value
          : this.receiptFooter,
      receiptPaperSize: data.receiptPaperSize.present
          ? data.receiptPaperSize.value
          : this.receiptPaperSize,
      useStock: data.useStock.present ? data.useStock.value : this.useStock,
      allowNegativeStock: data.allowNegativeStock.present
          ? data.allowNegativeStock.value
          : this.allowNegativeStock,
      defaultInterestRate: data.defaultInterestRate.present
          ? data.defaultInterestRate.value
          : this.defaultInterestRate,
      defaultAdminFee: data.defaultAdminFee.present
          ? data.defaultAdminFee.value
          : this.defaultAdminFee,
      currencySymbol: data.currencySymbol.present
          ? data.currencySymbol.value
          : this.currencySymbol,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoreSettingData(')
          ..write('id: $id, ')
          ..write('storeName: $storeName, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('receiptHeader: $receiptHeader, ')
          ..write('receiptFooter: $receiptFooter, ')
          ..write('receiptPaperSize: $receiptPaperSize, ')
          ..write('useStock: $useStock, ')
          ..write('allowNegativeStock: $allowNegativeStock, ')
          ..write('defaultInterestRate: $defaultInterestRate, ')
          ..write('defaultAdminFee: $defaultAdminFee, ')
          ..write('currencySymbol: $currencySymbol, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      storeName,
      address,
      phone,
      email,
      logoUrl,
      receiptHeader,
      receiptFooter,
      receiptPaperSize,
      useStock,
      allowNegativeStock,
      defaultInterestRate,
      defaultAdminFee,
      currencySymbol,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoreSettingData &&
          other.id == this.id &&
          other.storeName == this.storeName &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.logoUrl == this.logoUrl &&
          other.receiptHeader == this.receiptHeader &&
          other.receiptFooter == this.receiptFooter &&
          other.receiptPaperSize == this.receiptPaperSize &&
          other.useStock == this.useStock &&
          other.allowNegativeStock == this.allowNegativeStock &&
          other.defaultInterestRate == this.defaultInterestRate &&
          other.defaultAdminFee == this.defaultAdminFee &&
          other.currencySymbol == this.currencySymbol &&
          other.updatedAt == this.updatedAt);
}

class StoreSettingsCompanion extends UpdateCompanion<StoreSettingData> {
  final Value<int> id;
  final Value<String> storeName;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> logoUrl;
  final Value<String?> receiptHeader;
  final Value<String?> receiptFooter;
  final Value<int> receiptPaperSize;
  final Value<bool> useStock;
  final Value<bool> allowNegativeStock;
  final Value<double> defaultInterestRate;
  final Value<double> defaultAdminFee;
  final Value<String> currencySymbol;
  final Value<DateTime> updatedAt;
  const StoreSettingsCompanion({
    this.id = const Value.absent(),
    this.storeName = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.receiptHeader = const Value.absent(),
    this.receiptFooter = const Value.absent(),
    this.receiptPaperSize = const Value.absent(),
    this.useStock = const Value.absent(),
    this.allowNegativeStock = const Value.absent(),
    this.defaultInterestRate = const Value.absent(),
    this.defaultAdminFee = const Value.absent(),
    this.currencySymbol = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StoreSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.storeName = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.receiptHeader = const Value.absent(),
    this.receiptFooter = const Value.absent(),
    this.receiptPaperSize = const Value.absent(),
    this.useStock = const Value.absent(),
    this.allowNegativeStock = const Value.absent(),
    this.defaultInterestRate = const Value.absent(),
    this.defaultAdminFee = const Value.absent(),
    this.currencySymbol = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<StoreSettingData> custom({
    Expression<int>? id,
    Expression<String>? storeName,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? logoUrl,
    Expression<String>? receiptHeader,
    Expression<String>? receiptFooter,
    Expression<int>? receiptPaperSize,
    Expression<bool>? useStock,
    Expression<bool>? allowNegativeStock,
    Expression<double>? defaultInterestRate,
    Expression<double>? defaultAdminFee,
    Expression<String>? currencySymbol,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (storeName != null) 'store_name': storeName,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (receiptHeader != null) 'receipt_header': receiptHeader,
      if (receiptFooter != null) 'receipt_footer': receiptFooter,
      if (receiptPaperSize != null) 'receipt_paper_size': receiptPaperSize,
      if (useStock != null) 'use_stock': useStock,
      if (allowNegativeStock != null)
        'allow_negative_stock': allowNegativeStock,
      if (defaultInterestRate != null)
        'default_interest_rate': defaultInterestRate,
      if (defaultAdminFee != null) 'default_admin_fee': defaultAdminFee,
      if (currencySymbol != null) 'currency_symbol': currencySymbol,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StoreSettingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? storeName,
      Value<String?>? address,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? logoUrl,
      Value<String?>? receiptHeader,
      Value<String?>? receiptFooter,
      Value<int>? receiptPaperSize,
      Value<bool>? useStock,
      Value<bool>? allowNegativeStock,
      Value<double>? defaultInterestRate,
      Value<double>? defaultAdminFee,
      Value<String>? currencySymbol,
      Value<DateTime>? updatedAt}) {
    return StoreSettingsCompanion(
      id: id ?? this.id,
      storeName: storeName ?? this.storeName,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      logoUrl: logoUrl ?? this.logoUrl,
      receiptHeader: receiptHeader ?? this.receiptHeader,
      receiptFooter: receiptFooter ?? this.receiptFooter,
      receiptPaperSize: receiptPaperSize ?? this.receiptPaperSize,
      useStock: useStock ?? this.useStock,
      allowNegativeStock: allowNegativeStock ?? this.allowNegativeStock,
      defaultInterestRate: defaultInterestRate ?? this.defaultInterestRate,
      defaultAdminFee: defaultAdminFee ?? this.defaultAdminFee,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (storeName.present) {
      map['store_name'] = Variable<String>(storeName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (receiptHeader.present) {
      map['receipt_header'] = Variable<String>(receiptHeader.value);
    }
    if (receiptFooter.present) {
      map['receipt_footer'] = Variable<String>(receiptFooter.value);
    }
    if (receiptPaperSize.present) {
      map['receipt_paper_size'] = Variable<int>(receiptPaperSize.value);
    }
    if (useStock.present) {
      map['use_stock'] = Variable<bool>(useStock.value);
    }
    if (allowNegativeStock.present) {
      map['allow_negative_stock'] = Variable<bool>(allowNegativeStock.value);
    }
    if (defaultInterestRate.present) {
      map['default_interest_rate'] =
          Variable<double>(defaultInterestRate.value);
    }
    if (defaultAdminFee.present) {
      map['default_admin_fee'] = Variable<double>(defaultAdminFee.value);
    }
    if (currencySymbol.present) {
      map['currency_symbol'] = Variable<String>(currencySymbol.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoreSettingsCompanion(')
          ..write('id: $id, ')
          ..write('storeName: $storeName, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('receiptHeader: $receiptHeader, ')
          ..write('receiptFooter: $receiptFooter, ')
          ..write('receiptPaperSize: $receiptPaperSize, ')
          ..write('useStock: $useStock, ')
          ..write('allowNegativeStock: $allowNegativeStock, ')
          ..write('defaultInterestRate: $defaultInterestRate, ')
          ..write('defaultAdminFee: $defaultAdminFee, ')
          ..write('currencySymbol: $currencySymbol, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $TransactionItemsTable transactionItems =
      $TransactionItemsTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $StoreSettingsTable storeSettings = $StoreSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        products,
        categories,
        customers,
        transactions,
        transactionItems,
        payments,
        users,
        expenses,
        storeSettings
      ];
}

typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  required String id,
  required String name,
  Value<String?> sku,
  Value<String?> barcode,
  Value<double> costPrice,
  Value<double> sellingPrice,
  Value<int> stock,
  Value<int> minStock,
  Value<String?> categoryId,
  Value<String?> description,
  Value<String?> imageUrl,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> sku,
  Value<String?> barcode,
  Value<double> costPrice,
  Value<double> sellingPrice,
  Value<int> stock,
  Value<int> minStock,
  Value<String?> categoryId,
  Value<String?> description,
  Value<String?> imageUrl,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sellingPrice => $composableBuilder(
      column: $table.sellingPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minStock => $composableBuilder(
      column: $table.minStock, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sellingPrice => $composableBuilder(
      column: $table.sellingPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minStock => $composableBuilder(
      column: $table.minStock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<double> get sellingPrice => $composableBuilder(
      column: $table.sellingPrice, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<int> get minStock =>
      $composableBuilder(column: $table.minStock, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTable,
    ProductData,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (ProductData, BaseReferences<_$AppDatabase, $ProductsTable, ProductData>),
    ProductData,
    PrefetchHooks Function()> {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> sku = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<double> costPrice = const Value.absent(),
            Value<double> sellingPrice = const Value.absent(),
            Value<int> stock = const Value.absent(),
            Value<int> minStock = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion(
            id: id,
            name: name,
            sku: sku,
            barcode: barcode,
            costPrice: costPrice,
            sellingPrice: sellingPrice,
            stock: stock,
            minStock: minStock,
            categoryId: categoryId,
            description: description,
            imageUrl: imageUrl,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> sku = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<double> costPrice = const Value.absent(),
            Value<double> sellingPrice = const Value.absent(),
            Value<int> stock = const Value.absent(),
            Value<int> minStock = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            id: id,
            name: name,
            sku: sku,
            barcode: barcode,
            costPrice: costPrice,
            sellingPrice: sellingPrice,
            stock: stock,
            minStock: minStock,
            categoryId: categoryId,
            description: description,
            imageUrl: imageUrl,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTable,
    ProductData,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (ProductData, BaseReferences<_$AppDatabase, $ProductsTable, ProductData>),
    ProductData,
    PrefetchHooks Function()>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    CategoryData,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (
      CategoryData,
      BaseReferences<_$AppDatabase, $CategoriesTable, CategoryData>
    ),
    CategoryData,
    PrefetchHooks Function()> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            description: description,
            isActive: isActive,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            description: description,
            isActive: isActive,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    CategoryData,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (
      CategoryData,
      BaseReferences<_$AppDatabase, $CategoriesTable, CategoryData>
    ),
    CategoryData,
    PrefetchHooks Function()>;
typedef $$CustomersTableCreateCompanionBuilder = CustomersCompanion Function({
  required String id,
  required String name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> address,
  Value<String?> city,
  Value<String?> province,
  Value<String?> postalCode,
  Value<String?> idCardNumber,
  Value<String?> idCardImageUrl,
  Value<double> creditLimit,
  Value<double> totalDebt,
  Value<int> totalTransactions,
  Value<int> rating,
  Value<String?> notes,
  Value<bool> isActive,
  Value<bool> isBlacklisted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> lastTransactionDate,
  Value<int> rowid,
});
typedef $$CustomersTableUpdateCompanionBuilder = CustomersCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> address,
  Value<String?> city,
  Value<String?> province,
  Value<String?> postalCode,
  Value<String?> idCardNumber,
  Value<String?> idCardImageUrl,
  Value<double> creditLimit,
  Value<double> totalDebt,
  Value<int> totalTransactions,
  Value<int> rating,
  Value<String?> notes,
  Value<bool> isActive,
  Value<bool> isBlacklisted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> lastTransactionDate,
  Value<int> rowid,
});

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get province => $composableBuilder(
      column: $table.province, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get idCardNumber => $composableBuilder(
      column: $table.idCardNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get idCardImageUrl => $composableBuilder(
      column: $table.idCardImageUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get creditLimit => $composableBuilder(
      column: $table.creditLimit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalDebt => $composableBuilder(
      column: $table.totalDebt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalTransactions => $composableBuilder(
      column: $table.totalTransactions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBlacklisted => $composableBuilder(
      column: $table.isBlacklisted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastTransactionDate => $composableBuilder(
      column: $table.lastTransactionDate,
      builder: (column) => ColumnFilters(column));
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get province => $composableBuilder(
      column: $table.province, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get idCardNumber => $composableBuilder(
      column: $table.idCardNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get idCardImageUrl => $composableBuilder(
      column: $table.idCardImageUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get creditLimit => $composableBuilder(
      column: $table.creditLimit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalDebt => $composableBuilder(
      column: $table.totalDebt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalTransactions => $composableBuilder(
      column: $table.totalTransactions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBlacklisted => $composableBuilder(
      column: $table.isBlacklisted,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastTransactionDate => $composableBuilder(
      column: $table.lastTransactionDate,
      builder: (column) => ColumnOrderings(column));
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get province =>
      $composableBuilder(column: $table.province, builder: (column) => column);

  GeneratedColumn<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => column);

  GeneratedColumn<String> get idCardNumber => $composableBuilder(
      column: $table.idCardNumber, builder: (column) => column);

  GeneratedColumn<String> get idCardImageUrl => $composableBuilder(
      column: $table.idCardImageUrl, builder: (column) => column);

  GeneratedColumn<double> get creditLimit => $composableBuilder(
      column: $table.creditLimit, builder: (column) => column);

  GeneratedColumn<double> get totalDebt =>
      $composableBuilder(column: $table.totalDebt, builder: (column) => column);

  GeneratedColumn<int> get totalTransactions => $composableBuilder(
      column: $table.totalTransactions, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isBlacklisted => $composableBuilder(
      column: $table.isBlacklisted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastTransactionDate => $composableBuilder(
      column: $table.lastTransactionDate, builder: (column) => column);
}

class $$CustomersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomersTable,
    CustomerData,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (
      CustomerData,
      BaseReferences<_$AppDatabase, $CustomersTable, CustomerData>
    ),
    CustomerData,
    PrefetchHooks Function()> {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> province = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> idCardNumber = const Value.absent(),
            Value<String?> idCardImageUrl = const Value.absent(),
            Value<double> creditLimit = const Value.absent(),
            Value<double> totalDebt = const Value.absent(),
            Value<int> totalTransactions = const Value.absent(),
            Value<int> rating = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<bool> isBlacklisted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> lastTransactionDate = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CustomersCompanion(
            id: id,
            name: name,
            phone: phone,
            email: email,
            address: address,
            city: city,
            province: province,
            postalCode: postalCode,
            idCardNumber: idCardNumber,
            idCardImageUrl: idCardImageUrl,
            creditLimit: creditLimit,
            totalDebt: totalDebt,
            totalTransactions: totalTransactions,
            rating: rating,
            notes: notes,
            isActive: isActive,
            isBlacklisted: isBlacklisted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            lastTransactionDate: lastTransactionDate,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> province = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> idCardNumber = const Value.absent(),
            Value<String?> idCardImageUrl = const Value.absent(),
            Value<double> creditLimit = const Value.absent(),
            Value<double> totalDebt = const Value.absent(),
            Value<int> totalTransactions = const Value.absent(),
            Value<int> rating = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<bool> isBlacklisted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> lastTransactionDate = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CustomersCompanion.insert(
            id: id,
            name: name,
            phone: phone,
            email: email,
            address: address,
            city: city,
            province: province,
            postalCode: postalCode,
            idCardNumber: idCardNumber,
            idCardImageUrl: idCardImageUrl,
            creditLimit: creditLimit,
            totalDebt: totalDebt,
            totalTransactions: totalTransactions,
            rating: rating,
            notes: notes,
            isActive: isActive,
            isBlacklisted: isBlacklisted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            lastTransactionDate: lastTransactionDate,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomersTable,
    CustomerData,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (
      CustomerData,
      BaseReferences<_$AppDatabase, $CustomersTable, CustomerData>
    ),
    CustomerData,
    PrefetchHooks Function()>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  required String id,
  required String transactionNumber,
  required String customerId,
  required String userId,
  Value<String> type,
  required double subtotal,
  Value<double> downPayment,
  required double remainingAmount,
  Value<int> tenor,
  Value<double> interestRate,
  Value<double> interestAmount,
  Value<double> adminFee,
  required double monthlyInstallment,
  required double totalPayable,
  Value<double> totalPaid,
  required double remainingDebt,
  Value<int> paidInstallments,
  required int remainingInstallments,
  Value<String> status,
  Value<String?> downPaymentMethod,
  Value<DateTime?> firstPaymentDate,
  Value<DateTime?> lastPaymentDate,
  Value<DateTime?> nextPaymentDue,
  Value<String?> notes,
  Value<DateTime> transactionDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<String> id,
  Value<String> transactionNumber,
  Value<String> customerId,
  Value<String> userId,
  Value<String> type,
  Value<double> subtotal,
  Value<double> downPayment,
  Value<double> remainingAmount,
  Value<int> tenor,
  Value<double> interestRate,
  Value<double> interestAmount,
  Value<double> adminFee,
  Value<double> monthlyInstallment,
  Value<double> totalPayable,
  Value<double> totalPaid,
  Value<double> remainingDebt,
  Value<int> paidInstallments,
  Value<int> remainingInstallments,
  Value<String> status,
  Value<String?> downPaymentMethod,
  Value<DateTime?> firstPaymentDate,
  Value<DateTime?> lastPaymentDate,
  Value<DateTime?> nextPaymentDue,
  Value<String?> notes,
  Value<DateTime> transactionDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionNumber => $composableBuilder(
      column: $table.transactionNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get downPayment => $composableBuilder(
      column: $table.downPayment, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get remainingAmount => $composableBuilder(
      column: $table.remainingAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tenor => $composableBuilder(
      column: $table.tenor, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get interestRate => $composableBuilder(
      column: $table.interestRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get interestAmount => $composableBuilder(
      column: $table.interestAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get adminFee => $composableBuilder(
      column: $table.adminFee, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get monthlyInstallment => $composableBuilder(
      column: $table.monthlyInstallment,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPayable => $composableBuilder(
      column: $table.totalPayable, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPaid => $composableBuilder(
      column: $table.totalPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get remainingDebt => $composableBuilder(
      column: $table.remainingDebt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get paidInstallments => $composableBuilder(
      column: $table.paidInstallments,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remainingInstallments => $composableBuilder(
      column: $table.remainingInstallments,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get downPaymentMethod => $composableBuilder(
      column: $table.downPaymentMethod,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get firstPaymentDate => $composableBuilder(
      column: $table.firstPaymentDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastPaymentDate => $composableBuilder(
      column: $table.lastPaymentDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextPaymentDue => $composableBuilder(
      column: $table.nextPaymentDue,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionNumber => $composableBuilder(
      column: $table.transactionNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get downPayment => $composableBuilder(
      column: $table.downPayment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get remainingAmount => $composableBuilder(
      column: $table.remainingAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tenor => $composableBuilder(
      column: $table.tenor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get interestRate => $composableBuilder(
      column: $table.interestRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get interestAmount => $composableBuilder(
      column: $table.interestAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get adminFee => $composableBuilder(
      column: $table.adminFee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get monthlyInstallment => $composableBuilder(
      column: $table.monthlyInstallment,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPayable => $composableBuilder(
      column: $table.totalPayable,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPaid => $composableBuilder(
      column: $table.totalPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get remainingDebt => $composableBuilder(
      column: $table.remainingDebt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get paidInstallments => $composableBuilder(
      column: $table.paidInstallments,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remainingInstallments => $composableBuilder(
      column: $table.remainingInstallments,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get downPaymentMethod => $composableBuilder(
      column: $table.downPaymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get firstPaymentDate => $composableBuilder(
      column: $table.firstPaymentDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastPaymentDate => $composableBuilder(
      column: $table.lastPaymentDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextPaymentDue => $composableBuilder(
      column: $table.nextPaymentDue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get transactionNumber => $composableBuilder(
      column: $table.transactionNumber, builder: (column) => column);

  GeneratedColumn<String> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get downPayment => $composableBuilder(
      column: $table.downPayment, builder: (column) => column);

  GeneratedColumn<double> get remainingAmount => $composableBuilder(
      column: $table.remainingAmount, builder: (column) => column);

  GeneratedColumn<int> get tenor =>
      $composableBuilder(column: $table.tenor, builder: (column) => column);

  GeneratedColumn<double> get interestRate => $composableBuilder(
      column: $table.interestRate, builder: (column) => column);

  GeneratedColumn<double> get interestAmount => $composableBuilder(
      column: $table.interestAmount, builder: (column) => column);

  GeneratedColumn<double> get adminFee =>
      $composableBuilder(column: $table.adminFee, builder: (column) => column);

  GeneratedColumn<double> get monthlyInstallment => $composableBuilder(
      column: $table.monthlyInstallment, builder: (column) => column);

  GeneratedColumn<double> get totalPayable => $composableBuilder(
      column: $table.totalPayable, builder: (column) => column);

  GeneratedColumn<double> get totalPaid =>
      $composableBuilder(column: $table.totalPaid, builder: (column) => column);

  GeneratedColumn<double> get remainingDebt => $composableBuilder(
      column: $table.remainingDebt, builder: (column) => column);

  GeneratedColumn<int> get paidInstallments => $composableBuilder(
      column: $table.paidInstallments, builder: (column) => column);

  GeneratedColumn<int> get remainingInstallments => $composableBuilder(
      column: $table.remainingInstallments, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get downPaymentMethod => $composableBuilder(
      column: $table.downPaymentMethod, builder: (column) => column);

  GeneratedColumn<DateTime> get firstPaymentDate => $composableBuilder(
      column: $table.firstPaymentDate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPaymentDate => $composableBuilder(
      column: $table.lastPaymentDate, builder: (column) => column);

  GeneratedColumn<DateTime> get nextPaymentDue => $composableBuilder(
      column: $table.nextPaymentDue, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    TransactionData,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (
      TransactionData,
      BaseReferences<_$AppDatabase, $TransactionsTable, TransactionData>
    ),
    TransactionData,
    PrefetchHooks Function()> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> transactionNumber = const Value.absent(),
            Value<String> customerId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double> subtotal = const Value.absent(),
            Value<double> downPayment = const Value.absent(),
            Value<double> remainingAmount = const Value.absent(),
            Value<int> tenor = const Value.absent(),
            Value<double> interestRate = const Value.absent(),
            Value<double> interestAmount = const Value.absent(),
            Value<double> adminFee = const Value.absent(),
            Value<double> monthlyInstallment = const Value.absent(),
            Value<double> totalPayable = const Value.absent(),
            Value<double> totalPaid = const Value.absent(),
            Value<double> remainingDebt = const Value.absent(),
            Value<int> paidInstallments = const Value.absent(),
            Value<int> remainingInstallments = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> downPaymentMethod = const Value.absent(),
            Value<DateTime?> firstPaymentDate = const Value.absent(),
            Value<DateTime?> lastPaymentDate = const Value.absent(),
            Value<DateTime?> nextPaymentDue = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> transactionDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            transactionNumber: transactionNumber,
            customerId: customerId,
            userId: userId,
            type: type,
            subtotal: subtotal,
            downPayment: downPayment,
            remainingAmount: remainingAmount,
            tenor: tenor,
            interestRate: interestRate,
            interestAmount: interestAmount,
            adminFee: adminFee,
            monthlyInstallment: monthlyInstallment,
            totalPayable: totalPayable,
            totalPaid: totalPaid,
            remainingDebt: remainingDebt,
            paidInstallments: paidInstallments,
            remainingInstallments: remainingInstallments,
            status: status,
            downPaymentMethod: downPaymentMethod,
            firstPaymentDate: firstPaymentDate,
            lastPaymentDate: lastPaymentDate,
            nextPaymentDue: nextPaymentDue,
            notes: notes,
            transactionDate: transactionDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String transactionNumber,
            required String customerId,
            required String userId,
            Value<String> type = const Value.absent(),
            required double subtotal,
            Value<double> downPayment = const Value.absent(),
            required double remainingAmount,
            Value<int> tenor = const Value.absent(),
            Value<double> interestRate = const Value.absent(),
            Value<double> interestAmount = const Value.absent(),
            Value<double> adminFee = const Value.absent(),
            required double monthlyInstallment,
            required double totalPayable,
            Value<double> totalPaid = const Value.absent(),
            required double remainingDebt,
            Value<int> paidInstallments = const Value.absent(),
            required int remainingInstallments,
            Value<String> status = const Value.absent(),
            Value<String?> downPaymentMethod = const Value.absent(),
            Value<DateTime?> firstPaymentDate = const Value.absent(),
            Value<DateTime?> lastPaymentDate = const Value.absent(),
            Value<DateTime?> nextPaymentDue = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> transactionDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            transactionNumber: transactionNumber,
            customerId: customerId,
            userId: userId,
            type: type,
            subtotal: subtotal,
            downPayment: downPayment,
            remainingAmount: remainingAmount,
            tenor: tenor,
            interestRate: interestRate,
            interestAmount: interestAmount,
            adminFee: adminFee,
            monthlyInstallment: monthlyInstallment,
            totalPayable: totalPayable,
            totalPaid: totalPaid,
            remainingDebt: remainingDebt,
            paidInstallments: paidInstallments,
            remainingInstallments: remainingInstallments,
            status: status,
            downPaymentMethod: downPaymentMethod,
            firstPaymentDate: firstPaymentDate,
            lastPaymentDate: lastPaymentDate,
            nextPaymentDue: nextPaymentDue,
            notes: notes,
            transactionDate: transactionDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTable,
    TransactionData,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (
      TransactionData,
      BaseReferences<_$AppDatabase, $TransactionsTable, TransactionData>
    ),
    TransactionData,
    PrefetchHooks Function()>;
typedef $$TransactionItemsTableCreateCompanionBuilder
    = TransactionItemsCompanion Function({
  required String id,
  required String transactionId,
  required String productId,
  required String productName,
  required double costPrice,
  required double sellingPrice,
  required int quantity,
  required double subtotal,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$TransactionItemsTableUpdateCompanionBuilder
    = TransactionItemsCompanion Function({
  Value<String> id,
  Value<String> transactionId,
  Value<String> productId,
  Value<String> productName,
  Value<double> costPrice,
  Value<double> sellingPrice,
  Value<int> quantity,
  Value<double> subtotal,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$TransactionItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionItemsTable> {
  $$TransactionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sellingPrice => $composableBuilder(
      column: $table.sellingPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$TransactionItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionItemsTable> {
  $$TransactionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionId => $composableBuilder(
      column: $table.transactionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sellingPrice => $composableBuilder(
      column: $table.sellingPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TransactionItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionItemsTable> {
  $$TransactionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<double> get sellingPrice => $composableBuilder(
      column: $table.sellingPrice, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TransactionItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionItemsTable,
    TransactionItemData,
    $$TransactionItemsTableFilterComposer,
    $$TransactionItemsTableOrderingComposer,
    $$TransactionItemsTableAnnotationComposer,
    $$TransactionItemsTableCreateCompanionBuilder,
    $$TransactionItemsTableUpdateCompanionBuilder,
    (
      TransactionItemData,
      BaseReferences<_$AppDatabase, $TransactionItemsTable, TransactionItemData>
    ),
    TransactionItemData,
    PrefetchHooks Function()> {
  $$TransactionItemsTableTableManager(
      _$AppDatabase db, $TransactionItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> transactionId = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<double> costPrice = const Value.absent(),
            Value<double> sellingPrice = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double> subtotal = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionItemsCompanion(
            id: id,
            transactionId: transactionId,
            productId: productId,
            productName: productName,
            costPrice: costPrice,
            sellingPrice: sellingPrice,
            quantity: quantity,
            subtotal: subtotal,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String transactionId,
            required String productId,
            required String productName,
            required double costPrice,
            required double sellingPrice,
            required int quantity,
            required double subtotal,
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionItemsCompanion.insert(
            id: id,
            transactionId: transactionId,
            productId: productId,
            productName: productName,
            costPrice: costPrice,
            sellingPrice: sellingPrice,
            quantity: quantity,
            subtotal: subtotal,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionItemsTable,
    TransactionItemData,
    $$TransactionItemsTableFilterComposer,
    $$TransactionItemsTableOrderingComposer,
    $$TransactionItemsTableAnnotationComposer,
    $$TransactionItemsTableCreateCompanionBuilder,
    $$TransactionItemsTableUpdateCompanionBuilder,
    (
      TransactionItemData,
      BaseReferences<_$AppDatabase, $TransactionItemsTable, TransactionItemData>
    ),
    TransactionItemData,
    PrefetchHooks Function()>;
typedef $$PaymentsTableCreateCompanionBuilder = PaymentsCompanion Function({
  required String id,
  required String paymentNumber,
  required String transactionId,
  required String customerId,
  required String userId,
  required double amount,
  required String paymentMethod,
  required int installmentNumber,
  Value<String> paymentType,
  Value<String> status,
  Value<String?> paymentProof,
  Value<String?> referenceNumber,
  Value<bool> isLate,
  Value<int> lateDays,
  Value<double> lateFee,
  Value<String?> notes,
  Value<DateTime> paymentDate,
  Value<DateTime?> dueDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$PaymentsTableUpdateCompanionBuilder = PaymentsCompanion Function({
  Value<String> id,
  Value<String> paymentNumber,
  Value<String> transactionId,
  Value<String> customerId,
  Value<String> userId,
  Value<double> amount,
  Value<String> paymentMethod,
  Value<int> installmentNumber,
  Value<String> paymentType,
  Value<String> status,
  Value<String?> paymentProof,
  Value<String?> referenceNumber,
  Value<bool> isLate,
  Value<int> lateDays,
  Value<double> lateFee,
  Value<String?> notes,
  Value<DateTime> paymentDate,
  Value<DateTime?> dueDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentNumber => $composableBuilder(
      column: $table.paymentNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get installmentNumber => $composableBuilder(
      column: $table.installmentNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentType => $composableBuilder(
      column: $table.paymentType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentProof => $composableBuilder(
      column: $table.paymentProof, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isLate => $composableBuilder(
      column: $table.isLate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lateDays => $composableBuilder(
      column: $table.lateDays, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lateFee => $composableBuilder(
      column: $table.lateFee, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentNumber => $composableBuilder(
      column: $table.paymentNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionId => $composableBuilder(
      column: $table.transactionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get installmentNumber => $composableBuilder(
      column: $table.installmentNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentType => $composableBuilder(
      column: $table.paymentType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentProof => $composableBuilder(
      column: $table.paymentProof,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isLate => $composableBuilder(
      column: $table.isLate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lateDays => $composableBuilder(
      column: $table.lateDays, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lateFee => $composableBuilder(
      column: $table.lateFee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get paymentNumber => $composableBuilder(
      column: $table.paymentNumber, builder: (column) => column);

  GeneratedColumn<String> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => column);

  GeneratedColumn<String> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<int> get installmentNumber => $composableBuilder(
      column: $table.installmentNumber, builder: (column) => column);

  GeneratedColumn<String> get paymentType => $composableBuilder(
      column: $table.paymentType, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get paymentProof => $composableBuilder(
      column: $table.paymentProof, builder: (column) => column);

  GeneratedColumn<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber, builder: (column) => column);

  GeneratedColumn<bool> get isLate =>
      $composableBuilder(column: $table.isLate, builder: (column) => column);

  GeneratedColumn<int> get lateDays =>
      $composableBuilder(column: $table.lateDays, builder: (column) => column);

  GeneratedColumn<double> get lateFee =>
      $composableBuilder(column: $table.lateFee, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PaymentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaymentsTable,
    PaymentData,
    $$PaymentsTableFilterComposer,
    $$PaymentsTableOrderingComposer,
    $$PaymentsTableAnnotationComposer,
    $$PaymentsTableCreateCompanionBuilder,
    $$PaymentsTableUpdateCompanionBuilder,
    (PaymentData, BaseReferences<_$AppDatabase, $PaymentsTable, PaymentData>),
    PaymentData,
    PrefetchHooks Function()> {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> paymentNumber = const Value.absent(),
            Value<String> transactionId = const Value.absent(),
            Value<String> customerId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<int> installmentNumber = const Value.absent(),
            Value<String> paymentType = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> paymentProof = const Value.absent(),
            Value<String?> referenceNumber = const Value.absent(),
            Value<bool> isLate = const Value.absent(),
            Value<int> lateDays = const Value.absent(),
            Value<double> lateFee = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PaymentsCompanion(
            id: id,
            paymentNumber: paymentNumber,
            transactionId: transactionId,
            customerId: customerId,
            userId: userId,
            amount: amount,
            paymentMethod: paymentMethod,
            installmentNumber: installmentNumber,
            paymentType: paymentType,
            status: status,
            paymentProof: paymentProof,
            referenceNumber: referenceNumber,
            isLate: isLate,
            lateDays: lateDays,
            lateFee: lateFee,
            notes: notes,
            paymentDate: paymentDate,
            dueDate: dueDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String paymentNumber,
            required String transactionId,
            required String customerId,
            required String userId,
            required double amount,
            required String paymentMethod,
            required int installmentNumber,
            Value<String> paymentType = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> paymentProof = const Value.absent(),
            Value<String?> referenceNumber = const Value.absent(),
            Value<bool> isLate = const Value.absent(),
            Value<int> lateDays = const Value.absent(),
            Value<double> lateFee = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PaymentsCompanion.insert(
            id: id,
            paymentNumber: paymentNumber,
            transactionId: transactionId,
            customerId: customerId,
            userId: userId,
            amount: amount,
            paymentMethod: paymentMethod,
            installmentNumber: installmentNumber,
            paymentType: paymentType,
            status: status,
            paymentProof: paymentProof,
            referenceNumber: referenceNumber,
            isLate: isLate,
            lateDays: lateDays,
            lateFee: lateFee,
            notes: notes,
            paymentDate: paymentDate,
            dueDate: dueDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PaymentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PaymentsTable,
    PaymentData,
    $$PaymentsTableFilterComposer,
    $$PaymentsTableOrderingComposer,
    $$PaymentsTableAnnotationComposer,
    $$PaymentsTableCreateCompanionBuilder,
    $$PaymentsTableUpdateCompanionBuilder,
    (PaymentData, BaseReferences<_$AppDatabase, $PaymentsTable, PaymentData>),
    PaymentData,
    PrefetchHooks Function()>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  required String username,
  required String password,
  Value<String?> pin,
  required String fullName,
  Value<String?> email,
  Value<String?> phone,
  Value<String> role,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> lastLoginAt,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String> username,
  Value<String> password,
  Value<String?> pin,
  Value<String> fullName,
  Value<String?> email,
  Value<String?> phone,
  Value<String> role,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> lastLoginAt,
  Value<int> rowid,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastLoginAt => $composableBuilder(
      column: $table.lastLoginAt, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastLoginAt => $composableBuilder(
      column: $table.lastLoginAt, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get pin =>
      $composableBuilder(column: $table.pin, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLoginAt => $composableBuilder(
      column: $table.lastLoginAt, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    UserData,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserData, BaseReferences<_$AppDatabase, $UsersTable, UserData>),
    UserData,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String?> pin = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> lastLoginAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            username: username,
            password: password,
            pin: pin,
            fullName: fullName,
            email: email,
            phone: phone,
            role: role,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            lastLoginAt: lastLoginAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String username,
            required String password,
            Value<String?> pin = const Value.absent(),
            required String fullName,
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> lastLoginAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            username: username,
            password: password,
            pin: pin,
            fullName: fullName,
            email: email,
            phone: phone,
            role: role,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            lastLoginAt: lastLoginAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    UserData,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserData, BaseReferences<_$AppDatabase, $UsersTable, UserData>),
    UserData,
    PrefetchHooks Function()>;
typedef $$ExpensesTableCreateCompanionBuilder = ExpensesCompanion Function({
  required String id,
  required String title,
  Value<String?> description,
  required double amount,
  required String category,
  required String paymentMethod,
  required String userId,
  Value<String?> receiptImage,
  Value<DateTime> expenseDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$ExpensesTableUpdateCompanionBuilder = ExpensesCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String?> description,
  Value<double> amount,
  Value<String> category,
  Value<String> paymentMethod,
  Value<String> userId,
  Value<String?> receiptImage,
  Value<DateTime> expenseDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiptImage => $composableBuilder(
      column: $table.receiptImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expenseDate => $composableBuilder(
      column: $table.expenseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiptImage => $composableBuilder(
      column: $table.receiptImage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expenseDate => $composableBuilder(
      column: $table.expenseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get receiptImage => $composableBuilder(
      column: $table.receiptImage, builder: (column) => column);

  GeneratedColumn<DateTime> get expenseDate => $composableBuilder(
      column: $table.expenseDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ExpensesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpensesTable,
    ExpenseData,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableAnnotationComposer,
    $$ExpensesTableCreateCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder,
    (ExpenseData, BaseReferences<_$AppDatabase, $ExpensesTable, ExpenseData>),
    ExpenseData,
    PrefetchHooks Function()> {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String?> receiptImage = const Value.absent(),
            Value<DateTime> expenseDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpensesCompanion(
            id: id,
            title: title,
            description: description,
            amount: amount,
            category: category,
            paymentMethod: paymentMethod,
            userId: userId,
            receiptImage: receiptImage,
            expenseDate: expenseDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> description = const Value.absent(),
            required double amount,
            required String category,
            required String paymentMethod,
            required String userId,
            Value<String?> receiptImage = const Value.absent(),
            Value<DateTime> expenseDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpensesCompanion.insert(
            id: id,
            title: title,
            description: description,
            amount: amount,
            category: category,
            paymentMethod: paymentMethod,
            userId: userId,
            receiptImage: receiptImage,
            expenseDate: expenseDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExpensesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExpensesTable,
    ExpenseData,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableAnnotationComposer,
    $$ExpensesTableCreateCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder,
    (ExpenseData, BaseReferences<_$AppDatabase, $ExpensesTable, ExpenseData>),
    ExpenseData,
    PrefetchHooks Function()>;
typedef $$StoreSettingsTableCreateCompanionBuilder = StoreSettingsCompanion
    Function({
  Value<int> id,
  Value<String> storeName,
  Value<String?> address,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> logoUrl,
  Value<String?> receiptHeader,
  Value<String?> receiptFooter,
  Value<int> receiptPaperSize,
  Value<bool> useStock,
  Value<bool> allowNegativeStock,
  Value<double> defaultInterestRate,
  Value<double> defaultAdminFee,
  Value<String> currencySymbol,
  Value<DateTime> updatedAt,
});
typedef $$StoreSettingsTableUpdateCompanionBuilder = StoreSettingsCompanion
    Function({
  Value<int> id,
  Value<String> storeName,
  Value<String?> address,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> logoUrl,
  Value<String?> receiptHeader,
  Value<String?> receiptFooter,
  Value<int> receiptPaperSize,
  Value<bool> useStock,
  Value<bool> allowNegativeStock,
  Value<double> defaultInterestRate,
  Value<double> defaultAdminFee,
  Value<String> currencySymbol,
  Value<DateTime> updatedAt,
});

class $$StoreSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $StoreSettingsTable> {
  $$StoreSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get storeName => $composableBuilder(
      column: $table.storeName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get logoUrl => $composableBuilder(
      column: $table.logoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiptHeader => $composableBuilder(
      column: $table.receiptHeader, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiptFooter => $composableBuilder(
      column: $table.receiptFooter, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get receiptPaperSize => $composableBuilder(
      column: $table.receiptPaperSize,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get useStock => $composableBuilder(
      column: $table.useStock, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get allowNegativeStock => $composableBuilder(
      column: $table.allowNegativeStock,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get defaultInterestRate => $composableBuilder(
      column: $table.defaultInterestRate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get defaultAdminFee => $composableBuilder(
      column: $table.defaultAdminFee,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currencySymbol => $composableBuilder(
      column: $table.currencySymbol,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$StoreSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $StoreSettingsTable> {
  $$StoreSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get storeName => $composableBuilder(
      column: $table.storeName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get logoUrl => $composableBuilder(
      column: $table.logoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiptHeader => $composableBuilder(
      column: $table.receiptHeader,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiptFooter => $composableBuilder(
      column: $table.receiptFooter,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get receiptPaperSize => $composableBuilder(
      column: $table.receiptPaperSize,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get useStock => $composableBuilder(
      column: $table.useStock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get allowNegativeStock => $composableBuilder(
      column: $table.allowNegativeStock,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get defaultInterestRate => $composableBuilder(
      column: $table.defaultInterestRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get defaultAdminFee => $composableBuilder(
      column: $table.defaultAdminFee,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currencySymbol => $composableBuilder(
      column: $table.currencySymbol,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$StoreSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StoreSettingsTable> {
  $$StoreSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get storeName =>
      $composableBuilder(column: $table.storeName, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<String> get receiptHeader => $composableBuilder(
      column: $table.receiptHeader, builder: (column) => column);

  GeneratedColumn<String> get receiptFooter => $composableBuilder(
      column: $table.receiptFooter, builder: (column) => column);

  GeneratedColumn<int> get receiptPaperSize => $composableBuilder(
      column: $table.receiptPaperSize, builder: (column) => column);

  GeneratedColumn<bool> get useStock =>
      $composableBuilder(column: $table.useStock, builder: (column) => column);

  GeneratedColumn<bool> get allowNegativeStock => $composableBuilder(
      column: $table.allowNegativeStock, builder: (column) => column);

  GeneratedColumn<double> get defaultInterestRate => $composableBuilder(
      column: $table.defaultInterestRate, builder: (column) => column);

  GeneratedColumn<double> get defaultAdminFee => $composableBuilder(
      column: $table.defaultAdminFee, builder: (column) => column);

  GeneratedColumn<String> get currencySymbol => $composableBuilder(
      column: $table.currencySymbol, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$StoreSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StoreSettingsTable,
    StoreSettingData,
    $$StoreSettingsTableFilterComposer,
    $$StoreSettingsTableOrderingComposer,
    $$StoreSettingsTableAnnotationComposer,
    $$StoreSettingsTableCreateCompanionBuilder,
    $$StoreSettingsTableUpdateCompanionBuilder,
    (
      StoreSettingData,
      BaseReferences<_$AppDatabase, $StoreSettingsTable, StoreSettingData>
    ),
    StoreSettingData,
    PrefetchHooks Function()> {
  $$StoreSettingsTableTableManager(_$AppDatabase db, $StoreSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoreSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoreSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoreSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> storeName = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> logoUrl = const Value.absent(),
            Value<String?> receiptHeader = const Value.absent(),
            Value<String?> receiptFooter = const Value.absent(),
            Value<int> receiptPaperSize = const Value.absent(),
            Value<bool> useStock = const Value.absent(),
            Value<bool> allowNegativeStock = const Value.absent(),
            Value<double> defaultInterestRate = const Value.absent(),
            Value<double> defaultAdminFee = const Value.absent(),
            Value<String> currencySymbol = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              StoreSettingsCompanion(
            id: id,
            storeName: storeName,
            address: address,
            phone: phone,
            email: email,
            logoUrl: logoUrl,
            receiptHeader: receiptHeader,
            receiptFooter: receiptFooter,
            receiptPaperSize: receiptPaperSize,
            useStock: useStock,
            allowNegativeStock: allowNegativeStock,
            defaultInterestRate: defaultInterestRate,
            defaultAdminFee: defaultAdminFee,
            currencySymbol: currencySymbol,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> storeName = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> logoUrl = const Value.absent(),
            Value<String?> receiptHeader = const Value.absent(),
            Value<String?> receiptFooter = const Value.absent(),
            Value<int> receiptPaperSize = const Value.absent(),
            Value<bool> useStock = const Value.absent(),
            Value<bool> allowNegativeStock = const Value.absent(),
            Value<double> defaultInterestRate = const Value.absent(),
            Value<double> defaultAdminFee = const Value.absent(),
            Value<String> currencySymbol = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              StoreSettingsCompanion.insert(
            id: id,
            storeName: storeName,
            address: address,
            phone: phone,
            email: email,
            logoUrl: logoUrl,
            receiptHeader: receiptHeader,
            receiptFooter: receiptFooter,
            receiptPaperSize: receiptPaperSize,
            useStock: useStock,
            allowNegativeStock: allowNegativeStock,
            defaultInterestRate: defaultInterestRate,
            defaultAdminFee: defaultAdminFee,
            currencySymbol: currencySymbol,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StoreSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StoreSettingsTable,
    StoreSettingData,
    $$StoreSettingsTableFilterComposer,
    $$StoreSettingsTableOrderingComposer,
    $$StoreSettingsTableAnnotationComposer,
    $$StoreSettingsTableCreateCompanionBuilder,
    $$StoreSettingsTableUpdateCompanionBuilder,
    (
      StoreSettingData,
      BaseReferences<_$AppDatabase, $StoreSettingsTable, StoreSettingData>
    ),
    StoreSettingData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$TransactionItemsTableTableManager get transactionItems =>
      $$TransactionItemsTableTableManager(_db, _db.transactionItems);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$StoreSettingsTableTableManager get storeSettings =>
      $$StoreSettingsTableTableManager(_db, _db.storeSettings);
}

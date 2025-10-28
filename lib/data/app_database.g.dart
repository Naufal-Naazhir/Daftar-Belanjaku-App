// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ShoppingListsTable extends ShoppingLists
    with TableInfo<$ShoppingListsTable, ShoppingList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_lists';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShoppingList> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingList(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $ShoppingListsTable createAlias(String alias) {
    return $ShoppingListsTable(attachedDatabase, alias);
  }
}

class ShoppingList extends DataClass implements Insertable<ShoppingList> {
  final int id;
  final String name;
  final int createdAt;
  final int updatedAt;
  const ShoppingList({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  ShoppingListsCompanion toCompanion(bool nullToAbsent) {
    return ShoppingListsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ShoppingList.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingList(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  ShoppingList copyWith({
    int? id,
    String? name,
    int? createdAt,
    int? updatedAt,
  }) => ShoppingList(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ShoppingList copyWithCompanion(ShoppingListsCompanion data) {
    return ShoppingList(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingList(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingList &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ShoppingListsCompanion extends UpdateCompanion<ShoppingList> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const ShoppingListsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ShoppingListsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int createdAt,
    required int updatedAt,
  }) : name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ShoppingList> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ShoppingListsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? createdAt,
    Value<int>? updatedAt,
  }) {
    return ShoppingListsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingListsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ShoppingItemsTable extends ShoppingItems
    with TableInfo<$ShoppingItemsTable, ShoppingItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _listIdMeta = const VerificationMeta('listId');
  @override
  late final GeneratedColumn<int> listId = GeneratedColumn<int>(
    'list_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shopping_lists (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isBoughtMeta = const VerificationMeta(
    'isBought',
  );
  @override
  late final GeneratedColumn<bool> isBought = GeneratedColumn<bool>(
    'is_bought',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_bought" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    listId,
    name,
    price,
    quantity,
    unit,
    isBought,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShoppingItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('list_id')) {
      context.handle(
        _listIdMeta,
        listId.isAcceptableOrUnknown(data['list_id']!, _listIdMeta),
      );
    } else if (isInserting) {
      context.missing(_listIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('is_bought')) {
      context.handle(
        _isBoughtMeta,
        isBought.isAcceptableOrUnknown(data['is_bought']!, _isBoughtMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      listId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}list_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      isBought:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_bought'],
          )!,
      orderIndex:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}order_index'],
          )!,
    );
  }

  @override
  $ShoppingItemsTable createAlias(String alias) {
    return $ShoppingItemsTable(attachedDatabase, alias);
  }
}

class ShoppingItem extends DataClass implements Insertable<ShoppingItem> {
  final int id;
  final int listId;
  final String name;
  final double? price;
  final double? quantity;
  final String? unit;
  final bool isBought;
  final int orderIndex;
  const ShoppingItem({
    required this.id,
    required this.listId,
    required this.name,
    this.price,
    this.quantity,
    this.unit,
    required this.isBought,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['list_id'] = Variable<int>(listId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    map['is_bought'] = Variable<bool>(isBought);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  ShoppingItemsCompanion toCompanion(bool nullToAbsent) {
    return ShoppingItemsCompanion(
      id: Value(id),
      listId: Value(listId),
      name: Value(name),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      quantity:
          quantity == null && nullToAbsent
              ? const Value.absent()
              : Value(quantity),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      isBought: Value(isBought),
      orderIndex: Value(orderIndex),
    );
  }

  factory ShoppingItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingItem(
      id: serializer.fromJson<int>(json['id']),
      listId: serializer.fromJson<int>(json['listId']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double?>(json['price']),
      quantity: serializer.fromJson<double?>(json['quantity']),
      unit: serializer.fromJson<String?>(json['unit']),
      isBought: serializer.fromJson<bool>(json['isBought']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'listId': serializer.toJson<int>(listId),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double?>(price),
      'quantity': serializer.toJson<double?>(quantity),
      'unit': serializer.toJson<String?>(unit),
      'isBought': serializer.toJson<bool>(isBought),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  ShoppingItem copyWith({
    int? id,
    int? listId,
    String? name,
    Value<double?> price = const Value.absent(),
    Value<double?> quantity = const Value.absent(),
    Value<String?> unit = const Value.absent(),
    bool? isBought,
    int? orderIndex,
  }) => ShoppingItem(
    id: id ?? this.id,
    listId: listId ?? this.listId,
    name: name ?? this.name,
    price: price.present ? price.value : this.price,
    quantity: quantity.present ? quantity.value : this.quantity,
    unit: unit.present ? unit.value : this.unit,
    isBought: isBought ?? this.isBought,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  ShoppingItem copyWithCompanion(ShoppingItemsCompanion data) {
    return ShoppingItem(
      id: data.id.present ? data.id.value : this.id,
      listId: data.listId.present ? data.listId.value : this.listId,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unit: data.unit.present ? data.unit.value : this.unit,
      isBought: data.isBought.present ? data.isBought.value : this.isBought,
      orderIndex:
          data.orderIndex.present ? data.orderIndex.value : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingItem(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('isBought: $isBought, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    listId,
    name,
    price,
    quantity,
    unit,
    isBought,
    orderIndex,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingItem &&
          other.id == this.id &&
          other.listId == this.listId &&
          other.name == this.name &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.unit == this.unit &&
          other.isBought == this.isBought &&
          other.orderIndex == this.orderIndex);
}

class ShoppingItemsCompanion extends UpdateCompanion<ShoppingItem> {
  final Value<int> id;
  final Value<int> listId;
  final Value<String> name;
  final Value<double?> price;
  final Value<double?> quantity;
  final Value<String?> unit;
  final Value<bool> isBought;
  final Value<int> orderIndex;
  const ShoppingItemsCompanion({
    this.id = const Value.absent(),
    this.listId = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.isBought = const Value.absent(),
    this.orderIndex = const Value.absent(),
  });
  ShoppingItemsCompanion.insert({
    this.id = const Value.absent(),
    required int listId,
    required String name,
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.isBought = const Value.absent(),
    this.orderIndex = const Value.absent(),
  }) : listId = Value(listId),
       name = Value(name);
  static Insertable<ShoppingItem> custom({
    Expression<int>? id,
    Expression<int>? listId,
    Expression<String>? name,
    Expression<double>? price,
    Expression<double>? quantity,
    Expression<String>? unit,
    Expression<bool>? isBought,
    Expression<int>? orderIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (listId != null) 'list_id': listId,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (unit != null) 'unit': unit,
      if (isBought != null) 'is_bought': isBought,
      if (orderIndex != null) 'order_index': orderIndex,
    });
  }

  ShoppingItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? listId,
    Value<String>? name,
    Value<double?>? price,
    Value<double?>? quantity,
    Value<String?>? unit,
    Value<bool>? isBought,
    Value<int>? orderIndex,
  }) {
    return ShoppingItemsCompanion(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      isBought: isBought ?? this.isBought,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (listId.present) {
      map['list_id'] = Variable<int>(listId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (isBought.present) {
      map['is_bought'] = Variable<bool>(isBought.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingItemsCompanion(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('isBought: $isBought, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }
}

class $ItemCategoriesTable extends ItemCategories
    with TableInfo<$ItemCategoriesTable, ItemCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemCategory(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  $ItemCategoriesTable createAlias(String alias) {
    return $ItemCategoriesTable(attachedDatabase, alias);
  }
}

class ItemCategory extends DataClass implements Insertable<ItemCategory> {
  final int id;
  final String name;
  const ItemCategory({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ItemCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ItemCategoriesCompanion(id: Value(id), name: Value(name));
  }

  factory ItemCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemCategory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  ItemCategory copyWith({int? id, String? name}) =>
      ItemCategory(id: id ?? this.id, name: name ?? this.name);
  ItemCategory copyWithCompanion(ItemCategoriesCompanion data) {
    return ItemCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemCategory(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemCategory && other.id == this.id && other.name == this.name);
}

class ItemCategoriesCompanion extends UpdateCompanion<ItemCategory> {
  final Value<int> id;
  final Value<String> name;
  const ItemCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ItemCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<ItemCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ItemCategoriesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ItemCategoriesCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PresetItemsTable extends PresetItems
    with TableInfo<$PresetItemsTable, PresetItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PresetItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES item_categories (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultPriceMeta = const VerificationMeta(
    'defaultPrice',
  );
  @override
  late final GeneratedColumn<double> defaultPrice = GeneratedColumn<double>(
    'default_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultQuantityMeta = const VerificationMeta(
    'defaultQuantity',
  );
  @override
  late final GeneratedColumn<double> defaultQuantity = GeneratedColumn<double>(
    'default_quantity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultUnitMeta = const VerificationMeta(
    'defaultUnit',
  );
  @override
  late final GeneratedColumn<String> defaultUnit = GeneratedColumn<String>(
    'default_unit',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categoryId,
    name,
    defaultPrice,
    defaultQuantity,
    defaultUnit,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preset_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PresetItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('default_price')) {
      context.handle(
        _defaultPriceMeta,
        defaultPrice.isAcceptableOrUnknown(
          data['default_price']!,
          _defaultPriceMeta,
        ),
      );
    }
    if (data.containsKey('default_quantity')) {
      context.handle(
        _defaultQuantityMeta,
        defaultQuantity.isAcceptableOrUnknown(
          data['default_quantity']!,
          _defaultQuantityMeta,
        ),
      );
    }
    if (data.containsKey('default_unit')) {
      context.handle(
        _defaultUnitMeta,
        defaultUnit.isAcceptableOrUnknown(
          data['default_unit']!,
          _defaultUnitMeta,
        ),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PresetItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PresetItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      categoryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}category_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      defaultPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}default_price'],
      ),
      defaultQuantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}default_quantity'],
      ),
      defaultUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_unit'],
      ),
      orderIndex:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}order_index'],
          )!,
    );
  }

  @override
  $PresetItemsTable createAlias(String alias) {
    return $PresetItemsTable(attachedDatabase, alias);
  }
}

class PresetItem extends DataClass implements Insertable<PresetItem> {
  final int id;
  final int categoryId;
  final String name;
  final double? defaultPrice;
  final double? defaultQuantity;
  final String? defaultUnit;
  final int orderIndex;
  const PresetItem({
    required this.id,
    required this.categoryId,
    required this.name,
    this.defaultPrice,
    this.defaultQuantity,
    this.defaultUnit,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || defaultPrice != null) {
      map['default_price'] = Variable<double>(defaultPrice);
    }
    if (!nullToAbsent || defaultQuantity != null) {
      map['default_quantity'] = Variable<double>(defaultQuantity);
    }
    if (!nullToAbsent || defaultUnit != null) {
      map['default_unit'] = Variable<String>(defaultUnit);
    }
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  PresetItemsCompanion toCompanion(bool nullToAbsent) {
    return PresetItemsCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      name: Value(name),
      defaultPrice:
          defaultPrice == null && nullToAbsent
              ? const Value.absent()
              : Value(defaultPrice),
      defaultQuantity:
          defaultQuantity == null && nullToAbsent
              ? const Value.absent()
              : Value(defaultQuantity),
      defaultUnit:
          defaultUnit == null && nullToAbsent
              ? const Value.absent()
              : Value(defaultUnit),
      orderIndex: Value(orderIndex),
    );
  }

  factory PresetItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PresetItem(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
      defaultPrice: serializer.fromJson<double?>(json['defaultPrice']),
      defaultQuantity: serializer.fromJson<double?>(json['defaultQuantity']),
      defaultUnit: serializer.fromJson<String?>(json['defaultUnit']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'name': serializer.toJson<String>(name),
      'defaultPrice': serializer.toJson<double?>(defaultPrice),
      'defaultQuantity': serializer.toJson<double?>(defaultQuantity),
      'defaultUnit': serializer.toJson<String?>(defaultUnit),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  PresetItem copyWith({
    int? id,
    int? categoryId,
    String? name,
    Value<double?> defaultPrice = const Value.absent(),
    Value<double?> defaultQuantity = const Value.absent(),
    Value<String?> defaultUnit = const Value.absent(),
    int? orderIndex,
  }) => PresetItem(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    name: name ?? this.name,
    defaultPrice: defaultPrice.present ? defaultPrice.value : this.defaultPrice,
    defaultQuantity:
        defaultQuantity.present ? defaultQuantity.value : this.defaultQuantity,
    defaultUnit: defaultUnit.present ? defaultUnit.value : this.defaultUnit,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  PresetItem copyWithCompanion(PresetItemsCompanion data) {
    return PresetItem(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      name: data.name.present ? data.name.value : this.name,
      defaultPrice:
          data.defaultPrice.present
              ? data.defaultPrice.value
              : this.defaultPrice,
      defaultQuantity:
          data.defaultQuantity.present
              ? data.defaultQuantity.value
              : this.defaultQuantity,
      defaultUnit:
          data.defaultUnit.present ? data.defaultUnit.value : this.defaultUnit,
      orderIndex:
          data.orderIndex.present ? data.orderIndex.value : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PresetItem(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('defaultPrice: $defaultPrice, ')
          ..write('defaultQuantity: $defaultQuantity, ')
          ..write('defaultUnit: $defaultUnit, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    categoryId,
    name,
    defaultPrice,
    defaultQuantity,
    defaultUnit,
    orderIndex,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PresetItem &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.defaultPrice == this.defaultPrice &&
          other.defaultQuantity == this.defaultQuantity &&
          other.defaultUnit == this.defaultUnit &&
          other.orderIndex == this.orderIndex);
}

class PresetItemsCompanion extends UpdateCompanion<PresetItem> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<String> name;
  final Value<double?> defaultPrice;
  final Value<double?> defaultQuantity;
  final Value<String?> defaultUnit;
  final Value<int> orderIndex;
  const PresetItemsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.defaultPrice = const Value.absent(),
    this.defaultQuantity = const Value.absent(),
    this.defaultUnit = const Value.absent(),
    this.orderIndex = const Value.absent(),
  });
  PresetItemsCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required String name,
    this.defaultPrice = const Value.absent(),
    this.defaultQuantity = const Value.absent(),
    this.defaultUnit = const Value.absent(),
    this.orderIndex = const Value.absent(),
  }) : categoryId = Value(categoryId),
       name = Value(name);
  static Insertable<PresetItem> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? name,
    Expression<double>? defaultPrice,
    Expression<double>? defaultQuantity,
    Expression<String>? defaultUnit,
    Expression<int>? orderIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (defaultPrice != null) 'default_price': defaultPrice,
      if (defaultQuantity != null) 'default_quantity': defaultQuantity,
      if (defaultUnit != null) 'default_unit': defaultUnit,
      if (orderIndex != null) 'order_index': orderIndex,
    });
  }

  PresetItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? categoryId,
    Value<String>? name,
    Value<double?>? defaultPrice,
    Value<double?>? defaultQuantity,
    Value<String?>? defaultUnit,
    Value<int>? orderIndex,
  }) {
    return PresetItemsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      defaultPrice: defaultPrice ?? this.defaultPrice,
      defaultQuantity: defaultQuantity ?? this.defaultQuantity,
      defaultUnit: defaultUnit ?? this.defaultUnit,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (defaultPrice.present) {
      map['default_price'] = Variable<double>(defaultPrice.value);
    }
    if (defaultQuantity.present) {
      map['default_quantity'] = Variable<double>(defaultQuantity.value);
    }
    if (defaultUnit.present) {
      map['default_unit'] = Variable<String>(defaultUnit.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PresetItemsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('defaultPrice: $defaultPrice, ')
          ..write('defaultQuantity: $defaultQuantity, ')
          ..write('defaultUnit: $defaultUnit, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }
}

class $PantryItemsTable extends PantryItems
    with TableInfo<$PantryItemsTable, PantryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PantryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _purchaseDateMeta = const VerificationMeta(
    'purchaseDate',
  );
  @override
  late final GeneratedColumn<int> purchaseDate = GeneratedColumn<int>(
    'purchase_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiryDateMeta = const VerificationMeta(
    'expiryDate',
  );
  @override
  late final GeneratedColumn<int> expiryDate = GeneratedColumn<int>(
    'expiry_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    quantity,
    unit,
    purchaseDate,
    expiryDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pantry_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PantryItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
        _purchaseDateMeta,
        purchaseDate.isAcceptableOrUnknown(
          data['purchase_date']!,
          _purchaseDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
        _expiryDateMeta,
        expiryDate.isAcceptableOrUnknown(data['expiry_date']!, _expiryDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PantryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PantryItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      purchaseDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}purchase_date'],
          )!,
      expiryDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}expiry_date'],
      ),
    );
  }

  @override
  $PantryItemsTable createAlias(String alias) {
    return $PantryItemsTable(attachedDatabase, alias);
  }
}

class PantryItem extends DataClass implements Insertable<PantryItem> {
  final int id;
  final String name;
  final double? quantity;
  final String? unit;
  final int purchaseDate;
  final int? expiryDate;
  const PantryItem({
    required this.id,
    required this.name,
    this.quantity,
    this.unit,
    required this.purchaseDate,
    this.expiryDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    map['purchase_date'] = Variable<int>(purchaseDate);
    if (!nullToAbsent || expiryDate != null) {
      map['expiry_date'] = Variable<int>(expiryDate);
    }
    return map;
  }

  PantryItemsCompanion toCompanion(bool nullToAbsent) {
    return PantryItemsCompanion(
      id: Value(id),
      name: Value(name),
      quantity:
          quantity == null && nullToAbsent
              ? const Value.absent()
              : Value(quantity),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      purchaseDate: Value(purchaseDate),
      expiryDate:
          expiryDate == null && nullToAbsent
              ? const Value.absent()
              : Value(expiryDate),
    );
  }

  factory PantryItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PantryItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<double?>(json['quantity']),
      unit: serializer.fromJson<String?>(json['unit']),
      purchaseDate: serializer.fromJson<int>(json['purchaseDate']),
      expiryDate: serializer.fromJson<int?>(json['expiryDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<double?>(quantity),
      'unit': serializer.toJson<String?>(unit),
      'purchaseDate': serializer.toJson<int>(purchaseDate),
      'expiryDate': serializer.toJson<int?>(expiryDate),
    };
  }

  PantryItem copyWith({
    int? id,
    String? name,
    Value<double?> quantity = const Value.absent(),
    Value<String?> unit = const Value.absent(),
    int? purchaseDate,
    Value<int?> expiryDate = const Value.absent(),
  }) => PantryItem(
    id: id ?? this.id,
    name: name ?? this.name,
    quantity: quantity.present ? quantity.value : this.quantity,
    unit: unit.present ? unit.value : this.unit,
    purchaseDate: purchaseDate ?? this.purchaseDate,
    expiryDate: expiryDate.present ? expiryDate.value : this.expiryDate,
  );
  PantryItem copyWithCompanion(PantryItemsCompanion data) {
    return PantryItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unit: data.unit.present ? data.unit.value : this.unit,
      purchaseDate:
          data.purchaseDate.present
              ? data.purchaseDate.value
              : this.purchaseDate,
      expiryDate:
          data.expiryDate.present ? data.expiryDate.value : this.expiryDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PantryItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('expiryDate: $expiryDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, quantity, unit, purchaseDate, expiryDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PantryItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.unit == this.unit &&
          other.purchaseDate == this.purchaseDate &&
          other.expiryDate == this.expiryDate);
}

class PantryItemsCompanion extends UpdateCompanion<PantryItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<double?> quantity;
  final Value<String?> unit;
  final Value<int> purchaseDate;
  final Value<int?> expiryDate;
  const PantryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.expiryDate = const Value.absent(),
  });
  PantryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    required int purchaseDate,
    this.expiryDate = const Value.absent(),
  }) : name = Value(name),
       purchaseDate = Value(purchaseDate);
  static Insertable<PantryItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? quantity,
    Expression<String>? unit,
    Expression<int>? purchaseDate,
    Expression<int>? expiryDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (unit != null) 'unit': unit,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (expiryDate != null) 'expiry_date': expiryDate,
    });
  }

  PantryItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double?>? quantity,
    Value<String?>? unit,
    Value<int>? purchaseDate,
    Value<int?>? expiryDate,
  }) {
    return PantryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<int>(purchaseDate.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<int>(expiryDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PantryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('expiryDate: $expiryDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ShoppingListsTable shoppingLists = $ShoppingListsTable(this);
  late final $ShoppingItemsTable shoppingItems = $ShoppingItemsTable(this);
  late final $ItemCategoriesTable itemCategories = $ItemCategoriesTable(this);
  late final $PresetItemsTable presetItems = $PresetItemsTable(this);
  late final $PantryItemsTable pantryItems = $PantryItemsTable(this);
  late final ShoppingListsDao shoppingListsDao = ShoppingListsDao(
    this as AppDatabase,
  );
  late final ShoppingItemsDao shoppingItemsDao = ShoppingItemsDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    shoppingLists,
    shoppingItems,
    itemCategories,
    presetItems,
    pantryItems,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'shopping_lists',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('shopping_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'item_categories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('preset_items', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$ShoppingListsTableCreateCompanionBuilder =
    ShoppingListsCompanion Function({
      Value<int> id,
      required String name,
      required int createdAt,
      required int updatedAt,
    });
typedef $$ShoppingListsTableUpdateCompanionBuilder =
    ShoppingListsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> createdAt,
      Value<int> updatedAt,
    });

final class $$ShoppingListsTableReferences
    extends BaseReferences<_$AppDatabase, $ShoppingListsTable, ShoppingList> {
  $$ShoppingListsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ShoppingItemsTable, List<ShoppingItem>>
  _shoppingItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.shoppingItems,
    aliasName: $_aliasNameGenerator(
      db.shoppingLists.id,
      db.shoppingItems.listId,
    ),
  );

  $$ShoppingItemsTableProcessedTableManager get shoppingItemsRefs {
    final manager = $$ShoppingItemsTableTableManager(
      $_db,
      $_db.shoppingItems,
    ).filter((f) => f.listId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shoppingItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShoppingListsTableFilterComposer
    extends Composer<_$AppDatabase, $ShoppingListsTable> {
  $$ShoppingListsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> shoppingItemsRefs(
    Expression<bool> Function($$ShoppingItemsTableFilterComposer f) f,
  ) {
    final $$ShoppingItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shoppingItems,
      getReferencedColumn: (t) => t.listId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShoppingItemsTableFilterComposer(
            $db: $db,
            $table: $db.shoppingItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShoppingListsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShoppingListsTable> {
  $$ShoppingListsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShoppingListsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShoppingListsTable> {
  $$ShoppingListsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> shoppingItemsRefs<T extends Object>(
    Expression<T> Function($$ShoppingItemsTableAnnotationComposer a) f,
  ) {
    final $$ShoppingItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shoppingItems,
      getReferencedColumn: (t) => t.listId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShoppingItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.shoppingItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShoppingListsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShoppingListsTable,
          ShoppingList,
          $$ShoppingListsTableFilterComposer,
          $$ShoppingListsTableOrderingComposer,
          $$ShoppingListsTableAnnotationComposer,
          $$ShoppingListsTableCreateCompanionBuilder,
          $$ShoppingListsTableUpdateCompanionBuilder,
          (ShoppingList, $$ShoppingListsTableReferences),
          ShoppingList,
          PrefetchHooks Function({bool shoppingItemsRefs})
        > {
  $$ShoppingListsTableTableManager(_$AppDatabase db, $ShoppingListsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ShoppingListsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ShoppingListsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ShoppingListsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => ShoppingListsCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int createdAt,
                required int updatedAt,
              }) => ShoppingListsCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ShoppingListsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({shoppingItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (shoppingItemsRefs) db.shoppingItems,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (shoppingItemsRefs)
                    await $_getPrefetchedData<
                      ShoppingList,
                      $ShoppingListsTable,
                      ShoppingItem
                    >(
                      currentTable: table,
                      referencedTable: $$ShoppingListsTableReferences
                          ._shoppingItemsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ShoppingListsTableReferences(
                                db,
                                table,
                                p0,
                              ).shoppingItemsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.listId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ShoppingListsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShoppingListsTable,
      ShoppingList,
      $$ShoppingListsTableFilterComposer,
      $$ShoppingListsTableOrderingComposer,
      $$ShoppingListsTableAnnotationComposer,
      $$ShoppingListsTableCreateCompanionBuilder,
      $$ShoppingListsTableUpdateCompanionBuilder,
      (ShoppingList, $$ShoppingListsTableReferences),
      ShoppingList,
      PrefetchHooks Function({bool shoppingItemsRefs})
    >;
typedef $$ShoppingItemsTableCreateCompanionBuilder =
    ShoppingItemsCompanion Function({
      Value<int> id,
      required int listId,
      required String name,
      Value<double?> price,
      Value<double?> quantity,
      Value<String?> unit,
      Value<bool> isBought,
      Value<int> orderIndex,
    });
typedef $$ShoppingItemsTableUpdateCompanionBuilder =
    ShoppingItemsCompanion Function({
      Value<int> id,
      Value<int> listId,
      Value<String> name,
      Value<double?> price,
      Value<double?> quantity,
      Value<String?> unit,
      Value<bool> isBought,
      Value<int> orderIndex,
    });

final class $$ShoppingItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ShoppingItemsTable, ShoppingItem> {
  $$ShoppingItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShoppingListsTable _listIdTable(_$AppDatabase db) =>
      db.shoppingLists.createAlias(
        $_aliasNameGenerator(db.shoppingItems.listId, db.shoppingLists.id),
      );

  $$ShoppingListsTableProcessedTableManager get listId {
    final $_column = $_itemColumn<int>('list_id')!;

    final manager = $$ShoppingListsTableTableManager(
      $_db,
      $_db.shoppingLists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_listIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShoppingItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ShoppingItemsTable> {
  $$ShoppingItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBought => $composableBuilder(
    column: $table.isBought,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$ShoppingListsTableFilterComposer get listId {
    final $$ShoppingListsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.listId,
      referencedTable: $db.shoppingLists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShoppingListsTableFilterComposer(
            $db: $db,
            $table: $db.shoppingLists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShoppingItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShoppingItemsTable> {
  $$ShoppingItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBought => $composableBuilder(
    column: $table.isBought,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShoppingListsTableOrderingComposer get listId {
    final $$ShoppingListsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.listId,
      referencedTable: $db.shoppingLists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShoppingListsTableOrderingComposer(
            $db: $db,
            $table: $db.shoppingLists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShoppingItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShoppingItemsTable> {
  $$ShoppingItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<bool> get isBought =>
      $composableBuilder(column: $table.isBought, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$ShoppingListsTableAnnotationComposer get listId {
    final $$ShoppingListsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.listId,
      referencedTable: $db.shoppingLists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShoppingListsTableAnnotationComposer(
            $db: $db,
            $table: $db.shoppingLists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShoppingItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShoppingItemsTable,
          ShoppingItem,
          $$ShoppingItemsTableFilterComposer,
          $$ShoppingItemsTableOrderingComposer,
          $$ShoppingItemsTableAnnotationComposer,
          $$ShoppingItemsTableCreateCompanionBuilder,
          $$ShoppingItemsTableUpdateCompanionBuilder,
          (ShoppingItem, $$ShoppingItemsTableReferences),
          ShoppingItem,
          PrefetchHooks Function({bool listId})
        > {
  $$ShoppingItemsTableTableManager(_$AppDatabase db, $ShoppingItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ShoppingItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ShoppingItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ShoppingItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> listId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double?> price = const Value.absent(),
                Value<double?> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<bool> isBought = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
              }) => ShoppingItemsCompanion(
                id: id,
                listId: listId,
                name: name,
                price: price,
                quantity: quantity,
                unit: unit,
                isBought: isBought,
                orderIndex: orderIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int listId,
                required String name,
                Value<double?> price = const Value.absent(),
                Value<double?> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<bool> isBought = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
              }) => ShoppingItemsCompanion.insert(
                id: id,
                listId: listId,
                name: name,
                price: price,
                quantity: quantity,
                unit: unit,
                isBought: isBought,
                orderIndex: orderIndex,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ShoppingItemsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({listId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (listId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.listId,
                            referencedTable: $$ShoppingItemsTableReferences
                                ._listIdTable(db),
                            referencedColumn:
                                $$ShoppingItemsTableReferences
                                    ._listIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShoppingItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShoppingItemsTable,
      ShoppingItem,
      $$ShoppingItemsTableFilterComposer,
      $$ShoppingItemsTableOrderingComposer,
      $$ShoppingItemsTableAnnotationComposer,
      $$ShoppingItemsTableCreateCompanionBuilder,
      $$ShoppingItemsTableUpdateCompanionBuilder,
      (ShoppingItem, $$ShoppingItemsTableReferences),
      ShoppingItem,
      PrefetchHooks Function({bool listId})
    >;
typedef $$ItemCategoriesTableCreateCompanionBuilder =
    ItemCategoriesCompanion Function({Value<int> id, required String name});
typedef $$ItemCategoriesTableUpdateCompanionBuilder =
    ItemCategoriesCompanion Function({Value<int> id, Value<String> name});

final class $$ItemCategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $ItemCategoriesTable, ItemCategory> {
  $$ItemCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$PresetItemsTable, List<PresetItem>>
  _presetItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.presetItems,
    aliasName: $_aliasNameGenerator(
      db.itemCategories.id,
      db.presetItems.categoryId,
    ),
  );

  $$PresetItemsTableProcessedTableManager get presetItemsRefs {
    final manager = $$PresetItemsTableTableManager(
      $_db,
      $_db.presetItems,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_presetItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ItemCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ItemCategoriesTable> {
  $$ItemCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> presetItemsRefs(
    Expression<bool> Function($$PresetItemsTableFilterComposer f) f,
  ) {
    final $$PresetItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.presetItems,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PresetItemsTableFilterComposer(
            $db: $db,
            $table: $db.presetItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ItemCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemCategoriesTable> {
  $$ItemCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemCategoriesTable> {
  $$ItemCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> presetItemsRefs<T extends Object>(
    Expression<T> Function($$PresetItemsTableAnnotationComposer a) f,
  ) {
    final $$PresetItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.presetItems,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PresetItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.presetItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ItemCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemCategoriesTable,
          ItemCategory,
          $$ItemCategoriesTableFilterComposer,
          $$ItemCategoriesTableOrderingComposer,
          $$ItemCategoriesTableAnnotationComposer,
          $$ItemCategoriesTableCreateCompanionBuilder,
          $$ItemCategoriesTableUpdateCompanionBuilder,
          (ItemCategory, $$ItemCategoriesTableReferences),
          ItemCategory,
          PrefetchHooks Function({bool presetItemsRefs})
        > {
  $$ItemCategoriesTableTableManager(
    _$AppDatabase db,
    $ItemCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ItemCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ItemCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ItemCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => ItemCategoriesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  ItemCategoriesCompanion.insert(id: id, name: name),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ItemCategoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({presetItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (presetItemsRefs) db.presetItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (presetItemsRefs)
                    await $_getPrefetchedData<
                      ItemCategory,
                      $ItemCategoriesTable,
                      PresetItem
                    >(
                      currentTable: table,
                      referencedTable: $$ItemCategoriesTableReferences
                          ._presetItemsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ItemCategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).presetItemsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.categoryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ItemCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemCategoriesTable,
      ItemCategory,
      $$ItemCategoriesTableFilterComposer,
      $$ItemCategoriesTableOrderingComposer,
      $$ItemCategoriesTableAnnotationComposer,
      $$ItemCategoriesTableCreateCompanionBuilder,
      $$ItemCategoriesTableUpdateCompanionBuilder,
      (ItemCategory, $$ItemCategoriesTableReferences),
      ItemCategory,
      PrefetchHooks Function({bool presetItemsRefs})
    >;
typedef $$PresetItemsTableCreateCompanionBuilder =
    PresetItemsCompanion Function({
      Value<int> id,
      required int categoryId,
      required String name,
      Value<double?> defaultPrice,
      Value<double?> defaultQuantity,
      Value<String?> defaultUnit,
      Value<int> orderIndex,
    });
typedef $$PresetItemsTableUpdateCompanionBuilder =
    PresetItemsCompanion Function({
      Value<int> id,
      Value<int> categoryId,
      Value<String> name,
      Value<double?> defaultPrice,
      Value<double?> defaultQuantity,
      Value<String?> defaultUnit,
      Value<int> orderIndex,
    });

final class $$PresetItemsTableReferences
    extends BaseReferences<_$AppDatabase, $PresetItemsTable, PresetItem> {
  $$PresetItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ItemCategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.itemCategories.createAlias(
        $_aliasNameGenerator(db.presetItems.categoryId, db.itemCategories.id),
      );

  $$ItemCategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$ItemCategoriesTableTableManager(
      $_db,
      $_db.itemCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PresetItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PresetItemsTable> {
  $$PresetItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get defaultPrice => $composableBuilder(
    column: $table.defaultPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get defaultQuantity => $composableBuilder(
    column: $table.defaultQuantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$ItemCategoriesTableFilterComposer get categoryId {
    final $$ItemCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.itemCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.itemCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PresetItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PresetItemsTable> {
  $$PresetItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get defaultPrice => $composableBuilder(
    column: $table.defaultPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get defaultQuantity => $composableBuilder(
    column: $table.defaultQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$ItemCategoriesTableOrderingComposer get categoryId {
    final $$ItemCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.itemCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.itemCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PresetItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PresetItemsTable> {
  $$PresetItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get defaultPrice => $composableBuilder(
    column: $table.defaultPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get defaultQuantity => $composableBuilder(
    column: $table.defaultQuantity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$ItemCategoriesTableAnnotationComposer get categoryId {
    final $$ItemCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.itemCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.itemCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PresetItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PresetItemsTable,
          PresetItem,
          $$PresetItemsTableFilterComposer,
          $$PresetItemsTableOrderingComposer,
          $$PresetItemsTableAnnotationComposer,
          $$PresetItemsTableCreateCompanionBuilder,
          $$PresetItemsTableUpdateCompanionBuilder,
          (PresetItem, $$PresetItemsTableReferences),
          PresetItem,
          PrefetchHooks Function({bool categoryId})
        > {
  $$PresetItemsTableTableManager(_$AppDatabase db, $PresetItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PresetItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PresetItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$PresetItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double?> defaultPrice = const Value.absent(),
                Value<double?> defaultQuantity = const Value.absent(),
                Value<String?> defaultUnit = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
              }) => PresetItemsCompanion(
                id: id,
                categoryId: categoryId,
                name: name,
                defaultPrice: defaultPrice,
                defaultQuantity: defaultQuantity,
                defaultUnit: defaultUnit,
                orderIndex: orderIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int categoryId,
                required String name,
                Value<double?> defaultPrice = const Value.absent(),
                Value<double?> defaultQuantity = const Value.absent(),
                Value<String?> defaultUnit = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
              }) => PresetItemsCompanion.insert(
                id: id,
                categoryId: categoryId,
                name: name,
                defaultPrice: defaultPrice,
                defaultQuantity: defaultQuantity,
                defaultUnit: defaultUnit,
                orderIndex: orderIndex,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$PresetItemsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (categoryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$PresetItemsTableReferences
                                ._categoryIdTable(db),
                            referencedColumn:
                                $$PresetItemsTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PresetItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PresetItemsTable,
      PresetItem,
      $$PresetItemsTableFilterComposer,
      $$PresetItemsTableOrderingComposer,
      $$PresetItemsTableAnnotationComposer,
      $$PresetItemsTableCreateCompanionBuilder,
      $$PresetItemsTableUpdateCompanionBuilder,
      (PresetItem, $$PresetItemsTableReferences),
      PresetItem,
      PrefetchHooks Function({bool categoryId})
    >;
typedef $$PantryItemsTableCreateCompanionBuilder =
    PantryItemsCompanion Function({
      Value<int> id,
      required String name,
      Value<double?> quantity,
      Value<String?> unit,
      required int purchaseDate,
      Value<int?> expiryDate,
    });
typedef $$PantryItemsTableUpdateCompanionBuilder =
    PantryItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double?> quantity,
      Value<String?> unit,
      Value<int> purchaseDate,
      Value<int?> expiryDate,
    });

class $$PantryItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PantryItemsTable> {
  $$PantryItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PantryItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PantryItemsTable> {
  $$PantryItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PantryItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PantryItemsTable> {
  $$PantryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => column,
  );
}

class $$PantryItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PantryItemsTable,
          PantryItem,
          $$PantryItemsTableFilterComposer,
          $$PantryItemsTableOrderingComposer,
          $$PantryItemsTableAnnotationComposer,
          $$PantryItemsTableCreateCompanionBuilder,
          $$PantryItemsTableUpdateCompanionBuilder,
          (
            PantryItem,
            BaseReferences<_$AppDatabase, $PantryItemsTable, PantryItem>,
          ),
          PantryItem,
          PrefetchHooks Function()
        > {
  $$PantryItemsTableTableManager(_$AppDatabase db, $PantryItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PantryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PantryItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$PantryItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double?> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<int> purchaseDate = const Value.absent(),
                Value<int?> expiryDate = const Value.absent(),
              }) => PantryItemsCompanion(
                id: id,
                name: name,
                quantity: quantity,
                unit: unit,
                purchaseDate: purchaseDate,
                expiryDate: expiryDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<double?> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                required int purchaseDate,
                Value<int?> expiryDate = const Value.absent(),
              }) => PantryItemsCompanion.insert(
                id: id,
                name: name,
                quantity: quantity,
                unit: unit,
                purchaseDate: purchaseDate,
                expiryDate: expiryDate,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PantryItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PantryItemsTable,
      PantryItem,
      $$PantryItemsTableFilterComposer,
      $$PantryItemsTableOrderingComposer,
      $$PantryItemsTableAnnotationComposer,
      $$PantryItemsTableCreateCompanionBuilder,
      $$PantryItemsTableUpdateCompanionBuilder,
      (
        PantryItem,
        BaseReferences<_$AppDatabase, $PantryItemsTable, PantryItem>,
      ),
      PantryItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ShoppingListsTableTableManager get shoppingLists =>
      $$ShoppingListsTableTableManager(_db, _db.shoppingLists);
  $$ShoppingItemsTableTableManager get shoppingItems =>
      $$ShoppingItemsTableTableManager(_db, _db.shoppingItems);
  $$ItemCategoriesTableTableManager get itemCategories =>
      $$ItemCategoriesTableTableManager(_db, _db.itemCategories);
  $$PresetItemsTableTableManager get presetItems =>
      $$PresetItemsTableTableManager(_db, _db.presetItems);
  $$PantryItemsTableTableManager get pantryItems =>
      $$PantryItemsTableTableManager(_db, _db.pantryItems);
}

mixin _$ShoppingListsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ShoppingListsTable get shoppingLists => attachedDatabase.shoppingLists;
  $ShoppingItemsTable get shoppingItems => attachedDatabase.shoppingItems;
}
mixin _$ShoppingItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ShoppingListsTable get shoppingLists => attachedDatabase.shoppingLists;
  $ShoppingItemsTable get shoppingItems => attachedDatabase.shoppingItems;
}

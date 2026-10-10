// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocalUnitsTable extends LocalUnits
    with TableInfo<$LocalUnitsTable, LocalUnitRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalUnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, isCustom];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_units';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalUnitRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalUnitRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalUnitRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
    );
  }

  @override
  $LocalUnitsTable createAlias(String alias) {
    return $LocalUnitsTable(attachedDatabase, alias);
  }
}

class LocalUnitRow extends DataClass implements Insertable<LocalUnitRow> {
  final String id;
  final String name;
  final bool isCustom;
  const LocalUnitRow({
    required this.id,
    required this.name,
    required this.isCustom,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['is_custom'] = Variable<bool>(isCustom);
    return map;
  }

  LocalUnitsCompanion toCompanion(bool nullToAbsent) {
    return LocalUnitsCompanion(
      id: Value(id),
      name: Value(name),
      isCustom: Value(isCustom),
    );
  }

  factory LocalUnitRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalUnitRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'isCustom': serializer.toJson<bool>(isCustom),
    };
  }

  LocalUnitRow copyWith({String? id, String? name, bool? isCustom}) =>
      LocalUnitRow(
        id: id ?? this.id,
        name: name ?? this.name,
        isCustom: isCustom ?? this.isCustom,
      );
  LocalUnitRow copyWithCompanion(LocalUnitsCompanion data) {
    return LocalUnitRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalUnitRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isCustom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalUnitRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.isCustom == this.isCustom);
}

class LocalUnitsCompanion extends UpdateCompanion<LocalUnitRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<bool> isCustom;
  final Value<int> rowid;
  const LocalUnitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalUnitsCompanion.insert({
    required String id,
    required String name,
    this.isCustom = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<LocalUnitRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<bool>? isCustom,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isCustom != null) 'is_custom': isCustom,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalUnitsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<bool>? isCustom,
    Value<int>? rowid,
  }) {
    return LocalUnitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isCustom: isCustom ?? this.isCustom,
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
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalUnitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCustom: $isCustom, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TransactionType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TransactionType>($TransactionsTable.$convertertype);
  static const VerificationMeta _amountFcfaMeta = const VerificationMeta(
    'amountFcfa',
  );
  @override
  late final GeneratedColumn<int> amountFcfa = GeneratedColumn<int>(
    'amount_fcfa',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES local_units (id)',
    ),
  );
  static const VerificationMeta _productMeta = const VerificationMeta(
    'product',
  );
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
    'product',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawTextMeta = const VerificationMeta(
    'rawText',
  );
  @override
  late final GeneratedColumn<String> rawText = GeneratedColumn<String>(
    'raw_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    amountFcfa,
    quantity,
    unitId,
    product,
    category,
    rawText,
    date,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount_fcfa')) {
      context.handle(
        _amountFcfaMeta,
        amountFcfa.isAcceptableOrUnknown(data['amount_fcfa']!, _amountFcfaMeta),
      );
    } else if (isInserting) {
      context.missing(_amountFcfaMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('product')) {
      context.handle(
        _productMeta,
        product.isAcceptableOrUnknown(data['product']!, _productMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('raw_text')) {
      context.handle(
        _rawTextMeta,
        rawText.isAcceptableOrUnknown(data['raw_text']!, _rawTextMeta),
      );
    } else if (isInserting) {
      context.missing(_rawTextMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: $TransactionsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      amountFcfa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_fcfa'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      ),
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      ),
      product: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      rawText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_text'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionType, String, String> $convertertype =
      const EnumNameConverter<TransactionType>(TransactionType.values);
}

class TransactionRow extends DataClass implements Insertable<TransactionRow> {
  final String id;
  final TransactionType type;
  final int amountFcfa;
  final double? quantity;
  final String? unitId;
  final String? product;
  final String? category;
  final String rawText;
  final DateTime date;
  const TransactionRow({
    required this.id,
    required this.type,
    required this.amountFcfa,
    this.quantity,
    this.unitId,
    this.product,
    this.category,
    required this.rawText,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['type'] = Variable<String>(
        $TransactionsTable.$convertertype.toSql(type),
      );
    }
    map['amount_fcfa'] = Variable<int>(amountFcfa);
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || unitId != null) {
      map['unit_id'] = Variable<String>(unitId);
    }
    if (!nullToAbsent || product != null) {
      map['product'] = Variable<String>(product);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['raw_text'] = Variable<String>(rawText);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      type: Value(type),
      amountFcfa: Value(amountFcfa),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      unitId: unitId == null && nullToAbsent
          ? const Value.absent()
          : Value(unitId),
      product: product == null && nullToAbsent
          ? const Value.absent()
          : Value(product),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      rawText: Value(rawText),
      date: Value(date),
    );
  }

  factory TransactionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRow(
      id: serializer.fromJson<String>(json['id']),
      type: $TransactionsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      amountFcfa: serializer.fromJson<int>(json['amountFcfa']),
      quantity: serializer.fromJson<double?>(json['quantity']),
      unitId: serializer.fromJson<String?>(json['unitId']),
      product: serializer.fromJson<String?>(json['product']),
      category: serializer.fromJson<String?>(json['category']),
      rawText: serializer.fromJson<String>(json['rawText']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(
        $TransactionsTable.$convertertype.toJson(type),
      ),
      'amountFcfa': serializer.toJson<int>(amountFcfa),
      'quantity': serializer.toJson<double?>(quantity),
      'unitId': serializer.toJson<String?>(unitId),
      'product': serializer.toJson<String?>(product),
      'category': serializer.toJson<String?>(category),
      'rawText': serializer.toJson<String>(rawText),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  TransactionRow copyWith({
    String? id,
    TransactionType? type,
    int? amountFcfa,
    Value<double?> quantity = const Value.absent(),
    Value<String?> unitId = const Value.absent(),
    Value<String?> product = const Value.absent(),
    Value<String?> category = const Value.absent(),
    String? rawText,
    DateTime? date,
  }) => TransactionRow(
    id: id ?? this.id,
    type: type ?? this.type,
    amountFcfa: amountFcfa ?? this.amountFcfa,
    quantity: quantity.present ? quantity.value : this.quantity,
    unitId: unitId.present ? unitId.value : this.unitId,
    product: product.present ? product.value : this.product,
    category: category.present ? category.value : this.category,
    rawText: rawText ?? this.rawText,
    date: date ?? this.date,
  );
  TransactionRow copyWithCompanion(TransactionsCompanion data) {
    return TransactionRow(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      amountFcfa: data.amountFcfa.present
          ? data.amountFcfa.value
          : this.amountFcfa,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      product: data.product.present ? data.product.value : this.product,
      category: data.category.present ? data.category.value : this.category,
      rawText: data.rawText.present ? data.rawText.value : this.rawText,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRow(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('amountFcfa: $amountFcfa, ')
          ..write('quantity: $quantity, ')
          ..write('unitId: $unitId, ')
          ..write('product: $product, ')
          ..write('category: $category, ')
          ..write('rawText: $rawText, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    amountFcfa,
    quantity,
    unitId,
    product,
    category,
    rawText,
    date,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRow &&
          other.id == this.id &&
          other.type == this.type &&
          other.amountFcfa == this.amountFcfa &&
          other.quantity == this.quantity &&
          other.unitId == this.unitId &&
          other.product == this.product &&
          other.category == this.category &&
          other.rawText == this.rawText &&
          other.date == this.date);
}

class TransactionsCompanion extends UpdateCompanion<TransactionRow> {
  final Value<String> id;
  final Value<TransactionType> type;
  final Value<int> amountFcfa;
  final Value<double?> quantity;
  final Value<String?> unitId;
  final Value<String?> product;
  final Value<String?> category;
  final Value<String> rawText;
  final Value<DateTime> date;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.amountFcfa = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitId = const Value.absent(),
    this.product = const Value.absent(),
    this.category = const Value.absent(),
    this.rawText = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required TransactionType type,
    required int amountFcfa,
    this.quantity = const Value.absent(),
    this.unitId = const Value.absent(),
    this.product = const Value.absent(),
    this.category = const Value.absent(),
    required String rawText,
    required DateTime date,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       amountFcfa = Value(amountFcfa),
       rawText = Value(rawText),
       date = Value(date);
  static Insertable<TransactionRow> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<int>? amountFcfa,
    Expression<double>? quantity,
    Expression<String>? unitId,
    Expression<String>? product,
    Expression<String>? category,
    Expression<String>? rawText,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (amountFcfa != null) 'amount_fcfa': amountFcfa,
      if (quantity != null) 'quantity': quantity,
      if (unitId != null) 'unit_id': unitId,
      if (product != null) 'product': product,
      if (category != null) 'category': category,
      if (rawText != null) 'raw_text': rawText,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? id,
    Value<TransactionType>? type,
    Value<int>? amountFcfa,
    Value<double?>? quantity,
    Value<String?>? unitId,
    Value<String?>? product,
    Value<String?>? category,
    Value<String>? rawText,
    Value<DateTime>? date,
    Value<int>? rowid,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      amountFcfa: amountFcfa ?? this.amountFcfa,
      quantity: quantity ?? this.quantity,
      unitId: unitId ?? this.unitId,
      product: product ?? this.product,
      category: category ?? this.category,
      rawText: rawText ?? this.rawText,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $TransactionsTable.$convertertype.toSql(type.value),
      );
    }
    if (amountFcfa.present) {
      map['amount_fcfa'] = Variable<int>(amountFcfa.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (rawText.present) {
      map['raw_text'] = Variable<String>(rawText.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
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
          ..write('type: $type, ')
          ..write('amountFcfa: $amountFcfa, ')
          ..write('quantity: $quantity, ')
          ..write('unitId: $unitId, ')
          ..write('product: $product, ')
          ..write('category: $category, ')
          ..write('rawText: $rawText, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CreditorNodesTable extends CreditorNodes
    with TableInfo<$CreditorNodesTable, CreditorNodeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreditorNodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supplierNameMeta = const VerificationMeta(
    'supplierName',
  );
  @override
  late final GeneratedColumn<String> supplierName = GeneratedColumn<String>(
    'supplier_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _balanceDueFcfaMeta = const VerificationMeta(
    'balanceDueFcfa',
  );
  @override
  late final GeneratedColumn<int> balanceDueFcfa = GeneratedColumn<int>(
    'balance_due_fcfa',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    supplierName,
    phone,
    balanceDueFcfa,
    dueDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'creditor_nodes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CreditorNodeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('supplier_name')) {
      context.handle(
        _supplierNameMeta,
        supplierName.isAcceptableOrUnknown(
          data['supplier_name']!,
          _supplierNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supplierNameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('balance_due_fcfa')) {
      context.handle(
        _balanceDueFcfaMeta,
        balanceDueFcfa.isAcceptableOrUnknown(
          data['balance_due_fcfa']!,
          _balanceDueFcfaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_balanceDueFcfaMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CreditorNodeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CreditorNodeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      supplierName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      balanceDueFcfa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}balance_due_fcfa'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
    );
  }

  @override
  $CreditorNodesTable createAlias(String alias) {
    return $CreditorNodesTable(attachedDatabase, alias);
  }
}

class CreditorNodeRow extends DataClass implements Insertable<CreditorNodeRow> {
  final String id;
  final String supplierName;
  final String? phone;
  final int balanceDueFcfa;
  final DateTime? dueDate;
  const CreditorNodeRow({
    required this.id,
    required this.supplierName,
    this.phone,
    required this.balanceDueFcfa,
    this.dueDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['supplier_name'] = Variable<String>(supplierName);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['balance_due_fcfa'] = Variable<int>(balanceDueFcfa);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    return map;
  }

  CreditorNodesCompanion toCompanion(bool nullToAbsent) {
    return CreditorNodesCompanion(
      id: Value(id),
      supplierName: Value(supplierName),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      balanceDueFcfa: Value(balanceDueFcfa),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
    );
  }

  factory CreditorNodeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CreditorNodeRow(
      id: serializer.fromJson<String>(json['id']),
      supplierName: serializer.fromJson<String>(json['supplierName']),
      phone: serializer.fromJson<String?>(json['phone']),
      balanceDueFcfa: serializer.fromJson<int>(json['balanceDueFcfa']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'supplierName': serializer.toJson<String>(supplierName),
      'phone': serializer.toJson<String?>(phone),
      'balanceDueFcfa': serializer.toJson<int>(balanceDueFcfa),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
    };
  }

  CreditorNodeRow copyWith({
    String? id,
    String? supplierName,
    Value<String?> phone = const Value.absent(),
    int? balanceDueFcfa,
    Value<DateTime?> dueDate = const Value.absent(),
  }) => CreditorNodeRow(
    id: id ?? this.id,
    supplierName: supplierName ?? this.supplierName,
    phone: phone.present ? phone.value : this.phone,
    balanceDueFcfa: balanceDueFcfa ?? this.balanceDueFcfa,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
  );
  CreditorNodeRow copyWithCompanion(CreditorNodesCompanion data) {
    return CreditorNodeRow(
      id: data.id.present ? data.id.value : this.id,
      supplierName: data.supplierName.present
          ? data.supplierName.value
          : this.supplierName,
      phone: data.phone.present ? data.phone.value : this.phone,
      balanceDueFcfa: data.balanceDueFcfa.present
          ? data.balanceDueFcfa.value
          : this.balanceDueFcfa,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CreditorNodeRow(')
          ..write('id: $id, ')
          ..write('supplierName: $supplierName, ')
          ..write('phone: $phone, ')
          ..write('balanceDueFcfa: $balanceDueFcfa, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, supplierName, phone, balanceDueFcfa, dueDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreditorNodeRow &&
          other.id == this.id &&
          other.supplierName == this.supplierName &&
          other.phone == this.phone &&
          other.balanceDueFcfa == this.balanceDueFcfa &&
          other.dueDate == this.dueDate);
}

class CreditorNodesCompanion extends UpdateCompanion<CreditorNodeRow> {
  final Value<String> id;
  final Value<String> supplierName;
  final Value<String?> phone;
  final Value<int> balanceDueFcfa;
  final Value<DateTime?> dueDate;
  final Value<int> rowid;
  const CreditorNodesCompanion({
    this.id = const Value.absent(),
    this.supplierName = const Value.absent(),
    this.phone = const Value.absent(),
    this.balanceDueFcfa = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CreditorNodesCompanion.insert({
    required String id,
    required String supplierName,
    this.phone = const Value.absent(),
    required int balanceDueFcfa,
    this.dueDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       supplierName = Value(supplierName),
       balanceDueFcfa = Value(balanceDueFcfa);
  static Insertable<CreditorNodeRow> custom({
    Expression<String>? id,
    Expression<String>? supplierName,
    Expression<String>? phone,
    Expression<int>? balanceDueFcfa,
    Expression<DateTime>? dueDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierName != null) 'supplier_name': supplierName,
      if (phone != null) 'phone': phone,
      if (balanceDueFcfa != null) 'balance_due_fcfa': balanceDueFcfa,
      if (dueDate != null) 'due_date': dueDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CreditorNodesCompanion copyWith({
    Value<String>? id,
    Value<String>? supplierName,
    Value<String?>? phone,
    Value<int>? balanceDueFcfa,
    Value<DateTime?>? dueDate,
    Value<int>? rowid,
  }) {
    return CreditorNodesCompanion(
      id: id ?? this.id,
      supplierName: supplierName ?? this.supplierName,
      phone: phone ?? this.phone,
      balanceDueFcfa: balanceDueFcfa ?? this.balanceDueFcfa,
      dueDate: dueDate ?? this.dueDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (supplierName.present) {
      map['supplier_name'] = Variable<String>(supplierName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (balanceDueFcfa.present) {
      map['balance_due_fcfa'] = Variable<int>(balanceDueFcfa.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreditorNodesCompanion(')
          ..write('id: $id, ')
          ..write('supplierName: $supplierName, ')
          ..write('phone: $phone, ')
          ..write('balanceDueFcfa: $balanceDueFcfa, ')
          ..write('dueDate: $dueDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaxNodesTable extends TaxNodes
    with TableInfo<$TaxNodesTable, TaxNodeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaxNodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rateBasisPointsMeta = const VerificationMeta(
    'rateBasisPoints',
  );
  @override
  late final GeneratedColumn<int> rateBasisPoints = GeneratedColumn<int>(
    'rate_basis_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _savedBalanceFcfaMeta = const VerificationMeta(
    'savedBalanceFcfa',
  );
  @override
  late final GeneratedColumn<int> savedBalanceFcfa = GeneratedColumn<int>(
    'saved_balance_fcfa',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, rateBasisPoints, savedBalanceFcfa];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tax_nodes';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaxNodeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('rate_basis_points')) {
      context.handle(
        _rateBasisPointsMeta,
        rateBasisPoints.isAcceptableOrUnknown(
          data['rate_basis_points']!,
          _rateBasisPointsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rateBasisPointsMeta);
    }
    if (data.containsKey('saved_balance_fcfa')) {
      context.handle(
        _savedBalanceFcfaMeta,
        savedBalanceFcfa.isAcceptableOrUnknown(
          data['saved_balance_fcfa']!,
          _savedBalanceFcfaMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaxNodeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaxNodeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      rateBasisPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rate_basis_points'],
      )!,
      savedBalanceFcfa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}saved_balance_fcfa'],
      )!,
    );
  }

  @override
  $TaxNodesTable createAlias(String alias) {
    return $TaxNodesTable(attachedDatabase, alias);
  }
}

class TaxNodeRow extends DataClass implements Insertable<TaxNodeRow> {
  final String id;
  final int rateBasisPoints;
  final int savedBalanceFcfa;
  const TaxNodeRow({
    required this.id,
    required this.rateBasisPoints,
    required this.savedBalanceFcfa,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['rate_basis_points'] = Variable<int>(rateBasisPoints);
    map['saved_balance_fcfa'] = Variable<int>(savedBalanceFcfa);
    return map;
  }

  TaxNodesCompanion toCompanion(bool nullToAbsent) {
    return TaxNodesCompanion(
      id: Value(id),
      rateBasisPoints: Value(rateBasisPoints),
      savedBalanceFcfa: Value(savedBalanceFcfa),
    );
  }

  factory TaxNodeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxNodeRow(
      id: serializer.fromJson<String>(json['id']),
      rateBasisPoints: serializer.fromJson<int>(json['rateBasisPoints']),
      savedBalanceFcfa: serializer.fromJson<int>(json['savedBalanceFcfa']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'rateBasisPoints': serializer.toJson<int>(rateBasisPoints),
      'savedBalanceFcfa': serializer.toJson<int>(savedBalanceFcfa),
    };
  }

  TaxNodeRow copyWith({
    String? id,
    int? rateBasisPoints,
    int? savedBalanceFcfa,
  }) => TaxNodeRow(
    id: id ?? this.id,
    rateBasisPoints: rateBasisPoints ?? this.rateBasisPoints,
    savedBalanceFcfa: savedBalanceFcfa ?? this.savedBalanceFcfa,
  );
  TaxNodeRow copyWithCompanion(TaxNodesCompanion data) {
    return TaxNodeRow(
      id: data.id.present ? data.id.value : this.id,
      rateBasisPoints: data.rateBasisPoints.present
          ? data.rateBasisPoints.value
          : this.rateBasisPoints,
      savedBalanceFcfa: data.savedBalanceFcfa.present
          ? data.savedBalanceFcfa.value
          : this.savedBalanceFcfa,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxNodeRow(')
          ..write('id: $id, ')
          ..write('rateBasisPoints: $rateBasisPoints, ')
          ..write('savedBalanceFcfa: $savedBalanceFcfa')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, rateBasisPoints, savedBalanceFcfa);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxNodeRow &&
          other.id == this.id &&
          other.rateBasisPoints == this.rateBasisPoints &&
          other.savedBalanceFcfa == this.savedBalanceFcfa);
}

class TaxNodesCompanion extends UpdateCompanion<TaxNodeRow> {
  final Value<String> id;
  final Value<int> rateBasisPoints;
  final Value<int> savedBalanceFcfa;
  final Value<int> rowid;
  const TaxNodesCompanion({
    this.id = const Value.absent(),
    this.rateBasisPoints = const Value.absent(),
    this.savedBalanceFcfa = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaxNodesCompanion.insert({
    required String id,
    required int rateBasisPoints,
    this.savedBalanceFcfa = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       rateBasisPoints = Value(rateBasisPoints);
  static Insertable<TaxNodeRow> custom({
    Expression<String>? id,
    Expression<int>? rateBasisPoints,
    Expression<int>? savedBalanceFcfa,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rateBasisPoints != null) 'rate_basis_points': rateBasisPoints,
      if (savedBalanceFcfa != null) 'saved_balance_fcfa': savedBalanceFcfa,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaxNodesCompanion copyWith({
    Value<String>? id,
    Value<int>? rateBasisPoints,
    Value<int>? savedBalanceFcfa,
    Value<int>? rowid,
  }) {
    return TaxNodesCompanion(
      id: id ?? this.id,
      rateBasisPoints: rateBasisPoints ?? this.rateBasisPoints,
      savedBalanceFcfa: savedBalanceFcfa ?? this.savedBalanceFcfa,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (rateBasisPoints.present) {
      map['rate_basis_points'] = Variable<int>(rateBasisPoints.value);
    }
    if (savedBalanceFcfa.present) {
      map['saved_balance_fcfa'] = Variable<int>(savedBalanceFcfa.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxNodesCompanion(')
          ..write('id: $id, ')
          ..write('rateBasisPoints: $rateBasisPoints, ')
          ..write('savedBalanceFcfa: $savedBalanceFcfa, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalUnitsTable localUnits = $LocalUnitsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $CreditorNodesTable creditorNodes = $CreditorNodesTable(this);
  late final $TaxNodesTable taxNodes = $TaxNodesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    localUnits,
    transactions,
    creditorNodes,
    taxNodes,
  ];
}

typedef $$LocalUnitsTableCreateCompanionBuilder = LocalUnitsCompanion Function({
  required String id,
  required String name,
  Value<bool> isCustom,
  Value<int> rowid,
});
typedef $$LocalUnitsTableUpdateCompanionBuilder = LocalUnitsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<bool> isCustom,
  Value<int> rowid,
});

final class $$LocalUnitsTableReferences
    extends BaseReferences<_$AppDatabase, $LocalUnitsTable, LocalUnitRow> {
  $$LocalUnitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsTable, List<TransactionRow>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: 'local_units__id__transactions__unit_id',
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.unitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LocalUnitsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalUnitsTable> {
  $$LocalUnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocalUnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalUnitsTable> {
  $$LocalUnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalUnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalUnitsTable> {
  $$LocalUnitsTableAnnotationComposer({
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

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocalUnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalUnitsTable,
          LocalUnitRow,
          $$LocalUnitsTableFilterComposer,
          $$LocalUnitsTableOrderingComposer,
          $$LocalUnitsTableAnnotationComposer,
          $$LocalUnitsTableCreateCompanionBuilder,
          $$LocalUnitsTableUpdateCompanionBuilder,
          (LocalUnitRow, $$LocalUnitsTableReferences),
          LocalUnitRow,
          PrefetchHooks Function({bool transactionsRefs})
        > {
  $$LocalUnitsTableTableManager(_$AppDatabase db, $LocalUnitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalUnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalUnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalUnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalUnitsCompanion(
                id: id,
                name: name,
                isCustom: isCustom,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<bool> isCustom = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalUnitsCompanion.insert(
                id: id,
                name: name,
                isCustom: isCustom,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LocalUnitsTable, LocalUnitRow>(table),
                  $$LocalUnitsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<
                      LocalUnitRow,
                      $LocalUnitsTable,
                      TransactionRow
                    >(
                      currentTable: table,
                      referencedTable: $$LocalUnitsTableReferences
                          ._transactionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LocalUnitsTableReferences(
                            db,
                            table,
                            p0,
                          ).transactionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.unitId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LocalUnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalUnitsTable,
      LocalUnitRow,
      $$LocalUnitsTableFilterComposer,
      $$LocalUnitsTableOrderingComposer,
      $$LocalUnitsTableAnnotationComposer,
      $$LocalUnitsTableCreateCompanionBuilder,
      $$LocalUnitsTableUpdateCompanionBuilder,
      (LocalUnitRow, $$LocalUnitsTableReferences),
      LocalUnitRow,
      PrefetchHooks Function({bool transactionsRefs})
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      required String id,
      required TransactionType type,
      required int amountFcfa,
      Value<double?> quantity,
      Value<String?> unitId,
      Value<String?> product,
      Value<String?> category,
      required String rawText,
      required DateTime date,
      Value<int> rowid,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> id,
      Value<TransactionType> type,
      Value<int> amountFcfa,
      Value<double?> quantity,
      Value<String?> unitId,
      Value<String?> product,
      Value<String?> category,
      Value<String> rawText,
      Value<DateTime> date,
      Value<int> rowid,
    });

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, TransactionRow> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LocalUnitsTable _unitIdTable(_$AppDatabase db) =>
      db.localUnits.createAlias('transactions__unit_id__local_units__id');

  $$LocalUnitsTableProcessedTableManager? get unitId {
    final $_column = $_itemColumn<String>('unit_id');
    if ($_column == null) return null;
    final manager = $$LocalUnitsTableTableManager(
      $_db,
      $_db.localUnits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

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
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TransactionType, TransactionType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get amountFcfa => $composableBuilder(
    column: $table.amountFcfa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawText => $composableBuilder(
    column: $table.rawText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  $$LocalUnitsTableFilterComposer get unitId {
    final $$LocalUnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.localUnits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalUnitsTableFilterComposer(
            $db: $db,
            $table: $db.localUnits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountFcfa => $composableBuilder(
    column: $table.amountFcfa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawText => $composableBuilder(
    column: $table.rawText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  $$LocalUnitsTableOrderingComposer get unitId {
    final $$LocalUnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.localUnits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalUnitsTableOrderingComposer(
            $db: $db,
            $table: $db.localUnits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  GeneratedColumnWithTypeConverter<TransactionType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get amountFcfa => $composableBuilder(
    column: $table.amountFcfa,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get rawText =>
      $composableBuilder(column: $table.rawText, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$LocalUnitsTableAnnotationComposer get unitId {
    final $$LocalUnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.localUnits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalUnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.localUnits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          TransactionRow,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (TransactionRow, $$TransactionsTableReferences),
          TransactionRow,
          PrefetchHooks Function({bool unitId})
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<TransactionType> type = const Value.absent(),
                Value<int> amountFcfa = const Value.absent(),
                Value<double?> quantity = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<String?> product = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String> rawText = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                type: type,
                amountFcfa: amountFcfa,
                quantity: quantity,
                unitId: unitId,
                product: product,
                category: category,
                rawText: rawText,
                date: date,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required TransactionType type,
                required int amountFcfa,
                Value<double?> quantity = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<String?> product = const Value.absent(),
                Value<String?> category = const Value.absent(),
                required String rawText,
                required DateTime date,
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                type: type,
                amountFcfa: amountFcfa,
                quantity: quantity,
                unitId: unitId,
                product: product,
                category: category,
                rawText: rawText,
                date: date,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TransactionsTable, TransactionRow>(table),
                  $$TransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                    if (unitId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.unitId,
                        referencedTable: $$TransactionsTableReferences
                            ._unitIdTable(db),
                        referencedColumn: $$TransactionsTableReferences
                            ._unitIdTable(db)
                            .id,
                      ) as T;
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

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      TransactionRow,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (TransactionRow, $$TransactionsTableReferences),
      TransactionRow,
      PrefetchHooks Function({bool unitId})
    >;
typedef $$CreditorNodesTableCreateCompanionBuilder =
    CreditorNodesCompanion Function({
      required String id,
      required String supplierName,
      Value<String?> phone,
      required int balanceDueFcfa,
      Value<DateTime?> dueDate,
      Value<int> rowid,
    });
typedef $$CreditorNodesTableUpdateCompanionBuilder =
    CreditorNodesCompanion Function({
      Value<String> id,
      Value<String> supplierName,
      Value<String?> phone,
      Value<int> balanceDueFcfa,
      Value<DateTime?> dueDate,
      Value<int> rowid,
    });

class $$CreditorNodesTableFilterComposer
    extends Composer<_$AppDatabase, $CreditorNodesTable> {
  $$CreditorNodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplierName => $composableBuilder(
    column: $table.supplierName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get balanceDueFcfa => $composableBuilder(
    column: $table.balanceDueFcfa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CreditorNodesTableOrderingComposer
    extends Composer<_$AppDatabase, $CreditorNodesTable> {
  $$CreditorNodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplierName => $composableBuilder(
    column: $table.supplierName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get balanceDueFcfa => $composableBuilder(
    column: $table.balanceDueFcfa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CreditorNodesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CreditorNodesTable> {
  $$CreditorNodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get supplierName => $composableBuilder(
    column: $table.supplierName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<int> get balanceDueFcfa => $composableBuilder(
    column: $table.balanceDueFcfa,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);
}

class $$CreditorNodesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CreditorNodesTable,
          CreditorNodeRow,
          $$CreditorNodesTableFilterComposer,
          $$CreditorNodesTableOrderingComposer,
          $$CreditorNodesTableAnnotationComposer,
          $$CreditorNodesTableCreateCompanionBuilder,
          $$CreditorNodesTableUpdateCompanionBuilder,
          (
            CreditorNodeRow,
            BaseReferences<_$AppDatabase, $CreditorNodesTable, CreditorNodeRow>,
          ),
          CreditorNodeRow,
          PrefetchHooks Function()
        > {
  $$CreditorNodesTableTableManager(_$AppDatabase db, $CreditorNodesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreditorNodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CreditorNodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CreditorNodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> supplierName = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<int> balanceDueFcfa = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CreditorNodesCompanion(
                id: id,
                supplierName: supplierName,
                phone: phone,
                balanceDueFcfa: balanceDueFcfa,
                dueDate: dueDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String supplierName,
                Value<String?> phone = const Value.absent(),
                required int balanceDueFcfa,
                Value<DateTime?> dueDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CreditorNodesCompanion.insert(
                id: id,
                supplierName: supplierName,
                phone: phone,
                balanceDueFcfa: balanceDueFcfa,
                dueDate: dueDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CreditorNodesTable, CreditorNodeRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $CreditorNodesTable,
                    CreditorNodeRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CreditorNodesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CreditorNodesTable,
      CreditorNodeRow,
      $$CreditorNodesTableFilterComposer,
      $$CreditorNodesTableOrderingComposer,
      $$CreditorNodesTableAnnotationComposer,
      $$CreditorNodesTableCreateCompanionBuilder,
      $$CreditorNodesTableUpdateCompanionBuilder,
      (
        CreditorNodeRow,
        BaseReferences<_$AppDatabase, $CreditorNodesTable, CreditorNodeRow>,
      ),
      CreditorNodeRow,
      PrefetchHooks Function()
    >;
typedef $$TaxNodesTableCreateCompanionBuilder = TaxNodesCompanion Function({
  required String id,
  required int rateBasisPoints,
  Value<int> savedBalanceFcfa,
  Value<int> rowid,
});
typedef $$TaxNodesTableUpdateCompanionBuilder = TaxNodesCompanion Function({
  Value<String> id,
  Value<int> rateBasisPoints,
  Value<int> savedBalanceFcfa,
  Value<int> rowid,
});

class $$TaxNodesTableFilterComposer
    extends Composer<_$AppDatabase, $TaxNodesTable> {
  $$TaxNodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rateBasisPoints => $composableBuilder(
    column: $table.rateBasisPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get savedBalanceFcfa => $composableBuilder(
    column: $table.savedBalanceFcfa,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TaxNodesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaxNodesTable> {
  $$TaxNodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rateBasisPoints => $composableBuilder(
    column: $table.rateBasisPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get savedBalanceFcfa => $composableBuilder(
    column: $table.savedBalanceFcfa,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaxNodesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaxNodesTable> {
  $$TaxNodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get rateBasisPoints => $composableBuilder(
    column: $table.rateBasisPoints,
    builder: (column) => column,
  );

  GeneratedColumn<int> get savedBalanceFcfa => $composableBuilder(
    column: $table.savedBalanceFcfa,
    builder: (column) => column,
  );
}

class $$TaxNodesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaxNodesTable,
          TaxNodeRow,
          $$TaxNodesTableFilterComposer,
          $$TaxNodesTableOrderingComposer,
          $$TaxNodesTableAnnotationComposer,
          $$TaxNodesTableCreateCompanionBuilder,
          $$TaxNodesTableUpdateCompanionBuilder,
          (
            TaxNodeRow,
            BaseReferences<_$AppDatabase, $TaxNodesTable, TaxNodeRow>,
          ),
          TaxNodeRow,
          PrefetchHooks Function()
        > {
  $$TaxNodesTableTableManager(_$AppDatabase db, $TaxNodesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaxNodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaxNodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaxNodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> rateBasisPoints = const Value.absent(),
                Value<int> savedBalanceFcfa = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaxNodesCompanion(
                id: id,
                rateBasisPoints: rateBasisPoints,
                savedBalanceFcfa: savedBalanceFcfa,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int rateBasisPoints,
                Value<int> savedBalanceFcfa = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaxNodesCompanion.insert(
                id: id,
                rateBasisPoints: rateBasisPoints,
                savedBalanceFcfa: savedBalanceFcfa,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TaxNodesTable, TaxNodeRow>(table),
                  BaseReferences<_$AppDatabase, $TaxNodesTable, TaxNodeRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TaxNodesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaxNodesTable,
      TaxNodeRow,
      $$TaxNodesTableFilterComposer,
      $$TaxNodesTableOrderingComposer,
      $$TaxNodesTableAnnotationComposer,
      $$TaxNodesTableCreateCompanionBuilder,
      $$TaxNodesTableUpdateCompanionBuilder,
      (TaxNodeRow, BaseReferences<_$AppDatabase, $TaxNodesTable, TaxNodeRow>),
      TaxNodeRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalUnitsTableTableManager get localUnits =>
      $$LocalUnitsTableTableManager(_db, _db.localUnits);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$CreditorNodesTableTableManager get creditorNodes =>
      $$CreditorNodesTableTableManager(_db, _db.creditorNodes);
  $$TaxNodesTableTableManager get taxNodes =>
      $$TaxNodesTableTableManager(_db, _db.taxNodes);
}

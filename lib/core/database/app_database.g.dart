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
  @override
  late final GeneratedColumnWithTypeConverter<TransactionCategory, String>
  category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(TransactionCategory.other.name),
  ).withConverter<TransactionCategory>($TransactionsTable.$convertercategory);
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
  static const VerificationMeta _taxSavedFcfaMeta = const VerificationMeta(
    'taxSavedFcfa',
  );
  @override
  late final GeneratedColumn<int> taxSavedFcfa = GeneratedColumn<int>(
    'tax_saved_fcfa',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
    taxSavedFcfa,
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
    if (data.containsKey('tax_saved_fcfa')) {
      context.handle(
        _taxSavedFcfaMeta,
        taxSavedFcfa.isAcceptableOrUnknown(
          data['tax_saved_fcfa']!,
          _taxSavedFcfaMeta,
        ),
      );
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
      category: $TransactionsTable.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
      rawText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_text'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      taxSavedFcfa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_saved_fcfa'],
      )!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionType, String, String> $convertertype =
      const EnumNameConverter<TransactionType>(TransactionType.values);
  static JsonTypeConverter2<TransactionCategory, String, String>
  $convertercategory = const EnumNameConverter<TransactionCategory>(
    TransactionCategory.values,
  );
}

class TransactionRow extends DataClass implements Insertable<TransactionRow> {
  final String id;
  final TransactionType type;
  final int amountFcfa;
  final double? quantity;
  final String? unitId;
  final String? product;
  final TransactionCategory category;
  final String rawText;
  final DateTime date;
  final int taxSavedFcfa;
  const TransactionRow({
    required this.id,
    required this.type,
    required this.amountFcfa,
    this.quantity,
    this.unitId,
    this.product,
    required this.category,
    required this.rawText,
    required this.date,
    required this.taxSavedFcfa,
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
    {
      map['category'] = Variable<String>(
        $TransactionsTable.$convertercategory.toSql(category),
      );
    }
    map['raw_text'] = Variable<String>(rawText);
    map['date'] = Variable<DateTime>(date);
    map['tax_saved_fcfa'] = Variable<int>(taxSavedFcfa);
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
      category: Value(category),
      rawText: Value(rawText),
      date: Value(date),
      taxSavedFcfa: Value(taxSavedFcfa),
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
      category: $TransactionsTable.$convertercategory.fromJson(
        serializer.fromJson<String>(json['category']),
      ),
      rawText: serializer.fromJson<String>(json['rawText']),
      date: serializer.fromJson<DateTime>(json['date']),
      taxSavedFcfa: serializer.fromJson<int>(json['taxSavedFcfa']),
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
      'category': serializer.toJson<String>(
        $TransactionsTable.$convertercategory.toJson(category),
      ),
      'rawText': serializer.toJson<String>(rawText),
      'date': serializer.toJson<DateTime>(date),
      'taxSavedFcfa': serializer.toJson<int>(taxSavedFcfa),
    };
  }

  TransactionRow copyWith({
    String? id,
    TransactionType? type,
    int? amountFcfa,
    Value<double?> quantity = const Value.absent(),
    Value<String?> unitId = const Value.absent(),
    Value<String?> product = const Value.absent(),
    TransactionCategory? category,
    String? rawText,
    DateTime? date,
    int? taxSavedFcfa,
  }) => TransactionRow(
    id: id ?? this.id,
    type: type ?? this.type,
    amountFcfa: amountFcfa ?? this.amountFcfa,
    quantity: quantity.present ? quantity.value : this.quantity,
    unitId: unitId.present ? unitId.value : this.unitId,
    product: product.present ? product.value : this.product,
    category: category ?? this.category,
    rawText: rawText ?? this.rawText,
    date: date ?? this.date,
    taxSavedFcfa: taxSavedFcfa ?? this.taxSavedFcfa,
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
      taxSavedFcfa: data.taxSavedFcfa.present
          ? data.taxSavedFcfa.value
          : this.taxSavedFcfa,
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
          ..write('date: $date, ')
          ..write('taxSavedFcfa: $taxSavedFcfa')
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
    taxSavedFcfa,
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
          other.date == this.date &&
          other.taxSavedFcfa == this.taxSavedFcfa);
}

class TransactionsCompanion extends UpdateCompanion<TransactionRow> {
  final Value<String> id;
  final Value<TransactionType> type;
  final Value<int> amountFcfa;
  final Value<double?> quantity;
  final Value<String?> unitId;
  final Value<String?> product;
  final Value<TransactionCategory> category;
  final Value<String> rawText;
  final Value<DateTime> date;
  final Value<int> taxSavedFcfa;
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
    this.taxSavedFcfa = const Value.absent(),
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
    this.taxSavedFcfa = const Value.absent(),
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
    Expression<int>? taxSavedFcfa,
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
      if (taxSavedFcfa != null) 'tax_saved_fcfa': taxSavedFcfa,
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
    Value<TransactionCategory>? category,
    Value<String>? rawText,
    Value<DateTime>? date,
    Value<int>? taxSavedFcfa,
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
      taxSavedFcfa: taxSavedFcfa ?? this.taxSavedFcfa,
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
      map['category'] = Variable<String>(
        $TransactionsTable.$convertercategory.toSql(category.value),
      );
    }
    if (rawText.present) {
      map['raw_text'] = Variable<String>(rawText.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (taxSavedFcfa.present) {
      map['tax_saved_fcfa'] = Variable<int>(taxSavedFcfa.value);
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
          ..write('taxSavedFcfa: $taxSavedFcfa, ')
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
  static const VerificationMeta _nextDueDateMeta = const VerificationMeta(
    'nextDueDate',
  );
  @override
  late final GeneratedColumn<DateTime> nextDueDate = GeneratedColumn<DateTime>(
    'next_due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    rateBasisPoints,
    savedBalanceFcfa,
    nextDueDate,
  ];
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
    if (data.containsKey('next_due_date')) {
      context.handle(
        _nextDueDateMeta,
        nextDueDate.isAcceptableOrUnknown(
          data['next_due_date']!,
          _nextDueDateMeta,
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
      nextDueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_due_date'],
      ),
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
  final DateTime? nextDueDate;
  const TaxNodeRow({
    required this.id,
    required this.rateBasisPoints,
    required this.savedBalanceFcfa,
    this.nextDueDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['rate_basis_points'] = Variable<int>(rateBasisPoints);
    map['saved_balance_fcfa'] = Variable<int>(savedBalanceFcfa);
    if (!nullToAbsent || nextDueDate != null) {
      map['next_due_date'] = Variable<DateTime>(nextDueDate);
    }
    return map;
  }

  TaxNodesCompanion toCompanion(bool nullToAbsent) {
    return TaxNodesCompanion(
      id: Value(id),
      rateBasisPoints: Value(rateBasisPoints),
      savedBalanceFcfa: Value(savedBalanceFcfa),
      nextDueDate: nextDueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextDueDate),
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
      nextDueDate: serializer.fromJson<DateTime?>(json['nextDueDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'rateBasisPoints': serializer.toJson<int>(rateBasisPoints),
      'savedBalanceFcfa': serializer.toJson<int>(savedBalanceFcfa),
      'nextDueDate': serializer.toJson<DateTime?>(nextDueDate),
    };
  }

  TaxNodeRow copyWith({
    String? id,
    int? rateBasisPoints,
    int? savedBalanceFcfa,
    Value<DateTime?> nextDueDate = const Value.absent(),
  }) => TaxNodeRow(
    id: id ?? this.id,
    rateBasisPoints: rateBasisPoints ?? this.rateBasisPoints,
    savedBalanceFcfa: savedBalanceFcfa ?? this.savedBalanceFcfa,
    nextDueDate: nextDueDate.present ? nextDueDate.value : this.nextDueDate,
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
      nextDueDate: data.nextDueDate.present
          ? data.nextDueDate.value
          : this.nextDueDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxNodeRow(')
          ..write('id: $id, ')
          ..write('rateBasisPoints: $rateBasisPoints, ')
          ..write('savedBalanceFcfa: $savedBalanceFcfa, ')
          ..write('nextDueDate: $nextDueDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, rateBasisPoints, savedBalanceFcfa, nextDueDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxNodeRow &&
          other.id == this.id &&
          other.rateBasisPoints == this.rateBasisPoints &&
          other.savedBalanceFcfa == this.savedBalanceFcfa &&
          other.nextDueDate == this.nextDueDate);
}

class TaxNodesCompanion extends UpdateCompanion<TaxNodeRow> {
  final Value<String> id;
  final Value<int> rateBasisPoints;
  final Value<int> savedBalanceFcfa;
  final Value<DateTime?> nextDueDate;
  final Value<int> rowid;
  const TaxNodesCompanion({
    this.id = const Value.absent(),
    this.rateBasisPoints = const Value.absent(),
    this.savedBalanceFcfa = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaxNodesCompanion.insert({
    required String id,
    required int rateBasisPoints,
    this.savedBalanceFcfa = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       rateBasisPoints = Value(rateBasisPoints);
  static Insertable<TaxNodeRow> custom({
    Expression<String>? id,
    Expression<int>? rateBasisPoints,
    Expression<int>? savedBalanceFcfa,
    Expression<DateTime>? nextDueDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rateBasisPoints != null) 'rate_basis_points': rateBasisPoints,
      if (savedBalanceFcfa != null) 'saved_balance_fcfa': savedBalanceFcfa,
      if (nextDueDate != null) 'next_due_date': nextDueDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaxNodesCompanion copyWith({
    Value<String>? id,
    Value<int>? rateBasisPoints,
    Value<int>? savedBalanceFcfa,
    Value<DateTime?>? nextDueDate,
    Value<int>? rowid,
  }) {
    return TaxNodesCompanion(
      id: id ?? this.id,
      rateBasisPoints: rateBasisPoints ?? this.rateBasisPoints,
      savedBalanceFcfa: savedBalanceFcfa ?? this.savedBalanceFcfa,
      nextDueDate: nextDueDate ?? this.nextDueDate,
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
    if (nextDueDate.present) {
      map['next_due_date'] = Variable<DateTime>(nextDueDate.value);
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
          ..write('nextDueDate: $nextDueDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CreditorPaymentsTable extends CreditorPayments
    with TableInfo<$CreditorPaymentsTable, CreditorPaymentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreditorPaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _creditorIdMeta = const VerificationMeta(
    'creditorId',
  );
  @override
  late final GeneratedColumn<String> creditorId = GeneratedColumn<String>(
    'creditor_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES creditor_nodes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
    'transaction_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _receiptNumberMeta = const VerificationMeta(
    'receiptNumber',
  );
  @override
  late final GeneratedColumn<String> receiptNumber = GeneratedColumn<String>(
    'receipt_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
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
  @override
  late final GeneratedColumnWithTypeConverter<PaymentMethod, String> method =
      GeneratedColumn<String>(
        'method',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<PaymentMethod>($CreditorPaymentsTable.$convertermethod);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _remainingAfterFcfaMeta =
      const VerificationMeta('remainingAfterFcfa');
  @override
  late final GeneratedColumn<int> remainingAfterFcfa = GeneratedColumn<int>(
    'remaining_after_fcfa',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _creditorNameMeta = const VerificationMeta(
    'creditorName',
  );
  @override
  late final GeneratedColumn<String> creditorName = GeneratedColumn<String>(
    'creditor_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _creditorPhoneMeta = const VerificationMeta(
    'creditorPhone',
  );
  @override
  late final GeneratedColumn<String> creditorPhone = GeneratedColumn<String>(
    'creditor_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    creditorId,
    transactionId,
    receiptNumber,
    amountFcfa,
    method,
    reason,
    date,
    remainingAfterFcfa,
    creditorName,
    creditorPhone,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'creditor_payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<CreditorPaymentRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('creditor_id')) {
      context.handle(
        _creditorIdMeta,
        creditorId.isAcceptableOrUnknown(data['creditor_id']!, _creditorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_creditorIdMeta);
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    }
    if (data.containsKey('receipt_number')) {
      context.handle(
        _receiptNumberMeta,
        receiptNumber.isAcceptableOrUnknown(
          data['receipt_number']!,
          _receiptNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_receiptNumberMeta);
    }
    if (data.containsKey('amount_fcfa')) {
      context.handle(
        _amountFcfaMeta,
        amountFcfa.isAcceptableOrUnknown(data['amount_fcfa']!, _amountFcfaMeta),
      );
    } else if (isInserting) {
      context.missing(_amountFcfaMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('remaining_after_fcfa')) {
      context.handle(
        _remainingAfterFcfaMeta,
        remainingAfterFcfa.isAcceptableOrUnknown(
          data['remaining_after_fcfa']!,
          _remainingAfterFcfaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remainingAfterFcfaMeta);
    }
    if (data.containsKey('creditor_name')) {
      context.handle(
        _creditorNameMeta,
        creditorName.isAcceptableOrUnknown(
          data['creditor_name']!,
          _creditorNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_creditorNameMeta);
    }
    if (data.containsKey('creditor_phone')) {
      context.handle(
        _creditorPhoneMeta,
        creditorPhone.isAcceptableOrUnknown(
          data['creditor_phone']!,
          _creditorPhoneMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CreditorPaymentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CreditorPaymentRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      creditorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creditor_id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transaction_id'],
      ),
      receiptNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_number'],
      )!,
      amountFcfa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_fcfa'],
      )!,
      method: $CreditorPaymentsTable.$convertermethod.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}method'],
        )!,
      ),
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      remainingAfterFcfa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remaining_after_fcfa'],
      )!,
      creditorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creditor_name'],
      )!,
      creditorPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creditor_phone'],
      ),
    );
  }

  @override
  $CreditorPaymentsTable createAlias(String alias) {
    return $CreditorPaymentsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PaymentMethod, String, String> $convertermethod =
      const EnumNameConverter<PaymentMethod>(PaymentMethod.values);
}

class CreditorPaymentRow extends DataClass
    implements Insertable<CreditorPaymentRow> {
  final String id;
  final String creditorId;
  final String? transactionId;
  final String receiptNumber;
  final int amountFcfa;
  final PaymentMethod method;
  final String? reason;
  final DateTime date;
  final int remainingAfterFcfa;
  final String creditorName;
  final String? creditorPhone;
  const CreditorPaymentRow({
    required this.id,
    required this.creditorId,
    this.transactionId,
    required this.receiptNumber,
    required this.amountFcfa,
    required this.method,
    this.reason,
    required this.date,
    required this.remainingAfterFcfa,
    required this.creditorName,
    this.creditorPhone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['creditor_id'] = Variable<String>(creditorId);
    if (!nullToAbsent || transactionId != null) {
      map['transaction_id'] = Variable<String>(transactionId);
    }
    map['receipt_number'] = Variable<String>(receiptNumber);
    map['amount_fcfa'] = Variable<int>(amountFcfa);
    {
      map['method'] = Variable<String>(
        $CreditorPaymentsTable.$convertermethod.toSql(method),
      );
    }
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    map['date'] = Variable<DateTime>(date);
    map['remaining_after_fcfa'] = Variable<int>(remainingAfterFcfa);
    map['creditor_name'] = Variable<String>(creditorName);
    if (!nullToAbsent || creditorPhone != null) {
      map['creditor_phone'] = Variable<String>(creditorPhone);
    }
    return map;
  }

  CreditorPaymentsCompanion toCompanion(bool nullToAbsent) {
    return CreditorPaymentsCompanion(
      id: Value(id),
      creditorId: Value(creditorId),
      transactionId: transactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionId),
      receiptNumber: Value(receiptNumber),
      amountFcfa: Value(amountFcfa),
      method: Value(method),
      reason: reason == null && nullToAbsent
          ? const Value.absent()
          : Value(reason),
      date: Value(date),
      remainingAfterFcfa: Value(remainingAfterFcfa),
      creditorName: Value(creditorName),
      creditorPhone: creditorPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(creditorPhone),
    );
  }

  factory CreditorPaymentRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CreditorPaymentRow(
      id: serializer.fromJson<String>(json['id']),
      creditorId: serializer.fromJson<String>(json['creditorId']),
      transactionId: serializer.fromJson<String?>(json['transactionId']),
      receiptNumber: serializer.fromJson<String>(json['receiptNumber']),
      amountFcfa: serializer.fromJson<int>(json['amountFcfa']),
      method: $CreditorPaymentsTable.$convertermethod.fromJson(
        serializer.fromJson<String>(json['method']),
      ),
      reason: serializer.fromJson<String?>(json['reason']),
      date: serializer.fromJson<DateTime>(json['date']),
      remainingAfterFcfa: serializer.fromJson<int>(json['remainingAfterFcfa']),
      creditorName: serializer.fromJson<String>(json['creditorName']),
      creditorPhone: serializer.fromJson<String?>(json['creditorPhone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'creditorId': serializer.toJson<String>(creditorId),
      'transactionId': serializer.toJson<String?>(transactionId),
      'receiptNumber': serializer.toJson<String>(receiptNumber),
      'amountFcfa': serializer.toJson<int>(amountFcfa),
      'method': serializer.toJson<String>(
        $CreditorPaymentsTable.$convertermethod.toJson(method),
      ),
      'reason': serializer.toJson<String?>(reason),
      'date': serializer.toJson<DateTime>(date),
      'remainingAfterFcfa': serializer.toJson<int>(remainingAfterFcfa),
      'creditorName': serializer.toJson<String>(creditorName),
      'creditorPhone': serializer.toJson<String?>(creditorPhone),
    };
  }

  CreditorPaymentRow copyWith({
    String? id,
    String? creditorId,
    Value<String?> transactionId = const Value.absent(),
    String? receiptNumber,
    int? amountFcfa,
    PaymentMethod? method,
    Value<String?> reason = const Value.absent(),
    DateTime? date,
    int? remainingAfterFcfa,
    String? creditorName,
    Value<String?> creditorPhone = const Value.absent(),
  }) => CreditorPaymentRow(
    id: id ?? this.id,
    creditorId: creditorId ?? this.creditorId,
    transactionId: transactionId.present
        ? transactionId.value
        : this.transactionId,
    receiptNumber: receiptNumber ?? this.receiptNumber,
    amountFcfa: amountFcfa ?? this.amountFcfa,
    method: method ?? this.method,
    reason: reason.present ? reason.value : this.reason,
    date: date ?? this.date,
    remainingAfterFcfa: remainingAfterFcfa ?? this.remainingAfterFcfa,
    creditorName: creditorName ?? this.creditorName,
    creditorPhone: creditorPhone.present
        ? creditorPhone.value
        : this.creditorPhone,
  );
  CreditorPaymentRow copyWithCompanion(CreditorPaymentsCompanion data) {
    return CreditorPaymentRow(
      id: data.id.present ? data.id.value : this.id,
      creditorId: data.creditorId.present
          ? data.creditorId.value
          : this.creditorId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      receiptNumber: data.receiptNumber.present
          ? data.receiptNumber.value
          : this.receiptNumber,
      amountFcfa: data.amountFcfa.present
          ? data.amountFcfa.value
          : this.amountFcfa,
      method: data.method.present ? data.method.value : this.method,
      reason: data.reason.present ? data.reason.value : this.reason,
      date: data.date.present ? data.date.value : this.date,
      remainingAfterFcfa: data.remainingAfterFcfa.present
          ? data.remainingAfterFcfa.value
          : this.remainingAfterFcfa,
      creditorName: data.creditorName.present
          ? data.creditorName.value
          : this.creditorName,
      creditorPhone: data.creditorPhone.present
          ? data.creditorPhone.value
          : this.creditorPhone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CreditorPaymentRow(')
          ..write('id: $id, ')
          ..write('creditorId: $creditorId, ')
          ..write('transactionId: $transactionId, ')
          ..write('receiptNumber: $receiptNumber, ')
          ..write('amountFcfa: $amountFcfa, ')
          ..write('method: $method, ')
          ..write('reason: $reason, ')
          ..write('date: $date, ')
          ..write('remainingAfterFcfa: $remainingAfterFcfa, ')
          ..write('creditorName: $creditorName, ')
          ..write('creditorPhone: $creditorPhone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    creditorId,
    transactionId,
    receiptNumber,
    amountFcfa,
    method,
    reason,
    date,
    remainingAfterFcfa,
    creditorName,
    creditorPhone,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreditorPaymentRow &&
          other.id == this.id &&
          other.creditorId == this.creditorId &&
          other.transactionId == this.transactionId &&
          other.receiptNumber == this.receiptNumber &&
          other.amountFcfa == this.amountFcfa &&
          other.method == this.method &&
          other.reason == this.reason &&
          other.date == this.date &&
          other.remainingAfterFcfa == this.remainingAfterFcfa &&
          other.creditorName == this.creditorName &&
          other.creditorPhone == this.creditorPhone);
}

class CreditorPaymentsCompanion extends UpdateCompanion<CreditorPaymentRow> {
  final Value<String> id;
  final Value<String> creditorId;
  final Value<String?> transactionId;
  final Value<String> receiptNumber;
  final Value<int> amountFcfa;
  final Value<PaymentMethod> method;
  final Value<String?> reason;
  final Value<DateTime> date;
  final Value<int> remainingAfterFcfa;
  final Value<String> creditorName;
  final Value<String?> creditorPhone;
  final Value<int> rowid;
  const CreditorPaymentsCompanion({
    this.id = const Value.absent(),
    this.creditorId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.receiptNumber = const Value.absent(),
    this.amountFcfa = const Value.absent(),
    this.method = const Value.absent(),
    this.reason = const Value.absent(),
    this.date = const Value.absent(),
    this.remainingAfterFcfa = const Value.absent(),
    this.creditorName = const Value.absent(),
    this.creditorPhone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CreditorPaymentsCompanion.insert({
    required String id,
    required String creditorId,
    this.transactionId = const Value.absent(),
    required String receiptNumber,
    required int amountFcfa,
    required PaymentMethod method,
    this.reason = const Value.absent(),
    required DateTime date,
    required int remainingAfterFcfa,
    required String creditorName,
    this.creditorPhone = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       creditorId = Value(creditorId),
       receiptNumber = Value(receiptNumber),
       amountFcfa = Value(amountFcfa),
       method = Value(method),
       date = Value(date),
       remainingAfterFcfa = Value(remainingAfterFcfa),
       creditorName = Value(creditorName);
  static Insertable<CreditorPaymentRow> custom({
    Expression<String>? id,
    Expression<String>? creditorId,
    Expression<String>? transactionId,
    Expression<String>? receiptNumber,
    Expression<int>? amountFcfa,
    Expression<String>? method,
    Expression<String>? reason,
    Expression<DateTime>? date,
    Expression<int>? remainingAfterFcfa,
    Expression<String>? creditorName,
    Expression<String>? creditorPhone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (creditorId != null) 'creditor_id': creditorId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (receiptNumber != null) 'receipt_number': receiptNumber,
      if (amountFcfa != null) 'amount_fcfa': amountFcfa,
      if (method != null) 'method': method,
      if (reason != null) 'reason': reason,
      if (date != null) 'date': date,
      if (remainingAfterFcfa != null)
        'remaining_after_fcfa': remainingAfterFcfa,
      if (creditorName != null) 'creditor_name': creditorName,
      if (creditorPhone != null) 'creditor_phone': creditorPhone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CreditorPaymentsCompanion copyWith({
    Value<String>? id,
    Value<String>? creditorId,
    Value<String?>? transactionId,
    Value<String>? receiptNumber,
    Value<int>? amountFcfa,
    Value<PaymentMethod>? method,
    Value<String?>? reason,
    Value<DateTime>? date,
    Value<int>? remainingAfterFcfa,
    Value<String>? creditorName,
    Value<String?>? creditorPhone,
    Value<int>? rowid,
  }) {
    return CreditorPaymentsCompanion(
      id: id ?? this.id,
      creditorId: creditorId ?? this.creditorId,
      transactionId: transactionId ?? this.transactionId,
      receiptNumber: receiptNumber ?? this.receiptNumber,
      amountFcfa: amountFcfa ?? this.amountFcfa,
      method: method ?? this.method,
      reason: reason ?? this.reason,
      date: date ?? this.date,
      remainingAfterFcfa: remainingAfterFcfa ?? this.remainingAfterFcfa,
      creditorName: creditorName ?? this.creditorName,
      creditorPhone: creditorPhone ?? this.creditorPhone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (creditorId.present) {
      map['creditor_id'] = Variable<String>(creditorId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (receiptNumber.present) {
      map['receipt_number'] = Variable<String>(receiptNumber.value);
    }
    if (amountFcfa.present) {
      map['amount_fcfa'] = Variable<int>(amountFcfa.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(
        $CreditorPaymentsTable.$convertermethod.toSql(method.value),
      );
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (remainingAfterFcfa.present) {
      map['remaining_after_fcfa'] = Variable<int>(remainingAfterFcfa.value);
    }
    if (creditorName.present) {
      map['creditor_name'] = Variable<String>(creditorName.value);
    }
    if (creditorPhone.present) {
      map['creditor_phone'] = Variable<String>(creditorPhone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreditorPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('creditorId: $creditorId, ')
          ..write('transactionId: $transactionId, ')
          ..write('receiptNumber: $receiptNumber, ')
          ..write('amountFcfa: $amountFcfa, ')
          ..write('method: $method, ')
          ..write('reason: $reason, ')
          ..write('date: $date, ')
          ..write('remainingAfterFcfa: $remainingAfterFcfa, ')
          ..write('creditorName: $creditorName, ')
          ..write('creditorPhone: $creditorPhone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReceiptSequencesTable extends ReceiptSequences
    with TableInfo<$ReceiptSequencesTable, ReceiptSequenceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReceiptSequencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastNumberMeta = const VerificationMeta(
    'lastNumber',
  );
  @override
  late final GeneratedColumn<int> lastNumber = GeneratedColumn<int>(
    'last_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [year, lastNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipt_sequences';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReceiptSequenceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('last_number')) {
      context.handle(
        _lastNumberMeta,
        lastNumber.isAcceptableOrUnknown(data['last_number']!, _lastNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {year};
  @override
  ReceiptSequenceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReceiptSequenceRow(
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      lastNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_number'],
      )!,
    );
  }

  @override
  $ReceiptSequencesTable createAlias(String alias) {
    return $ReceiptSequencesTable(attachedDatabase, alias);
  }
}

class ReceiptSequenceRow extends DataClass
    implements Insertable<ReceiptSequenceRow> {
  final int year;
  final int lastNumber;
  const ReceiptSequenceRow({required this.year, required this.lastNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['year'] = Variable<int>(year);
    map['last_number'] = Variable<int>(lastNumber);
    return map;
  }

  ReceiptSequencesCompanion toCompanion(bool nullToAbsent) {
    return ReceiptSequencesCompanion(
      year: Value(year),
      lastNumber: Value(lastNumber),
    );
  }

  factory ReceiptSequenceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReceiptSequenceRow(
      year: serializer.fromJson<int>(json['year']),
      lastNumber: serializer.fromJson<int>(json['lastNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'year': serializer.toJson<int>(year),
      'lastNumber': serializer.toJson<int>(lastNumber),
    };
  }

  ReceiptSequenceRow copyWith({int? year, int? lastNumber}) =>
      ReceiptSequenceRow(
        year: year ?? this.year,
        lastNumber: lastNumber ?? this.lastNumber,
      );
  ReceiptSequenceRow copyWithCompanion(ReceiptSequencesCompanion data) {
    return ReceiptSequenceRow(
      year: data.year.present ? data.year.value : this.year,
      lastNumber: data.lastNumber.present
          ? data.lastNumber.value
          : this.lastNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptSequenceRow(')
          ..write('year: $year, ')
          ..write('lastNumber: $lastNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(year, lastNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReceiptSequenceRow &&
          other.year == this.year &&
          other.lastNumber == this.lastNumber);
}

class ReceiptSequencesCompanion extends UpdateCompanion<ReceiptSequenceRow> {
  final Value<int> year;
  final Value<int> lastNumber;
  const ReceiptSequencesCompanion({
    this.year = const Value.absent(),
    this.lastNumber = const Value.absent(),
  });
  ReceiptSequencesCompanion.insert({
    this.year = const Value.absent(),
    required int lastNumber,
  }) : lastNumber = Value(lastNumber);
  static Insertable<ReceiptSequenceRow> custom({
    Expression<int>? year,
    Expression<int>? lastNumber,
  }) {
    return RawValuesInsertable({
      if (year != null) 'year': year,
      if (lastNumber != null) 'last_number': lastNumber,
    });
  }

  ReceiptSequencesCompanion copyWith({
    Value<int>? year,
    Value<int>? lastNumber,
  }) {
    return ReceiptSequencesCompanion(
      year: year ?? this.year,
      lastNumber: lastNumber ?? this.lastNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (lastNumber.present) {
      map['last_number'] = Variable<int>(lastNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptSequencesCompanion(')
          ..write('year: $year, ')
          ..write('lastNumber: $lastNumber')
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
  late final $CreditorPaymentsTable creditorPayments = $CreditorPaymentsTable(
    this,
  );
  late final $ReceiptSequencesTable receiptSequences = $ReceiptSequencesTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    localUnits,
    transactions,
    creditorNodes,
    taxNodes,
    creditorPayments,
    receiptSequences,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'creditor_nodes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('creditor_payments', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'transactions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('creditor_payments', kind: UpdateKind.update)],
    ),
  ]);
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
      Value<TransactionCategory> category,
      required String rawText,
      required DateTime date,
      Value<int> taxSavedFcfa,
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
      Value<TransactionCategory> category,
      Value<String> rawText,
      Value<DateTime> date,
      Value<int> taxSavedFcfa,
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

  static MultiTypedResultKey<$CreditorPaymentsTable, List<CreditorPaymentRow>>
  _creditorPaymentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.creditorPayments,
    aliasName: 'transactions__id__creditor_payments__transaction_id',
  );

  $$CreditorPaymentsTableProcessedTableManager get creditorPaymentsRefs {
    final manager = $$CreditorPaymentsTableTableManager(
      $_db,
      $_db.creditorPayments,
    ).filter((f) => f.transactionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _creditorPaymentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  ColumnWithTypeConverterFilters<
    TransactionCategory,
    TransactionCategory,
    String
  >
  get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get rawText => $composableBuilder(
    column: $table.rawText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxSavedFcfa => $composableBuilder(
    column: $table.taxSavedFcfa,
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

  Expression<bool> creditorPaymentsRefs(
    Expression<bool> Function($$CreditorPaymentsTableFilterComposer f) f,
  ) {
    final $$CreditorPaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.creditorPayments,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditorPaymentsTableFilterComposer(
            $db: $db,
            $table: $db.creditorPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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

  ColumnOrderings<int> get taxSavedFcfa => $composableBuilder(
    column: $table.taxSavedFcfa,
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

  GeneratedColumnWithTypeConverter<TransactionCategory, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get rawText =>
      $composableBuilder(column: $table.rawText, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get taxSavedFcfa => $composableBuilder(
    column: $table.taxSavedFcfa,
    builder: (column) => column,
  );

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

  Expression<T> creditorPaymentsRefs<T extends Object>(
    Expression<T> Function($$CreditorPaymentsTableAnnotationComposer a) f,
  ) {
    final $$CreditorPaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.creditorPayments,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditorPaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.creditorPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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
          PrefetchHooks Function({bool unitId, bool creditorPaymentsRefs})
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
                Value<TransactionCategory> category = const Value.absent(),
                Value<String> rawText = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> taxSavedFcfa = const Value.absent(),
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
                taxSavedFcfa: taxSavedFcfa,
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
                Value<TransactionCategory> category = const Value.absent(),
                required String rawText,
                required DateTime date,
                Value<int> taxSavedFcfa = const Value.absent(),
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
                taxSavedFcfa: taxSavedFcfa,
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
          prefetchHooksCallback:
              ({unitId = false, creditorPaymentsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (creditorPaymentsRefs) db.creditorPayments,
                  ],
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
                    return [
                      if (creditorPaymentsRefs)
                        await $_getPrefetchedData<
                          TransactionRow,
                          $TransactionsTable,
                          CreditorPaymentRow
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._creditorPaymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).creditorPaymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.id,
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
      PrefetchHooks Function({bool unitId, bool creditorPaymentsRefs})
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

final class $$CreditorNodesTableReferences
    extends
        BaseReferences<_$AppDatabase, $CreditorNodesTable, CreditorNodeRow> {
  $$CreditorNodesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$CreditorPaymentsTable, List<CreditorPaymentRow>>
  _creditorPaymentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.creditorPayments,
    aliasName: 'creditor_nodes__id__creditor_payments__creditor_id',
  );

  $$CreditorPaymentsTableProcessedTableManager get creditorPaymentsRefs {
    final manager = $$CreditorPaymentsTableTableManager(
      $_db,
      $_db.creditorPayments,
    ).filter((f) => f.creditorId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _creditorPaymentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> creditorPaymentsRefs(
    Expression<bool> Function($$CreditorPaymentsTableFilterComposer f) f,
  ) {
    final $$CreditorPaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.creditorPayments,
      getReferencedColumn: (t) => t.creditorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditorPaymentsTableFilterComposer(
            $db: $db,
            $table: $db.creditorPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> creditorPaymentsRefs<T extends Object>(
    Expression<T> Function($$CreditorPaymentsTableAnnotationComposer a) f,
  ) {
    final $$CreditorPaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.creditorPayments,
      getReferencedColumn: (t) => t.creditorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditorPaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.creditorPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (CreditorNodeRow, $$CreditorNodesTableReferences),
          CreditorNodeRow,
          PrefetchHooks Function({bool creditorPaymentsRefs})
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
                  $$CreditorNodesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({creditorPaymentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (creditorPaymentsRefs) db.creditorPayments,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (creditorPaymentsRefs)
                    await $_getPrefetchedData<
                      CreditorNodeRow,
                      $CreditorNodesTable,
                      CreditorPaymentRow
                    >(
                      currentTable: table,
                      referencedTable: $$CreditorNodesTableReferences
                          ._creditorPaymentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CreditorNodesTableReferences(
                            db,
                            table,
                            p0,
                          ).creditorPaymentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.creditorId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (CreditorNodeRow, $$CreditorNodesTableReferences),
      CreditorNodeRow,
      PrefetchHooks Function({bool creditorPaymentsRefs})
    >;
typedef $$TaxNodesTableCreateCompanionBuilder = TaxNodesCompanion Function({
  required String id,
  required int rateBasisPoints,
  Value<int> savedBalanceFcfa,
  Value<DateTime?> nextDueDate,
  Value<int> rowid,
});
typedef $$TaxNodesTableUpdateCompanionBuilder = TaxNodesCompanion Function({
  Value<String> id,
  Value<int> rateBasisPoints,
  Value<int> savedBalanceFcfa,
  Value<DateTime?> nextDueDate,
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

  ColumnFilters<DateTime> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
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

  ColumnOrderings<DateTime> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
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

  GeneratedColumn<DateTime> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
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
                Value<DateTime?> nextDueDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaxNodesCompanion(
                id: id,
                rateBasisPoints: rateBasisPoints,
                savedBalanceFcfa: savedBalanceFcfa,
                nextDueDate: nextDueDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int rateBasisPoints,
                Value<int> savedBalanceFcfa = const Value.absent(),
                Value<DateTime?> nextDueDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaxNodesCompanion.insert(
                id: id,
                rateBasisPoints: rateBasisPoints,
                savedBalanceFcfa: savedBalanceFcfa,
                nextDueDate: nextDueDate,
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
typedef $$CreditorPaymentsTableCreateCompanionBuilder =
    CreditorPaymentsCompanion Function({
      required String id,
      required String creditorId,
      Value<String?> transactionId,
      required String receiptNumber,
      required int amountFcfa,
      required PaymentMethod method,
      Value<String?> reason,
      required DateTime date,
      required int remainingAfterFcfa,
      required String creditorName,
      Value<String?> creditorPhone,
      Value<int> rowid,
    });
typedef $$CreditorPaymentsTableUpdateCompanionBuilder =
    CreditorPaymentsCompanion Function({
      Value<String> id,
      Value<String> creditorId,
      Value<String?> transactionId,
      Value<String> receiptNumber,
      Value<int> amountFcfa,
      Value<PaymentMethod> method,
      Value<String?> reason,
      Value<DateTime> date,
      Value<int> remainingAfterFcfa,
      Value<String> creditorName,
      Value<String?> creditorPhone,
      Value<int> rowid,
    });

final class $$CreditorPaymentsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CreditorPaymentsTable,
          CreditorPaymentRow
        > {
  $$CreditorPaymentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CreditorNodesTable _creditorIdTable(_$AppDatabase db) => db
      .creditorNodes
      .createAlias('creditor_payments__creditor_id__creditor_nodes__id');

  $$CreditorNodesTableProcessedTableManager get creditorId {
    final $_column = $_itemColumn<String>('creditor_id')!;

    final manager = $$CreditorNodesTableTableManager(
      $_db,
      $_db.creditorNodes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_creditorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) => db
      .transactions
      .createAlias('creditor_payments__transaction_id__transactions__id');

  $$TransactionsTableProcessedTableManager? get transactionId {
    final $_column = $_itemColumn<String>('transaction_id');
    if ($_column == null) return null;
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CreditorPaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $CreditorPaymentsTable> {
  $$CreditorPaymentsTableFilterComposer({
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

  ColumnFilters<String> get receiptNumber => $composableBuilder(
    column: $table.receiptNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountFcfa => $composableBuilder(
    column: $table.amountFcfa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PaymentMethod, PaymentMethod, String>
  get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remainingAfterFcfa => $composableBuilder(
    column: $table.remainingAfterFcfa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get creditorName => $composableBuilder(
    column: $table.creditorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get creditorPhone => $composableBuilder(
    column: $table.creditorPhone,
    builder: (column) => ColumnFilters(column),
  );

  $$CreditorNodesTableFilterComposer get creditorId {
    final $$CreditorNodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.creditorId,
      referencedTable: $db.creditorNodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditorNodesTableFilterComposer(
            $db: $db,
            $table: $db.creditorNodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$CreditorPaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $CreditorPaymentsTable> {
  $$CreditorPaymentsTableOrderingComposer({
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

  ColumnOrderings<String> get receiptNumber => $composableBuilder(
    column: $table.receiptNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountFcfa => $composableBuilder(
    column: $table.amountFcfa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remainingAfterFcfa => $composableBuilder(
    column: $table.remainingAfterFcfa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get creditorName => $composableBuilder(
    column: $table.creditorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get creditorPhone => $composableBuilder(
    column: $table.creditorPhone,
    builder: (column) => ColumnOrderings(column),
  );

  $$CreditorNodesTableOrderingComposer get creditorId {
    final $$CreditorNodesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.creditorId,
      referencedTable: $db.creditorNodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditorNodesTableOrderingComposer(
            $db: $db,
            $table: $db.creditorNodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CreditorPaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CreditorPaymentsTable> {
  $$CreditorPaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get receiptNumber => $composableBuilder(
    column: $table.receiptNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amountFcfa => $composableBuilder(
    column: $table.amountFcfa,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<PaymentMethod, String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get remainingAfterFcfa => $composableBuilder(
    column: $table.remainingAfterFcfa,
    builder: (column) => column,
  );

  GeneratedColumn<String> get creditorName => $composableBuilder(
    column: $table.creditorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get creditorPhone => $composableBuilder(
    column: $table.creditorPhone,
    builder: (column) => column,
  );

  $$CreditorNodesTableAnnotationComposer get creditorId {
    final $$CreditorNodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.creditorId,
      referencedTable: $db.creditorNodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditorNodesTableAnnotationComposer(
            $db: $db,
            $table: $db.creditorNodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$CreditorPaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CreditorPaymentsTable,
          CreditorPaymentRow,
          $$CreditorPaymentsTableFilterComposer,
          $$CreditorPaymentsTableOrderingComposer,
          $$CreditorPaymentsTableAnnotationComposer,
          $$CreditorPaymentsTableCreateCompanionBuilder,
          $$CreditorPaymentsTableUpdateCompanionBuilder,
          (CreditorPaymentRow, $$CreditorPaymentsTableReferences),
          CreditorPaymentRow,
          PrefetchHooks Function({bool creditorId, bool transactionId})
        > {
  $$CreditorPaymentsTableTableManager(
    _$AppDatabase db,
    $CreditorPaymentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreditorPaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CreditorPaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CreditorPaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> creditorId = const Value.absent(),
                Value<String?> transactionId = const Value.absent(),
                Value<String> receiptNumber = const Value.absent(),
                Value<int> amountFcfa = const Value.absent(),
                Value<PaymentMethod> method = const Value.absent(),
                Value<String?> reason = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> remainingAfterFcfa = const Value.absent(),
                Value<String> creditorName = const Value.absent(),
                Value<String?> creditorPhone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CreditorPaymentsCompanion(
                id: id,
                creditorId: creditorId,
                transactionId: transactionId,
                receiptNumber: receiptNumber,
                amountFcfa: amountFcfa,
                method: method,
                reason: reason,
                date: date,
                remainingAfterFcfa: remainingAfterFcfa,
                creditorName: creditorName,
                creditorPhone: creditorPhone,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String creditorId,
                Value<String?> transactionId = const Value.absent(),
                required String receiptNumber,
                required int amountFcfa,
                required PaymentMethod method,
                Value<String?> reason = const Value.absent(),
                required DateTime date,
                required int remainingAfterFcfa,
                required String creditorName,
                Value<String?> creditorPhone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CreditorPaymentsCompanion.insert(
                id: id,
                creditorId: creditorId,
                transactionId: transactionId,
                receiptNumber: receiptNumber,
                amountFcfa: amountFcfa,
                method: method,
                reason: reason,
                date: date,
                remainingAfterFcfa: remainingAfterFcfa,
                creditorName: creditorName,
                creditorPhone: creditorPhone,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CreditorPaymentsTable, CreditorPaymentRow>(
                    table,
                  ),
                  $$CreditorPaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({creditorId = false, transactionId = false}) {
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
                    if (creditorId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.creditorId,
                        referencedTable: $$CreditorPaymentsTableReferences
                            ._creditorIdTable(db),
                        referencedColumn: $$CreditorPaymentsTableReferences
                            ._creditorIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (transactionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.transactionId,
                        referencedTable: $$CreditorPaymentsTableReferences
                            ._transactionIdTable(db),
                        referencedColumn: $$CreditorPaymentsTableReferences
                            ._transactionIdTable(db)
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

typedef $$CreditorPaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CreditorPaymentsTable,
      CreditorPaymentRow,
      $$CreditorPaymentsTableFilterComposer,
      $$CreditorPaymentsTableOrderingComposer,
      $$CreditorPaymentsTableAnnotationComposer,
      $$CreditorPaymentsTableCreateCompanionBuilder,
      $$CreditorPaymentsTableUpdateCompanionBuilder,
      (CreditorPaymentRow, $$CreditorPaymentsTableReferences),
      CreditorPaymentRow,
      PrefetchHooks Function({bool creditorId, bool transactionId})
    >;
typedef $$ReceiptSequencesTableCreateCompanionBuilder =
    ReceiptSequencesCompanion Function({
      Value<int> year,
      required int lastNumber,
    });
typedef $$ReceiptSequencesTableUpdateCompanionBuilder =
    ReceiptSequencesCompanion Function({
      Value<int> year,
      Value<int> lastNumber,
    });

class $$ReceiptSequencesTableFilterComposer
    extends Composer<_$AppDatabase, $ReceiptSequencesTable> {
  $$ReceiptSequencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastNumber => $composableBuilder(
    column: $table.lastNumber,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReceiptSequencesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReceiptSequencesTable> {
  $$ReceiptSequencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastNumber => $composableBuilder(
    column: $table.lastNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReceiptSequencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReceiptSequencesTable> {
  $$ReceiptSequencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get lastNumber => $composableBuilder(
    column: $table.lastNumber,
    builder: (column) => column,
  );
}

class $$ReceiptSequencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReceiptSequencesTable,
          ReceiptSequenceRow,
          $$ReceiptSequencesTableFilterComposer,
          $$ReceiptSequencesTableOrderingComposer,
          $$ReceiptSequencesTableAnnotationComposer,
          $$ReceiptSequencesTableCreateCompanionBuilder,
          $$ReceiptSequencesTableUpdateCompanionBuilder,
          (
            ReceiptSequenceRow,
            BaseReferences<
              _$AppDatabase,
              $ReceiptSequencesTable,
              ReceiptSequenceRow
            >,
          ),
          ReceiptSequenceRow,
          PrefetchHooks Function()
        > {
  $$ReceiptSequencesTableTableManager(
    _$AppDatabase db,
    $ReceiptSequencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReceiptSequencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReceiptSequencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReceiptSequencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> year = const Value.absent(),
            Value<int> lastNumber = const Value.absent(),
          }) => ReceiptSequencesCompanion(year: year, lastNumber: lastNumber),
          createCompanionCallback:
              ({
                Value<int> year = const Value.absent(),
                required int lastNumber,
              }) => ReceiptSequencesCompanion.insert(
                year: year,
                lastNumber: lastNumber,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ReceiptSequencesTable, ReceiptSequenceRow>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $ReceiptSequencesTable,
                    ReceiptSequenceRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReceiptSequencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReceiptSequencesTable,
      ReceiptSequenceRow,
      $$ReceiptSequencesTableFilterComposer,
      $$ReceiptSequencesTableOrderingComposer,
      $$ReceiptSequencesTableAnnotationComposer,
      $$ReceiptSequencesTableCreateCompanionBuilder,
      $$ReceiptSequencesTableUpdateCompanionBuilder,
      (
        ReceiptSequenceRow,
        BaseReferences<
          _$AppDatabase,
          $ReceiptSequencesTable,
          ReceiptSequenceRow
        >,
      ),
      ReceiptSequenceRow,
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
  $$CreditorPaymentsTableTableManager get creditorPayments =>
      $$CreditorPaymentsTableTableManager(_db, _db.creditorPayments);
  $$ReceiptSequencesTableTableManager get receiptSequences =>
      $$ReceiptSequencesTableTableManager(_db, _db.receiptSequences);
}

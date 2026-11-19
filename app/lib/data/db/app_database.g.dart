// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BusinessesTable extends Businesses
    with TableInfo<$BusinessesTable, Business> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tinMeta = const VerificationMeta('tin');
  @override
  late final GeneratedColumn<String> tin = GeneratedColumn<String>(
    'tin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoPathMeta = const VerificationMeta(
    'logoPath',
  );
  @override
  late final GeneratedColumn<String> logoPath = GeneratedColumn<String>(
    'logo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('GHS'),
  );
  static const VerificationMeta _defaultTaxRateIdMeta = const VerificationMeta(
    'defaultTaxRateId',
  );
  @override
  late final GeneratedColumn<int> defaultTaxRateId = GeneratedColumn<int>(
    'default_tax_rate_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    name,
    phone,
    email,
    address,
    tin,
    logoPath,
    currency,
    defaultTaxRateId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'businesses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Business> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
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
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('tin')) {
      context.handle(
        _tinMeta,
        tin.isAcceptableOrUnknown(data['tin']!, _tinMeta),
      );
    }
    if (data.containsKey('logo_path')) {
      context.handle(
        _logoPathMeta,
        logoPath.isAcceptableOrUnknown(data['logo_path']!, _logoPathMeta),
      );
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('default_tax_rate_id')) {
      context.handle(
        _defaultTaxRateIdMeta,
        defaultTaxRateId.isAcceptableOrUnknown(
          data['default_tax_rate_id']!,
          _defaultTaxRateIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Business map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Business(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      tin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tin'],
      ),
      logoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_path'],
      ),
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      defaultTaxRateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_tax_rate_id'],
      ),
    );
  }

  @override
  $BusinessesTable createAlias(String alias) {
    return $BusinessesTable(attachedDatabase, alias);
  }
}

class Business extends DataClass implements Insertable<Business> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final String? tin;
  final String? logoPath;
  final String currency;
  final int? defaultTaxRateId;
  const Business({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    this.tin,
    this.logoPath,
    required this.currency,
    this.defaultTaxRateId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
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
    if (!nullToAbsent || tin != null) {
      map['tin'] = Variable<String>(tin);
    }
    if (!nullToAbsent || logoPath != null) {
      map['logo_path'] = Variable<String>(logoPath);
    }
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || defaultTaxRateId != null) {
      map['default_tax_rate_id'] = Variable<int>(defaultTaxRateId);
    }
    return map;
  }

  BusinessesCompanion toCompanion(bool nullToAbsent) {
    return BusinessesCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      name: Value(name),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      tin: tin == null && nullToAbsent ? const Value.absent() : Value(tin),
      logoPath: logoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(logoPath),
      currency: Value(currency),
      defaultTaxRateId: defaultTaxRateId == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultTaxRateId),
    );
  }

  factory Business.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Business(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      tin: serializer.fromJson<String?>(json['tin']),
      logoPath: serializer.fromJson<String?>(json['logoPath']),
      currency: serializer.fromJson<String>(json['currency']),
      defaultTaxRateId: serializer.fromJson<int?>(json['defaultTaxRateId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
      'tin': serializer.toJson<String?>(tin),
      'logoPath': serializer.toJson<String?>(logoPath),
      'currency': serializer.toJson<String>(currency),
      'defaultTaxRateId': serializer.toJson<int?>(defaultTaxRateId),
    };
  }

  Business copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    String? name,
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> tin = const Value.absent(),
    Value<String?> logoPath = const Value.absent(),
    String? currency,
    Value<int?> defaultTaxRateId = const Value.absent(),
  }) => Business(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    address: address.present ? address.value : this.address,
    tin: tin.present ? tin.value : this.tin,
    logoPath: logoPath.present ? logoPath.value : this.logoPath,
    currency: currency ?? this.currency,
    defaultTaxRateId: defaultTaxRateId.present
        ? defaultTaxRateId.value
        : this.defaultTaxRateId,
  );
  Business copyWithCompanion(BusinessesCompanion data) {
    return Business(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
      tin: data.tin.present ? data.tin.value : this.tin,
      logoPath: data.logoPath.present ? data.logoPath.value : this.logoPath,
      currency: data.currency.present ? data.currency.value : this.currency,
      defaultTaxRateId: data.defaultTaxRateId.present
          ? data.defaultTaxRateId.value
          : this.defaultTaxRateId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Business(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('tin: $tin, ')
          ..write('logoPath: $logoPath, ')
          ..write('currency: $currency, ')
          ..write('defaultTaxRateId: $defaultTaxRateId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    name,
    phone,
    email,
    address,
    tin,
    logoPath,
    currency,
    defaultTaxRateId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Business &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.address == this.address &&
          other.tin == this.tin &&
          other.logoPath == this.logoPath &&
          other.currency == this.currency &&
          other.defaultTaxRateId == this.defaultTaxRateId);
}

class BusinessesCompanion extends UpdateCompanion<Business> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> tin;
  final Value<String?> logoPath;
  final Value<String> currency;
  final Value<int?> defaultTaxRateId;
  const BusinessesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.tin = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.currency = const Value.absent(),
    this.defaultTaxRateId = const Value.absent(),
  });
  BusinessesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.tin = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.currency = const Value.absent(),
    this.defaultTaxRateId = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Business> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? tin,
    Expression<String>? logoPath,
    Expression<String>? currency,
    Expression<int>? defaultTaxRateId,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (tin != null) 'tin': tin,
      if (logoPath != null) 'logo_path': logoPath,
      if (currency != null) 'currency': currency,
      if (defaultTaxRateId != null) 'default_tax_rate_id': defaultTaxRateId,
    });
  }

  BusinessesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<String>? name,
    Value<String?>? phone,
    Value<String?>? email,
    Value<String?>? address,
    Value<String?>? tin,
    Value<String?>? logoPath,
    Value<String>? currency,
    Value<int?>? defaultTaxRateId,
  }) {
    return BusinessesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      tin: tin ?? this.tin,
      logoPath: logoPath ?? this.logoPath,
      currency: currency ?? this.currency,
      defaultTaxRateId: defaultTaxRateId ?? this.defaultTaxRateId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (tin.present) {
      map['tin'] = Variable<String>(tin.value);
    }
    if (logoPath.present) {
      map['logo_path'] = Variable<String>(logoPath.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (defaultTaxRateId.present) {
      map['default_tax_rate_id'] = Variable<int>(defaultTaxRateId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('tin: $tin, ')
          ..write('logoPath: $logoPath, ')
          ..write('currency: $currency, ')
          ..write('defaultTaxRateId: $defaultTaxRateId')
          ..write(')'))
        .toString();
  }
}

class $ShopsTable extends Shops with TableInfo<$ShopsTable, Shop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _businessIdMeta = const VerificationMeta(
    'businessId',
  );
  @override
  late final GeneratedColumn<int> businessId = GeneratedColumn<int>(
    'business_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    businessId,
    name,
    address,
    phone,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shops';
  @override
  VerificationContext validateIntegrity(
    Insertable<Shop> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_id')) {
      context.handle(
        _businessIdMeta,
        businessId.isAcceptableOrUnknown(data['business_id']!, _businessIdMeta),
      );
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Shop map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Shop(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      businessId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}business_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $ShopsTable createAlias(String alias) {
    return $ShopsTable(attachedDatabase, alias);
  }
}

class Shop extends DataClass implements Insertable<Shop> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int businessId;
  final String name;
  final String? address;
  final String? phone;
  final bool isActive;
  const Shop({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.businessId,
    required this.name,
    this.address,
    this.phone,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['business_id'] = Variable<int>(businessId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  ShopsCompanion toCompanion(bool nullToAbsent) {
    return ShopsCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      businessId: Value(businessId),
      name: Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      isActive: Value(isActive),
    );
  }

  factory Shop.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shop(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      businessId: serializer.fromJson<int>(json['businessId']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'businessId': serializer.toJson<int>(businessId),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  Shop copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? businessId,
    String? name,
    Value<String?> address = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    bool? isActive,
  }) => Shop(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    businessId: businessId ?? this.businessId,
    name: name ?? this.name,
    address: address.present ? address.value : this.address,
    phone: phone.present ? phone.value : this.phone,
    isActive: isActive ?? this.isActive,
  );
  Shop copyWithCompanion(ShopsCompanion data) {
    return Shop(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      businessId: data.businessId.present
          ? data.businessId.value
          : this.businessId,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Shop(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    businessId,
    name,
    address,
    phone,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shop &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.businessId == this.businessId &&
          other.name == this.name &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.isActive == this.isActive);
}

class ShopsCompanion extends UpdateCompanion<Shop> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> businessId;
  final Value<String> name;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<bool> isActive;
  const ShopsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.businessId = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  ShopsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int businessId,
    required String name,
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : businessId = Value(businessId),
       name = Value(name);
  static Insertable<Shop> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? businessId,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (businessId != null) 'business_id': businessId,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (isActive != null) 'is_active': isActive,
    });
  }

  ShopsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? businessId,
    Value<String>? name,
    Value<String?>? address,
    Value<String?>? phone,
    Value<bool>? isActive,
  }) {
    return ShopsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<int>(businessId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pinHashMeta = const VerificationMeta(
    'pinHash',
  );
  @override
  late final GeneratedColumn<String> pinHash = GeneratedColumn<String>(
    'pin_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<UserRole, String> role =
      GeneratedColumn<String>(
        'role',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<UserRole>($UsersTable.$converterrole);
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    fullName,
    pinHash,
    role,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('pin_hash')) {
      context.handle(
        _pinHashMeta,
        pinHash.isAcceptableOrUnknown(data['pin_hash']!, _pinHashMeta),
      );
    } else if (isInserting) {
      context.missing(_pinHashMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      pinHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pin_hash'],
      )!,
      role: $UsersTable.$converterrole.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}role'],
        )!,
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UserRole, String, String> $converterrole =
      const EnumNameConverter<UserRole>(UserRole.values);
}

class User extends DataClass implements Insertable<User> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final String fullName;
  final String pinHash;
  final UserRole role;
  final bool isActive;
  const User({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.fullName,
    required this.pinHash,
    required this.role,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    map['full_name'] = Variable<String>(fullName);
    map['pin_hash'] = Variable<String>(pinHash);
    {
      map['role'] = Variable<String>($UsersTable.$converterrole.toSql(role));
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      fullName: Value(fullName),
      pinHash: Value(pinHash),
      role: Value(role),
      isActive: Value(isActive),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      fullName: serializer.fromJson<String>(json['fullName']),
      pinHash: serializer.fromJson<String>(json['pinHash']),
      role: $UsersTable.$converterrole.fromJson(
        serializer.fromJson<String>(json['role']),
      ),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'fullName': serializer.toJson<String>(fullName),
      'pinHash': serializer.toJson<String>(pinHash),
      'role': serializer.toJson<String>(
        $UsersTable.$converterrole.toJson(role),
      ),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  User copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    String? fullName,
    String? pinHash,
    UserRole? role,
    bool? isActive,
  }) => User(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    fullName: fullName ?? this.fullName,
    pinHash: pinHash ?? this.pinHash,
    role: role ?? this.role,
    isActive: isActive ?? this.isActive,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      pinHash: data.pinHash.present ? data.pinHash.value : this.pinHash,
      role: data.role.present ? data.role.value : this.role,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('fullName: $fullName, ')
          ..write('pinHash: $pinHash, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    shopId,
    fullName,
    pinHash,
    role,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.fullName == this.fullName &&
          other.pinHash == this.pinHash &&
          other.role == this.role &&
          other.isActive == this.isActive);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<String> fullName;
  final Value<String> pinHash;
  final Value<UserRole> role;
  final Value<bool> isActive;
  const UsersCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.fullName = const Value.absent(),
    this.pinHash = const Value.absent(),
    this.role = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  UsersCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required String fullName,
    required String pinHash,
    required UserRole role,
    this.isActive = const Value.absent(),
  }) : shopId = Value(shopId),
       fullName = Value(fullName),
       pinHash = Value(pinHash),
       role = Value(role);
  static Insertable<User> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<String>? fullName,
    Expression<String>? pinHash,
    Expression<String>? role,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (fullName != null) 'full_name': fullName,
      if (pinHash != null) 'pin_hash': pinHash,
      if (role != null) 'role': role,
      if (isActive != null) 'is_active': isActive,
    });
  }

  UsersCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<String>? fullName,
    Value<String>? pinHash,
    Value<UserRole>? role,
    Value<bool>? isActive,
  }) {
    return UsersCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      fullName: fullName ?? this.fullName,
      pinHash: pinHash ?? this.pinHash,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (pinHash.present) {
      map['pin_hash'] = Variable<String>(pinHash.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(
        $UsersTable.$converterrole.toSql(role.value),
      );
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('fullName: $fullName, ')
          ..write('pinHash: $pinHash, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
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
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, String> accountType =
      GeneratedColumn<String>(
        'account_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AccountType>($AccountsTable.$converteraccountType);
  static const VerificationMeta _subtypeMeta = const VerificationMeta(
    'subtype',
  );
  @override
  late final GeneratedColumn<String> subtype = GeneratedColumn<String>(
    'subtype',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSystemMeta = const VerificationMeta(
    'isSystem',
  );
  @override
  late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>(
    'is_system',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_system" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _openingBalanceMeta = const VerificationMeta(
    'openingBalance',
  );
  @override
  late final GeneratedColumn<int> openingBalance = GeneratedColumn<int>(
    'opening_balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    code,
    name,
    accountType,
    subtype,
    isSystem,
    isActive,
    openingBalance,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Account> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('subtype')) {
      context.handle(
        _subtypeMeta,
        subtype.isAcceptableOrUnknown(data['subtype']!, _subtypeMeta),
      );
    }
    if (data.containsKey('is_system')) {
      context.handle(
        _isSystemMeta,
        isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
        _openingBalanceMeta,
        openingBalance.isAcceptableOrUnknown(
          data['opening_balance']!,
          _openingBalanceMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      accountType: $AccountsTable.$converteraccountType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}account_type'],
        )!,
      ),
      subtype: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subtype'],
      ),
      isSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_system'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      openingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}opening_balance'],
      )!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, String, String> $converteraccountType =
      const EnumNameConverter<AccountType>(AccountType.values);
}

class Account extends DataClass implements Insertable<Account> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final String code;
  final String name;
  final AccountType accountType;
  final String? subtype;
  final bool isSystem;
  final bool isActive;
  final int openingBalance;
  const Account({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.code,
    required this.name,
    required this.accountType,
    this.subtype,
    required this.isSystem,
    required this.isActive,
    required this.openingBalance,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    {
      map['account_type'] = Variable<String>(
        $AccountsTable.$converteraccountType.toSql(accountType),
      );
    }
    if (!nullToAbsent || subtype != null) {
      map['subtype'] = Variable<String>(subtype);
    }
    map['is_system'] = Variable<bool>(isSystem);
    map['is_active'] = Variable<bool>(isActive);
    map['opening_balance'] = Variable<int>(openingBalance);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      code: Value(code),
      name: Value(name),
      accountType: Value(accountType),
      subtype: subtype == null && nullToAbsent
          ? const Value.absent()
          : Value(subtype),
      isSystem: Value(isSystem),
      isActive: Value(isActive),
      openingBalance: Value(openingBalance),
    );
  }

  factory Account.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      accountType: $AccountsTable.$converteraccountType.fromJson(
        serializer.fromJson<String>(json['accountType']),
      ),
      subtype: serializer.fromJson<String?>(json['subtype']),
      isSystem: serializer.fromJson<bool>(json['isSystem']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      openingBalance: serializer.fromJson<int>(json['openingBalance']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'accountType': serializer.toJson<String>(
        $AccountsTable.$converteraccountType.toJson(accountType),
      ),
      'subtype': serializer.toJson<String?>(subtype),
      'isSystem': serializer.toJson<bool>(isSystem),
      'isActive': serializer.toJson<bool>(isActive),
      'openingBalance': serializer.toJson<int>(openingBalance),
    };
  }

  Account copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    String? code,
    String? name,
    AccountType? accountType,
    Value<String?> subtype = const Value.absent(),
    bool? isSystem,
    bool? isActive,
    int? openingBalance,
  }) => Account(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    code: code ?? this.code,
    name: name ?? this.name,
    accountType: accountType ?? this.accountType,
    subtype: subtype.present ? subtype.value : this.subtype,
    isSystem: isSystem ?? this.isSystem,
    isActive: isActive ?? this.isActive,
    openingBalance: openingBalance ?? this.openingBalance,
  );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      accountType: data.accountType.present
          ? data.accountType.value
          : this.accountType,
      subtype: data.subtype.present ? data.subtype.value : this.subtype,
      isSystem: data.isSystem.present ? data.isSystem.value : this.isSystem,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('accountType: $accountType, ')
          ..write('subtype: $subtype, ')
          ..write('isSystem: $isSystem, ')
          ..write('isActive: $isActive, ')
          ..write('openingBalance: $openingBalance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    shopId,
    code,
    name,
    accountType,
    subtype,
    isSystem,
    isActive,
    openingBalance,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.code == this.code &&
          other.name == this.name &&
          other.accountType == this.accountType &&
          other.subtype == this.subtype &&
          other.isSystem == this.isSystem &&
          other.isActive == this.isActive &&
          other.openingBalance == this.openingBalance);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<String> code;
  final Value<String> name;
  final Value<AccountType> accountType;
  final Value<String?> subtype;
  final Value<bool> isSystem;
  final Value<bool> isActive;
  final Value<int> openingBalance;
  const AccountsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.accountType = const Value.absent(),
    this.subtype = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.isActive = const Value.absent(),
    this.openingBalance = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required String code,
    required String name,
    required AccountType accountType,
    this.subtype = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.isActive = const Value.absent(),
    this.openingBalance = const Value.absent(),
  }) : shopId = Value(shopId),
       code = Value(code),
       name = Value(name),
       accountType = Value(accountType);
  static Insertable<Account> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? accountType,
    Expression<String>? subtype,
    Expression<bool>? isSystem,
    Expression<bool>? isActive,
    Expression<int>? openingBalance,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (accountType != null) 'account_type': accountType,
      if (subtype != null) 'subtype': subtype,
      if (isSystem != null) 'is_system': isSystem,
      if (isActive != null) 'is_active': isActive,
      if (openingBalance != null) 'opening_balance': openingBalance,
    });
  }

  AccountsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<String>? code,
    Value<String>? name,
    Value<AccountType>? accountType,
    Value<String?>? subtype,
    Value<bool>? isSystem,
    Value<bool>? isActive,
    Value<int>? openingBalance,
  }) {
    return AccountsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      code: code ?? this.code,
      name: name ?? this.name,
      accountType: accountType ?? this.accountType,
      subtype: subtype ?? this.subtype,
      isSystem: isSystem ?? this.isSystem,
      isActive: isActive ?? this.isActive,
      openingBalance: openingBalance ?? this.openingBalance,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(
        $AccountsTable.$converteraccountType.toSql(accountType.value),
      );
    }
    if (subtype.present) {
      map['subtype'] = Variable<String>(subtype.value);
    }
    if (isSystem.present) {
      map['is_system'] = Variable<bool>(isSystem.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<int>(openingBalance.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('accountType: $accountType, ')
          ..write('subtype: $subtype, ')
          ..write('isSystem: $isSystem, ')
          ..write('isActive: $isActive, ')
          ..write('openingBalance: $openingBalance')
          ..write(')'))
        .toString();
  }
}

class $TaxRatesTable extends TaxRates with TableInfo<$TaxRatesTable, TaxRate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaxRatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rateBpMeta = const VerificationMeta('rateBp');
  @override
  late final GeneratedColumn<int> rateBp = GeneratedColumn<int>(
    'rate_bp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TaxKind, String> taxKind =
      GeneratedColumn<String>(
        'tax_kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TaxKind>($TaxRatesTable.$convertertaxKind);
  static const VerificationMeta _isLevyMeta = const VerificationMeta('isLevy');
  @override
  late final GeneratedColumn<bool> isLevy = GeneratedColumn<bool>(
    'is_levy',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_levy" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    name,
    rateBp,
    taxKind,
    isLevy,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tax_rates';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaxRate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
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
    if (data.containsKey('rate_bp')) {
      context.handle(
        _rateBpMeta,
        rateBp.isAcceptableOrUnknown(data['rate_bp']!, _rateBpMeta),
      );
    } else if (isInserting) {
      context.missing(_rateBpMeta);
    }
    if (data.containsKey('is_levy')) {
      context.handle(
        _isLevyMeta,
        isLevy.isAcceptableOrUnknown(data['is_levy']!, _isLevyMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaxRate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaxRate(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      rateBp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rate_bp'],
      )!,
      taxKind: $TaxRatesTable.$convertertaxKind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tax_kind'],
        )!,
      ),
      isLevy: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_levy'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $TaxRatesTable createAlias(String alias) {
    return $TaxRatesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TaxKind, String, String> $convertertaxKind =
      const EnumNameConverter<TaxKind>(TaxKind.values);
}

class TaxRate extends DataClass implements Insertable<TaxRate> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final String name;
  final int rateBp;
  final TaxKind taxKind;
  final bool isLevy;
  final bool isActive;
  const TaxRate({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.name,
    required this.rateBp,
    required this.taxKind,
    required this.isLevy,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['rate_bp'] = Variable<int>(rateBp);
    {
      map['tax_kind'] = Variable<String>(
        $TaxRatesTable.$convertertaxKind.toSql(taxKind),
      );
    }
    map['is_levy'] = Variable<bool>(isLevy);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  TaxRatesCompanion toCompanion(bool nullToAbsent) {
    return TaxRatesCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      name: Value(name),
      rateBp: Value(rateBp),
      taxKind: Value(taxKind),
      isLevy: Value(isLevy),
      isActive: Value(isActive),
    );
  }

  factory TaxRate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxRate(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      rateBp: serializer.fromJson<int>(json['rateBp']),
      taxKind: $TaxRatesTable.$convertertaxKind.fromJson(
        serializer.fromJson<String>(json['taxKind']),
      ),
      isLevy: serializer.fromJson<bool>(json['isLevy']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'rateBp': serializer.toJson<int>(rateBp),
      'taxKind': serializer.toJson<String>(
        $TaxRatesTable.$convertertaxKind.toJson(taxKind),
      ),
      'isLevy': serializer.toJson<bool>(isLevy),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  TaxRate copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    String? name,
    int? rateBp,
    TaxKind? taxKind,
    bool? isLevy,
    bool? isActive,
  }) => TaxRate(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    name: name ?? this.name,
    rateBp: rateBp ?? this.rateBp,
    taxKind: taxKind ?? this.taxKind,
    isLevy: isLevy ?? this.isLevy,
    isActive: isActive ?? this.isActive,
  );
  TaxRate copyWithCompanion(TaxRatesCompanion data) {
    return TaxRate(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      rateBp: data.rateBp.present ? data.rateBp.value : this.rateBp,
      taxKind: data.taxKind.present ? data.taxKind.value : this.taxKind,
      isLevy: data.isLevy.present ? data.isLevy.value : this.isLevy,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxRate(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rateBp: $rateBp, ')
          ..write('taxKind: $taxKind, ')
          ..write('isLevy: $isLevy, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    name,
    rateBp,
    taxKind,
    isLevy,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxRate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.name == this.name &&
          other.rateBp == this.rateBp &&
          other.taxKind == this.taxKind &&
          other.isLevy == this.isLevy &&
          other.isActive == this.isActive);
}

class TaxRatesCompanion extends UpdateCompanion<TaxRate> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<String> name;
  final Value<int> rateBp;
  final Value<TaxKind> taxKind;
  final Value<bool> isLevy;
  final Value<bool> isActive;
  const TaxRatesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rateBp = const Value.absent(),
    this.taxKind = const Value.absent(),
    this.isLevy = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  TaxRatesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required int rateBp,
    required TaxKind taxKind,
    this.isLevy = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : name = Value(name),
       rateBp = Value(rateBp),
       taxKind = Value(taxKind);
  static Insertable<TaxRate> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? rateBp,
    Expression<String>? taxKind,
    Expression<bool>? isLevy,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rateBp != null) 'rate_bp': rateBp,
      if (taxKind != null) 'tax_kind': taxKind,
      if (isLevy != null) 'is_levy': isLevy,
      if (isActive != null) 'is_active': isActive,
    });
  }

  TaxRatesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<String>? name,
    Value<int>? rateBp,
    Value<TaxKind>? taxKind,
    Value<bool>? isLevy,
    Value<bool>? isActive,
  }) {
    return TaxRatesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      name: name ?? this.name,
      rateBp: rateBp ?? this.rateBp,
      taxKind: taxKind ?? this.taxKind,
      isLevy: isLevy ?? this.isLevy,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rateBp.present) {
      map['rate_bp'] = Variable<int>(rateBp.value);
    }
    if (taxKind.present) {
      map['tax_kind'] = Variable<String>(
        $TaxRatesTable.$convertertaxKind.toSql(taxKind.value),
      );
    }
    if (isLevy.present) {
      map['is_levy'] = Variable<bool>(isLevy.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxRatesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rateBp: $rateBp, ')
          ..write('taxKind: $taxKind, ')
          ..write('isLevy: $isLevy, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $PartiesTable extends Parties with TableInfo<$PartiesTable, Party> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<PartyKind, String> partyKind =
      GeneratedColumn<String>(
        'party_kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<PartyKind>($PartiesTable.$converterpartyKind);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
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
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tinMeta = const VerificationMeta('tin');
  @override
  late final GeneratedColumn<String> tin = GeneratedColumn<String>(
    'tin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _creditLimitMeta = const VerificationMeta(
    'creditLimit',
  );
  @override
  late final GeneratedColumn<int> creditLimit = GeneratedColumn<int>(
    'credit_limit',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _creditDaysMeta = const VerificationMeta(
    'creditDays',
  );
  @override
  late final GeneratedColumn<int> creditDays = GeneratedColumn<int>(
    'credit_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _openingBalanceMeta = const VerificationMeta(
    'openingBalance',
  );
  @override
  late final GeneratedColumn<int> openingBalance = GeneratedColumn<int>(
    'opening_balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    partyKind,
    name,
    phone,
    email,
    address,
    tin,
    creditLimit,
    creditDays,
    openingBalance,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parties';
  @override
  VerificationContext validateIntegrity(
    Insertable<Party> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('tin')) {
      context.handle(
        _tinMeta,
        tin.isAcceptableOrUnknown(data['tin']!, _tinMeta),
      );
    }
    if (data.containsKey('credit_limit')) {
      context.handle(
        _creditLimitMeta,
        creditLimit.isAcceptableOrUnknown(
          data['credit_limit']!,
          _creditLimitMeta,
        ),
      );
    }
    if (data.containsKey('credit_days')) {
      context.handle(
        _creditDaysMeta,
        creditDays.isAcceptableOrUnknown(data['credit_days']!, _creditDaysMeta),
      );
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
        _openingBalanceMeta,
        openingBalance.isAcceptableOrUnknown(
          data['opening_balance']!,
          _openingBalanceMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Party map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Party(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      partyKind: $PartiesTable.$converterpartyKind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}party_kind'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      tin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tin'],
      ),
      creditLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}credit_limit'],
      ),
      creditDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}credit_days'],
      ),
      openingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}opening_balance'],
      )!,
    );
  }

  @override
  $PartiesTable createAlias(String alias) {
    return $PartiesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PartyKind, String, String> $converterpartyKind =
      const EnumNameConverter<PartyKind>(PartyKind.values);
}

class Party extends DataClass implements Insertable<Party> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final PartyKind partyKind;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final String? tin;
  final int? creditLimit;
  final int? creditDays;
  final int openingBalance;
  const Party({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.partyKind,
    required this.name,
    this.phone,
    this.email,
    this.address,
    this.tin,
    this.creditLimit,
    this.creditDays,
    required this.openingBalance,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    {
      map['party_kind'] = Variable<String>(
        $PartiesTable.$converterpartyKind.toSql(partyKind),
      );
    }
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
    if (!nullToAbsent || tin != null) {
      map['tin'] = Variable<String>(tin);
    }
    if (!nullToAbsent || creditLimit != null) {
      map['credit_limit'] = Variable<int>(creditLimit);
    }
    if (!nullToAbsent || creditDays != null) {
      map['credit_days'] = Variable<int>(creditDays);
    }
    map['opening_balance'] = Variable<int>(openingBalance);
    return map;
  }

  PartiesCompanion toCompanion(bool nullToAbsent) {
    return PartiesCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      partyKind: Value(partyKind),
      name: Value(name),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      tin: tin == null && nullToAbsent ? const Value.absent() : Value(tin),
      creditLimit: creditLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(creditLimit),
      creditDays: creditDays == null && nullToAbsent
          ? const Value.absent()
          : Value(creditDays),
      openingBalance: Value(openingBalance),
    );
  }

  factory Party.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Party(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      partyKind: $PartiesTable.$converterpartyKind.fromJson(
        serializer.fromJson<String>(json['partyKind']),
      ),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      tin: serializer.fromJson<String?>(json['tin']),
      creditLimit: serializer.fromJson<int?>(json['creditLimit']),
      creditDays: serializer.fromJson<int?>(json['creditDays']),
      openingBalance: serializer.fromJson<int>(json['openingBalance']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'partyKind': serializer.toJson<String>(
        $PartiesTable.$converterpartyKind.toJson(partyKind),
      ),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
      'tin': serializer.toJson<String?>(tin),
      'creditLimit': serializer.toJson<int?>(creditLimit),
      'creditDays': serializer.toJson<int?>(creditDays),
      'openingBalance': serializer.toJson<int>(openingBalance),
    };
  }

  Party copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    PartyKind? partyKind,
    String? name,
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> tin = const Value.absent(),
    Value<int?> creditLimit = const Value.absent(),
    Value<int?> creditDays = const Value.absent(),
    int? openingBalance,
  }) => Party(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    partyKind: partyKind ?? this.partyKind,
    name: name ?? this.name,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    address: address.present ? address.value : this.address,
    tin: tin.present ? tin.value : this.tin,
    creditLimit: creditLimit.present ? creditLimit.value : this.creditLimit,
    creditDays: creditDays.present ? creditDays.value : this.creditDays,
    openingBalance: openingBalance ?? this.openingBalance,
  );
  Party copyWithCompanion(PartiesCompanion data) {
    return Party(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      partyKind: data.partyKind.present ? data.partyKind.value : this.partyKind,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
      tin: data.tin.present ? data.tin.value : this.tin,
      creditLimit: data.creditLimit.present
          ? data.creditLimit.value
          : this.creditLimit,
      creditDays: data.creditDays.present
          ? data.creditDays.value
          : this.creditDays,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Party(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('partyKind: $partyKind, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('tin: $tin, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('creditDays: $creditDays, ')
          ..write('openingBalance: $openingBalance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    shopId,
    partyKind,
    name,
    phone,
    email,
    address,
    tin,
    creditLimit,
    creditDays,
    openingBalance,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Party &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.partyKind == this.partyKind &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.address == this.address &&
          other.tin == this.tin &&
          other.creditLimit == this.creditLimit &&
          other.creditDays == this.creditDays &&
          other.openingBalance == this.openingBalance);
}

class PartiesCompanion extends UpdateCompanion<Party> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<PartyKind> partyKind;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> tin;
  final Value<int?> creditLimit;
  final Value<int?> creditDays;
  final Value<int> openingBalance;
  const PartiesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.partyKind = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.tin = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.creditDays = const Value.absent(),
    this.openingBalance = const Value.absent(),
  });
  PartiesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required PartyKind partyKind,
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.tin = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.creditDays = const Value.absent(),
    this.openingBalance = const Value.absent(),
  }) : shopId = Value(shopId),
       partyKind = Value(partyKind),
       name = Value(name);
  static Insertable<Party> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<String>? partyKind,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? tin,
    Expression<int>? creditLimit,
    Expression<int>? creditDays,
    Expression<int>? openingBalance,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (partyKind != null) 'party_kind': partyKind,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (tin != null) 'tin': tin,
      if (creditLimit != null) 'credit_limit': creditLimit,
      if (creditDays != null) 'credit_days': creditDays,
      if (openingBalance != null) 'opening_balance': openingBalance,
    });
  }

  PartiesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<PartyKind>? partyKind,
    Value<String>? name,
    Value<String?>? phone,
    Value<String?>? email,
    Value<String?>? address,
    Value<String?>? tin,
    Value<int?>? creditLimit,
    Value<int?>? creditDays,
    Value<int>? openingBalance,
  }) {
    return PartiesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      partyKind: partyKind ?? this.partyKind,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      tin: tin ?? this.tin,
      creditLimit: creditLimit ?? this.creditLimit,
      creditDays: creditDays ?? this.creditDays,
      openingBalance: openingBalance ?? this.openingBalance,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (partyKind.present) {
      map['party_kind'] = Variable<String>(
        $PartiesTable.$converterpartyKind.toSql(partyKind.value),
      );
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
    if (tin.present) {
      map['tin'] = Variable<String>(tin.value);
    }
    if (creditLimit.present) {
      map['credit_limit'] = Variable<int>(creditLimit.value);
    }
    if (creditDays.present) {
      map['credit_days'] = Variable<int>(creditDays.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<int>(openingBalance.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartiesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('partyKind: $partyKind, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('tin: $tin, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('creditDays: $creditDays, ')
          ..write('openingBalance: $openingBalance')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    name,
    parentId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      ),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final String name;
  final int? parentId;
  const Category({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.name,
    this.parentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      name: Value(name),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      name: serializer.fromJson<String>(json['name']),
      parentId: serializer.fromJson<int?>(json['parentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'name': serializer.toJson<String>(name),
      'parentId': serializer.toJson<int?>(parentId),
    };
  }

  Category copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    String? name,
    Value<int?> parentId = const Value.absent(),
  }) => Category(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    name: name ?? this.name,
    parentId: parentId.present ? parentId.value : this.parentId,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      name: data.name.present ? data.name.value : this.name,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(createdAt, updatedAt, id, shopId, name, parentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.name == this.name &&
          other.parentId == this.parentId);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<String> name;
  final Value<int?> parentId;
  const CategoriesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.name = const Value.absent(),
    this.parentId = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required String name,
    this.parentId = const Value.absent(),
  }) : shopId = Value(shopId),
       name = Value(name);
  static Insertable<Category> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<String>? name,
    Expression<int>? parentId,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (name != null) 'name': name,
      if (parentId != null) 'parent_id': parentId,
    });
  }

  CategoriesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<String>? name,
    Value<int?>? parentId,
  }) {
    return CategoriesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<int> cost = GeneratedColumn<int>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _taxRateIdMeta = const VerificationMeta(
    'taxRateId',
  );
  @override
  late final GeneratedColumn<int> taxRateId = GeneratedColumn<int>(
    'tax_rate_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stockOnHandMeta = const VerificationMeta(
    'stockOnHand',
  );
  @override
  late final GeneratedColumn<int> stockOnHand = GeneratedColumn<int>(
    'stock_on_hand',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _reorderLevelMeta = const VerificationMeta(
    'reorderLevel',
  );
  @override
  late final GeneratedColumn<int> reorderLevel = GeneratedColumn<int>(
    'reorder_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    sku,
    barcode,
    name,
    description,
    categoryId,
    unit,
    cost,
    price,
    taxRateId,
    stockOnHand,
    reorderLevel,
    expiresAt,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('tax_rate_id')) {
      context.handle(
        _taxRateIdMeta,
        taxRateId.isAcceptableOrUnknown(data['tax_rate_id']!, _taxRateIdMeta),
      );
    }
    if (data.containsKey('stock_on_hand')) {
      context.handle(
        _stockOnHandMeta,
        stockOnHand.isAcceptableOrUnknown(
          data['stock_on_hand']!,
          _stockOnHandMeta,
        ),
      );
    }
    if (data.containsKey('reorder_level')) {
      context.handle(
        _reorderLevelMeta,
        reorderLevel.isAcceptableOrUnknown(
          data['reorder_level']!,
          _reorderLevelMeta,
        ),
      );
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      )!,
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cost'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      taxRateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_rate_id'],
      ),
      stockOnHand: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock_on_hand'],
      )!,
      reorderLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reorder_level'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final String sku;
  final String? barcode;
  final String name;
  final String? description;
  final int? categoryId;
  final String unit;
  final int cost;
  final int price;
  final int? taxRateId;
  final int stockOnHand;
  final int reorderLevel;
  final DateTime? expiresAt;
  final bool isActive;
  const Product({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.sku,
    this.barcode,
    required this.name,
    this.description,
    this.categoryId,
    required this.unit,
    required this.cost,
    required this.price,
    this.taxRateId,
    required this.stockOnHand,
    required this.reorderLevel,
    this.expiresAt,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    map['sku'] = Variable<String>(sku);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    map['unit'] = Variable<String>(unit);
    map['cost'] = Variable<int>(cost);
    map['price'] = Variable<int>(price);
    if (!nullToAbsent || taxRateId != null) {
      map['tax_rate_id'] = Variable<int>(taxRateId);
    }
    map['stock_on_hand'] = Variable<int>(stockOnHand);
    map['reorder_level'] = Variable<int>(reorderLevel);
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      sku: Value(sku),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      unit: Value(unit),
      cost: Value(cost),
      price: Value(price),
      taxRateId: taxRateId == null && nullToAbsent
          ? const Value.absent()
          : Value(taxRateId),
      stockOnHand: Value(stockOnHand),
      reorderLevel: Value(reorderLevel),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      isActive: Value(isActive),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      sku: serializer.fromJson<String>(json['sku']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      unit: serializer.fromJson<String>(json['unit']),
      cost: serializer.fromJson<int>(json['cost']),
      price: serializer.fromJson<int>(json['price']),
      taxRateId: serializer.fromJson<int?>(json['taxRateId']),
      stockOnHand: serializer.fromJson<int>(json['stockOnHand']),
      reorderLevel: serializer.fromJson<int>(json['reorderLevel']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'sku': serializer.toJson<String>(sku),
      'barcode': serializer.toJson<String?>(barcode),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'categoryId': serializer.toJson<int?>(categoryId),
      'unit': serializer.toJson<String>(unit),
      'cost': serializer.toJson<int>(cost),
      'price': serializer.toJson<int>(price),
      'taxRateId': serializer.toJson<int?>(taxRateId),
      'stockOnHand': serializer.toJson<int>(stockOnHand),
      'reorderLevel': serializer.toJson<int>(reorderLevel),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  Product copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    String? sku,
    Value<String?> barcode = const Value.absent(),
    String? name,
    Value<String?> description = const Value.absent(),
    Value<int?> categoryId = const Value.absent(),
    String? unit,
    int? cost,
    int? price,
    Value<int?> taxRateId = const Value.absent(),
    int? stockOnHand,
    int? reorderLevel,
    Value<DateTime?> expiresAt = const Value.absent(),
    bool? isActive,
  }) => Product(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    sku: sku ?? this.sku,
    barcode: barcode.present ? barcode.value : this.barcode,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    unit: unit ?? this.unit,
    cost: cost ?? this.cost,
    price: price ?? this.price,
    taxRateId: taxRateId.present ? taxRateId.value : this.taxRateId,
    stockOnHand: stockOnHand ?? this.stockOnHand,
    reorderLevel: reorderLevel ?? this.reorderLevel,
    expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
    isActive: isActive ?? this.isActive,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      sku: data.sku.present ? data.sku.value : this.sku,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      unit: data.unit.present ? data.unit.value : this.unit,
      cost: data.cost.present ? data.cost.value : this.cost,
      price: data.price.present ? data.price.value : this.price,
      taxRateId: data.taxRateId.present ? data.taxRateId.value : this.taxRateId,
      stockOnHand: data.stockOnHand.present
          ? data.stockOnHand.value
          : this.stockOnHand,
      reorderLevel: data.reorderLevel.present
          ? data.reorderLevel.value
          : this.reorderLevel,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('categoryId: $categoryId, ')
          ..write('unit: $unit, ')
          ..write('cost: $cost, ')
          ..write('price: $price, ')
          ..write('taxRateId: $taxRateId, ')
          ..write('stockOnHand: $stockOnHand, ')
          ..write('reorderLevel: $reorderLevel, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    shopId,
    sku,
    barcode,
    name,
    description,
    categoryId,
    unit,
    cost,
    price,
    taxRateId,
    stockOnHand,
    reorderLevel,
    expiresAt,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.sku == this.sku &&
          other.barcode == this.barcode &&
          other.name == this.name &&
          other.description == this.description &&
          other.categoryId == this.categoryId &&
          other.unit == this.unit &&
          other.cost == this.cost &&
          other.price == this.price &&
          other.taxRateId == this.taxRateId &&
          other.stockOnHand == this.stockOnHand &&
          other.reorderLevel == this.reorderLevel &&
          other.expiresAt == this.expiresAt &&
          other.isActive == this.isActive);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<String> sku;
  final Value<String?> barcode;
  final Value<String> name;
  final Value<String?> description;
  final Value<int?> categoryId;
  final Value<String> unit;
  final Value<int> cost;
  final Value<int> price;
  final Value<int?> taxRateId;
  final Value<int> stockOnHand;
  final Value<int> reorderLevel;
  final Value<DateTime?> expiresAt;
  final Value<bool> isActive;
  const ProductsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.sku = const Value.absent(),
    this.barcode = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.unit = const Value.absent(),
    this.cost = const Value.absent(),
    this.price = const Value.absent(),
    this.taxRateId = const Value.absent(),
    this.stockOnHand = const Value.absent(),
    this.reorderLevel = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required String sku,
    this.barcode = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.categoryId = const Value.absent(),
    required String unit,
    this.cost = const Value.absent(),
    this.price = const Value.absent(),
    this.taxRateId = const Value.absent(),
    this.stockOnHand = const Value.absent(),
    this.reorderLevel = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : shopId = Value(shopId),
       sku = Value(sku),
       name = Value(name),
       unit = Value(unit);
  static Insertable<Product> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<String>? sku,
    Expression<String>? barcode,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? categoryId,
    Expression<String>? unit,
    Expression<int>? cost,
    Expression<int>? price,
    Expression<int>? taxRateId,
    Expression<int>? stockOnHand,
    Expression<int>? reorderLevel,
    Expression<DateTime>? expiresAt,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (sku != null) 'sku': sku,
      if (barcode != null) 'barcode': barcode,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (categoryId != null) 'category_id': categoryId,
      if (unit != null) 'unit': unit,
      if (cost != null) 'cost': cost,
      if (price != null) 'price': price,
      if (taxRateId != null) 'tax_rate_id': taxRateId,
      if (stockOnHand != null) 'stock_on_hand': stockOnHand,
      if (reorderLevel != null) 'reorder_level': reorderLevel,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (isActive != null) 'is_active': isActive,
    });
  }

  ProductsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<String>? sku,
    Value<String?>? barcode,
    Value<String>? name,
    Value<String?>? description,
    Value<int?>? categoryId,
    Value<String>? unit,
    Value<int>? cost,
    Value<int>? price,
    Value<int?>? taxRateId,
    Value<int>? stockOnHand,
    Value<int>? reorderLevel,
    Value<DateTime?>? expiresAt,
    Value<bool>? isActive,
  }) {
    return ProductsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      sku: sku ?? this.sku,
      barcode: barcode ?? this.barcode,
      name: name ?? this.name,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      unit: unit ?? this.unit,
      cost: cost ?? this.cost,
      price: price ?? this.price,
      taxRateId: taxRateId ?? this.taxRateId,
      stockOnHand: stockOnHand ?? this.stockOnHand,
      reorderLevel: reorderLevel ?? this.reorderLevel,
      expiresAt: expiresAt ?? this.expiresAt,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (cost.present) {
      map['cost'] = Variable<int>(cost.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (taxRateId.present) {
      map['tax_rate_id'] = Variable<int>(taxRateId.value);
    }
    if (stockOnHand.present) {
      map['stock_on_hand'] = Variable<int>(stockOnHand.value);
    }
    if (reorderLevel.present) {
      map['reorder_level'] = Variable<int>(reorderLevel.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('categoryId: $categoryId, ')
          ..write('unit: $unit, ')
          ..write('cost: $cost, ')
          ..write('price: $price, ')
          ..write('taxRateId: $taxRateId, ')
          ..write('stockOnHand: $stockOnHand, ')
          ..write('reorderLevel: $reorderLevel, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $PaymentMethodsTable extends PaymentMethods
    with TableInfo<$PaymentMethodsTable, PaymentMethod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentMethodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    name,
    accountId,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_methods';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentMethod> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentMethod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentMethod(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $PaymentMethodsTable createAlias(String alias) {
    return $PaymentMethodsTable(attachedDatabase, alias);
  }
}

class PaymentMethod extends DataClass implements Insertable<PaymentMethod> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final String name;
  final int accountId;
  final bool isActive;
  const PaymentMethod({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.name,
    required this.accountId,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    map['name'] = Variable<String>(name);
    map['account_id'] = Variable<int>(accountId);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  PaymentMethodsCompanion toCompanion(bool nullToAbsent) {
    return PaymentMethodsCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      name: Value(name),
      accountId: Value(accountId),
      isActive: Value(isActive),
    );
  }

  factory PaymentMethod.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentMethod(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      name: serializer.fromJson<String>(json['name']),
      accountId: serializer.fromJson<int>(json['accountId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'name': serializer.toJson<String>(name),
      'accountId': serializer.toJson<int>(accountId),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  PaymentMethod copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    String? name,
    int? accountId,
    bool? isActive,
  }) => PaymentMethod(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    name: name ?? this.name,
    accountId: accountId ?? this.accountId,
    isActive: isActive ?? this.isActive,
  );
  PaymentMethod copyWithCompanion(PaymentMethodsCompanion data) {
    return PaymentMethod(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      name: data.name.present ? data.name.value : this.name,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentMethod(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('name: $name, ')
          ..write('accountId: $accountId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(createdAt, updatedAt, id, shopId, name, accountId, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentMethod &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.name == this.name &&
          other.accountId == this.accountId &&
          other.isActive == this.isActive);
}

class PaymentMethodsCompanion extends UpdateCompanion<PaymentMethod> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<String> name;
  final Value<int> accountId;
  final Value<bool> isActive;
  const PaymentMethodsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.name = const Value.absent(),
    this.accountId = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  PaymentMethodsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required String name,
    required int accountId,
    this.isActive = const Value.absent(),
  }) : shopId = Value(shopId),
       name = Value(name),
       accountId = Value(accountId);
  static Insertable<PaymentMethod> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<String>? name,
    Expression<int>? accountId,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (name != null) 'name': name,
      if (accountId != null) 'account_id': accountId,
      if (isActive != null) 'is_active': isActive,
    });
  }

  PaymentMethodsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<String>? name,
    Value<int>? accountId,
    Value<bool>? isActive,
  }) {
    return PaymentMethodsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      name: name ?? this.name,
      accountId: accountId ?? this.accountId,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentMethodsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('name: $name, ')
          ..write('accountId: $accountId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTable extends Invoices with TableInfo<$InvoicesTable, Invoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<InvoiceKind, String> invoiceKind =
      GeneratedColumn<String>(
        'invoice_kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<InvoiceKind>($InvoicesTable.$converterinvoiceKind);
  static const VerificationMeta _partyIdMeta = const VerificationMeta(
    'partyId',
  );
  @override
  late final GeneratedColumn<int> partyId = GeneratedColumn<int>(
    'party_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  late final GeneratedColumnWithTypeConverter<InvoiceStatus, String>
  invoiceStatus = GeneratedColumn<String>(
    'invoice_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<InvoiceStatus>($InvoicesTable.$converterinvoiceStatus);
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<int> subtotal = GeneratedColumn<int>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountTotalMeta = const VerificationMeta(
    'discountTotal',
  );
  @override
  late final GeneratedColumn<int> discountTotal = GeneratedColumn<int>(
    'discount_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxTotalMeta = const VerificationMeta(
    'taxTotal',
  );
  @override
  late final GeneratedColumn<int> taxTotal = GeneratedColumn<int>(
    'tax_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidTotalMeta = const VerificationMeta(
    'paidTotal',
  );
  @override
  late final GeneratedColumn<int> paidTotal = GeneratedColumn<int>(
    'paid_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    number,
    invoiceKind,
    partyId,
    date,
    dueDate,
    invoiceStatus,
    subtotal,
    discountTotal,
    taxTotal,
    total,
    paidTotal,
    reference,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Invoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('party_id')) {
      context.handle(
        _partyIdMeta,
        partyId.isAcceptableOrUnknown(data['party_id']!, _partyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_partyIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('discount_total')) {
      context.handle(
        _discountTotalMeta,
        discountTotal.isAcceptableOrUnknown(
          data['discount_total']!,
          _discountTotalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_discountTotalMeta);
    }
    if (data.containsKey('tax_total')) {
      context.handle(
        _taxTotalMeta,
        taxTotal.isAcceptableOrUnknown(data['tax_total']!, _taxTotalMeta),
      );
    } else if (isInserting) {
      context.missing(_taxTotalMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('paid_total')) {
      context.handle(
        _paidTotalMeta,
        paidTotal.isAcceptableOrUnknown(data['paid_total']!, _paidTotalMeta),
      );
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Invoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Invoice(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      )!,
      invoiceKind: $InvoicesTable.$converterinvoiceKind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}invoice_kind'],
        )!,
      ),
      partyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}party_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      invoiceStatus: $InvoicesTable.$converterinvoiceStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}invoice_status'],
        )!,
      ),
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subtotal'],
      )!,
      discountTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_total'],
      )!,
      taxTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_total'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      )!,
      paidTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paid_total'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $InvoicesTable createAlias(String alias) {
    return $InvoicesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<InvoiceKind, String, String> $converterinvoiceKind =
      const EnumNameConverter<InvoiceKind>(InvoiceKind.values);
  static JsonTypeConverter2<InvoiceStatus, String, String>
  $converterinvoiceStatus = const EnumNameConverter<InvoiceStatus>(
    InvoiceStatus.values,
  );
}

class Invoice extends DataClass implements Insertable<Invoice> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final String number;
  final InvoiceKind invoiceKind;
  final int partyId;
  final DateTime date;
  final DateTime? dueDate;
  final InvoiceStatus invoiceStatus;
  final int subtotal;
  final int discountTotal;
  final int taxTotal;
  final int total;
  final int paidTotal;
  final String? reference;
  final String? notes;
  const Invoice({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.number,
    required this.invoiceKind,
    required this.partyId,
    required this.date,
    this.dueDate,
    required this.invoiceStatus,
    required this.subtotal,
    required this.discountTotal,
    required this.taxTotal,
    required this.total,
    required this.paidTotal,
    this.reference,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    map['number'] = Variable<String>(number);
    {
      map['invoice_kind'] = Variable<String>(
        $InvoicesTable.$converterinvoiceKind.toSql(invoiceKind),
      );
    }
    map['party_id'] = Variable<int>(partyId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    {
      map['invoice_status'] = Variable<String>(
        $InvoicesTable.$converterinvoiceStatus.toSql(invoiceStatus),
      );
    }
    map['subtotal'] = Variable<int>(subtotal);
    map['discount_total'] = Variable<int>(discountTotal);
    map['tax_total'] = Variable<int>(taxTotal);
    map['total'] = Variable<int>(total);
    map['paid_total'] = Variable<int>(paidTotal);
    if (!nullToAbsent || reference != null) {
      map['reference'] = Variable<String>(reference);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      number: Value(number),
      invoiceKind: Value(invoiceKind),
      partyId: Value(partyId),
      date: Value(date),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      invoiceStatus: Value(invoiceStatus),
      subtotal: Value(subtotal),
      discountTotal: Value(discountTotal),
      taxTotal: Value(taxTotal),
      total: Value(total),
      paidTotal: Value(paidTotal),
      reference: reference == null && nullToAbsent
          ? const Value.absent()
          : Value(reference),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Invoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Invoice(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      number: serializer.fromJson<String>(json['number']),
      invoiceKind: $InvoicesTable.$converterinvoiceKind.fromJson(
        serializer.fromJson<String>(json['invoiceKind']),
      ),
      partyId: serializer.fromJson<int>(json['partyId']),
      date: serializer.fromJson<DateTime>(json['date']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      invoiceStatus: $InvoicesTable.$converterinvoiceStatus.fromJson(
        serializer.fromJson<String>(json['invoiceStatus']),
      ),
      subtotal: serializer.fromJson<int>(json['subtotal']),
      discountTotal: serializer.fromJson<int>(json['discountTotal']),
      taxTotal: serializer.fromJson<int>(json['taxTotal']),
      total: serializer.fromJson<int>(json['total']),
      paidTotal: serializer.fromJson<int>(json['paidTotal']),
      reference: serializer.fromJson<String?>(json['reference']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'number': serializer.toJson<String>(number),
      'invoiceKind': serializer.toJson<String>(
        $InvoicesTable.$converterinvoiceKind.toJson(invoiceKind),
      ),
      'partyId': serializer.toJson<int>(partyId),
      'date': serializer.toJson<DateTime>(date),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'invoiceStatus': serializer.toJson<String>(
        $InvoicesTable.$converterinvoiceStatus.toJson(invoiceStatus),
      ),
      'subtotal': serializer.toJson<int>(subtotal),
      'discountTotal': serializer.toJson<int>(discountTotal),
      'taxTotal': serializer.toJson<int>(taxTotal),
      'total': serializer.toJson<int>(total),
      'paidTotal': serializer.toJson<int>(paidTotal),
      'reference': serializer.toJson<String?>(reference),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Invoice copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    String? number,
    InvoiceKind? invoiceKind,
    int? partyId,
    DateTime? date,
    Value<DateTime?> dueDate = const Value.absent(),
    InvoiceStatus? invoiceStatus,
    int? subtotal,
    int? discountTotal,
    int? taxTotal,
    int? total,
    int? paidTotal,
    Value<String?> reference = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Invoice(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    number: number ?? this.number,
    invoiceKind: invoiceKind ?? this.invoiceKind,
    partyId: partyId ?? this.partyId,
    date: date ?? this.date,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    invoiceStatus: invoiceStatus ?? this.invoiceStatus,
    subtotal: subtotal ?? this.subtotal,
    discountTotal: discountTotal ?? this.discountTotal,
    taxTotal: taxTotal ?? this.taxTotal,
    total: total ?? this.total,
    paidTotal: paidTotal ?? this.paidTotal,
    reference: reference.present ? reference.value : this.reference,
    notes: notes.present ? notes.value : this.notes,
  );
  Invoice copyWithCompanion(InvoicesCompanion data) {
    return Invoice(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      number: data.number.present ? data.number.value : this.number,
      invoiceKind: data.invoiceKind.present
          ? data.invoiceKind.value
          : this.invoiceKind,
      partyId: data.partyId.present ? data.partyId.value : this.partyId,
      date: data.date.present ? data.date.value : this.date,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      invoiceStatus: data.invoiceStatus.present
          ? data.invoiceStatus.value
          : this.invoiceStatus,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discountTotal: data.discountTotal.present
          ? data.discountTotal.value
          : this.discountTotal,
      taxTotal: data.taxTotal.present ? data.taxTotal.value : this.taxTotal,
      total: data.total.present ? data.total.value : this.total,
      paidTotal: data.paidTotal.present ? data.paidTotal.value : this.paidTotal,
      reference: data.reference.present ? data.reference.value : this.reference,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Invoice(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('number: $number, ')
          ..write('invoiceKind: $invoiceKind, ')
          ..write('partyId: $partyId, ')
          ..write('date: $date, ')
          ..write('dueDate: $dueDate, ')
          ..write('invoiceStatus: $invoiceStatus, ')
          ..write('subtotal: $subtotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('total: $total, ')
          ..write('paidTotal: $paidTotal, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    shopId,
    number,
    invoiceKind,
    partyId,
    date,
    dueDate,
    invoiceStatus,
    subtotal,
    discountTotal,
    taxTotal,
    total,
    paidTotal,
    reference,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Invoice &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.number == this.number &&
          other.invoiceKind == this.invoiceKind &&
          other.partyId == this.partyId &&
          other.date == this.date &&
          other.dueDate == this.dueDate &&
          other.invoiceStatus == this.invoiceStatus &&
          other.subtotal == this.subtotal &&
          other.discountTotal == this.discountTotal &&
          other.taxTotal == this.taxTotal &&
          other.total == this.total &&
          other.paidTotal == this.paidTotal &&
          other.reference == this.reference &&
          other.notes == this.notes);
}

class InvoicesCompanion extends UpdateCompanion<Invoice> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<String> number;
  final Value<InvoiceKind> invoiceKind;
  final Value<int> partyId;
  final Value<DateTime> date;
  final Value<DateTime?> dueDate;
  final Value<InvoiceStatus> invoiceStatus;
  final Value<int> subtotal;
  final Value<int> discountTotal;
  final Value<int> taxTotal;
  final Value<int> total;
  final Value<int> paidTotal;
  final Value<String?> reference;
  final Value<String?> notes;
  const InvoicesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.number = const Value.absent(),
    this.invoiceKind = const Value.absent(),
    this.partyId = const Value.absent(),
    this.date = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.invoiceStatus = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discountTotal = const Value.absent(),
    this.taxTotal = const Value.absent(),
    this.total = const Value.absent(),
    this.paidTotal = const Value.absent(),
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
  });
  InvoicesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required String number,
    required InvoiceKind invoiceKind,
    required int partyId,
    required DateTime date,
    this.dueDate = const Value.absent(),
    required InvoiceStatus invoiceStatus,
    required int subtotal,
    required int discountTotal,
    required int taxTotal,
    required int total,
    this.paidTotal = const Value.absent(),
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
  }) : shopId = Value(shopId),
       number = Value(number),
       invoiceKind = Value(invoiceKind),
       partyId = Value(partyId),
       date = Value(date),
       invoiceStatus = Value(invoiceStatus),
       subtotal = Value(subtotal),
       discountTotal = Value(discountTotal),
       taxTotal = Value(taxTotal),
       total = Value(total);
  static Insertable<Invoice> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<String>? number,
    Expression<String>? invoiceKind,
    Expression<int>? partyId,
    Expression<DateTime>? date,
    Expression<DateTime>? dueDate,
    Expression<String>? invoiceStatus,
    Expression<int>? subtotal,
    Expression<int>? discountTotal,
    Expression<int>? taxTotal,
    Expression<int>? total,
    Expression<int>? paidTotal,
    Expression<String>? reference,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (number != null) 'number': number,
      if (invoiceKind != null) 'invoice_kind': invoiceKind,
      if (partyId != null) 'party_id': partyId,
      if (date != null) 'date': date,
      if (dueDate != null) 'due_date': dueDate,
      if (invoiceStatus != null) 'invoice_status': invoiceStatus,
      if (subtotal != null) 'subtotal': subtotal,
      if (discountTotal != null) 'discount_total': discountTotal,
      if (taxTotal != null) 'tax_total': taxTotal,
      if (total != null) 'total': total,
      if (paidTotal != null) 'paid_total': paidTotal,
      if (reference != null) 'reference': reference,
      if (notes != null) 'notes': notes,
    });
  }

  InvoicesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<String>? number,
    Value<InvoiceKind>? invoiceKind,
    Value<int>? partyId,
    Value<DateTime>? date,
    Value<DateTime?>? dueDate,
    Value<InvoiceStatus>? invoiceStatus,
    Value<int>? subtotal,
    Value<int>? discountTotal,
    Value<int>? taxTotal,
    Value<int>? total,
    Value<int>? paidTotal,
    Value<String?>? reference,
    Value<String?>? notes,
  }) {
    return InvoicesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      number: number ?? this.number,
      invoiceKind: invoiceKind ?? this.invoiceKind,
      partyId: partyId ?? this.partyId,
      date: date ?? this.date,
      dueDate: dueDate ?? this.dueDate,
      invoiceStatus: invoiceStatus ?? this.invoiceStatus,
      subtotal: subtotal ?? this.subtotal,
      discountTotal: discountTotal ?? this.discountTotal,
      taxTotal: taxTotal ?? this.taxTotal,
      total: total ?? this.total,
      paidTotal: paidTotal ?? this.paidTotal,
      reference: reference ?? this.reference,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (invoiceKind.present) {
      map['invoice_kind'] = Variable<String>(
        $InvoicesTable.$converterinvoiceKind.toSql(invoiceKind.value),
      );
    }
    if (partyId.present) {
      map['party_id'] = Variable<int>(partyId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (invoiceStatus.present) {
      map['invoice_status'] = Variable<String>(
        $InvoicesTable.$converterinvoiceStatus.toSql(invoiceStatus.value),
      );
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<int>(subtotal.value);
    }
    if (discountTotal.present) {
      map['discount_total'] = Variable<int>(discountTotal.value);
    }
    if (taxTotal.present) {
      map['tax_total'] = Variable<int>(taxTotal.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (paidTotal.present) {
      map['paid_total'] = Variable<int>(paidTotal.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('number: $number, ')
          ..write('invoiceKind: $invoiceKind, ')
          ..write('partyId: $partyId, ')
          ..write('date: $date, ')
          ..write('dueDate: $dueDate, ')
          ..write('invoiceStatus: $invoiceStatus, ')
          ..write('subtotal: $subtotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('total: $total, ')
          ..write('paidTotal: $paidTotal, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $InvoiceLinesTable extends InvoiceLines
    with TableInfo<$InvoiceLinesTable, InvoiceLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceLinesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<int> qty = GeneratedColumn<int>(
    'qty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<int> discount = GeneratedColumn<int>(
    'discount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _taxRateIdMeta = const VerificationMeta(
    'taxRateId',
  );
  @override
  late final GeneratedColumn<int> taxRateId = GeneratedColumn<int>(
    'tax_rate_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taxAmountMeta = const VerificationMeta(
    'taxAmount',
  );
  @override
  late final GeneratedColumn<int> taxAmount = GeneratedColumn<int>(
    'tax_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lineTotalMeta = const VerificationMeta(
    'lineTotal',
  );
  @override
  late final GeneratedColumn<int> lineTotal = GeneratedColumn<int>(
    'line_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    productId,
    description,
    qty,
    unitPrice,
    discount,
    taxRateId,
    taxAmount,
    lineTotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice_lines';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceLine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
        _qtyMeta,
        qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta),
      );
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('tax_rate_id')) {
      context.handle(
        _taxRateIdMeta,
        taxRateId.isAcceptableOrUnknown(data['tax_rate_id']!, _taxRateIdMeta),
      );
    }
    if (data.containsKey('tax_amount')) {
      context.handle(
        _taxAmountMeta,
        taxAmount.isAcceptableOrUnknown(data['tax_amount']!, _taxAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_taxAmountMeta);
    }
    if (data.containsKey('line_total')) {
      context.handle(
        _lineTotalMeta,
        lineTotal.isAcceptableOrUnknown(data['line_total']!, _lineTotalMeta),
      );
    } else if (isInserting) {
      context.missing(_lineTotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceLine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceLine(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      qty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount'],
      )!,
      taxRateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_rate_id'],
      ),
      taxAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_amount'],
      )!,
      lineTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_total'],
      )!,
    );
  }

  @override
  $InvoiceLinesTable createAlias(String alias) {
    return $InvoiceLinesTable(attachedDatabase, alias);
  }
}

class InvoiceLine extends DataClass implements Insertable<InvoiceLine> {
  final int id;
  final int invoiceId;
  final int? productId;
  final String description;
  final int qty;
  final int unitPrice;
  final int discount;
  final int? taxRateId;
  final int taxAmount;
  final int lineTotal;
  const InvoiceLine({
    required this.id,
    required this.invoiceId,
    this.productId,
    required this.description,
    required this.qty,
    required this.unitPrice,
    required this.discount,
    this.taxRateId,
    required this.taxAmount,
    required this.lineTotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_id'] = Variable<int>(invoiceId);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<int>(productId);
    }
    map['description'] = Variable<String>(description);
    map['qty'] = Variable<int>(qty);
    map['unit_price'] = Variable<int>(unitPrice);
    map['discount'] = Variable<int>(discount);
    if (!nullToAbsent || taxRateId != null) {
      map['tax_rate_id'] = Variable<int>(taxRateId);
    }
    map['tax_amount'] = Variable<int>(taxAmount);
    map['line_total'] = Variable<int>(lineTotal);
    return map;
  }

  InvoiceLinesCompanion toCompanion(bool nullToAbsent) {
    return InvoiceLinesCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      description: Value(description),
      qty: Value(qty),
      unitPrice: Value(unitPrice),
      discount: Value(discount),
      taxRateId: taxRateId == null && nullToAbsent
          ? const Value.absent()
          : Value(taxRateId),
      taxAmount: Value(taxAmount),
      lineTotal: Value(lineTotal),
    );
  }

  factory InvoiceLine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceLine(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      productId: serializer.fromJson<int?>(json['productId']),
      description: serializer.fromJson<String>(json['description']),
      qty: serializer.fromJson<int>(json['qty']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      discount: serializer.fromJson<int>(json['discount']),
      taxRateId: serializer.fromJson<int?>(json['taxRateId']),
      taxAmount: serializer.fromJson<int>(json['taxAmount']),
      lineTotal: serializer.fromJson<int>(json['lineTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'productId': serializer.toJson<int?>(productId),
      'description': serializer.toJson<String>(description),
      'qty': serializer.toJson<int>(qty),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'discount': serializer.toJson<int>(discount),
      'taxRateId': serializer.toJson<int?>(taxRateId),
      'taxAmount': serializer.toJson<int>(taxAmount),
      'lineTotal': serializer.toJson<int>(lineTotal),
    };
  }

  InvoiceLine copyWith({
    int? id,
    int? invoiceId,
    Value<int?> productId = const Value.absent(),
    String? description,
    int? qty,
    int? unitPrice,
    int? discount,
    Value<int?> taxRateId = const Value.absent(),
    int? taxAmount,
    int? lineTotal,
  }) => InvoiceLine(
    id: id ?? this.id,
    invoiceId: invoiceId ?? this.invoiceId,
    productId: productId.present ? productId.value : this.productId,
    description: description ?? this.description,
    qty: qty ?? this.qty,
    unitPrice: unitPrice ?? this.unitPrice,
    discount: discount ?? this.discount,
    taxRateId: taxRateId.present ? taxRateId.value : this.taxRateId,
    taxAmount: taxAmount ?? this.taxAmount,
    lineTotal: lineTotal ?? this.lineTotal,
  );
  InvoiceLine copyWithCompanion(InvoiceLinesCompanion data) {
    return InvoiceLine(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      productId: data.productId.present ? data.productId.value : this.productId,
      description: data.description.present
          ? data.description.value
          : this.description,
      qty: data.qty.present ? data.qty.value : this.qty,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      discount: data.discount.present ? data.discount.value : this.discount,
      taxRateId: data.taxRateId.present ? data.taxRateId.value : this.taxRateId,
      taxAmount: data.taxAmount.present ? data.taxAmount.value : this.taxAmount,
      lineTotal: data.lineTotal.present ? data.lineTotal.value : this.lineTotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceLine(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('description: $description, ')
          ..write('qty: $qty, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('discount: $discount, ')
          ..write('taxRateId: $taxRateId, ')
          ..write('taxAmount: $taxAmount, ')
          ..write('lineTotal: $lineTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceId,
    productId,
    description,
    qty,
    unitPrice,
    discount,
    taxRateId,
    taxAmount,
    lineTotal,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceLine &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.productId == this.productId &&
          other.description == this.description &&
          other.qty == this.qty &&
          other.unitPrice == this.unitPrice &&
          other.discount == this.discount &&
          other.taxRateId == this.taxRateId &&
          other.taxAmount == this.taxAmount &&
          other.lineTotal == this.lineTotal);
}

class InvoiceLinesCompanion extends UpdateCompanion<InvoiceLine> {
  final Value<int> id;
  final Value<int> invoiceId;
  final Value<int?> productId;
  final Value<String> description;
  final Value<int> qty;
  final Value<int> unitPrice;
  final Value<int> discount;
  final Value<int?> taxRateId;
  final Value<int> taxAmount;
  final Value<int> lineTotal;
  const InvoiceLinesCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.productId = const Value.absent(),
    this.description = const Value.absent(),
    this.qty = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.discount = const Value.absent(),
    this.taxRateId = const Value.absent(),
    this.taxAmount = const Value.absent(),
    this.lineTotal = const Value.absent(),
  });
  InvoiceLinesCompanion.insert({
    this.id = const Value.absent(),
    required int invoiceId,
    this.productId = const Value.absent(),
    required String description,
    required int qty,
    required int unitPrice,
    this.discount = const Value.absent(),
    this.taxRateId = const Value.absent(),
    required int taxAmount,
    required int lineTotal,
  }) : invoiceId = Value(invoiceId),
       description = Value(description),
       qty = Value(qty),
       unitPrice = Value(unitPrice),
       taxAmount = Value(taxAmount),
       lineTotal = Value(lineTotal);
  static Insertable<InvoiceLine> custom({
    Expression<int>? id,
    Expression<int>? invoiceId,
    Expression<int>? productId,
    Expression<String>? description,
    Expression<int>? qty,
    Expression<int>? unitPrice,
    Expression<int>? discount,
    Expression<int>? taxRateId,
    Expression<int>? taxAmount,
    Expression<int>? lineTotal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (productId != null) 'product_id': productId,
      if (description != null) 'description': description,
      if (qty != null) 'qty': qty,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (discount != null) 'discount': discount,
      if (taxRateId != null) 'tax_rate_id': taxRateId,
      if (taxAmount != null) 'tax_amount': taxAmount,
      if (lineTotal != null) 'line_total': lineTotal,
    });
  }

  InvoiceLinesCompanion copyWith({
    Value<int>? id,
    Value<int>? invoiceId,
    Value<int?>? productId,
    Value<String>? description,
    Value<int>? qty,
    Value<int>? unitPrice,
    Value<int>? discount,
    Value<int?>? taxRateId,
    Value<int>? taxAmount,
    Value<int>? lineTotal,
  }) {
    return InvoiceLinesCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      productId: productId ?? this.productId,
      description: description ?? this.description,
      qty: qty ?? this.qty,
      unitPrice: unitPrice ?? this.unitPrice,
      discount: discount ?? this.discount,
      taxRateId: taxRateId ?? this.taxRateId,
      taxAmount: taxAmount ?? this.taxAmount,
      lineTotal: lineTotal ?? this.lineTotal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (discount.present) {
      map['discount'] = Variable<int>(discount.value);
    }
    if (taxRateId.present) {
      map['tax_rate_id'] = Variable<int>(taxRateId.value);
    }
    if (taxAmount.present) {
      map['tax_amount'] = Variable<int>(taxAmount.value);
    }
    if (lineTotal.present) {
      map['line_total'] = Variable<int>(lineTotal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceLinesCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('description: $description, ')
          ..write('qty: $qty, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('discount: $discount, ')
          ..write('taxRateId: $taxRateId, ')
          ..write('taxAmount: $taxAmount, ')
          ..write('lineTotal: $lineTotal')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<PaymentDirection, String>
  direction = GeneratedColumn<String>(
    'direction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<PaymentDirection>($PaymentsTable.$converterdirection);
  static const VerificationMeta _partyIdMeta = const VerificationMeta(
    'partyId',
  );
  @override
  late final GeneratedColumn<int> partyId = GeneratedColumn<int>(
    'party_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _methodIdMeta = const VerificationMeta(
    'methodId',
  );
  @override
  late final GeneratedColumn<int> methodId = GeneratedColumn<int>(
    'method_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    number,
    direction,
    partyId,
    date,
    methodId,
    amount,
    reference,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Payment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('party_id')) {
      context.handle(
        _partyIdMeta,
        partyId.isAcceptableOrUnknown(data['party_id']!, _partyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_partyIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('method_id')) {
      context.handle(
        _methodIdMeta,
        methodId.isAcceptableOrUnknown(data['method_id']!, _methodIdMeta),
      );
    } else if (isInserting) {
      context.missing(_methodIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      )!,
      direction: $PaymentsTable.$converterdirection.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}direction'],
        )!,
      ),
      partyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}party_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      methodId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}method_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PaymentDirection, String, String>
  $converterdirection = const EnumNameConverter<PaymentDirection>(
    PaymentDirection.values,
  );
}

class Payment extends DataClass implements Insertable<Payment> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final String number;
  final PaymentDirection direction;
  final int partyId;
  final DateTime date;
  final int methodId;
  final int amount;
  final String? reference;
  final String? notes;
  const Payment({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.number,
    required this.direction,
    required this.partyId,
    required this.date,
    required this.methodId,
    required this.amount,
    this.reference,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    map['number'] = Variable<String>(number);
    {
      map['direction'] = Variable<String>(
        $PaymentsTable.$converterdirection.toSql(direction),
      );
    }
    map['party_id'] = Variable<int>(partyId);
    map['date'] = Variable<DateTime>(date);
    map['method_id'] = Variable<int>(methodId);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || reference != null) {
      map['reference'] = Variable<String>(reference);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      number: Value(number),
      direction: Value(direction),
      partyId: Value(partyId),
      date: Value(date),
      methodId: Value(methodId),
      amount: Value(amount),
      reference: reference == null && nullToAbsent
          ? const Value.absent()
          : Value(reference),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Payment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payment(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      number: serializer.fromJson<String>(json['number']),
      direction: $PaymentsTable.$converterdirection.fromJson(
        serializer.fromJson<String>(json['direction']),
      ),
      partyId: serializer.fromJson<int>(json['partyId']),
      date: serializer.fromJson<DateTime>(json['date']),
      methodId: serializer.fromJson<int>(json['methodId']),
      amount: serializer.fromJson<int>(json['amount']),
      reference: serializer.fromJson<String?>(json['reference']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'number': serializer.toJson<String>(number),
      'direction': serializer.toJson<String>(
        $PaymentsTable.$converterdirection.toJson(direction),
      ),
      'partyId': serializer.toJson<int>(partyId),
      'date': serializer.toJson<DateTime>(date),
      'methodId': serializer.toJson<int>(methodId),
      'amount': serializer.toJson<int>(amount),
      'reference': serializer.toJson<String?>(reference),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Payment copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    String? number,
    PaymentDirection? direction,
    int? partyId,
    DateTime? date,
    int? methodId,
    int? amount,
    Value<String?> reference = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Payment(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    number: number ?? this.number,
    direction: direction ?? this.direction,
    partyId: partyId ?? this.partyId,
    date: date ?? this.date,
    methodId: methodId ?? this.methodId,
    amount: amount ?? this.amount,
    reference: reference.present ? reference.value : this.reference,
    notes: notes.present ? notes.value : this.notes,
  );
  Payment copyWithCompanion(PaymentsCompanion data) {
    return Payment(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      number: data.number.present ? data.number.value : this.number,
      direction: data.direction.present ? data.direction.value : this.direction,
      partyId: data.partyId.present ? data.partyId.value : this.partyId,
      date: data.date.present ? data.date.value : this.date,
      methodId: data.methodId.present ? data.methodId.value : this.methodId,
      amount: data.amount.present ? data.amount.value : this.amount,
      reference: data.reference.present ? data.reference.value : this.reference,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Payment(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('number: $number, ')
          ..write('direction: $direction, ')
          ..write('partyId: $partyId, ')
          ..write('date: $date, ')
          ..write('methodId: $methodId, ')
          ..write('amount: $amount, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    shopId,
    number,
    direction,
    partyId,
    date,
    methodId,
    amount,
    reference,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.number == this.number &&
          other.direction == this.direction &&
          other.partyId == this.partyId &&
          other.date == this.date &&
          other.methodId == this.methodId &&
          other.amount == this.amount &&
          other.reference == this.reference &&
          other.notes == this.notes);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<String> number;
  final Value<PaymentDirection> direction;
  final Value<int> partyId;
  final Value<DateTime> date;
  final Value<int> methodId;
  final Value<int> amount;
  final Value<String?> reference;
  final Value<String?> notes;
  const PaymentsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.number = const Value.absent(),
    this.direction = const Value.absent(),
    this.partyId = const Value.absent(),
    this.date = const Value.absent(),
    this.methodId = const Value.absent(),
    this.amount = const Value.absent(),
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
  });
  PaymentsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required String number,
    required PaymentDirection direction,
    required int partyId,
    required DateTime date,
    required int methodId,
    required int amount,
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
  }) : shopId = Value(shopId),
       number = Value(number),
       direction = Value(direction),
       partyId = Value(partyId),
       date = Value(date),
       methodId = Value(methodId),
       amount = Value(amount);
  static Insertable<Payment> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<String>? number,
    Expression<String>? direction,
    Expression<int>? partyId,
    Expression<DateTime>? date,
    Expression<int>? methodId,
    Expression<int>? amount,
    Expression<String>? reference,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (number != null) 'number': number,
      if (direction != null) 'direction': direction,
      if (partyId != null) 'party_id': partyId,
      if (date != null) 'date': date,
      if (methodId != null) 'method_id': methodId,
      if (amount != null) 'amount': amount,
      if (reference != null) 'reference': reference,
      if (notes != null) 'notes': notes,
    });
  }

  PaymentsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<String>? number,
    Value<PaymentDirection>? direction,
    Value<int>? partyId,
    Value<DateTime>? date,
    Value<int>? methodId,
    Value<int>? amount,
    Value<String?>? reference,
    Value<String?>? notes,
  }) {
    return PaymentsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      number: number ?? this.number,
      direction: direction ?? this.direction,
      partyId: partyId ?? this.partyId,
      date: date ?? this.date,
      methodId: methodId ?? this.methodId,
      amount: amount ?? this.amount,
      reference: reference ?? this.reference,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(
        $PaymentsTable.$converterdirection.toSql(direction.value),
      );
    }
    if (partyId.present) {
      map['party_id'] = Variable<int>(partyId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (methodId.present) {
      map['method_id'] = Variable<int>(methodId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('number: $number, ')
          ..write('direction: $direction, ')
          ..write('partyId: $partyId, ')
          ..write('date: $date, ')
          ..write('methodId: $methodId, ')
          ..write('amount: $amount, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $PaymentAllocationsTable extends PaymentAllocations
    with TableInfo<$PaymentAllocationsTable, PaymentAllocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentAllocationsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<int> paymentId = GeneratedColumn<int>(
    'payment_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, paymentId, invoiceId, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_allocations';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentAllocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentIdMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentAllocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentAllocation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}payment_id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $PaymentAllocationsTable createAlias(String alias) {
    return $PaymentAllocationsTable(attachedDatabase, alias);
  }
}

class PaymentAllocation extends DataClass
    implements Insertable<PaymentAllocation> {
  final int id;
  final int paymentId;
  final int invoiceId;
  final int amount;
  const PaymentAllocation({
    required this.id,
    required this.paymentId,
    required this.invoiceId,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['payment_id'] = Variable<int>(paymentId);
    map['invoice_id'] = Variable<int>(invoiceId);
    map['amount'] = Variable<int>(amount);
    return map;
  }

  PaymentAllocationsCompanion toCompanion(bool nullToAbsent) {
    return PaymentAllocationsCompanion(
      id: Value(id),
      paymentId: Value(paymentId),
      invoiceId: Value(invoiceId),
      amount: Value(amount),
    );
  }

  factory PaymentAllocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentAllocation(
      id: serializer.fromJson<int>(json['id']),
      paymentId: serializer.fromJson<int>(json['paymentId']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'paymentId': serializer.toJson<int>(paymentId),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'amount': serializer.toJson<int>(amount),
    };
  }

  PaymentAllocation copyWith({
    int? id,
    int? paymentId,
    int? invoiceId,
    int? amount,
  }) => PaymentAllocation(
    id: id ?? this.id,
    paymentId: paymentId ?? this.paymentId,
    invoiceId: invoiceId ?? this.invoiceId,
    amount: amount ?? this.amount,
  );
  PaymentAllocation copyWithCompanion(PaymentAllocationsCompanion data) {
    return PaymentAllocation(
      id: data.id.present ? data.id.value : this.id,
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAllocation(')
          ..write('id: $id, ')
          ..write('paymentId: $paymentId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, paymentId, invoiceId, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentAllocation &&
          other.id == this.id &&
          other.paymentId == this.paymentId &&
          other.invoiceId == this.invoiceId &&
          other.amount == this.amount);
}

class PaymentAllocationsCompanion extends UpdateCompanion<PaymentAllocation> {
  final Value<int> id;
  final Value<int> paymentId;
  final Value<int> invoiceId;
  final Value<int> amount;
  const PaymentAllocationsCompanion({
    this.id = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.amount = const Value.absent(),
  });
  PaymentAllocationsCompanion.insert({
    this.id = const Value.absent(),
    required int paymentId,
    required int invoiceId,
    required int amount,
  }) : paymentId = Value(paymentId),
       invoiceId = Value(invoiceId),
       amount = Value(amount);
  static Insertable<PaymentAllocation> custom({
    Expression<int>? id,
    Expression<int>? paymentId,
    Expression<int>? invoiceId,
    Expression<int>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (paymentId != null) 'payment_id': paymentId,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (amount != null) 'amount': amount,
    });
  }

  PaymentAllocationsCompanion copyWith({
    Value<int>? id,
    Value<int>? paymentId,
    Value<int>? invoiceId,
    Value<int>? amount,
  }) {
    return PaymentAllocationsCompanion(
      id: id ?? this.id,
      paymentId: paymentId ?? this.paymentId,
      invoiceId: invoiceId ?? this.invoiceId,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<int>(paymentId.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAllocationsCompanion(')
          ..write('id: $id, ')
          ..write('paymentId: $paymentId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
    'supplier_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxInputMeta = const VerificationMeta(
    'taxInput',
  );
  @override
  late final GeneratedColumn<int> taxInput = GeneratedColumn<int>(
    'tax_input',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _methodIdMeta = const VerificationMeta(
    'methodId',
  );
  @override
  late final GeneratedColumn<int> methodId = GeneratedColumn<int>(
    'method_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    date,
    accountId,
    supplierId,
    amount,
    taxInput,
    methodId,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Expense> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('tax_input')) {
      context.handle(
        _taxInputMeta,
        taxInput.isAcceptableOrUnknown(data['tax_input']!, _taxInputMeta),
      );
    }
    if (data.containsKey('method_id')) {
      context.handle(
        _methodIdMeta,
        methodId.isAcceptableOrUnknown(data['method_id']!, _methodIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_id'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      taxInput: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_input'],
      )!,
      methodId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}method_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final DateTime date;
  final int accountId;
  final int? supplierId;
  final int amount;
  final int taxInput;
  final int? methodId;
  final String? notes;
  const Expense({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.date,
    required this.accountId,
    this.supplierId,
    required this.amount,
    required this.taxInput,
    this.methodId,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    map['date'] = Variable<DateTime>(date);
    map['account_id'] = Variable<int>(accountId);
    if (!nullToAbsent || supplierId != null) {
      map['supplier_id'] = Variable<int>(supplierId);
    }
    map['amount'] = Variable<int>(amount);
    map['tax_input'] = Variable<int>(taxInput);
    if (!nullToAbsent || methodId != null) {
      map['method_id'] = Variable<int>(methodId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      date: Value(date),
      accountId: Value(accountId),
      supplierId: supplierId == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierId),
      amount: Value(amount),
      taxInput: Value(taxInput),
      methodId: methodId == null && nullToAbsent
          ? const Value.absent()
          : Value(methodId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Expense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      date: serializer.fromJson<DateTime>(json['date']),
      accountId: serializer.fromJson<int>(json['accountId']),
      supplierId: serializer.fromJson<int?>(json['supplierId']),
      amount: serializer.fromJson<int>(json['amount']),
      taxInput: serializer.fromJson<int>(json['taxInput']),
      methodId: serializer.fromJson<int?>(json['methodId']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'date': serializer.toJson<DateTime>(date),
      'accountId': serializer.toJson<int>(accountId),
      'supplierId': serializer.toJson<int?>(supplierId),
      'amount': serializer.toJson<int>(amount),
      'taxInput': serializer.toJson<int>(taxInput),
      'methodId': serializer.toJson<int?>(methodId),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Expense copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    DateTime? date,
    int? accountId,
    Value<int?> supplierId = const Value.absent(),
    int? amount,
    int? taxInput,
    Value<int?> methodId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Expense(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    date: date ?? this.date,
    accountId: accountId ?? this.accountId,
    supplierId: supplierId.present ? supplierId.value : this.supplierId,
    amount: amount ?? this.amount,
    taxInput: taxInput ?? this.taxInput,
    methodId: methodId.present ? methodId.value : this.methodId,
    notes: notes.present ? notes.value : this.notes,
  );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      date: data.date.present ? data.date.value : this.date,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      amount: data.amount.present ? data.amount.value : this.amount,
      taxInput: data.taxInput.present ? data.taxInput.value : this.taxInput,
      methodId: data.methodId.present ? data.methodId.value : this.methodId,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('date: $date, ')
          ..write('accountId: $accountId, ')
          ..write('supplierId: $supplierId, ')
          ..write('amount: $amount, ')
          ..write('taxInput: $taxInput, ')
          ..write('methodId: $methodId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    shopId,
    date,
    accountId,
    supplierId,
    amount,
    taxInput,
    methodId,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.date == this.date &&
          other.accountId == this.accountId &&
          other.supplierId == this.supplierId &&
          other.amount == this.amount &&
          other.taxInput == this.taxInput &&
          other.methodId == this.methodId &&
          other.notes == this.notes);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<DateTime> date;
  final Value<int> accountId;
  final Value<int?> supplierId;
  final Value<int> amount;
  final Value<int> taxInput;
  final Value<int?> methodId;
  final Value<String?> notes;
  const ExpensesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.date = const Value.absent(),
    this.accountId = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.amount = const Value.absent(),
    this.taxInput = const Value.absent(),
    this.methodId = const Value.absent(),
    this.notes = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required DateTime date,
    required int accountId,
    this.supplierId = const Value.absent(),
    required int amount,
    this.taxInput = const Value.absent(),
    this.methodId = const Value.absent(),
    this.notes = const Value.absent(),
  }) : shopId = Value(shopId),
       date = Value(date),
       accountId = Value(accountId),
       amount = Value(amount);
  static Insertable<Expense> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<DateTime>? date,
    Expression<int>? accountId,
    Expression<int>? supplierId,
    Expression<int>? amount,
    Expression<int>? taxInput,
    Expression<int>? methodId,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (date != null) 'date': date,
      if (accountId != null) 'account_id': accountId,
      if (supplierId != null) 'supplier_id': supplierId,
      if (amount != null) 'amount': amount,
      if (taxInput != null) 'tax_input': taxInput,
      if (methodId != null) 'method_id': methodId,
      if (notes != null) 'notes': notes,
    });
  }

  ExpensesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<DateTime>? date,
    Value<int>? accountId,
    Value<int?>? supplierId,
    Value<int>? amount,
    Value<int>? taxInput,
    Value<int?>? methodId,
    Value<String?>? notes,
  }) {
    return ExpensesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      date: date ?? this.date,
      accountId: accountId ?? this.accountId,
      supplierId: supplierId ?? this.supplierId,
      amount: amount ?? this.amount,
      taxInput: taxInput ?? this.taxInput,
      methodId: methodId ?? this.methodId,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (taxInput.present) {
      map['tax_input'] = Variable<int>(taxInput.value);
    }
    if (methodId.present) {
      map['method_id'] = Variable<int>(methodId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('date: $date, ')
          ..write('accountId: $accountId, ')
          ..write('supplierId: $supplierId, ')
          ..write('amount: $amount, ')
          ..write('taxInput: $taxInput, ')
          ..write('methodId: $methodId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $StockMovementsTable extends StockMovements
    with TableInfo<$StockMovementsTable, StockMovement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockMovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  late final GeneratedColumnWithTypeConverter<StockMovementType, String>
  movementType =
      GeneratedColumn<String>(
        'movement_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<StockMovementType>(
        $StockMovementsTable.$convertermovementType,
      );
  static const VerificationMeta _deltaQtyMeta = const VerificationMeta(
    'deltaQty',
  );
  @override
  late final GeneratedColumn<int> deltaQty = GeneratedColumn<int>(
    'delta_qty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitCostMeta = const VerificationMeta(
    'unitCost',
  );
  @override
  late final GeneratedColumn<int> unitCost = GeneratedColumn<int>(
    'unit_cost',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refTypeMeta = const VerificationMeta(
    'refType',
  );
  @override
  late final GeneratedColumn<String> refType = GeneratedColumn<String>(
    'ref_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
    'ref_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    productId,
    date,
    movementType,
    deltaQty,
    unitCost,
    refType,
    refId,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_movements';
  @override
  VerificationContext validateIntegrity(
    Insertable<StockMovement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('delta_qty')) {
      context.handle(
        _deltaQtyMeta,
        deltaQty.isAcceptableOrUnknown(data['delta_qty']!, _deltaQtyMeta),
      );
    } else if (isInserting) {
      context.missing(_deltaQtyMeta);
    }
    if (data.containsKey('unit_cost')) {
      context.handle(
        _unitCostMeta,
        unitCost.isAcceptableOrUnknown(data['unit_cost']!, _unitCostMeta),
      );
    } else if (isInserting) {
      context.missing(_unitCostMeta);
    }
    if (data.containsKey('ref_type')) {
      context.handle(
        _refTypeMeta,
        refType.isAcceptableOrUnknown(data['ref_type']!, _refTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_refTypeMeta);
    }
    if (data.containsKey('ref_id')) {
      context.handle(
        _refIdMeta,
        refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockMovement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockMovement(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      movementType: $StockMovementsTable.$convertermovementType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}movement_type'],
        )!,
      ),
      deltaQty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}delta_qty'],
      )!,
      unitCost: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_cost'],
      )!,
      refType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_type'],
      )!,
      refId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ref_id'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $StockMovementsTable createAlias(String alias) {
    return $StockMovementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<StockMovementType, String, String>
  $convertermovementType = const EnumNameConverter<StockMovementType>(
    StockMovementType.values,
  );
}

class StockMovement extends DataClass implements Insertable<StockMovement> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final int productId;
  final DateTime date;
  final StockMovementType movementType;
  final int deltaQty;
  final int unitCost;
  final String refType;
  final int? refId;
  final String? note;
  const StockMovement({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.productId,
    required this.date,
    required this.movementType,
    required this.deltaQty,
    required this.unitCost,
    required this.refType,
    this.refId,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    map['product_id'] = Variable<int>(productId);
    map['date'] = Variable<DateTime>(date);
    {
      map['movement_type'] = Variable<String>(
        $StockMovementsTable.$convertermovementType.toSql(movementType),
      );
    }
    map['delta_qty'] = Variable<int>(deltaQty);
    map['unit_cost'] = Variable<int>(unitCost);
    map['ref_type'] = Variable<String>(refType);
    if (!nullToAbsent || refId != null) {
      map['ref_id'] = Variable<int>(refId);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  StockMovementsCompanion toCompanion(bool nullToAbsent) {
    return StockMovementsCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      productId: Value(productId),
      date: Value(date),
      movementType: Value(movementType),
      deltaQty: Value(deltaQty),
      unitCost: Value(unitCost),
      refType: Value(refType),
      refId: refId == null && nullToAbsent
          ? const Value.absent()
          : Value(refId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory StockMovement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockMovement(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      productId: serializer.fromJson<int>(json['productId']),
      date: serializer.fromJson<DateTime>(json['date']),
      movementType: $StockMovementsTable.$convertermovementType.fromJson(
        serializer.fromJson<String>(json['movementType']),
      ),
      deltaQty: serializer.fromJson<int>(json['deltaQty']),
      unitCost: serializer.fromJson<int>(json['unitCost']),
      refType: serializer.fromJson<String>(json['refType']),
      refId: serializer.fromJson<int?>(json['refId']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'productId': serializer.toJson<int>(productId),
      'date': serializer.toJson<DateTime>(date),
      'movementType': serializer.toJson<String>(
        $StockMovementsTable.$convertermovementType.toJson(movementType),
      ),
      'deltaQty': serializer.toJson<int>(deltaQty),
      'unitCost': serializer.toJson<int>(unitCost),
      'refType': serializer.toJson<String>(refType),
      'refId': serializer.toJson<int?>(refId),
      'note': serializer.toJson<String?>(note),
    };
  }

  StockMovement copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    int? productId,
    DateTime? date,
    StockMovementType? movementType,
    int? deltaQty,
    int? unitCost,
    String? refType,
    Value<int?> refId = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => StockMovement(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    productId: productId ?? this.productId,
    date: date ?? this.date,
    movementType: movementType ?? this.movementType,
    deltaQty: deltaQty ?? this.deltaQty,
    unitCost: unitCost ?? this.unitCost,
    refType: refType ?? this.refType,
    refId: refId.present ? refId.value : this.refId,
    note: note.present ? note.value : this.note,
  );
  StockMovement copyWithCompanion(StockMovementsCompanion data) {
    return StockMovement(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      productId: data.productId.present ? data.productId.value : this.productId,
      date: data.date.present ? data.date.value : this.date,
      movementType: data.movementType.present
          ? data.movementType.value
          : this.movementType,
      deltaQty: data.deltaQty.present ? data.deltaQty.value : this.deltaQty,
      unitCost: data.unitCost.present ? data.unitCost.value : this.unitCost,
      refType: data.refType.present ? data.refType.value : this.refType,
      refId: data.refId.present ? data.refId.value : this.refId,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockMovement(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('productId: $productId, ')
          ..write('date: $date, ')
          ..write('movementType: $movementType, ')
          ..write('deltaQty: $deltaQty, ')
          ..write('unitCost: $unitCost, ')
          ..write('refType: $refType, ')
          ..write('refId: $refId, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    shopId,
    productId,
    date,
    movementType,
    deltaQty,
    unitCost,
    refType,
    refId,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockMovement &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.productId == this.productId &&
          other.date == this.date &&
          other.movementType == this.movementType &&
          other.deltaQty == this.deltaQty &&
          other.unitCost == this.unitCost &&
          other.refType == this.refType &&
          other.refId == this.refId &&
          other.note == this.note);
}

class StockMovementsCompanion extends UpdateCompanion<StockMovement> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<int> productId;
  final Value<DateTime> date;
  final Value<StockMovementType> movementType;
  final Value<int> deltaQty;
  final Value<int> unitCost;
  final Value<String> refType;
  final Value<int?> refId;
  final Value<String?> note;
  const StockMovementsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.productId = const Value.absent(),
    this.date = const Value.absent(),
    this.movementType = const Value.absent(),
    this.deltaQty = const Value.absent(),
    this.unitCost = const Value.absent(),
    this.refType = const Value.absent(),
    this.refId = const Value.absent(),
    this.note = const Value.absent(),
  });
  StockMovementsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required int productId,
    required DateTime date,
    required StockMovementType movementType,
    required int deltaQty,
    required int unitCost,
    required String refType,
    this.refId = const Value.absent(),
    this.note = const Value.absent(),
  }) : shopId = Value(shopId),
       productId = Value(productId),
       date = Value(date),
       movementType = Value(movementType),
       deltaQty = Value(deltaQty),
       unitCost = Value(unitCost),
       refType = Value(refType);
  static Insertable<StockMovement> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<int>? productId,
    Expression<DateTime>? date,
    Expression<String>? movementType,
    Expression<int>? deltaQty,
    Expression<int>? unitCost,
    Expression<String>? refType,
    Expression<int>? refId,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (productId != null) 'product_id': productId,
      if (date != null) 'date': date,
      if (movementType != null) 'movement_type': movementType,
      if (deltaQty != null) 'delta_qty': deltaQty,
      if (unitCost != null) 'unit_cost': unitCost,
      if (refType != null) 'ref_type': refType,
      if (refId != null) 'ref_id': refId,
      if (note != null) 'note': note,
    });
  }

  StockMovementsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<int>? productId,
    Value<DateTime>? date,
    Value<StockMovementType>? movementType,
    Value<int>? deltaQty,
    Value<int>? unitCost,
    Value<String>? refType,
    Value<int?>? refId,
    Value<String?>? note,
  }) {
    return StockMovementsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      productId: productId ?? this.productId,
      date: date ?? this.date,
      movementType: movementType ?? this.movementType,
      deltaQty: deltaQty ?? this.deltaQty,
      unitCost: unitCost ?? this.unitCost,
      refType: refType ?? this.refType,
      refId: refId ?? this.refId,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (movementType.present) {
      map['movement_type'] = Variable<String>(
        $StockMovementsTable.$convertermovementType.toSql(movementType.value),
      );
    }
    if (deltaQty.present) {
      map['delta_qty'] = Variable<int>(deltaQty.value);
    }
    if (unitCost.present) {
      map['unit_cost'] = Variable<int>(unitCost.value);
    }
    if (refType.present) {
      map['ref_type'] = Variable<String>(refType.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockMovementsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('productId: $productId, ')
          ..write('date: $date, ')
          ..write('movementType: $movementType, ')
          ..write('deltaQty: $deltaQty, ')
          ..write('unitCost: $unitCost, ')
          ..write('refType: $refType, ')
          ..write('refId: $refId, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $JournalEntriesTable extends JournalEntries
    with TableInfo<$JournalEntriesTable, JournalEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
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
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refTypeMeta = const VerificationMeta(
    'refType',
  );
  @override
  late final GeneratedColumn<String> refType = GeneratedColumn<String>(
    'ref_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
    'ref_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<JournalStatus, String>
  journalStatus = GeneratedColumn<String>(
    'journal_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<JournalStatus>($JournalEntriesTable.$converterjournalStatus);
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    shopId,
    number,
    date,
    memo,
    refType,
    refId,
    journalStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<JournalEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    } else if (isInserting) {
      context.missing(_memoMeta);
    }
    if (data.containsKey('ref_type')) {
      context.handle(
        _refTypeMeta,
        refType.isAcceptableOrUnknown(data['ref_type']!, _refTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_refTypeMeta);
    }
    if (data.containsKey('ref_id')) {
      context.handle(
        _refIdMeta,
        refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntry(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      )!,
      refType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_type'],
      )!,
      refId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ref_id'],
      ),
      journalStatus: $JournalEntriesTable.$converterjournalStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}journal_status'],
        )!,
      ),
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<JournalStatus, String, String>
  $converterjournalStatus = const EnumNameConverter<JournalStatus>(
    JournalStatus.values,
  );
}

class JournalEntry extends DataClass implements Insertable<JournalEntry> {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int id;
  final int shopId;
  final String number;
  final DateTime date;
  final String memo;
  final String refType;
  final int? refId;
  final JournalStatus journalStatus;
  const JournalEntry({
    required this.createdAt,
    this.updatedAt,
    required this.id,
    required this.shopId,
    required this.number,
    required this.date,
    required this.memo,
    required this.refType,
    this.refId,
    required this.journalStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['shop_id'] = Variable<int>(shopId);
    map['number'] = Variable<String>(number);
    map['date'] = Variable<DateTime>(date);
    map['memo'] = Variable<String>(memo);
    map['ref_type'] = Variable<String>(refType);
    if (!nullToAbsent || refId != null) {
      map['ref_id'] = Variable<int>(refId);
    }
    {
      map['journal_status'] = Variable<String>(
        $JournalEntriesTable.$converterjournalStatus.toSql(journalStatus),
      );
    }
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      shopId: Value(shopId),
      number: Value(number),
      date: Value(date),
      memo: Value(memo),
      refType: Value(refType),
      refId: refId == null && nullToAbsent
          ? const Value.absent()
          : Value(refId),
      journalStatus: Value(journalStatus),
    );
  }

  factory JournalEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntry(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      shopId: serializer.fromJson<int>(json['shopId']),
      number: serializer.fromJson<String>(json['number']),
      date: serializer.fromJson<DateTime>(json['date']),
      memo: serializer.fromJson<String>(json['memo']),
      refType: serializer.fromJson<String>(json['refType']),
      refId: serializer.fromJson<int?>(json['refId']),
      journalStatus: $JournalEntriesTable.$converterjournalStatus.fromJson(
        serializer.fromJson<String>(json['journalStatus']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'shopId': serializer.toJson<int>(shopId),
      'number': serializer.toJson<String>(number),
      'date': serializer.toJson<DateTime>(date),
      'memo': serializer.toJson<String>(memo),
      'refType': serializer.toJson<String>(refType),
      'refId': serializer.toJson<int?>(refId),
      'journalStatus': serializer.toJson<String>(
        $JournalEntriesTable.$converterjournalStatus.toJson(journalStatus),
      ),
    };
  }

  JournalEntry copyWith({
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    int? shopId,
    String? number,
    DateTime? date,
    String? memo,
    String? refType,
    Value<int?> refId = const Value.absent(),
    JournalStatus? journalStatus,
  }) => JournalEntry(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    shopId: shopId ?? this.shopId,
    number: number ?? this.number,
    date: date ?? this.date,
    memo: memo ?? this.memo,
    refType: refType ?? this.refType,
    refId: refId.present ? refId.value : this.refId,
    journalStatus: journalStatus ?? this.journalStatus,
  );
  JournalEntry copyWithCompanion(JournalEntriesCompanion data) {
    return JournalEntry(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      number: data.number.present ? data.number.value : this.number,
      date: data.date.present ? data.date.value : this.date,
      memo: data.memo.present ? data.memo.value : this.memo,
      refType: data.refType.present ? data.refType.value : this.refType,
      refId: data.refId.present ? data.refId.value : this.refId,
      journalStatus: data.journalStatus.present
          ? data.journalStatus.value
          : this.journalStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntry(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('number: $number, ')
          ..write('date: $date, ')
          ..write('memo: $memo, ')
          ..write('refType: $refType, ')
          ..write('refId: $refId, ')
          ..write('journalStatus: $journalStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    shopId,
    number,
    date,
    memo,
    refType,
    refId,
    journalStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntry &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.shopId == this.shopId &&
          other.number == this.number &&
          other.date == this.date &&
          other.memo == this.memo &&
          other.refType == this.refType &&
          other.refId == this.refId &&
          other.journalStatus == this.journalStatus);
}

class JournalEntriesCompanion extends UpdateCompanion<JournalEntry> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<int> shopId;
  final Value<String> number;
  final Value<DateTime> date;
  final Value<String> memo;
  final Value<String> refType;
  final Value<int?> refId;
  final Value<JournalStatus> journalStatus;
  const JournalEntriesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.shopId = const Value.absent(),
    this.number = const Value.absent(),
    this.date = const Value.absent(),
    this.memo = const Value.absent(),
    this.refType = const Value.absent(),
    this.refId = const Value.absent(),
    this.journalStatus = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int shopId,
    required String number,
    required DateTime date,
    required String memo,
    required String refType,
    this.refId = const Value.absent(),
    required JournalStatus journalStatus,
  }) : shopId = Value(shopId),
       number = Value(number),
       date = Value(date),
       memo = Value(memo),
       refType = Value(refType),
       journalStatus = Value(journalStatus);
  static Insertable<JournalEntry> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? shopId,
    Expression<String>? number,
    Expression<DateTime>? date,
    Expression<String>? memo,
    Expression<String>? refType,
    Expression<int>? refId,
    Expression<String>? journalStatus,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (shopId != null) 'shop_id': shopId,
      if (number != null) 'number': number,
      if (date != null) 'date': date,
      if (memo != null) 'memo': memo,
      if (refType != null) 'ref_type': refType,
      if (refId != null) 'ref_id': refId,
      if (journalStatus != null) 'journal_status': journalStatus,
    });
  }

  JournalEntriesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<int>? shopId,
    Value<String>? number,
    Value<DateTime>? date,
    Value<String>? memo,
    Value<String>? refType,
    Value<int?>? refId,
    Value<JournalStatus>? journalStatus,
  }) {
    return JournalEntriesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      number: number ?? this.number,
      date: date ?? this.date,
      memo: memo ?? this.memo,
      refType: refType ?? this.refType,
      refId: refId ?? this.refId,
      journalStatus: journalStatus ?? this.journalStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (refType.present) {
      map['ref_type'] = Variable<String>(refType.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (journalStatus.present) {
      map['journal_status'] = Variable<String>(
        $JournalEntriesTable.$converterjournalStatus.toSql(journalStatus.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('shopId: $shopId, ')
          ..write('number: $number, ')
          ..write('date: $date, ')
          ..write('memo: $memo, ')
          ..write('refType: $refType, ')
          ..write('refId: $refId, ')
          ..write('journalStatus: $journalStatus')
          ..write(')'))
        .toString();
  }
}

class $JournalLinesTable extends JournalLines
    with TableInfo<$JournalLinesTable, JournalLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalLinesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _entryIdMeta = const VerificationMeta(
    'entryId',
  );
  @override
  late final GeneratedColumn<int> entryId = GeneratedColumn<int>(
    'entry_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _debitMeta = const VerificationMeta('debit');
  @override
  late final GeneratedColumn<int> debit = GeneratedColumn<int>(
    'debit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _creditMeta = const VerificationMeta('credit');
  @override
  late final GeneratedColumn<int> credit = GeneratedColumn<int>(
    'credit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, entryId, accountId, debit, credit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_lines';
  @override
  VerificationContext validateIntegrity(
    Insertable<JournalLine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entry_id')) {
      context.handle(
        _entryIdMeta,
        entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('debit')) {
      context.handle(
        _debitMeta,
        debit.isAcceptableOrUnknown(data['debit']!, _debitMeta),
      );
    }
    if (data.containsKey('credit')) {
      context.handle(
        _creditMeta,
        credit.isAcceptableOrUnknown(data['credit']!, _creditMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalLine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalLine(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entry_id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      debit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}debit'],
      )!,
      credit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}credit'],
      )!,
    );
  }

  @override
  $JournalLinesTable createAlias(String alias) {
    return $JournalLinesTable(attachedDatabase, alias);
  }
}

class JournalLine extends DataClass implements Insertable<JournalLine> {
  final int id;
  final int entryId;
  final int accountId;
  final int debit;
  final int credit;
  const JournalLine({
    required this.id,
    required this.entryId,
    required this.accountId,
    required this.debit,
    required this.credit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entry_id'] = Variable<int>(entryId);
    map['account_id'] = Variable<int>(accountId);
    map['debit'] = Variable<int>(debit);
    map['credit'] = Variable<int>(credit);
    return map;
  }

  JournalLinesCompanion toCompanion(bool nullToAbsent) {
    return JournalLinesCompanion(
      id: Value(id),
      entryId: Value(entryId),
      accountId: Value(accountId),
      debit: Value(debit),
      credit: Value(credit),
    );
  }

  factory JournalLine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalLine(
      id: serializer.fromJson<int>(json['id']),
      entryId: serializer.fromJson<int>(json['entryId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      debit: serializer.fromJson<int>(json['debit']),
      credit: serializer.fromJson<int>(json['credit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entryId': serializer.toJson<int>(entryId),
      'accountId': serializer.toJson<int>(accountId),
      'debit': serializer.toJson<int>(debit),
      'credit': serializer.toJson<int>(credit),
    };
  }

  JournalLine copyWith({
    int? id,
    int? entryId,
    int? accountId,
    int? debit,
    int? credit,
  }) => JournalLine(
    id: id ?? this.id,
    entryId: entryId ?? this.entryId,
    accountId: accountId ?? this.accountId,
    debit: debit ?? this.debit,
    credit: credit ?? this.credit,
  );
  JournalLine copyWithCompanion(JournalLinesCompanion data) {
    return JournalLine(
      id: data.id.present ? data.id.value : this.id,
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      debit: data.debit.present ? data.debit.value : this.debit,
      credit: data.credit.present ? data.credit.value : this.credit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalLine(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('accountId: $accountId, ')
          ..write('debit: $debit, ')
          ..write('credit: $credit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entryId, accountId, debit, credit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalLine &&
          other.id == this.id &&
          other.entryId == this.entryId &&
          other.accountId == this.accountId &&
          other.debit == this.debit &&
          other.credit == this.credit);
}

class JournalLinesCompanion extends UpdateCompanion<JournalLine> {
  final Value<int> id;
  final Value<int> entryId;
  final Value<int> accountId;
  final Value<int> debit;
  final Value<int> credit;
  const JournalLinesCompanion({
    this.id = const Value.absent(),
    this.entryId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.debit = const Value.absent(),
    this.credit = const Value.absent(),
  });
  JournalLinesCompanion.insert({
    this.id = const Value.absent(),
    required int entryId,
    required int accountId,
    this.debit = const Value.absent(),
    this.credit = const Value.absent(),
  }) : entryId = Value(entryId),
       accountId = Value(accountId);
  static Insertable<JournalLine> custom({
    Expression<int>? id,
    Expression<int>? entryId,
    Expression<int>? accountId,
    Expression<int>? debit,
    Expression<int>? credit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryId != null) 'entry_id': entryId,
      if (accountId != null) 'account_id': accountId,
      if (debit != null) 'debit': debit,
      if (credit != null) 'credit': credit,
    });
  }

  JournalLinesCompanion copyWith({
    Value<int>? id,
    Value<int>? entryId,
    Value<int>? accountId,
    Value<int>? debit,
    Value<int>? credit,
  }) {
    return JournalLinesCompanion(
      id: id ?? this.id,
      entryId: entryId ?? this.entryId,
      accountId: accountId ?? this.accountId,
      debit: debit ?? this.debit,
      credit: credit ?? this.credit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (debit.present) {
      map['debit'] = Variable<int>(debit.value);
    }
    if (credit.present) {
      map['credit'] = Variable<int>(credit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalLinesCompanion(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('accountId: $accountId, ')
          ..write('debit: $debit, ')
          ..write('credit: $credit')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BusinessesTable businesses = $BusinessesTable(this);
  late final $ShopsTable shops = $ShopsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $TaxRatesTable taxRates = $TaxRatesTable(this);
  late final $PartiesTable parties = $PartiesTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $PaymentMethodsTable paymentMethods = $PaymentMethodsTable(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final $InvoiceLinesTable invoiceLines = $InvoiceLinesTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $PaymentAllocationsTable paymentAllocations =
      $PaymentAllocationsTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $StockMovementsTable stockMovements = $StockMovementsTable(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final $JournalLinesTable journalLines = $JournalLinesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    businesses,
    shops,
    users,
    accounts,
    taxRates,
    parties,
    categories,
    products,
    paymentMethods,
    invoices,
    invoiceLines,
    payments,
    paymentAllocations,
    expenses,
    stockMovements,
    journalEntries,
    journalLines,
  ];
}

typedef $$BusinessesTableCreateCompanionBuilder =
    BusinessesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required String name,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> address,
      Value<String?> tin,
      Value<String?> logoPath,
      Value<String> currency,
      Value<int?> defaultTaxRateId,
    });
typedef $$BusinessesTableUpdateCompanionBuilder =
    BusinessesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<String> name,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> address,
      Value<String?> tin,
      Value<String?> logoPath,
      Value<String> currency,
      Value<int?> defaultTaxRateId,
    });

class $$BusinessesTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tin => $composableBuilder(
    column: $table.tin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultTaxRateId => $composableBuilder(
    column: $table.defaultTaxRateId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BusinessesTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tin => $composableBuilder(
    column: $table.tin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultTaxRateId => $composableBuilder(
    column: $table.defaultTaxRateId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BusinessesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get tin =>
      $composableBuilder(column: $table.tin, builder: (column) => column);

  GeneratedColumn<String> get logoPath =>
      $composableBuilder(column: $table.logoPath, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<int> get defaultTaxRateId => $composableBuilder(
    column: $table.defaultTaxRateId,
    builder: (column) => column,
  );
}

class $$BusinessesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessesTable,
          Business,
          $$BusinessesTableFilterComposer,
          $$BusinessesTableOrderingComposer,
          $$BusinessesTableAnnotationComposer,
          $$BusinessesTableCreateCompanionBuilder,
          $$BusinessesTableUpdateCompanionBuilder,
          (Business, BaseReferences<_$AppDatabase, $BusinessesTable, Business>),
          Business,
          PrefetchHooks Function()
        > {
  $$BusinessesTableTableManager(_$AppDatabase db, $BusinessesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> tin = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<int?> defaultTaxRateId = const Value.absent(),
              }) => BusinessesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                name: name,
                phone: phone,
                email: email,
                address: address,
                tin: tin,
                logoPath: logoPath,
                currency: currency,
                defaultTaxRateId: defaultTaxRateId,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> tin = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<int?> defaultTaxRateId = const Value.absent(),
              }) => BusinessesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                name: name,
                phone: phone,
                email: email,
                address: address,
                tin: tin,
                logoPath: logoPath,
                currency: currency,
                defaultTaxRateId: defaultTaxRateId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BusinessesTable, Business>(table),
                  BaseReferences<_$AppDatabase, $BusinessesTable, Business>(
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

typedef $$BusinessesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessesTable,
      Business,
      $$BusinessesTableFilterComposer,
      $$BusinessesTableOrderingComposer,
      $$BusinessesTableAnnotationComposer,
      $$BusinessesTableCreateCompanionBuilder,
      $$BusinessesTableUpdateCompanionBuilder,
      (Business, BaseReferences<_$AppDatabase, $BusinessesTable, Business>),
      Business,
      PrefetchHooks Function()
    >;
typedef $$ShopsTableCreateCompanionBuilder =
    ShopsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int businessId,
      required String name,
      Value<String?> address,
      Value<String?> phone,
      Value<bool> isActive,
    });
typedef $$ShopsTableUpdateCompanionBuilder =
    ShopsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> businessId,
      Value<String> name,
      Value<String?> address,
      Value<String?> phone,
      Value<bool> isActive,
    });

class $$ShopsTableFilterComposer extends Composer<_$AppDatabase, $ShopsTable> {
  $$ShopsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get businessId => $composableBuilder(
    column: $table.businessId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShopsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShopsTable> {
  $$ShopsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get businessId => $composableBuilder(
    column: $table.businessId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShopsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShopsTable> {
  $$ShopsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get businessId => $composableBuilder(
    column: $table.businessId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$ShopsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShopsTable,
          Shop,
          $$ShopsTableFilterComposer,
          $$ShopsTableOrderingComposer,
          $$ShopsTableAnnotationComposer,
          $$ShopsTableCreateCompanionBuilder,
          $$ShopsTableUpdateCompanionBuilder,
          (Shop, BaseReferences<_$AppDatabase, $ShopsTable, Shop>),
          Shop,
          PrefetchHooks Function()
        > {
  $$ShopsTableTableManager(_$AppDatabase db, $ShopsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> businessId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => ShopsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                businessId: businessId,
                name: name,
                address: address,
                phone: phone,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int businessId,
                required String name,
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => ShopsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                businessId: businessId,
                name: name,
                address: address,
                phone: phone,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ShopsTable, Shop>(table),
                  BaseReferences<_$AppDatabase, $ShopsTable, Shop>(
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

typedef $$ShopsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShopsTable,
      Shop,
      $$ShopsTableFilterComposer,
      $$ShopsTableOrderingComposer,
      $$ShopsTableAnnotationComposer,
      $$ShopsTableCreateCompanionBuilder,
      $$ShopsTableUpdateCompanionBuilder,
      (Shop, BaseReferences<_$AppDatabase, $ShopsTable, Shop>),
      Shop,
      PrefetchHooks Function()
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required String fullName,
      required String pinHash,
      required UserRole role,
      Value<bool> isActive,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<String> fullName,
      Value<String> pinHash,
      Value<UserRole> role,
      Value<bool> isActive,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinHash => $composableBuilder(
    column: $table.pinHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UserRole, UserRole, String> get role =>
      $composableBuilder(
        column: $table.role,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
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
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinHash => $composableBuilder(
    column: $table.pinHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get pinHash =>
      $composableBuilder(column: $table.pinHash, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UserRole, String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
          User,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> pinHash = const Value.absent(),
                Value<UserRole> role = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => UsersCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                fullName: fullName,
                pinHash: pinHash,
                role: role,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required String fullName,
                required String pinHash,
                required UserRole role,
                Value<bool> isActive = const Value.absent(),
              }) => UsersCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                fullName: fullName,
                pinHash: pinHash,
                role: role,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UsersTable, User>(table),
                  BaseReferences<_$AppDatabase, $UsersTable, User>(
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

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
      User,
      PrefetchHooks Function()
    >;
typedef $$AccountsTableCreateCompanionBuilder =
    AccountsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required String code,
      required String name,
      required AccountType accountType,
      Value<String?> subtype,
      Value<bool> isSystem,
      Value<bool> isActive,
      Value<int> openingBalance,
    });
typedef $$AccountsTableUpdateCompanionBuilder =
    AccountsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<String> code,
      Value<String> name,
      Value<AccountType> accountType,
      Value<String?> subtype,
      Value<bool> isSystem,
      Value<bool> isActive,
      Value<int> openingBalance,
    });

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AccountType, AccountType, String>
  get accountType => $composableBuilder(
    column: $table.accountType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get subtype => $composableBuilder(
    column: $table.subtype,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountType => $composableBuilder(
    column: $table.accountType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subtype => $composableBuilder(
    column: $table.subtype,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AccountType, String> get accountType =>
      $composableBuilder(
        column: $table.accountType,
        builder: (column) => column,
      );

  GeneratedColumn<String> get subtype =>
      $composableBuilder(column: $table.subtype, builder: (column) => column);

  GeneratedColumn<bool> get isSystem =>
      $composableBuilder(column: $table.isSystem, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => column,
  );
}

class $$AccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountsTable,
          Account,
          $$AccountsTableFilterComposer,
          $$AccountsTableOrderingComposer,
          $$AccountsTableAnnotationComposer,
          $$AccountsTableCreateCompanionBuilder,
          $$AccountsTableUpdateCompanionBuilder,
          (Account, BaseReferences<_$AppDatabase, $AccountsTable, Account>),
          Account,
          PrefetchHooks Function()
        > {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<AccountType> accountType = const Value.absent(),
                Value<String?> subtype = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
              }) => AccountsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                code: code,
                name: name,
                accountType: accountType,
                subtype: subtype,
                isSystem: isSystem,
                isActive: isActive,
                openingBalance: openingBalance,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required String code,
                required String name,
                required AccountType accountType,
                Value<String?> subtype = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
              }) => AccountsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                code: code,
                name: name,
                accountType: accountType,
                subtype: subtype,
                isSystem: isSystem,
                isActive: isActive,
                openingBalance: openingBalance,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AccountsTable, Account>(table),
                  BaseReferences<_$AppDatabase, $AccountsTable, Account>(
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

typedef $$AccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountsTable,
      Account,
      $$AccountsTableFilterComposer,
      $$AccountsTableOrderingComposer,
      $$AccountsTableAnnotationComposer,
      $$AccountsTableCreateCompanionBuilder,
      $$AccountsTableUpdateCompanionBuilder,
      (Account, BaseReferences<_$AppDatabase, $AccountsTable, Account>),
      Account,
      PrefetchHooks Function()
    >;
typedef $$TaxRatesTableCreateCompanionBuilder =
    TaxRatesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required String name,
      required int rateBp,
      required TaxKind taxKind,
      Value<bool> isLevy,
      Value<bool> isActive,
    });
typedef $$TaxRatesTableUpdateCompanionBuilder =
    TaxRatesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<String> name,
      Value<int> rateBp,
      Value<TaxKind> taxKind,
      Value<bool> isLevy,
      Value<bool> isActive,
    });

class $$TaxRatesTableFilterComposer
    extends Composer<_$AppDatabase, $TaxRatesTable> {
  $$TaxRatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rateBp => $composableBuilder(
    column: $table.rateBp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TaxKind, TaxKind, String> get taxKind =>
      $composableBuilder(
        column: $table.taxKind,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get isLevy => $composableBuilder(
    column: $table.isLevy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TaxRatesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaxRatesTable> {
  $$TaxRatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rateBp => $composableBuilder(
    column: $table.rateBp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxKind => $composableBuilder(
    column: $table.taxKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLevy => $composableBuilder(
    column: $table.isLevy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaxRatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaxRatesTable> {
  $$TaxRatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get rateBp =>
      $composableBuilder(column: $table.rateBp, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TaxKind, String> get taxKind =>
      $composableBuilder(column: $table.taxKind, builder: (column) => column);

  GeneratedColumn<bool> get isLevy =>
      $composableBuilder(column: $table.isLevy, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$TaxRatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaxRatesTable,
          TaxRate,
          $$TaxRatesTableFilterComposer,
          $$TaxRatesTableOrderingComposer,
          $$TaxRatesTableAnnotationComposer,
          $$TaxRatesTableCreateCompanionBuilder,
          $$TaxRatesTableUpdateCompanionBuilder,
          (TaxRate, BaseReferences<_$AppDatabase, $TaxRatesTable, TaxRate>),
          TaxRate,
          PrefetchHooks Function()
        > {
  $$TaxRatesTableTableManager(_$AppDatabase db, $TaxRatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaxRatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaxRatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaxRatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rateBp = const Value.absent(),
                Value<TaxKind> taxKind = const Value.absent(),
                Value<bool> isLevy = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => TaxRatesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                name: name,
                rateBp: rateBp,
                taxKind: taxKind,
                isLevy: isLevy,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
                required int rateBp,
                required TaxKind taxKind,
                Value<bool> isLevy = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => TaxRatesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                name: name,
                rateBp: rateBp,
                taxKind: taxKind,
                isLevy: isLevy,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TaxRatesTable, TaxRate>(table),
                  BaseReferences<_$AppDatabase, $TaxRatesTable, TaxRate>(
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

typedef $$TaxRatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaxRatesTable,
      TaxRate,
      $$TaxRatesTableFilterComposer,
      $$TaxRatesTableOrderingComposer,
      $$TaxRatesTableAnnotationComposer,
      $$TaxRatesTableCreateCompanionBuilder,
      $$TaxRatesTableUpdateCompanionBuilder,
      (TaxRate, BaseReferences<_$AppDatabase, $TaxRatesTable, TaxRate>),
      TaxRate,
      PrefetchHooks Function()
    >;
typedef $$PartiesTableCreateCompanionBuilder =
    PartiesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required PartyKind partyKind,
      required String name,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> address,
      Value<String?> tin,
      Value<int?> creditLimit,
      Value<int?> creditDays,
      Value<int> openingBalance,
    });
typedef $$PartiesTableUpdateCompanionBuilder =
    PartiesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<PartyKind> partyKind,
      Value<String> name,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> address,
      Value<String?> tin,
      Value<int?> creditLimit,
      Value<int?> creditDays,
      Value<int> openingBalance,
    });

class $$PartiesTableFilterComposer
    extends Composer<_$AppDatabase, $PartiesTable> {
  $$PartiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PartyKind, PartyKind, String> get partyKind =>
      $composableBuilder(
        column: $table.partyKind,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tin => $composableBuilder(
    column: $table.tin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get creditDays => $composableBuilder(
    column: $table.creditDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PartiesTableOrderingComposer
    extends Composer<_$AppDatabase, $PartiesTable> {
  $$PartiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partyKind => $composableBuilder(
    column: $table.partyKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tin => $composableBuilder(
    column: $table.tin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get creditDays => $composableBuilder(
    column: $table.creditDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PartiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PartiesTable> {
  $$PartiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PartyKind, String> get partyKind =>
      $composableBuilder(column: $table.partyKind, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get tin =>
      $composableBuilder(column: $table.tin, builder: (column) => column);

  GeneratedColumn<int> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get creditDays => $composableBuilder(
    column: $table.creditDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => column,
  );
}

class $$PartiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PartiesTable,
          Party,
          $$PartiesTableFilterComposer,
          $$PartiesTableOrderingComposer,
          $$PartiesTableAnnotationComposer,
          $$PartiesTableCreateCompanionBuilder,
          $$PartiesTableUpdateCompanionBuilder,
          (Party, BaseReferences<_$AppDatabase, $PartiesTable, Party>),
          Party,
          PrefetchHooks Function()
        > {
  $$PartiesTableTableManager(_$AppDatabase db, $PartiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<PartyKind> partyKind = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> tin = const Value.absent(),
                Value<int?> creditLimit = const Value.absent(),
                Value<int?> creditDays = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
              }) => PartiesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                partyKind: partyKind,
                name: name,
                phone: phone,
                email: email,
                address: address,
                tin: tin,
                creditLimit: creditLimit,
                creditDays: creditDays,
                openingBalance: openingBalance,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required PartyKind partyKind,
                required String name,
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> tin = const Value.absent(),
                Value<int?> creditLimit = const Value.absent(),
                Value<int?> creditDays = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
              }) => PartiesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                partyKind: partyKind,
                name: name,
                phone: phone,
                email: email,
                address: address,
                tin: tin,
                creditLimit: creditLimit,
                creditDays: creditDays,
                openingBalance: openingBalance,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PartiesTable, Party>(table),
                  BaseReferences<_$AppDatabase, $PartiesTable, Party>(
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

typedef $$PartiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PartiesTable,
      Party,
      $$PartiesTableFilterComposer,
      $$PartiesTableOrderingComposer,
      $$PartiesTableAnnotationComposer,
      $$PartiesTableCreateCompanionBuilder,
      $$PartiesTableUpdateCompanionBuilder,
      (Party, BaseReferences<_$AppDatabase, $PartiesTable, Party>),
      Party,
      PrefetchHooks Function()
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required String name,
      Value<int?> parentId,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<String> name,
      Value<int?> parentId,
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
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );
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
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
          Category,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
              }) => CategoriesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                name: name,
                parentId: parentId,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required String name,
                Value<int?> parentId = const Value.absent(),
              }) => CategoriesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                name: name,
                parentId: parentId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CategoriesTable, Category>(table),
                  BaseReferences<_$AppDatabase, $CategoriesTable, Category>(
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

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
      Category,
      PrefetchHooks Function()
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required String sku,
      Value<String?> barcode,
      required String name,
      Value<String?> description,
      Value<int?> categoryId,
      required String unit,
      Value<int> cost,
      Value<int> price,
      Value<int?> taxRateId,
      Value<int> stockOnHand,
      Value<int> reorderLevel,
      Value<DateTime?> expiresAt,
      Value<bool> isActive,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<String> sku,
      Value<String?> barcode,
      Value<String> name,
      Value<String?> description,
      Value<int?> categoryId,
      Value<String> unit,
      Value<int> cost,
      Value<int> price,
      Value<int?> taxRateId,
      Value<int> stockOnHand,
      Value<int> reorderLevel,
      Value<DateTime?> expiresAt,
      Value<bool> isActive,
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
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxRateId => $composableBuilder(
    column: $table.taxRateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stockOnHand => $composableBuilder(
    column: $table.stockOnHand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reorderLevel => $composableBuilder(
    column: $table.reorderLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
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
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxRateId => $composableBuilder(
    column: $table.taxRateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stockOnHand => $composableBuilder(
    column: $table.stockOnHand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reorderLevel => $composableBuilder(
    column: $table.reorderLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get taxRateId =>
      $composableBuilder(column: $table.taxRateId, builder: (column) => column);

  GeneratedColumn<int> get stockOnHand => $composableBuilder(
    column: $table.stockOnHand,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reorderLevel => $composableBuilder(
    column: $table.reorderLevel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<String> sku = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<int> cost = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<int?> taxRateId = const Value.absent(),
                Value<int> stockOnHand = const Value.absent(),
                Value<int> reorderLevel = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => ProductsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                sku: sku,
                barcode: barcode,
                name: name,
                description: description,
                categoryId: categoryId,
                unit: unit,
                cost: cost,
                price: price,
                taxRateId: taxRateId,
                stockOnHand: stockOnHand,
                reorderLevel: reorderLevel,
                expiresAt: expiresAt,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required String sku,
                Value<String?> barcode = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
                required String unit,
                Value<int> cost = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<int?> taxRateId = const Value.absent(),
                Value<int> stockOnHand = const Value.absent(),
                Value<int> reorderLevel = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => ProductsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                sku: sku,
                barcode: barcode,
                name: name,
                description: description,
                categoryId: categoryId,
                unit: unit,
                cost: cost,
                price: price,
                taxRateId: taxRateId,
                stockOnHand: stockOnHand,
                reorderLevel: reorderLevel,
                expiresAt: expiresAt,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductsTable, Product>(table),
                  BaseReferences<_$AppDatabase, $ProductsTable, Product>(
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

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
      Product,
      PrefetchHooks Function()
    >;
typedef $$PaymentMethodsTableCreateCompanionBuilder =
    PaymentMethodsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required String name,
      required int accountId,
      Value<bool> isActive,
    });
typedef $$PaymentMethodsTableUpdateCompanionBuilder =
    PaymentMethodsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<String> name,
      Value<int> accountId,
      Value<bool> isActive,
    });

class $$PaymentMethodsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentMethodsTable> {
  $$PaymentMethodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PaymentMethodsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentMethodsTable> {
  $$PaymentMethodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PaymentMethodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentMethodsTable> {
  $$PaymentMethodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$PaymentMethodsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentMethodsTable,
          PaymentMethod,
          $$PaymentMethodsTableFilterComposer,
          $$PaymentMethodsTableOrderingComposer,
          $$PaymentMethodsTableAnnotationComposer,
          $$PaymentMethodsTableCreateCompanionBuilder,
          $$PaymentMethodsTableUpdateCompanionBuilder,
          (
            PaymentMethod,
            BaseReferences<_$AppDatabase, $PaymentMethodsTable, PaymentMethod>,
          ),
          PaymentMethod,
          PrefetchHooks Function()
        > {
  $$PaymentMethodsTableTableManager(
    _$AppDatabase db,
    $PaymentMethodsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentMethodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentMethodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentMethodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => PaymentMethodsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                name: name,
                accountId: accountId,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required String name,
                required int accountId,
                Value<bool> isActive = const Value.absent(),
              }) => PaymentMethodsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                name: name,
                accountId: accountId,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PaymentMethodsTable, PaymentMethod>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $PaymentMethodsTable,
                    PaymentMethod
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PaymentMethodsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentMethodsTable,
      PaymentMethod,
      $$PaymentMethodsTableFilterComposer,
      $$PaymentMethodsTableOrderingComposer,
      $$PaymentMethodsTableAnnotationComposer,
      $$PaymentMethodsTableCreateCompanionBuilder,
      $$PaymentMethodsTableUpdateCompanionBuilder,
      (
        PaymentMethod,
        BaseReferences<_$AppDatabase, $PaymentMethodsTable, PaymentMethod>,
      ),
      PaymentMethod,
      PrefetchHooks Function()
    >;
typedef $$InvoicesTableCreateCompanionBuilder =
    InvoicesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required String number,
      required InvoiceKind invoiceKind,
      required int partyId,
      required DateTime date,
      Value<DateTime?> dueDate,
      required InvoiceStatus invoiceStatus,
      required int subtotal,
      required int discountTotal,
      required int taxTotal,
      required int total,
      Value<int> paidTotal,
      Value<String?> reference,
      Value<String?> notes,
    });
typedef $$InvoicesTableUpdateCompanionBuilder =
    InvoicesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<String> number,
      Value<InvoiceKind> invoiceKind,
      Value<int> partyId,
      Value<DateTime> date,
      Value<DateTime?> dueDate,
      Value<InvoiceStatus> invoiceStatus,
      Value<int> subtotal,
      Value<int> discountTotal,
      Value<int> taxTotal,
      Value<int> total,
      Value<int> paidTotal,
      Value<String?> reference,
      Value<String?> notes,
    });

class $$InvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<InvoiceKind, InvoiceKind, String>
  get invoiceKind => $composableBuilder(
    column: $table.invoiceKind,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get partyId => $composableBuilder(
    column: $table.partyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<InvoiceStatus, InvoiceStatus, String>
  get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxTotal => $composableBuilder(
    column: $table.taxTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paidTotal => $composableBuilder(
    column: $table.paidTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceKind => $composableBuilder(
    column: $table.invoiceKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get partyId => $composableBuilder(
    column: $table.partyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxTotal => $composableBuilder(
    column: $table.taxTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paidTotal => $composableBuilder(
    column: $table.paidTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumnWithTypeConverter<InvoiceKind, String> get invoiceKind =>
      $composableBuilder(
        column: $table.invoiceKind,
        builder: (column) => column,
      );

  GeneratedColumn<int> get partyId =>
      $composableBuilder(column: $table.partyId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<InvoiceStatus, String> get invoiceStatus =>
      $composableBuilder(
        column: $table.invoiceStatus,
        builder: (column) => column,
      );

  GeneratedColumn<int> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<int> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get taxTotal =>
      $composableBuilder(column: $table.taxTotal, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<int> get paidTotal =>
      $composableBuilder(column: $table.paidTotal, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$InvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoicesTable,
          Invoice,
          $$InvoicesTableFilterComposer,
          $$InvoicesTableOrderingComposer,
          $$InvoicesTableAnnotationComposer,
          $$InvoicesTableCreateCompanionBuilder,
          $$InvoicesTableUpdateCompanionBuilder,
          (Invoice, BaseReferences<_$AppDatabase, $InvoicesTable, Invoice>),
          Invoice,
          PrefetchHooks Function()
        > {
  $$InvoicesTableTableManager(_$AppDatabase db, $InvoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<String> number = const Value.absent(),
                Value<InvoiceKind> invoiceKind = const Value.absent(),
                Value<int> partyId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<InvoiceStatus> invoiceStatus = const Value.absent(),
                Value<int> subtotal = const Value.absent(),
                Value<int> discountTotal = const Value.absent(),
                Value<int> taxTotal = const Value.absent(),
                Value<int> total = const Value.absent(),
                Value<int> paidTotal = const Value.absent(),
                Value<String?> reference = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => InvoicesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                number: number,
                invoiceKind: invoiceKind,
                partyId: partyId,
                date: date,
                dueDate: dueDate,
                invoiceStatus: invoiceStatus,
                subtotal: subtotal,
                discountTotal: discountTotal,
                taxTotal: taxTotal,
                total: total,
                paidTotal: paidTotal,
                reference: reference,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required String number,
                required InvoiceKind invoiceKind,
                required int partyId,
                required DateTime date,
                Value<DateTime?> dueDate = const Value.absent(),
                required InvoiceStatus invoiceStatus,
                required int subtotal,
                required int discountTotal,
                required int taxTotal,
                required int total,
                Value<int> paidTotal = const Value.absent(),
                Value<String?> reference = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => InvoicesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                number: number,
                invoiceKind: invoiceKind,
                partyId: partyId,
                date: date,
                dueDate: dueDate,
                invoiceStatus: invoiceStatus,
                subtotal: subtotal,
                discountTotal: discountTotal,
                taxTotal: taxTotal,
                total: total,
                paidTotal: paidTotal,
                reference: reference,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$InvoicesTable, Invoice>(table),
                  BaseReferences<_$AppDatabase, $InvoicesTable, Invoice>(
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

typedef $$InvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoicesTable,
      Invoice,
      $$InvoicesTableFilterComposer,
      $$InvoicesTableOrderingComposer,
      $$InvoicesTableAnnotationComposer,
      $$InvoicesTableCreateCompanionBuilder,
      $$InvoicesTableUpdateCompanionBuilder,
      (Invoice, BaseReferences<_$AppDatabase, $InvoicesTable, Invoice>),
      Invoice,
      PrefetchHooks Function()
    >;
typedef $$InvoiceLinesTableCreateCompanionBuilder =
    InvoiceLinesCompanion Function({
      Value<int> id,
      required int invoiceId,
      Value<int?> productId,
      required String description,
      required int qty,
      required int unitPrice,
      Value<int> discount,
      Value<int?> taxRateId,
      required int taxAmount,
      required int lineTotal,
    });
typedef $$InvoiceLinesTableUpdateCompanionBuilder =
    InvoiceLinesCompanion Function({
      Value<int> id,
      Value<int> invoiceId,
      Value<int?> productId,
      Value<String> description,
      Value<int> qty,
      Value<int> unitPrice,
      Value<int> discount,
      Value<int?> taxRateId,
      Value<int> taxAmount,
      Value<int> lineTotal,
    });

class $$InvoiceLinesTableFilterComposer
    extends Composer<_$AppDatabase, $InvoiceLinesTable> {
  $$InvoiceLinesTableFilterComposer({
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

  ColumnFilters<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qty => $composableBuilder(
    column: $table.qty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxRateId => $composableBuilder(
    column: $table.taxRateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxAmount => $composableBuilder(
    column: $table.taxAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineTotal => $composableBuilder(
    column: $table.lineTotal,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InvoiceLinesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoiceLinesTable> {
  $$InvoiceLinesTableOrderingComposer({
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

  ColumnOrderings<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qty => $composableBuilder(
    column: $table.qty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxRateId => $composableBuilder(
    column: $table.taxRateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxAmount => $composableBuilder(
    column: $table.taxAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineTotal => $composableBuilder(
    column: $table.lineTotal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InvoiceLinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoiceLinesTable> {
  $$InvoiceLinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<int> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<int> get taxRateId =>
      $composableBuilder(column: $table.taxRateId, builder: (column) => column);

  GeneratedColumn<int> get taxAmount =>
      $composableBuilder(column: $table.taxAmount, builder: (column) => column);

  GeneratedColumn<int> get lineTotal =>
      $composableBuilder(column: $table.lineTotal, builder: (column) => column);
}

class $$InvoiceLinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoiceLinesTable,
          InvoiceLine,
          $$InvoiceLinesTableFilterComposer,
          $$InvoiceLinesTableOrderingComposer,
          $$InvoiceLinesTableAnnotationComposer,
          $$InvoiceLinesTableCreateCompanionBuilder,
          $$InvoiceLinesTableUpdateCompanionBuilder,
          (
            InvoiceLine,
            BaseReferences<_$AppDatabase, $InvoiceLinesTable, InvoiceLine>,
          ),
          InvoiceLine,
          PrefetchHooks Function()
        > {
  $$InvoiceLinesTableTableManager(_$AppDatabase db, $InvoiceLinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceLinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoiceLinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoiceLinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> invoiceId = const Value.absent(),
                Value<int?> productId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> qty = const Value.absent(),
                Value<int> unitPrice = const Value.absent(),
                Value<int> discount = const Value.absent(),
                Value<int?> taxRateId = const Value.absent(),
                Value<int> taxAmount = const Value.absent(),
                Value<int> lineTotal = const Value.absent(),
              }) => InvoiceLinesCompanion(
                id: id,
                invoiceId: invoiceId,
                productId: productId,
                description: description,
                qty: qty,
                unitPrice: unitPrice,
                discount: discount,
                taxRateId: taxRateId,
                taxAmount: taxAmount,
                lineTotal: lineTotal,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int invoiceId,
                Value<int?> productId = const Value.absent(),
                required String description,
                required int qty,
                required int unitPrice,
                Value<int> discount = const Value.absent(),
                Value<int?> taxRateId = const Value.absent(),
                required int taxAmount,
                required int lineTotal,
              }) => InvoiceLinesCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                productId: productId,
                description: description,
                qty: qty,
                unitPrice: unitPrice,
                discount: discount,
                taxRateId: taxRateId,
                taxAmount: taxAmount,
                lineTotal: lineTotal,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$InvoiceLinesTable, InvoiceLine>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $InvoiceLinesTable,
                    InvoiceLine
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InvoiceLinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoiceLinesTable,
      InvoiceLine,
      $$InvoiceLinesTableFilterComposer,
      $$InvoiceLinesTableOrderingComposer,
      $$InvoiceLinesTableAnnotationComposer,
      $$InvoiceLinesTableCreateCompanionBuilder,
      $$InvoiceLinesTableUpdateCompanionBuilder,
      (
        InvoiceLine,
        BaseReferences<_$AppDatabase, $InvoiceLinesTable, InvoiceLine>,
      ),
      InvoiceLine,
      PrefetchHooks Function()
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required String number,
      required PaymentDirection direction,
      required int partyId,
      required DateTime date,
      required int methodId,
      required int amount,
      Value<String?> reference,
      Value<String?> notes,
    });
typedef $$PaymentsTableUpdateCompanionBuilder =
    PaymentsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<String> number,
      Value<PaymentDirection> direction,
      Value<int> partyId,
      Value<DateTime> date,
      Value<int> methodId,
      Value<int> amount,
      Value<String?> reference,
      Value<String?> notes,
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
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PaymentDirection, PaymentDirection, String>
  get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get partyId => $composableBuilder(
    column: $table.partyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get methodId => $composableBuilder(
    column: $table.methodId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
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
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get partyId => $composableBuilder(
    column: $table.partyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get methodId => $composableBuilder(
    column: $table.methodId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PaymentDirection, String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<int> get partyId =>
      $composableBuilder(column: $table.partyId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get methodId =>
      $composableBuilder(column: $table.methodId, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$PaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTable,
          Payment,
          $$PaymentsTableFilterComposer,
          $$PaymentsTableOrderingComposer,
          $$PaymentsTableAnnotationComposer,
          $$PaymentsTableCreateCompanionBuilder,
          $$PaymentsTableUpdateCompanionBuilder,
          (Payment, BaseReferences<_$AppDatabase, $PaymentsTable, Payment>),
          Payment,
          PrefetchHooks Function()
        > {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<String> number = const Value.absent(),
                Value<PaymentDirection> direction = const Value.absent(),
                Value<int> partyId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> methodId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String?> reference = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => PaymentsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                number: number,
                direction: direction,
                partyId: partyId,
                date: date,
                methodId: methodId,
                amount: amount,
                reference: reference,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required String number,
                required PaymentDirection direction,
                required int partyId,
                required DateTime date,
                required int methodId,
                required int amount,
                Value<String?> reference = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => PaymentsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                number: number,
                direction: direction,
                partyId: partyId,
                date: date,
                methodId: methodId,
                amount: amount,
                reference: reference,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PaymentsTable, Payment>(table),
                  BaseReferences<_$AppDatabase, $PaymentsTable, Payment>(
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

typedef $$PaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTable,
      Payment,
      $$PaymentsTableFilterComposer,
      $$PaymentsTableOrderingComposer,
      $$PaymentsTableAnnotationComposer,
      $$PaymentsTableCreateCompanionBuilder,
      $$PaymentsTableUpdateCompanionBuilder,
      (Payment, BaseReferences<_$AppDatabase, $PaymentsTable, Payment>),
      Payment,
      PrefetchHooks Function()
    >;
typedef $$PaymentAllocationsTableCreateCompanionBuilder =
    PaymentAllocationsCompanion Function({
      Value<int> id,
      required int paymentId,
      required int invoiceId,
      required int amount,
    });
typedef $$PaymentAllocationsTableUpdateCompanionBuilder =
    PaymentAllocationsCompanion Function({
      Value<int> id,
      Value<int> paymentId,
      Value<int> invoiceId,
      Value<int> amount,
    });

class $$PaymentAllocationsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableFilterComposer({
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

  ColumnFilters<int> get paymentId => $composableBuilder(
    column: $table.paymentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PaymentAllocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableOrderingComposer({
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

  ColumnOrderings<int> get paymentId => $composableBuilder(
    column: $table.paymentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PaymentAllocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get paymentId =>
      $composableBuilder(column: $table.paymentId, builder: (column) => column);

  GeneratedColumn<int> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);
}

class $$PaymentAllocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentAllocationsTable,
          PaymentAllocation,
          $$PaymentAllocationsTableFilterComposer,
          $$PaymentAllocationsTableOrderingComposer,
          $$PaymentAllocationsTableAnnotationComposer,
          $$PaymentAllocationsTableCreateCompanionBuilder,
          $$PaymentAllocationsTableUpdateCompanionBuilder,
          (
            PaymentAllocation,
            BaseReferences<
              _$AppDatabase,
              $PaymentAllocationsTable,
              PaymentAllocation
            >,
          ),
          PaymentAllocation,
          PrefetchHooks Function()
        > {
  $$PaymentAllocationsTableTableManager(
    _$AppDatabase db,
    $PaymentAllocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentAllocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentAllocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentAllocationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> paymentId = const Value.absent(),
                Value<int> invoiceId = const Value.absent(),
                Value<int> amount = const Value.absent(),
              }) => PaymentAllocationsCompanion(
                id: id,
                paymentId: paymentId,
                invoiceId: invoiceId,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int paymentId,
                required int invoiceId,
                required int amount,
              }) => PaymentAllocationsCompanion.insert(
                id: id,
                paymentId: paymentId,
                invoiceId: invoiceId,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PaymentAllocationsTable, PaymentAllocation>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $PaymentAllocationsTable,
                    PaymentAllocation
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PaymentAllocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentAllocationsTable,
      PaymentAllocation,
      $$PaymentAllocationsTableFilterComposer,
      $$PaymentAllocationsTableOrderingComposer,
      $$PaymentAllocationsTableAnnotationComposer,
      $$PaymentAllocationsTableCreateCompanionBuilder,
      $$PaymentAllocationsTableUpdateCompanionBuilder,
      (
        PaymentAllocation,
        BaseReferences<
          _$AppDatabase,
          $PaymentAllocationsTable,
          PaymentAllocation
        >,
      ),
      PaymentAllocation,
      PrefetchHooks Function()
    >;
typedef $$ExpensesTableCreateCompanionBuilder =
    ExpensesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required DateTime date,
      required int accountId,
      Value<int?> supplierId,
      required int amount,
      Value<int> taxInput,
      Value<int?> methodId,
      Value<String?> notes,
    });
typedef $$ExpensesTableUpdateCompanionBuilder =
    ExpensesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<DateTime> date,
      Value<int> accountId,
      Value<int?> supplierId,
      Value<int> amount,
      Value<int> taxInput,
      Value<int?> methodId,
      Value<String?> notes,
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
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxInput => $composableBuilder(
    column: $table.taxInput,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get methodId => $composableBuilder(
    column: $table.methodId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
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
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxInput => $composableBuilder(
    column: $table.taxInput,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get methodId => $composableBuilder(
    column: $table.methodId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get taxInput =>
      $composableBuilder(column: $table.taxInput, builder: (column) => column);

  GeneratedColumn<int> get methodId =>
      $composableBuilder(column: $table.methodId, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpensesTable,
          Expense,
          $$ExpensesTableFilterComposer,
          $$ExpensesTableOrderingComposer,
          $$ExpensesTableAnnotationComposer,
          $$ExpensesTableCreateCompanionBuilder,
          $$ExpensesTableUpdateCompanionBuilder,
          (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
          Expense,
          PrefetchHooks Function()
        > {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int?> supplierId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> taxInput = const Value.absent(),
                Value<int?> methodId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => ExpensesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                date: date,
                accountId: accountId,
                supplierId: supplierId,
                amount: amount,
                taxInput: taxInput,
                methodId: methodId,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required DateTime date,
                required int accountId,
                Value<int?> supplierId = const Value.absent(),
                required int amount,
                Value<int> taxInput = const Value.absent(),
                Value<int?> methodId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => ExpensesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                date: date,
                accountId: accountId,
                supplierId: supplierId,
                amount: amount,
                taxInput: taxInput,
                methodId: methodId,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExpensesTable, Expense>(table),
                  BaseReferences<_$AppDatabase, $ExpensesTable, Expense>(
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

typedef $$ExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpensesTable,
      Expense,
      $$ExpensesTableFilterComposer,
      $$ExpensesTableOrderingComposer,
      $$ExpensesTableAnnotationComposer,
      $$ExpensesTableCreateCompanionBuilder,
      $$ExpensesTableUpdateCompanionBuilder,
      (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
      Expense,
      PrefetchHooks Function()
    >;
typedef $$StockMovementsTableCreateCompanionBuilder =
    StockMovementsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required int productId,
      required DateTime date,
      required StockMovementType movementType,
      required int deltaQty,
      required int unitCost,
      required String refType,
      Value<int?> refId,
      Value<String?> note,
    });
typedef $$StockMovementsTableUpdateCompanionBuilder =
    StockMovementsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<int> productId,
      Value<DateTime> date,
      Value<StockMovementType> movementType,
      Value<int> deltaQty,
      Value<int> unitCost,
      Value<String> refType,
      Value<int?> refId,
      Value<String?> note,
    });

class $$StockMovementsTableFilterComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<StockMovementType, StockMovementType, String>
  get movementType => $composableBuilder(
    column: $table.movementType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get deltaQty => $composableBuilder(
    column: $table.deltaQty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitCost => $composableBuilder(
    column: $table.unitCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refType => $composableBuilder(
    column: $table.refType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StockMovementsTableOrderingComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get movementType => $composableBuilder(
    column: $table.movementType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deltaQty => $composableBuilder(
    column: $table.deltaQty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitCost => $composableBuilder(
    column: $table.unitCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refType => $composableBuilder(
    column: $table.refType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StockMovementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumnWithTypeConverter<StockMovementType, String>
  get movementType => $composableBuilder(
    column: $table.movementType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get deltaQty =>
      $composableBuilder(column: $table.deltaQty, builder: (column) => column);

  GeneratedColumn<int> get unitCost =>
      $composableBuilder(column: $table.unitCost, builder: (column) => column);

  GeneratedColumn<String> get refType =>
      $composableBuilder(column: $table.refType, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$StockMovementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StockMovementsTable,
          StockMovement,
          $$StockMovementsTableFilterComposer,
          $$StockMovementsTableOrderingComposer,
          $$StockMovementsTableAnnotationComposer,
          $$StockMovementsTableCreateCompanionBuilder,
          $$StockMovementsTableUpdateCompanionBuilder,
          (
            StockMovement,
            BaseReferences<_$AppDatabase, $StockMovementsTable, StockMovement>,
          ),
          StockMovement,
          PrefetchHooks Function()
        > {
  $$StockMovementsTableTableManager(
    _$AppDatabase db,
    $StockMovementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockMovementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockMovementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockMovementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<StockMovementType> movementType = const Value.absent(),
                Value<int> deltaQty = const Value.absent(),
                Value<int> unitCost = const Value.absent(),
                Value<String> refType = const Value.absent(),
                Value<int?> refId = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => StockMovementsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                productId: productId,
                date: date,
                movementType: movementType,
                deltaQty: deltaQty,
                unitCost: unitCost,
                refType: refType,
                refId: refId,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required int productId,
                required DateTime date,
                required StockMovementType movementType,
                required int deltaQty,
                required int unitCost,
                required String refType,
                Value<int?> refId = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => StockMovementsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                productId: productId,
                date: date,
                movementType: movementType,
                deltaQty: deltaQty,
                unitCost: unitCost,
                refType: refType,
                refId: refId,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StockMovementsTable, StockMovement>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $StockMovementsTable,
                    StockMovement
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StockMovementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StockMovementsTable,
      StockMovement,
      $$StockMovementsTableFilterComposer,
      $$StockMovementsTableOrderingComposer,
      $$StockMovementsTableAnnotationComposer,
      $$StockMovementsTableCreateCompanionBuilder,
      $$StockMovementsTableUpdateCompanionBuilder,
      (
        StockMovement,
        BaseReferences<_$AppDatabase, $StockMovementsTable, StockMovement>,
      ),
      StockMovement,
      PrefetchHooks Function()
    >;
typedef $$JournalEntriesTableCreateCompanionBuilder =
    JournalEntriesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      required int shopId,
      required String number,
      required DateTime date,
      required String memo,
      required String refType,
      Value<int?> refId,
      required JournalStatus journalStatus,
    });
typedef $$JournalEntriesTableUpdateCompanionBuilder =
    JournalEntriesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<int> shopId,
      Value<String> number,
      Value<DateTime> date,
      Value<String> memo,
      Value<String> refType,
      Value<int?> refId,
      Value<JournalStatus> journalStatus,
    });

class $$JournalEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refType => $composableBuilder(
    column: $table.refType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<JournalStatus, JournalStatus, String>
  get journalStatus => $composableBuilder(
    column: $table.journalStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$JournalEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shopId => $composableBuilder(
    column: $table.shopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refType => $composableBuilder(
    column: $table.refType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get journalStatus => $composableBuilder(
    column: $table.journalStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JournalEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shopId =>
      $composableBuilder(column: $table.shopId, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<String> get refType =>
      $composableBuilder(column: $table.refType, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<JournalStatus, String> get journalStatus =>
      $composableBuilder(
        column: $table.journalStatus,
        builder: (column) => column,
      );
}

class $$JournalEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalEntriesTable,
          JournalEntry,
          $$JournalEntriesTableFilterComposer,
          $$JournalEntriesTableOrderingComposer,
          $$JournalEntriesTableAnnotationComposer,
          $$JournalEntriesTableCreateCompanionBuilder,
          $$JournalEntriesTableUpdateCompanionBuilder,
          (
            JournalEntry,
            BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntry>,
          ),
          JournalEntry,
          PrefetchHooks Function()
        > {
  $$JournalEntriesTableTableManager(
    _$AppDatabase db,
    $JournalEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<String> number = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> memo = const Value.absent(),
                Value<String> refType = const Value.absent(),
                Value<int?> refId = const Value.absent(),
                Value<JournalStatus> journalStatus = const Value.absent(),
              }) => JournalEntriesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                number: number,
                date: date,
                memo: memo,
                refType: refType,
                refId: refId,
                journalStatus: journalStatus,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int shopId,
                required String number,
                required DateTime date,
                required String memo,
                required String refType,
                Value<int?> refId = const Value.absent(),
                required JournalStatus journalStatus,
              }) => JournalEntriesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                shopId: shopId,
                number: number,
                date: date,
                memo: memo,
                refType: refType,
                refId: refId,
                journalStatus: journalStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$JournalEntriesTable, JournalEntry>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $JournalEntriesTable,
                    JournalEntry
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JournalEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalEntriesTable,
      JournalEntry,
      $$JournalEntriesTableFilterComposer,
      $$JournalEntriesTableOrderingComposer,
      $$JournalEntriesTableAnnotationComposer,
      $$JournalEntriesTableCreateCompanionBuilder,
      $$JournalEntriesTableUpdateCompanionBuilder,
      (
        JournalEntry,
        BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntry>,
      ),
      JournalEntry,
      PrefetchHooks Function()
    >;
typedef $$JournalLinesTableCreateCompanionBuilder =
    JournalLinesCompanion Function({
      Value<int> id,
      required int entryId,
      required int accountId,
      Value<int> debit,
      Value<int> credit,
    });
typedef $$JournalLinesTableUpdateCompanionBuilder =
    JournalLinesCompanion Function({
      Value<int> id,
      Value<int> entryId,
      Value<int> accountId,
      Value<int> debit,
      Value<int> credit,
    });

class $$JournalLinesTableFilterComposer
    extends Composer<_$AppDatabase, $JournalLinesTable> {
  $$JournalLinesTableFilterComposer({
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

  ColumnFilters<int> get entryId => $composableBuilder(
    column: $table.entryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get debit => $composableBuilder(
    column: $table.debit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get credit => $composableBuilder(
    column: $table.credit,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JournalLinesTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalLinesTable> {
  $$JournalLinesTableOrderingComposer({
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

  ColumnOrderings<int> get entryId => $composableBuilder(
    column: $table.entryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get debit => $composableBuilder(
    column: $table.debit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get credit => $composableBuilder(
    column: $table.credit,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JournalLinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalLinesTable> {
  $$JournalLinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get entryId =>
      $composableBuilder(column: $table.entryId, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get debit =>
      $composableBuilder(column: $table.debit, builder: (column) => column);

  GeneratedColumn<int> get credit =>
      $composableBuilder(column: $table.credit, builder: (column) => column);
}

class $$JournalLinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalLinesTable,
          JournalLine,
          $$JournalLinesTableFilterComposer,
          $$JournalLinesTableOrderingComposer,
          $$JournalLinesTableAnnotationComposer,
          $$JournalLinesTableCreateCompanionBuilder,
          $$JournalLinesTableUpdateCompanionBuilder,
          (
            JournalLine,
            BaseReferences<_$AppDatabase, $JournalLinesTable, JournalLine>,
          ),
          JournalLine,
          PrefetchHooks Function()
        > {
  $$JournalLinesTableTableManager(_$AppDatabase db, $JournalLinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalLinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalLinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalLinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> entryId = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int> debit = const Value.absent(),
                Value<int> credit = const Value.absent(),
              }) => JournalLinesCompanion(
                id: id,
                entryId: entryId,
                accountId: accountId,
                debit: debit,
                credit: credit,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int entryId,
                required int accountId,
                Value<int> debit = const Value.absent(),
                Value<int> credit = const Value.absent(),
              }) => JournalLinesCompanion.insert(
                id: id,
                entryId: entryId,
                accountId: accountId,
                debit: debit,
                credit: credit,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$JournalLinesTable, JournalLine>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $JournalLinesTable,
                    JournalLine
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JournalLinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalLinesTable,
      JournalLine,
      $$JournalLinesTableFilterComposer,
      $$JournalLinesTableOrderingComposer,
      $$JournalLinesTableAnnotationComposer,
      $$JournalLinesTableCreateCompanionBuilder,
      $$JournalLinesTableUpdateCompanionBuilder,
      (
        JournalLine,
        BaseReferences<_$AppDatabase, $JournalLinesTable, JournalLine>,
      ),
      JournalLine,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BusinessesTableTableManager get businesses =>
      $$BusinessesTableTableManager(_db, _db.businesses);
  $$ShopsTableTableManager get shops =>
      $$ShopsTableTableManager(_db, _db.shops);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$TaxRatesTableTableManager get taxRates =>
      $$TaxRatesTableTableManager(_db, _db.taxRates);
  $$PartiesTableTableManager get parties =>
      $$PartiesTableTableManager(_db, _db.parties);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$PaymentMethodsTableTableManager get paymentMethods =>
      $$PaymentMethodsTableTableManager(_db, _db.paymentMethods);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
  $$InvoiceLinesTableTableManager get invoiceLines =>
      $$InvoiceLinesTableTableManager(_db, _db.invoiceLines);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$PaymentAllocationsTableTableManager get paymentAllocations =>
      $$PaymentAllocationsTableTableManager(_db, _db.paymentAllocations);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$StockMovementsTableTableManager get stockMovements =>
      $$StockMovementsTableTableManager(_db, _db.stockMovements);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
  $$JournalLinesTableTableManager get journalLines =>
      $$JournalLinesTableTableManager(_db, _db.journalLines);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CompanyEntitiesTable extends CompanyEntities
    with TableInfo<$CompanyEntitiesTable, CompanyEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompanyEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _abbrMeta = const VerificationMeta('abbr');
  @override
  late final GeneratedColumn<String> abbr = GeneratedColumn<String>(
      'abbr', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _industryMeta =
      const VerificationMeta('industry');
  @override
  late final GeneratedColumn<String> industry = GeneratedColumn<String>(
      'industry', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _establishmentDateMeta =
      const VerificationMeta('establishmentDate');
  @override
  late final GeneratedColumn<String> establishmentDate =
      GeneratedColumn<String>('establishment_date', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _listedDateMeta =
      const VerificationMeta('listedDate');
  @override
  late final GeneratedColumn<String> listedDate = GeneratedColumn<String>(
      'listed_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _chairmanMeta =
      const VerificationMeta('chairman');
  @override
  late final GeneratedColumn<String> chairman = GeneratedColumn<String>(
      'chairman', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _generalManagerMeta =
      const VerificationMeta('generalManager');
  @override
  late final GeneratedColumn<String> generalManager = GeneratedColumn<String>(
      'general_manager', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _switchboardPhoneMeta =
      const VerificationMeta('switchboardPhone');
  @override
  late final GeneratedColumn<String> switchboardPhone = GeneratedColumn<String>(
      'switchboard_phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _unifiedNumberMeta =
      const VerificationMeta('unifiedNumber');
  @override
  late final GeneratedColumn<String> unifiedNumber = GeneratedColumn<String>(
      'unified_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _paidInCapitalMeta =
      const VerificationMeta('paidInCapital');
  @override
  late final GeneratedColumn<String> paidInCapital = GeneratedColumn<String>(
      'paid_in_capital', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _specialStockMeta =
      const VerificationMeta('specialStock');
  @override
  late final GeneratedColumn<String> specialStock = GeneratedColumn<String>(
      'special_stock', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _parValueMeta =
      const VerificationMeta('parValue');
  @override
  late final GeneratedColumn<String> parValue = GeneratedColumn<String>(
      'par_value', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        abbr,
        industry,
        establishmentDate,
        listedDate,
        chairman,
        generalManager,
        switchboardPhone,
        address,
        unifiedNumber,
        paidInCapital,
        specialStock,
        parValue,
        url
      ];
  @override
  String get aliasedName => _alias ?? 'company_entities';
  @override
  String get actualTableName => 'company_entities';
  @override
  VerificationContext validateIntegrity(Insertable<CompanyEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('abbr')) {
      context.handle(
          _abbrMeta, abbr.isAcceptableOrUnknown(data['abbr']!, _abbrMeta));
    }
    if (data.containsKey('industry')) {
      context.handle(_industryMeta,
          industry.isAcceptableOrUnknown(data['industry']!, _industryMeta));
    }
    if (data.containsKey('establishment_date')) {
      context.handle(
          _establishmentDateMeta,
          establishmentDate.isAcceptableOrUnknown(
              data['establishment_date']!, _establishmentDateMeta));
    }
    if (data.containsKey('listed_date')) {
      context.handle(
          _listedDateMeta,
          listedDate.isAcceptableOrUnknown(
              data['listed_date']!, _listedDateMeta));
    }
    if (data.containsKey('chairman')) {
      context.handle(_chairmanMeta,
          chairman.isAcceptableOrUnknown(data['chairman']!, _chairmanMeta));
    }
    if (data.containsKey('general_manager')) {
      context.handle(
          _generalManagerMeta,
          generalManager.isAcceptableOrUnknown(
              data['general_manager']!, _generalManagerMeta));
    }
    if (data.containsKey('switchboard_phone')) {
      context.handle(
          _switchboardPhoneMeta,
          switchboardPhone.isAcceptableOrUnknown(
              data['switchboard_phone']!, _switchboardPhoneMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('unified_number')) {
      context.handle(
          _unifiedNumberMeta,
          unifiedNumber.isAcceptableOrUnknown(
              data['unified_number']!, _unifiedNumberMeta));
    }
    if (data.containsKey('paid_in_capital')) {
      context.handle(
          _paidInCapitalMeta,
          paidInCapital.isAcceptableOrUnknown(
              data['paid_in_capital']!, _paidInCapitalMeta));
    }
    if (data.containsKey('special_stock')) {
      context.handle(
          _specialStockMeta,
          specialStock.isAcceptableOrUnknown(
              data['special_stock']!, _specialStockMeta));
    }
    if (data.containsKey('par_value')) {
      context.handle(_parValueMeta,
          parValue.isAcceptableOrUnknown(data['par_value']!, _parValueMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompanyEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanyEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      abbr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}abbr']),
      industry: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}industry']),
      establishmentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}establishment_date']),
      listedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}listed_date']),
      chairman: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chairman']),
      generalManager: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}general_manager']),
      switchboardPhone: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}switchboard_phone']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      unifiedNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unified_number']),
      paidInCapital: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}paid_in_capital']),
      specialStock: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}special_stock']),
      parValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}par_value']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
    );
  }

  @override
  $CompanyEntitiesTable createAlias(String alias) {
    return $CompanyEntitiesTable(attachedDatabase, alias);
  }
}

class CompanyEntity extends DataClass implements Insertable<CompanyEntity> {
  final String? id;
  final String? name;
  final String? abbr;
  final String? industry;
  final String? establishmentDate;
  final String? listedDate;
  final String? chairman;
  final String? generalManager;
  final String? switchboardPhone;
  final String? address;
  final String? unifiedNumber;
  final String? paidInCapital;
  final String? specialStock;
  final String? parValue;
  final String? url;
  const CompanyEntity(
      {this.id,
      this.name,
      this.abbr,
      this.industry,
      this.establishmentDate,
      this.listedDate,
      this.chairman,
      this.generalManager,
      this.switchboardPhone,
      this.address,
      this.unifiedNumber,
      this.paidInCapital,
      this.specialStock,
      this.parValue,
      this.url});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || abbr != null) {
      map['abbr'] = Variable<String>(abbr);
    }
    if (!nullToAbsent || industry != null) {
      map['industry'] = Variable<String>(industry);
    }
    if (!nullToAbsent || establishmentDate != null) {
      map['establishment_date'] = Variable<String>(establishmentDate);
    }
    if (!nullToAbsent || listedDate != null) {
      map['listed_date'] = Variable<String>(listedDate);
    }
    if (!nullToAbsent || chairman != null) {
      map['chairman'] = Variable<String>(chairman);
    }
    if (!nullToAbsent || generalManager != null) {
      map['general_manager'] = Variable<String>(generalManager);
    }
    if (!nullToAbsent || switchboardPhone != null) {
      map['switchboard_phone'] = Variable<String>(switchboardPhone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || unifiedNumber != null) {
      map['unified_number'] = Variable<String>(unifiedNumber);
    }
    if (!nullToAbsent || paidInCapital != null) {
      map['paid_in_capital'] = Variable<String>(paidInCapital);
    }
    if (!nullToAbsent || specialStock != null) {
      map['special_stock'] = Variable<String>(specialStock);
    }
    if (!nullToAbsent || parValue != null) {
      map['par_value'] = Variable<String>(parValue);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  CompanyEntitiesCompanion toCompanion(bool nullToAbsent) {
    return CompanyEntitiesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      abbr: abbr == null && nullToAbsent ? const Value.absent() : Value(abbr),
      industry: industry == null && nullToAbsent
          ? const Value.absent()
          : Value(industry),
      establishmentDate: establishmentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(establishmentDate),
      listedDate: listedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(listedDate),
      chairman: chairman == null && nullToAbsent
          ? const Value.absent()
          : Value(chairman),
      generalManager: generalManager == null && nullToAbsent
          ? const Value.absent()
          : Value(generalManager),
      switchboardPhone: switchboardPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(switchboardPhone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      unifiedNumber: unifiedNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(unifiedNumber),
      paidInCapital: paidInCapital == null && nullToAbsent
          ? const Value.absent()
          : Value(paidInCapital),
      specialStock: specialStock == null && nullToAbsent
          ? const Value.absent()
          : Value(specialStock),
      parValue: parValue == null && nullToAbsent
          ? const Value.absent()
          : Value(parValue),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory CompanyEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanyEntity(
      id: serializer.fromJson<String?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      abbr: serializer.fromJson<String?>(json['abbr']),
      industry: serializer.fromJson<String?>(json['industry']),
      establishmentDate:
          serializer.fromJson<String?>(json['establishmentDate']),
      listedDate: serializer.fromJson<String?>(json['listedDate']),
      chairman: serializer.fromJson<String?>(json['chairman']),
      generalManager: serializer.fromJson<String?>(json['generalManager']),
      switchboardPhone: serializer.fromJson<String?>(json['switchboardPhone']),
      address: serializer.fromJson<String?>(json['address']),
      unifiedNumber: serializer.fromJson<String?>(json['unifiedNumber']),
      paidInCapital: serializer.fromJson<String?>(json['paidInCapital']),
      specialStock: serializer.fromJson<String?>(json['specialStock']),
      parValue: serializer.fromJson<String?>(json['parValue']),
      url: serializer.fromJson<String?>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'name': serializer.toJson<String?>(name),
      'abbr': serializer.toJson<String?>(abbr),
      'industry': serializer.toJson<String?>(industry),
      'establishmentDate': serializer.toJson<String?>(establishmentDate),
      'listedDate': serializer.toJson<String?>(listedDate),
      'chairman': serializer.toJson<String?>(chairman),
      'generalManager': serializer.toJson<String?>(generalManager),
      'switchboardPhone': serializer.toJson<String?>(switchboardPhone),
      'address': serializer.toJson<String?>(address),
      'unifiedNumber': serializer.toJson<String?>(unifiedNumber),
      'paidInCapital': serializer.toJson<String?>(paidInCapital),
      'specialStock': serializer.toJson<String?>(specialStock),
      'parValue': serializer.toJson<String?>(parValue),
      'url': serializer.toJson<String?>(url),
    };
  }

  CompanyEntity copyWith(
          {Value<String?> id = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> abbr = const Value.absent(),
          Value<String?> industry = const Value.absent(),
          Value<String?> establishmentDate = const Value.absent(),
          Value<String?> listedDate = const Value.absent(),
          Value<String?> chairman = const Value.absent(),
          Value<String?> generalManager = const Value.absent(),
          Value<String?> switchboardPhone = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> unifiedNumber = const Value.absent(),
          Value<String?> paidInCapital = const Value.absent(),
          Value<String?> specialStock = const Value.absent(),
          Value<String?> parValue = const Value.absent(),
          Value<String?> url = const Value.absent()}) =>
      CompanyEntity(
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
        abbr: abbr.present ? abbr.value : this.abbr,
        industry: industry.present ? industry.value : this.industry,
        establishmentDate: establishmentDate.present
            ? establishmentDate.value
            : this.establishmentDate,
        listedDate: listedDate.present ? listedDate.value : this.listedDate,
        chairman: chairman.present ? chairman.value : this.chairman,
        generalManager:
            generalManager.present ? generalManager.value : this.generalManager,
        switchboardPhone: switchboardPhone.present
            ? switchboardPhone.value
            : this.switchboardPhone,
        address: address.present ? address.value : this.address,
        unifiedNumber:
            unifiedNumber.present ? unifiedNumber.value : this.unifiedNumber,
        paidInCapital:
            paidInCapital.present ? paidInCapital.value : this.paidInCapital,
        specialStock:
            specialStock.present ? specialStock.value : this.specialStock,
        parValue: parValue.present ? parValue.value : this.parValue,
        url: url.present ? url.value : this.url,
      );
  @override
  String toString() {
    return (StringBuffer('CompanyEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('abbr: $abbr, ')
          ..write('industry: $industry, ')
          ..write('establishmentDate: $establishmentDate, ')
          ..write('listedDate: $listedDate, ')
          ..write('chairman: $chairman, ')
          ..write('generalManager: $generalManager, ')
          ..write('switchboardPhone: $switchboardPhone, ')
          ..write('address: $address, ')
          ..write('unifiedNumber: $unifiedNumber, ')
          ..write('paidInCapital: $paidInCapital, ')
          ..write('specialStock: $specialStock, ')
          ..write('parValue: $parValue, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      abbr,
      industry,
      establishmentDate,
      listedDate,
      chairman,
      generalManager,
      switchboardPhone,
      address,
      unifiedNumber,
      paidInCapital,
      specialStock,
      parValue,
      url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.abbr == this.abbr &&
          other.industry == this.industry &&
          other.establishmentDate == this.establishmentDate &&
          other.listedDate == this.listedDate &&
          other.chairman == this.chairman &&
          other.generalManager == this.generalManager &&
          other.switchboardPhone == this.switchboardPhone &&
          other.address == this.address &&
          other.unifiedNumber == this.unifiedNumber &&
          other.paidInCapital == this.paidInCapital &&
          other.specialStock == this.specialStock &&
          other.parValue == this.parValue &&
          other.url == this.url);
}

class CompanyEntitiesCompanion extends UpdateCompanion<CompanyEntity> {
  final Value<String?> id;
  final Value<String?> name;
  final Value<String?> abbr;
  final Value<String?> industry;
  final Value<String?> establishmentDate;
  final Value<String?> listedDate;
  final Value<String?> chairman;
  final Value<String?> generalManager;
  final Value<String?> switchboardPhone;
  final Value<String?> address;
  final Value<String?> unifiedNumber;
  final Value<String?> paidInCapital;
  final Value<String?> specialStock;
  final Value<String?> parValue;
  final Value<String?> url;
  final Value<int> rowid;
  const CompanyEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.abbr = const Value.absent(),
    this.industry = const Value.absent(),
    this.establishmentDate = const Value.absent(),
    this.listedDate = const Value.absent(),
    this.chairman = const Value.absent(),
    this.generalManager = const Value.absent(),
    this.switchboardPhone = const Value.absent(),
    this.address = const Value.absent(),
    this.unifiedNumber = const Value.absent(),
    this.paidInCapital = const Value.absent(),
    this.specialStock = const Value.absent(),
    this.parValue = const Value.absent(),
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompanyEntitiesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.abbr = const Value.absent(),
    this.industry = const Value.absent(),
    this.establishmentDate = const Value.absent(),
    this.listedDate = const Value.absent(),
    this.chairman = const Value.absent(),
    this.generalManager = const Value.absent(),
    this.switchboardPhone = const Value.absent(),
    this.address = const Value.absent(),
    this.unifiedNumber = const Value.absent(),
    this.paidInCapital = const Value.absent(),
    this.specialStock = const Value.absent(),
    this.parValue = const Value.absent(),
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<CompanyEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? abbr,
    Expression<String>? industry,
    Expression<String>? establishmentDate,
    Expression<String>? listedDate,
    Expression<String>? chairman,
    Expression<String>? generalManager,
    Expression<String>? switchboardPhone,
    Expression<String>? address,
    Expression<String>? unifiedNumber,
    Expression<String>? paidInCapital,
    Expression<String>? specialStock,
    Expression<String>? parValue,
    Expression<String>? url,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (abbr != null) 'abbr': abbr,
      if (industry != null) 'industry': industry,
      if (establishmentDate != null) 'establishment_date': establishmentDate,
      if (listedDate != null) 'listed_date': listedDate,
      if (chairman != null) 'chairman': chairman,
      if (generalManager != null) 'general_manager': generalManager,
      if (switchboardPhone != null) 'switchboard_phone': switchboardPhone,
      if (address != null) 'address': address,
      if (unifiedNumber != null) 'unified_number': unifiedNumber,
      if (paidInCapital != null) 'paid_in_capital': paidInCapital,
      if (specialStock != null) 'special_stock': specialStock,
      if (parValue != null) 'par_value': parValue,
      if (url != null) 'url': url,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompanyEntitiesCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? name,
      Value<String?>? abbr,
      Value<String?>? industry,
      Value<String?>? establishmentDate,
      Value<String?>? listedDate,
      Value<String?>? chairman,
      Value<String?>? generalManager,
      Value<String?>? switchboardPhone,
      Value<String?>? address,
      Value<String?>? unifiedNumber,
      Value<String?>? paidInCapital,
      Value<String?>? specialStock,
      Value<String?>? parValue,
      Value<String?>? url,
      Value<int>? rowid}) {
    return CompanyEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      abbr: abbr ?? this.abbr,
      industry: industry ?? this.industry,
      establishmentDate: establishmentDate ?? this.establishmentDate,
      listedDate: listedDate ?? this.listedDate,
      chairman: chairman ?? this.chairman,
      generalManager: generalManager ?? this.generalManager,
      switchboardPhone: switchboardPhone ?? this.switchboardPhone,
      address: address ?? this.address,
      unifiedNumber: unifiedNumber ?? this.unifiedNumber,
      paidInCapital: paidInCapital ?? this.paidInCapital,
      specialStock: specialStock ?? this.specialStock,
      parValue: parValue ?? this.parValue,
      url: url ?? this.url,
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
    if (abbr.present) {
      map['abbr'] = Variable<String>(abbr.value);
    }
    if (industry.present) {
      map['industry'] = Variable<String>(industry.value);
    }
    if (establishmentDate.present) {
      map['establishment_date'] = Variable<String>(establishmentDate.value);
    }
    if (listedDate.present) {
      map['listed_date'] = Variable<String>(listedDate.value);
    }
    if (chairman.present) {
      map['chairman'] = Variable<String>(chairman.value);
    }
    if (generalManager.present) {
      map['general_manager'] = Variable<String>(generalManager.value);
    }
    if (switchboardPhone.present) {
      map['switchboard_phone'] = Variable<String>(switchboardPhone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (unifiedNumber.present) {
      map['unified_number'] = Variable<String>(unifiedNumber.value);
    }
    if (paidInCapital.present) {
      map['paid_in_capital'] = Variable<String>(paidInCapital.value);
    }
    if (specialStock.present) {
      map['special_stock'] = Variable<String>(specialStock.value);
    }
    if (parValue.present) {
      map['par_value'] = Variable<String>(parValue.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('abbr: $abbr, ')
          ..write('industry: $industry, ')
          ..write('establishmentDate: $establishmentDate, ')
          ..write('listedDate: $listedDate, ')
          ..write('chairman: $chairman, ')
          ..write('generalManager: $generalManager, ')
          ..write('switchboardPhone: $switchboardPhone, ')
          ..write('address: $address, ')
          ..write('unifiedNumber: $unifiedNumber, ')
          ..write('paidInCapital: $paidInCapital, ')
          ..write('specialStock: $specialStock, ')
          ..write('parValue: $parValue, ')
          ..write('url: $url, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CompanyEntitiesTable companyEntities =
      $CompanyEntitiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [companyEntities];
}

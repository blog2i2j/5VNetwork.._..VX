// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SubscriptionsTable extends Subscriptions
    with TableInfo<$SubscriptionsTable, Subscription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscriptionsTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
    'link',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _remainingDataMeta = const VerificationMeta(
    'remainingData',
  );
  @override
  late final GeneratedColumn<double> remainingData = GeneratedColumn<double>(
    'remaining_data',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _websiteMeta = const VerificationMeta(
    'website',
  );
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
    'website',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _lastUpdateMeta = const VerificationMeta(
    'lastUpdate',
  );
  @override
  late final GeneratedColumn<int> lastUpdate = GeneratedColumn<int>(
    'last_update',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSuccessUpdateMeta = const VerificationMeta(
    'lastSuccessUpdate',
  );
  @override
  late final GeneratedColumn<int> lastSuccessUpdate = GeneratedColumn<int>(
    'last_success_update',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _placeOnTopMeta = const VerificationMeta(
    'placeOnTop',
  );
  @override
  late final GeneratedColumn<bool> placeOnTop = GeneratedColumn<bool>(
    'place_on_top',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("place_on_top" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    updatedAt,
    id,
    name,
    link,
    remainingData,
    endTime,
    website,
    description,
    lastUpdate,
    lastSuccessUpdate,
    placeOnTop,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscriptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subscription> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    if (data.containsKey('link')) {
      context.handle(
        _linkMeta,
        link.isAcceptableOrUnknown(data['link']!, _linkMeta),
      );
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('remaining_data')) {
      context.handle(
        _remainingDataMeta,
        remainingData.isAcceptableOrUnknown(
          data['remaining_data']!,
          _remainingDataMeta,
        ),
      );
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('website')) {
      context.handle(
        _websiteMeta,
        website.isAcceptableOrUnknown(data['website']!, _websiteMeta),
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
    }
    if (data.containsKey('last_update')) {
      context.handle(
        _lastUpdateMeta,
        lastUpdate.isAcceptableOrUnknown(data['last_update']!, _lastUpdateMeta),
      );
    } else if (isInserting) {
      context.missing(_lastUpdateMeta);
    }
    if (data.containsKey('last_success_update')) {
      context.handle(
        _lastSuccessUpdateMeta,
        lastSuccessUpdate.isAcceptableOrUnknown(
          data['last_success_update']!,
          _lastSuccessUpdateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastSuccessUpdateMeta);
    }
    if (data.containsKey('place_on_top')) {
      context.handle(
        _placeOnTopMeta,
        placeOnTop.isAcceptableOrUnknown(
          data['place_on_top']!,
          _placeOnTopMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subscription map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subscription(
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
      link: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}link'],
      )!,
      remainingData: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}remaining_data'],
      ),
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_time'],
      ),
      website: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}website'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      lastUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_update'],
      )!,
      lastSuccessUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_success_update'],
      )!,
      placeOnTop: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}place_on_top'],
      )!,
    );
  }

  @override
  $SubscriptionsTable createAlias(String alias) {
    return $SubscriptionsTable(attachedDatabase, alias);
  }
}

class Subscription extends DataClass implements Insertable<Subscription> {
  final DateTime? updatedAt;
  final int id;
  final String name;
  final String link;
  final double? remainingData;
  final int? endTime;
  final String website;
  final String description;
  final int lastUpdate;
  final int lastSuccessUpdate;
  final bool placeOnTop;
  const Subscription({
    this.updatedAt,
    required this.id,
    required this.name,
    required this.link,
    this.remainingData,
    this.endTime,
    required this.website,
    required this.description,
    required this.lastUpdate,
    required this.lastSuccessUpdate,
    required this.placeOnTop,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['link'] = Variable<String>(link);
    if (!nullToAbsent || remainingData != null) {
      map['remaining_data'] = Variable<double>(remainingData);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<int>(endTime);
    }
    map['website'] = Variable<String>(website);
    map['description'] = Variable<String>(description);
    map['last_update'] = Variable<int>(lastUpdate);
    map['last_success_update'] = Variable<int>(lastSuccessUpdate);
    map['place_on_top'] = Variable<bool>(placeOnTop);
    return map;
  }

  SubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return SubscriptionsCompanion(
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      name: Value(name),
      link: Value(link),
      remainingData: remainingData == null && nullToAbsent
          ? const Value.absent()
          : Value(remainingData),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      website: Value(website),
      description: Value(description),
      lastUpdate: Value(lastUpdate),
      lastSuccessUpdate: Value(lastSuccessUpdate),
      placeOnTop: Value(placeOnTop),
    );
  }

  factory Subscription.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subscription(
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      link: serializer.fromJson<String>(json['link']),
      remainingData: serializer.fromJson<double?>(json['remainingData']),
      endTime: serializer.fromJson<int?>(json['endTime']),
      website: serializer.fromJson<String>(json['website']),
      description: serializer.fromJson<String>(json['description']),
      lastUpdate: serializer.fromJson<int>(json['lastUpdate']),
      lastSuccessUpdate: serializer.fromJson<int>(json['lastSuccessUpdate']),
      placeOnTop: serializer.fromJson<bool>(json['placeOnTop']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'link': serializer.toJson<String>(link),
      'remainingData': serializer.toJson<double?>(remainingData),
      'endTime': serializer.toJson<int?>(endTime),
      'website': serializer.toJson<String>(website),
      'description': serializer.toJson<String>(description),
      'lastUpdate': serializer.toJson<int>(lastUpdate),
      'lastSuccessUpdate': serializer.toJson<int>(lastSuccessUpdate),
      'placeOnTop': serializer.toJson<bool>(placeOnTop),
    };
  }

  Subscription copyWith({
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    String? name,
    String? link,
    Value<double?> remainingData = const Value.absent(),
    Value<int?> endTime = const Value.absent(),
    String? website,
    String? description,
    int? lastUpdate,
    int? lastSuccessUpdate,
    bool? placeOnTop,
  }) => Subscription(
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    name: name ?? this.name,
    link: link ?? this.link,
    remainingData: remainingData.present
        ? remainingData.value
        : this.remainingData,
    endTime: endTime.present ? endTime.value : this.endTime,
    website: website ?? this.website,
    description: description ?? this.description,
    lastUpdate: lastUpdate ?? this.lastUpdate,
    lastSuccessUpdate: lastSuccessUpdate ?? this.lastSuccessUpdate,
    placeOnTop: placeOnTop ?? this.placeOnTop,
  );
  Subscription copyWithCompanion(SubscriptionsCompanion data) {
    return Subscription(
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      link: data.link.present ? data.link.value : this.link,
      remainingData: data.remainingData.present
          ? data.remainingData.value
          : this.remainingData,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      website: data.website.present ? data.website.value : this.website,
      description: data.description.present
          ? data.description.value
          : this.description,
      lastUpdate: data.lastUpdate.present
          ? data.lastUpdate.value
          : this.lastUpdate,
      lastSuccessUpdate: data.lastSuccessUpdate.present
          ? data.lastSuccessUpdate.value
          : this.lastSuccessUpdate,
      placeOnTop: data.placeOnTop.present
          ? data.placeOnTop.value
          : this.placeOnTop,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subscription(')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('link: $link, ')
          ..write('remainingData: $remainingData, ')
          ..write('endTime: $endTime, ')
          ..write('website: $website, ')
          ..write('description: $description, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastSuccessUpdate: $lastSuccessUpdate, ')
          ..write('placeOnTop: $placeOnTop')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    updatedAt,
    id,
    name,
    link,
    remainingData,
    endTime,
    website,
    description,
    lastUpdate,
    lastSuccessUpdate,
    placeOnTop,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subscription &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.name == this.name &&
          other.link == this.link &&
          other.remainingData == this.remainingData &&
          other.endTime == this.endTime &&
          other.website == this.website &&
          other.description == this.description &&
          other.lastUpdate == this.lastUpdate &&
          other.lastSuccessUpdate == this.lastSuccessUpdate &&
          other.placeOnTop == this.placeOnTop);
}

class SubscriptionsCompanion extends UpdateCompanion<Subscription> {
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<String> name;
  final Value<String> link;
  final Value<double?> remainingData;
  final Value<int?> endTime;
  final Value<String> website;
  final Value<String> description;
  final Value<int> lastUpdate;
  final Value<int> lastSuccessUpdate;
  final Value<bool> placeOnTop;
  const SubscriptionsCompanion({
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.link = const Value.absent(),
    this.remainingData = const Value.absent(),
    this.endTime = const Value.absent(),
    this.website = const Value.absent(),
    this.description = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastSuccessUpdate = const Value.absent(),
    this.placeOnTop = const Value.absent(),
  });
  SubscriptionsCompanion.insert({
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required String link,
    this.remainingData = const Value.absent(),
    this.endTime = const Value.absent(),
    this.website = const Value.absent(),
    this.description = const Value.absent(),
    required int lastUpdate,
    required int lastSuccessUpdate,
    this.placeOnTop = const Value.absent(),
  }) : name = Value(name),
       link = Value(link),
       lastUpdate = Value(lastUpdate),
       lastSuccessUpdate = Value(lastSuccessUpdate);
  static Insertable<Subscription> custom({
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? link,
    Expression<double>? remainingData,
    Expression<int>? endTime,
    Expression<String>? website,
    Expression<String>? description,
    Expression<int>? lastUpdate,
    Expression<int>? lastSuccessUpdate,
    Expression<bool>? placeOnTop,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (link != null) 'link': link,
      if (remainingData != null) 'remaining_data': remainingData,
      if (endTime != null) 'end_time': endTime,
      if (website != null) 'website': website,
      if (description != null) 'description': description,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastSuccessUpdate != null) 'last_success_update': lastSuccessUpdate,
      if (placeOnTop != null) 'place_on_top': placeOnTop,
    });
  }

  SubscriptionsCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<String>? name,
    Value<String>? link,
    Value<double?>? remainingData,
    Value<int?>? endTime,
    Value<String>? website,
    Value<String>? description,
    Value<int>? lastUpdate,
    Value<int>? lastSuccessUpdate,
    Value<bool>? placeOnTop,
  }) {
    return SubscriptionsCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      remainingData: remainingData ?? this.remainingData,
      endTime: endTime ?? this.endTime,
      website: website ?? this.website,
      description: description ?? this.description,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastSuccessUpdate: lastSuccessUpdate ?? this.lastSuccessUpdate,
      placeOnTop: placeOnTop ?? this.placeOnTop,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (remainingData.present) {
      map['remaining_data'] = Variable<double>(remainingData.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<int>(lastUpdate.value);
    }
    if (lastSuccessUpdate.present) {
      map['last_success_update'] = Variable<int>(lastSuccessUpdate.value);
    }
    if (placeOnTop.present) {
      map['place_on_top'] = Variable<bool>(placeOnTop.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionsCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('link: $link, ')
          ..write('remainingData: $remainingData, ')
          ..write('endTime: $endTime, ')
          ..write('website: $website, ')
          ..write('description: $description, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastSuccessUpdate: $lastSuccessUpdate, ')
          ..write('placeOnTop: $placeOnTop')
          ..write(')'))
        .toString();
  }
}

class $OutboundHandlersTable extends OutboundHandlers
    with TableInfo<$OutboundHandlersTable, OutboundHandler> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutboundHandlersTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _selectedMeta = const VerificationMeta(
    'selected',
  );
  @override
  late final GeneratedColumn<bool> selected = GeneratedColumn<bool>(
    'selected',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("selected" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _countryCodeMeta = const VerificationMeta(
    'countryCode',
  );
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
    'country_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _sniMeta = const VerificationMeta('sni');
  @override
  late final GeneratedColumn<String> sni = GeneratedColumn<String>(
    'sni',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
    'speed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _speedTestTimeMeta = const VerificationMeta(
    'speedTestTime',
  );
  @override
  late final GeneratedColumn<int> speedTestTime = GeneratedColumn<int>(
    'speed_test_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pingMeta = const VerificationMeta('ping');
  @override
  late final GeneratedColumn<int> ping = GeneratedColumn<int>(
    'ping',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pingTestTimeMeta = const VerificationMeta(
    'pingTestTime',
  );
  @override
  late final GeneratedColumn<int> pingTestTime = GeneratedColumn<int>(
    'ping_test_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _okMeta = const VerificationMeta('ok');
  @override
  late final GeneratedColumn<int> ok = GeneratedColumn<int>(
    'ok',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _serverIpMeta = const VerificationMeta(
    'serverIp',
  );
  @override
  late final GeneratedColumn<String> serverIp = GeneratedColumn<String>(
    'server_ip',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  @override
  late final GeneratedColumnWithTypeConverter<HandlerConfig, Uint8List> config =
      GeneratedColumn<Uint8List>(
        'config',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
      ).withConverter<HandlerConfig>($OutboundHandlersTable.$converterconfig);
  static const VerificationMeta _support6Meta = const VerificationMeta(
    'support6',
  );
  @override
  late final GeneratedColumn<int> support6 = GeneratedColumn<int>(
    'support6',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _support6TestTimeMeta = const VerificationMeta(
    'support6TestTime',
  );
  @override
  late final GeneratedColumn<int> support6TestTime = GeneratedColumn<int>(
    'support6_test_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _subIdMeta = const VerificationMeta('subId');
  @override
  late final GeneratedColumn<int> subId = GeneratedColumn<int>(
    'sub_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subscriptions (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    updatedAt,
    id,
    selected,
    countryCode,
    sni,
    speed,
    speedTestTime,
    ping,
    pingTestTime,
    ok,
    serverIp,
    config,
    support6,
    support6TestTime,
    subId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outbound_handlers';
  @override
  VerificationContext validateIntegrity(
    Insertable<OutboundHandler> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('selected')) {
      context.handle(
        _selectedMeta,
        selected.isAcceptableOrUnknown(data['selected']!, _selectedMeta),
      );
    }
    if (data.containsKey('country_code')) {
      context.handle(
        _countryCodeMeta,
        countryCode.isAcceptableOrUnknown(
          data['country_code']!,
          _countryCodeMeta,
        ),
      );
    }
    if (data.containsKey('sni')) {
      context.handle(
        _sniMeta,
        sni.isAcceptableOrUnknown(data['sni']!, _sniMeta),
      );
    }
    if (data.containsKey('speed')) {
      context.handle(
        _speedMeta,
        speed.isAcceptableOrUnknown(data['speed']!, _speedMeta),
      );
    }
    if (data.containsKey('speed_test_time')) {
      context.handle(
        _speedTestTimeMeta,
        speedTestTime.isAcceptableOrUnknown(
          data['speed_test_time']!,
          _speedTestTimeMeta,
        ),
      );
    }
    if (data.containsKey('ping')) {
      context.handle(
        _pingMeta,
        ping.isAcceptableOrUnknown(data['ping']!, _pingMeta),
      );
    }
    if (data.containsKey('ping_test_time')) {
      context.handle(
        _pingTestTimeMeta,
        pingTestTime.isAcceptableOrUnknown(
          data['ping_test_time']!,
          _pingTestTimeMeta,
        ),
      );
    }
    if (data.containsKey('ok')) {
      context.handle(_okMeta, ok.isAcceptableOrUnknown(data['ok']!, _okMeta));
    }
    if (data.containsKey('server_ip')) {
      context.handle(
        _serverIpMeta,
        serverIp.isAcceptableOrUnknown(data['server_ip']!, _serverIpMeta),
      );
    }
    if (data.containsKey('support6')) {
      context.handle(
        _support6Meta,
        support6.isAcceptableOrUnknown(data['support6']!, _support6Meta),
      );
    }
    if (data.containsKey('support6_test_time')) {
      context.handle(
        _support6TestTimeMeta,
        support6TestTime.isAcceptableOrUnknown(
          data['support6_test_time']!,
          _support6TestTimeMeta,
        ),
      );
    }
    if (data.containsKey('sub_id')) {
      context.handle(
        _subIdMeta,
        subId.isAcceptableOrUnknown(data['sub_id']!, _subIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutboundHandler map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboundHandler(
      config: $OutboundHandlersTable.$converterconfig.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}config'],
        )!,
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      countryCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_code'],
      )!,
      selected: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}selected'],
      )!,
      speed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speed'],
      )!,
      ping: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ping'],
      )!,
      ok: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ok'],
      )!,
      serverIp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_ip'],
      )!,
      speedTestTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}speed_test_time'],
      )!,
      pingTestTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ping_test_time'],
      )!,
      support6: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}support6'],
      )!,
      support6TestTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}support6_test_time'],
      )!,
      subId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sub_id'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $OutboundHandlersTable createAlias(String alias) {
    return $OutboundHandlersTable(attachedDatabase, alias);
  }

  static TypeConverter<HandlerConfig, Uint8List> $converterconfig =
      const OutboundConverter();
}

class OutboundHandlersCompanion extends UpdateCompanion<OutboundHandler> {
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<bool> selected;
  final Value<String> countryCode;
  final Value<String> sni;
  final Value<double> speed;
  final Value<int> speedTestTime;
  final Value<int> ping;
  final Value<int> pingTestTime;
  final Value<int> ok;
  final Value<String> serverIp;
  final Value<HandlerConfig> config;
  final Value<int> support6;
  final Value<int> support6TestTime;
  final Value<int?> subId;
  const OutboundHandlersCompanion({
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.selected = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.sni = const Value.absent(),
    this.speed = const Value.absent(),
    this.speedTestTime = const Value.absent(),
    this.ping = const Value.absent(),
    this.pingTestTime = const Value.absent(),
    this.ok = const Value.absent(),
    this.serverIp = const Value.absent(),
    this.config = const Value.absent(),
    this.support6 = const Value.absent(),
    this.support6TestTime = const Value.absent(),
    this.subId = const Value.absent(),
  });
  OutboundHandlersCompanion.insert({
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.selected = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.sni = const Value.absent(),
    this.speed = const Value.absent(),
    this.speedTestTime = const Value.absent(),
    this.ping = const Value.absent(),
    this.pingTestTime = const Value.absent(),
    this.ok = const Value.absent(),
    this.serverIp = const Value.absent(),
    required HandlerConfig config,
    this.support6 = const Value.absent(),
    this.support6TestTime = const Value.absent(),
    this.subId = const Value.absent(),
  }) : config = Value(config);
  static Insertable<OutboundHandler> custom({
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<bool>? selected,
    Expression<String>? countryCode,
    Expression<String>? sni,
    Expression<double>? speed,
    Expression<int>? speedTestTime,
    Expression<int>? ping,
    Expression<int>? pingTestTime,
    Expression<int>? ok,
    Expression<String>? serverIp,
    Expression<Uint8List>? config,
    Expression<int>? support6,
    Expression<int>? support6TestTime,
    Expression<int>? subId,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (selected != null) 'selected': selected,
      if (countryCode != null) 'country_code': countryCode,
      if (sni != null) 'sni': sni,
      if (speed != null) 'speed': speed,
      if (speedTestTime != null) 'speed_test_time': speedTestTime,
      if (ping != null) 'ping': ping,
      if (pingTestTime != null) 'ping_test_time': pingTestTime,
      if (ok != null) 'ok': ok,
      if (serverIp != null) 'server_ip': serverIp,
      if (config != null) 'config': config,
      if (support6 != null) 'support6': support6,
      if (support6TestTime != null) 'support6_test_time': support6TestTime,
      if (subId != null) 'sub_id': subId,
    });
  }

  OutboundHandlersCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<bool>? selected,
    Value<String>? countryCode,
    Value<String>? sni,
    Value<double>? speed,
    Value<int>? speedTestTime,
    Value<int>? ping,
    Value<int>? pingTestTime,
    Value<int>? ok,
    Value<String>? serverIp,
    Value<HandlerConfig>? config,
    Value<int>? support6,
    Value<int>? support6TestTime,
    Value<int?>? subId,
  }) {
    return OutboundHandlersCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      selected: selected ?? this.selected,
      countryCode: countryCode ?? this.countryCode,
      sni: sni ?? this.sni,
      speed: speed ?? this.speed,
      speedTestTime: speedTestTime ?? this.speedTestTime,
      ping: ping ?? this.ping,
      pingTestTime: pingTestTime ?? this.pingTestTime,
      ok: ok ?? this.ok,
      serverIp: serverIp ?? this.serverIp,
      config: config ?? this.config,
      support6: support6 ?? this.support6,
      support6TestTime: support6TestTime ?? this.support6TestTime,
      subId: subId ?? this.subId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (selected.present) {
      map['selected'] = Variable<bool>(selected.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    if (sni.present) {
      map['sni'] = Variable<String>(sni.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (speedTestTime.present) {
      map['speed_test_time'] = Variable<int>(speedTestTime.value);
    }
    if (ping.present) {
      map['ping'] = Variable<int>(ping.value);
    }
    if (pingTestTime.present) {
      map['ping_test_time'] = Variable<int>(pingTestTime.value);
    }
    if (ok.present) {
      map['ok'] = Variable<int>(ok.value);
    }
    if (serverIp.present) {
      map['server_ip'] = Variable<String>(serverIp.value);
    }
    if (config.present) {
      map['config'] = Variable<Uint8List>(
        $OutboundHandlersTable.$converterconfig.toSql(config.value),
      );
    }
    if (support6.present) {
      map['support6'] = Variable<int>(support6.value);
    }
    if (support6TestTime.present) {
      map['support6_test_time'] = Variable<int>(support6TestTime.value);
    }
    if (subId.present) {
      map['sub_id'] = Variable<int>(subId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutboundHandlersCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('selected: $selected, ')
          ..write('countryCode: $countryCode, ')
          ..write('sni: $sni, ')
          ..write('speed: $speed, ')
          ..write('speedTestTime: $speedTestTime, ')
          ..write('ping: $ping, ')
          ..write('pingTestTime: $pingTestTime, ')
          ..write('ok: $ok, ')
          ..write('serverIp: $serverIp, ')
          ..write('config: $config, ')
          ..write('support6: $support6, ')
          ..write('support6TestTime: $support6TestTime, ')
          ..write('subId: $subId')
          ..write(')'))
        .toString();
  }
}

class $OutboundHandlerGroupsTable extends OutboundHandlerGroups
    with TableInfo<$OutboundHandlerGroupsTable, OutboundHandlerGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutboundHandlerGroupsTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
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
  static const VerificationMeta _placeOnTopMeta = const VerificationMeta(
    'placeOnTop',
  );
  @override
  late final GeneratedColumn<bool> placeOnTop = GeneratedColumn<bool>(
    'place_on_top',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("place_on_top" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [updatedAt, name, placeOnTop];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outbound_handler_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<OutboundHandlerGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
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
    if (data.containsKey('place_on_top')) {
      context.handle(
        _placeOnTopMeta,
        placeOnTop.isAcceptableOrUnknown(
          data['place_on_top']!,
          _placeOnTopMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  OutboundHandlerGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboundHandlerGroup(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      placeOnTop: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}place_on_top'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $OutboundHandlerGroupsTable createAlias(String alias) {
    return $OutboundHandlerGroupsTable(attachedDatabase, alias);
  }
}

class OutboundHandlerGroupsCompanion
    extends UpdateCompanion<OutboundHandlerGroup> {
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<bool> placeOnTop;
  final Value<int> rowid;
  const OutboundHandlerGroupsCompanion({
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.placeOnTop = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OutboundHandlerGroupsCompanion.insert({
    this.updatedAt = const Value.absent(),
    required String name,
    this.placeOnTop = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<OutboundHandlerGroup> custom({
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<bool>? placeOnTop,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (placeOnTop != null) 'place_on_top': placeOnTop,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OutboundHandlerGroupsCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<bool>? placeOnTop,
    Value<int>? rowid,
  }) {
    return OutboundHandlerGroupsCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      placeOnTop: placeOnTop ?? this.placeOnTop,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (placeOnTop.present) {
      map['place_on_top'] = Variable<bool>(placeOnTop.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutboundHandlerGroupsCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('placeOnTop: $placeOnTop, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OutboundHandlerGroupRelationsTable extends OutboundHandlerGroupRelations
    with
        TableInfo<
          $OutboundHandlerGroupRelationsTable,
          OutboundHandlerGroupRelation
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutboundHandlerGroupRelationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupNameMeta = const VerificationMeta(
    'groupName',
  );
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
    'group_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES outbound_handler_groups (name) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _handlerIdMeta = const VerificationMeta(
    'handlerId',
  );
  @override
  late final GeneratedColumn<int> handlerId = GeneratedColumn<int>(
    'handler_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES outbound_handlers (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [groupName, handlerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outbound_handler_group_relations';
  @override
  VerificationContext validateIntegrity(
    Insertable<OutboundHandlerGroupRelation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group_name')) {
      context.handle(
        _groupNameMeta,
        groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta),
      );
    } else if (isInserting) {
      context.missing(_groupNameMeta);
    }
    if (data.containsKey('handler_id')) {
      context.handle(
        _handlerIdMeta,
        handlerId.isAcceptableOrUnknown(data['handler_id']!, _handlerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_handlerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {groupName, handlerId};
  @override
  OutboundHandlerGroupRelation map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboundHandlerGroupRelation(
      groupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_name'],
      )!,
      handlerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}handler_id'],
      )!,
    );
  }

  @override
  $OutboundHandlerGroupRelationsTable createAlias(String alias) {
    return $OutboundHandlerGroupRelationsTable(attachedDatabase, alias);
  }
}

class OutboundHandlerGroupRelation extends DataClass
    implements Insertable<OutboundHandlerGroupRelation> {
  final String groupName;
  final int handlerId;
  const OutboundHandlerGroupRelation({
    required this.groupName,
    required this.handlerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group_name'] = Variable<String>(groupName);
    map['handler_id'] = Variable<int>(handlerId);
    return map;
  }

  OutboundHandlerGroupRelationsCompanion toCompanion(bool nullToAbsent) {
    return OutboundHandlerGroupRelationsCompanion(
      groupName: Value(groupName),
      handlerId: Value(handlerId),
    );
  }

  factory OutboundHandlerGroupRelation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutboundHandlerGroupRelation(
      groupName: serializer.fromJson<String>(json['groupName']),
      handlerId: serializer.fromJson<int>(json['handlerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'groupName': serializer.toJson<String>(groupName),
      'handlerId': serializer.toJson<int>(handlerId),
    };
  }

  OutboundHandlerGroupRelation copyWith({String? groupName, int? handlerId}) =>
      OutboundHandlerGroupRelation(
        groupName: groupName ?? this.groupName,
        handlerId: handlerId ?? this.handlerId,
      );
  OutboundHandlerGroupRelation copyWithCompanion(
    OutboundHandlerGroupRelationsCompanion data,
  ) {
    return OutboundHandlerGroupRelation(
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      handlerId: data.handlerId.present ? data.handlerId.value : this.handlerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutboundHandlerGroupRelation(')
          ..write('groupName: $groupName, ')
          ..write('handlerId: $handlerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(groupName, handlerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutboundHandlerGroupRelation &&
          other.groupName == this.groupName &&
          other.handlerId == this.handlerId);
}

class OutboundHandlerGroupRelationsCompanion
    extends UpdateCompanion<OutboundHandlerGroupRelation> {
  final Value<String> groupName;
  final Value<int> handlerId;
  final Value<int> rowid;
  const OutboundHandlerGroupRelationsCompanion({
    this.groupName = const Value.absent(),
    this.handlerId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OutboundHandlerGroupRelationsCompanion.insert({
    required String groupName,
    required int handlerId,
    this.rowid = const Value.absent(),
  }) : groupName = Value(groupName),
       handlerId = Value(handlerId);
  static Insertable<OutboundHandlerGroupRelation> custom({
    Expression<String>? groupName,
    Expression<int>? handlerId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (groupName != null) 'group_name': groupName,
      if (handlerId != null) 'handler_id': handlerId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OutboundHandlerGroupRelationsCompanion copyWith({
    Value<String>? groupName,
    Value<int>? handlerId,
    Value<int>? rowid,
  }) {
    return OutboundHandlerGroupRelationsCompanion(
      groupName: groupName ?? this.groupName,
      handlerId: handlerId ?? this.handlerId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (handlerId.present) {
      map['handler_id'] = Variable<int>(handlerId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutboundHandlerGroupRelationsCompanion(')
          ..write('groupName: $groupName, ')
          ..write('handlerId: $handlerId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DnsRecordsTable extends DnsRecords
    with TableInfo<$DnsRecordsTable, DnsRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DnsRecordsTable(this.attachedDatabase, [this._alias]);
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
  @override
  late final GeneratedColumnWithTypeConverter<dns.Record, Uint8List> dnsRecord =
      GeneratedColumn<Uint8List>(
        'dns_record',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
      ).withConverter<dns.Record>($DnsRecordsTable.$converterdnsRecord);
  @override
  List<GeneratedColumn> get $columns => [id, dnsRecord];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dns_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<DnsRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DnsRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DnsRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      dnsRecord: $DnsRecordsTable.$converterdnsRecord.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}dns_record'],
        )!,
      ),
    );
  }

  @override
  $DnsRecordsTable createAlias(String alias) {
    return $DnsRecordsTable(attachedDatabase, alias);
  }

  static TypeConverter<dns.Record, Uint8List> $converterdnsRecord =
      const DnsRecordConverter();
}

class DnsRecord extends DataClass implements Insertable<DnsRecord> {
  final int id;
  final dns.Record dnsRecord;
  const DnsRecord({required this.id, required this.dnsRecord});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['dns_record'] = Variable<Uint8List>(
        $DnsRecordsTable.$converterdnsRecord.toSql(dnsRecord),
      );
    }
    return map;
  }

  DnsRecordsCompanion toCompanion(bool nullToAbsent) {
    return DnsRecordsCompanion(id: Value(id), dnsRecord: Value(dnsRecord));
  }

  factory DnsRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DnsRecord(
      id: serializer.fromJson<int>(json['id']),
      dnsRecord: serializer.fromJson<dns.Record>(json['dnsRecord']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dnsRecord': serializer.toJson<dns.Record>(dnsRecord),
    };
  }

  DnsRecord copyWith({int? id, dns.Record? dnsRecord}) =>
      DnsRecord(id: id ?? this.id, dnsRecord: dnsRecord ?? this.dnsRecord);
  DnsRecord copyWithCompanion(DnsRecordsCompanion data) {
    return DnsRecord(
      id: data.id.present ? data.id.value : this.id,
      dnsRecord: data.dnsRecord.present ? data.dnsRecord.value : this.dnsRecord,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DnsRecord(')
          ..write('id: $id, ')
          ..write('dnsRecord: $dnsRecord')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dnsRecord);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DnsRecord &&
          other.id == this.id &&
          other.dnsRecord == this.dnsRecord);
}

class DnsRecordsCompanion extends UpdateCompanion<DnsRecord> {
  final Value<int> id;
  final Value<dns.Record> dnsRecord;
  const DnsRecordsCompanion({
    this.id = const Value.absent(),
    this.dnsRecord = const Value.absent(),
  });
  DnsRecordsCompanion.insert({
    this.id = const Value.absent(),
    required dns.Record dnsRecord,
  }) : dnsRecord = Value(dnsRecord);
  static Insertable<DnsRecord> custom({
    Expression<int>? id,
    Expression<Uint8List>? dnsRecord,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dnsRecord != null) 'dns_record': dnsRecord,
    });
  }

  DnsRecordsCompanion copyWith({Value<int>? id, Value<dns.Record>? dnsRecord}) {
    return DnsRecordsCompanion(
      id: id ?? this.id,
      dnsRecord: dnsRecord ?? this.dnsRecord,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dnsRecord.present) {
      map['dns_record'] = Variable<Uint8List>(
        $DnsRecordsTable.$converterdnsRecord.toSql(dnsRecord.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DnsRecordsCompanion(')
          ..write('id: $id, ')
          ..write('dnsRecord: $dnsRecord')
          ..write(')'))
        .toString();
  }
}

class $AtomicDomainSetsTable extends AtomicDomainSets
    with TableInfo<$AtomicDomainSetsTable, AtomicDomainSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AtomicDomainSetsTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
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
  late final GeneratedColumnWithTypeConverter<GeositeConfig?, Uint8List>
  geositeConfig =
      GeneratedColumn<Uint8List>(
        'geosite_config',
        aliasedName,
        true,
        type: DriftSqlType.blob,
        requiredDuringInsert: false,
      ).withConverter<GeositeConfig?>(
        $AtomicDomainSetsTable.$convertergeositeConfign,
      );
  static const VerificationMeta _useBloomFilterMeta = const VerificationMeta(
    'useBloomFilter',
  );
  @override
  late final GeneratedColumn<bool> useBloomFilter = GeneratedColumn<bool>(
    'use_bloom_filter',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("use_bloom_filter" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  clashRuleUrls =
      GeneratedColumn<String>(
        'clash_rule_urls',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>(
        $AtomicDomainSetsTable.$converterclashRuleUrlsn,
      );
  static const VerificationMeta _geoUrlMeta = const VerificationMeta('geoUrl');
  @override
  late final GeneratedColumn<String> geoUrl = GeneratedColumn<String>(
    'geo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _inverseMeta = const VerificationMeta(
    'inverse',
  );
  @override
  late final GeneratedColumn<bool> inverse = GeneratedColumn<bool>(
    'inverse',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("inverse" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    updatedAt,
    name,
    geositeConfig,
    useBloomFilter,
    clashRuleUrls,
    geoUrl,
    inverse,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'atomic_domain_sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<AtomicDomainSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
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
    if (data.containsKey('use_bloom_filter')) {
      context.handle(
        _useBloomFilterMeta,
        useBloomFilter.isAcceptableOrUnknown(
          data['use_bloom_filter']!,
          _useBloomFilterMeta,
        ),
      );
    }
    if (data.containsKey('geo_url')) {
      context.handle(
        _geoUrlMeta,
        geoUrl.isAcceptableOrUnknown(data['geo_url']!, _geoUrlMeta),
      );
    }
    if (data.containsKey('inverse')) {
      context.handle(
        _inverseMeta,
        inverse.isAcceptableOrUnknown(data['inverse']!, _inverseMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  AtomicDomainSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AtomicDomainSet(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      geositeConfig: $AtomicDomainSetsTable.$convertergeositeConfign.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}geosite_config'],
        ),
      ),
      inverse: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}inverse'],
      )!,
      useBloomFilter: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}use_bloom_filter'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      geoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}geo_url'],
      ),
      clashRuleUrls: $AtomicDomainSetsTable.$converterclashRuleUrlsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}clash_rule_urls'],
        ),
      ),
    );
  }

  @override
  $AtomicDomainSetsTable createAlias(String alias) {
    return $AtomicDomainSetsTable(attachedDatabase, alias);
  }

  static TypeConverter<GeositeConfig, Uint8List> $convertergeositeConfig =
      const GeositeConfigConverter();
  static TypeConverter<GeositeConfig?, Uint8List?> $convertergeositeConfign =
      NullAwareTypeConverter.wrap($convertergeositeConfig);
  static TypeConverter<List<String>, String> $converterclashRuleUrls =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterclashRuleUrlsn =
      NullAwareTypeConverter.wrap($converterclashRuleUrls);
}

class AtomicDomainSetsCompanion extends UpdateCompanion<AtomicDomainSet> {
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<GeositeConfig?> geositeConfig;
  final Value<bool> useBloomFilter;
  final Value<List<String>?> clashRuleUrls;
  final Value<String?> geoUrl;
  final Value<bool> inverse;
  final Value<int> rowid;
  const AtomicDomainSetsCompanion({
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.geositeConfig = const Value.absent(),
    this.useBloomFilter = const Value.absent(),
    this.clashRuleUrls = const Value.absent(),
    this.geoUrl = const Value.absent(),
    this.inverse = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AtomicDomainSetsCompanion.insert({
    this.updatedAt = const Value.absent(),
    required String name,
    this.geositeConfig = const Value.absent(),
    this.useBloomFilter = const Value.absent(),
    this.clashRuleUrls = const Value.absent(),
    this.geoUrl = const Value.absent(),
    this.inverse = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<AtomicDomainSet> custom({
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<Uint8List>? geositeConfig,
    Expression<bool>? useBloomFilter,
    Expression<String>? clashRuleUrls,
    Expression<String>? geoUrl,
    Expression<bool>? inverse,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (geositeConfig != null) 'geosite_config': geositeConfig,
      if (useBloomFilter != null) 'use_bloom_filter': useBloomFilter,
      if (clashRuleUrls != null) 'clash_rule_urls': clashRuleUrls,
      if (geoUrl != null) 'geo_url': geoUrl,
      if (inverse != null) 'inverse': inverse,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AtomicDomainSetsCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<GeositeConfig?>? geositeConfig,
    Value<bool>? useBloomFilter,
    Value<List<String>?>? clashRuleUrls,
    Value<String?>? geoUrl,
    Value<bool>? inverse,
    Value<int>? rowid,
  }) {
    return AtomicDomainSetsCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      geositeConfig: geositeConfig ?? this.geositeConfig,
      useBloomFilter: useBloomFilter ?? this.useBloomFilter,
      clashRuleUrls: clashRuleUrls ?? this.clashRuleUrls,
      geoUrl: geoUrl ?? this.geoUrl,
      inverse: inverse ?? this.inverse,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (geositeConfig.present) {
      map['geosite_config'] = Variable<Uint8List>(
        $AtomicDomainSetsTable.$convertergeositeConfign.toSql(
          geositeConfig.value,
        ),
      );
    }
    if (useBloomFilter.present) {
      map['use_bloom_filter'] = Variable<bool>(useBloomFilter.value);
    }
    if (clashRuleUrls.present) {
      map['clash_rule_urls'] = Variable<String>(
        $AtomicDomainSetsTable.$converterclashRuleUrlsn.toSql(
          clashRuleUrls.value,
        ),
      );
    }
    if (geoUrl.present) {
      map['geo_url'] = Variable<String>(geoUrl.value);
    }
    if (inverse.present) {
      map['inverse'] = Variable<bool>(inverse.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AtomicDomainSetsCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('geositeConfig: $geositeConfig, ')
          ..write('useBloomFilter: $useBloomFilter, ')
          ..write('clashRuleUrls: $clashRuleUrls, ')
          ..write('geoUrl: $geoUrl, ')
          ..write('inverse: $inverse, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GeoDomainsTable extends GeoDomains
    with TableInfo<$GeoDomainsTable, GeoDomain> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeoDomainsTable(this.attachedDatabase, [this._alias]);
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
  @override
  late final GeneratedColumnWithTypeConverter<Domain, Uint8List> geoDomain =
      GeneratedColumn<Uint8List>(
        'geo_domain',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
      ).withConverter<Domain>($GeoDomainsTable.$convertergeoDomain);
  static const VerificationMeta _domainSetNameMeta = const VerificationMeta(
    'domainSetName',
  );
  @override
  late final GeneratedColumn<String> domainSetName = GeneratedColumn<String>(
    'domain_set_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES atomic_domain_sets (name) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, geoDomain, domainSetName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'geo_domains';
  @override
  VerificationContext validateIntegrity(
    Insertable<GeoDomain> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('domain_set_name')) {
      context.handle(
        _domainSetNameMeta,
        domainSetName.isAcceptableOrUnknown(
          data['domain_set_name']!,
          _domainSetNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_domainSetNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {geoDomain, domainSetName},
  ];
  @override
  GeoDomain map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeoDomain(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      geoDomain: $GeoDomainsTable.$convertergeoDomain.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}geo_domain'],
        )!,
      ),
      domainSetName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}domain_set_name'],
      )!,
    );
  }

  @override
  $GeoDomainsTable createAlias(String alias) {
    return $GeoDomainsTable(attachedDatabase, alias);
  }

  static TypeConverter<Domain, Uint8List> $convertergeoDomain =
      const GeoDomainConverter();
}

class GeoDomainsCompanion extends UpdateCompanion<GeoDomain> {
  final Value<int> id;
  final Value<Domain> geoDomain;
  final Value<String> domainSetName;
  const GeoDomainsCompanion({
    this.id = const Value.absent(),
    this.geoDomain = const Value.absent(),
    this.domainSetName = const Value.absent(),
  });
  GeoDomainsCompanion.insert({
    this.id = const Value.absent(),
    required Domain geoDomain,
    required String domainSetName,
  }) : geoDomain = Value(geoDomain),
       domainSetName = Value(domainSetName);
  static Insertable<GeoDomain> custom({
    Expression<int>? id,
    Expression<Uint8List>? geoDomain,
    Expression<String>? domainSetName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (geoDomain != null) 'geo_domain': geoDomain,
      if (domainSetName != null) 'domain_set_name': domainSetName,
    });
  }

  GeoDomainsCompanion copyWith({
    Value<int>? id,
    Value<Domain>? geoDomain,
    Value<String>? domainSetName,
  }) {
    return GeoDomainsCompanion(
      id: id ?? this.id,
      geoDomain: geoDomain ?? this.geoDomain,
      domainSetName: domainSetName ?? this.domainSetName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (geoDomain.present) {
      map['geo_domain'] = Variable<Uint8List>(
        $GeoDomainsTable.$convertergeoDomain.toSql(geoDomain.value),
      );
    }
    if (domainSetName.present) {
      map['domain_set_name'] = Variable<String>(domainSetName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeoDomainsCompanion(')
          ..write('id: $id, ')
          ..write('geoDomain: $geoDomain, ')
          ..write('domainSetName: $domainSetName')
          ..write(')'))
        .toString();
  }
}

class $GreatDomainSetsTable extends GreatDomainSets
    with TableInfo<$GreatDomainSetsTable, GreatDomainSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GreatDomainSetsTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
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
  static const VerificationMeta _oppositeNameMeta = const VerificationMeta(
    'oppositeName',
  );
  @override
  late final GeneratedColumn<String> oppositeName = GeneratedColumn<String>(
    'opposite_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<GreatDomainSetConfig, Uint8List>
  set = GeneratedColumn<Uint8List>(
    'set',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  ).withConverter<GreatDomainSetConfig>($GreatDomainSetsTable.$converterset);
  @override
  List<GeneratedColumn> get $columns => [updatedAt, name, oppositeName, set];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'great_domain_sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<GreatDomainSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
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
    if (data.containsKey('opposite_name')) {
      context.handle(
        _oppositeNameMeta,
        oppositeName.isAcceptableOrUnknown(
          data['opposite_name']!,
          _oppositeNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  GreatDomainSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GreatDomainSet(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      oppositeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}opposite_name'],
      ),
      set: $GreatDomainSetsTable.$converterset.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}set'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $GreatDomainSetsTable createAlias(String alias) {
    return $GreatDomainSetsTable(attachedDatabase, alias);
  }

  static TypeConverter<GreatDomainSetConfig, Uint8List> $converterset =
      const GreatDomainSetConverter();
}

class GreatDomainSetsCompanion extends UpdateCompanion<GreatDomainSet> {
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<String?> oppositeName;
  final Value<GreatDomainSetConfig> set;
  final Value<int> rowid;
  const GreatDomainSetsCompanion({
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.oppositeName = const Value.absent(),
    this.set = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GreatDomainSetsCompanion.insert({
    this.updatedAt = const Value.absent(),
    required String name,
    this.oppositeName = const Value.absent(),
    required GreatDomainSetConfig set,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       set = Value(set);
  static Insertable<GreatDomainSet> custom({
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<String>? oppositeName,
    Expression<Uint8List>? set,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (oppositeName != null) 'opposite_name': oppositeName,
      if (set != null) 'set': set,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GreatDomainSetsCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<String?>? oppositeName,
    Value<GreatDomainSetConfig>? set,
    Value<int>? rowid,
  }) {
    return GreatDomainSetsCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      oppositeName: oppositeName ?? this.oppositeName,
      set: set ?? this.set,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (oppositeName.present) {
      map['opposite_name'] = Variable<String>(oppositeName.value);
    }
    if (set.present) {
      map['set'] = Variable<Uint8List>(
        $GreatDomainSetsTable.$converterset.toSql(set.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GreatDomainSetsCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('oppositeName: $oppositeName, ')
          ..write('set: $set, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AtomicIpSetsTable extends AtomicIpSets
    with TableInfo<$AtomicIpSetsTable, AtomicIpSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AtomicIpSetsTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
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
  static const VerificationMeta _inverseMeta = const VerificationMeta(
    'inverse',
  );
  @override
  late final GeneratedColumn<bool> inverse = GeneratedColumn<bool>(
    'inverse',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("inverse" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<GeoIPConfig?, Uint8List>
  geoIpConfig = GeneratedColumn<Uint8List>(
    'geo_ip_config',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  ).withConverter<GeoIPConfig?>($AtomicIpSetsTable.$convertergeoIpConfign);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  clashRuleUrls = GeneratedColumn<String>(
    'clash_rule_urls',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<String>?>($AtomicIpSetsTable.$converterclashRuleUrlsn);
  static const VerificationMeta _geoUrlMeta = const VerificationMeta('geoUrl');
  @override
  late final GeneratedColumn<String> geoUrl = GeneratedColumn<String>(
    'geo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    updatedAt,
    name,
    inverse,
    geoIpConfig,
    clashRuleUrls,
    geoUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'atomic_ip_sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<AtomicIpSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
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
    if (data.containsKey('inverse')) {
      context.handle(
        _inverseMeta,
        inverse.isAcceptableOrUnknown(data['inverse']!, _inverseMeta),
      );
    }
    if (data.containsKey('geo_url')) {
      context.handle(
        _geoUrlMeta,
        geoUrl.isAcceptableOrUnknown(data['geo_url']!, _geoUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  AtomicIpSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AtomicIpSet(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      inverse: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}inverse'],
      )!,
      geoIpConfig: $AtomicIpSetsTable.$convertergeoIpConfign.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}geo_ip_config'],
        ),
      ),
      clashRuleUrls: $AtomicIpSetsTable.$converterclashRuleUrlsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}clash_rule_urls'],
        ),
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      geoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}geo_url'],
      ),
    );
  }

  @override
  $AtomicIpSetsTable createAlias(String alias) {
    return $AtomicIpSetsTable(attachedDatabase, alias);
  }

  static TypeConverter<GeoIPConfig, Uint8List> $convertergeoIpConfig =
      const GeoIpConfigConverter();
  static TypeConverter<GeoIPConfig?, Uint8List?> $convertergeoIpConfign =
      NullAwareTypeConverter.wrap($convertergeoIpConfig);
  static TypeConverter<List<String>, String> $converterclashRuleUrls =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterclashRuleUrlsn =
      NullAwareTypeConverter.wrap($converterclashRuleUrls);
}

class AtomicIpSetsCompanion extends UpdateCompanion<AtomicIpSet> {
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<bool> inverse;
  final Value<GeoIPConfig?> geoIpConfig;
  final Value<List<String>?> clashRuleUrls;
  final Value<String?> geoUrl;
  final Value<int> rowid;
  const AtomicIpSetsCompanion({
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.inverse = const Value.absent(),
    this.geoIpConfig = const Value.absent(),
    this.clashRuleUrls = const Value.absent(),
    this.geoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AtomicIpSetsCompanion.insert({
    this.updatedAt = const Value.absent(),
    required String name,
    this.inverse = const Value.absent(),
    this.geoIpConfig = const Value.absent(),
    this.clashRuleUrls = const Value.absent(),
    this.geoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<AtomicIpSet> custom({
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<bool>? inverse,
    Expression<Uint8List>? geoIpConfig,
    Expression<String>? clashRuleUrls,
    Expression<String>? geoUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (inverse != null) 'inverse': inverse,
      if (geoIpConfig != null) 'geo_ip_config': geoIpConfig,
      if (clashRuleUrls != null) 'clash_rule_urls': clashRuleUrls,
      if (geoUrl != null) 'geo_url': geoUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AtomicIpSetsCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<bool>? inverse,
    Value<GeoIPConfig?>? geoIpConfig,
    Value<List<String>?>? clashRuleUrls,
    Value<String?>? geoUrl,
    Value<int>? rowid,
  }) {
    return AtomicIpSetsCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      inverse: inverse ?? this.inverse,
      geoIpConfig: geoIpConfig ?? this.geoIpConfig,
      clashRuleUrls: clashRuleUrls ?? this.clashRuleUrls,
      geoUrl: geoUrl ?? this.geoUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (inverse.present) {
      map['inverse'] = Variable<bool>(inverse.value);
    }
    if (geoIpConfig.present) {
      map['geo_ip_config'] = Variable<Uint8List>(
        $AtomicIpSetsTable.$convertergeoIpConfign.toSql(geoIpConfig.value),
      );
    }
    if (clashRuleUrls.present) {
      map['clash_rule_urls'] = Variable<String>(
        $AtomicIpSetsTable.$converterclashRuleUrlsn.toSql(clashRuleUrls.value),
      );
    }
    if (geoUrl.present) {
      map['geo_url'] = Variable<String>(geoUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AtomicIpSetsCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('inverse: $inverse, ')
          ..write('geoIpConfig: $geoIpConfig, ')
          ..write('clashRuleUrls: $clashRuleUrls, ')
          ..write('geoUrl: $geoUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GreatIpSetsTable extends GreatIpSets
    with TableInfo<$GreatIpSetsTable, GreatIpSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GreatIpSetsTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
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
  late final GeneratedColumnWithTypeConverter<GreatIPSetConfig, Uint8List>
  greatIpSetConfig =
      GeneratedColumn<Uint8List>(
        'great_ip_set_config',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
      ).withConverter<GreatIPSetConfig>(
        $GreatIpSetsTable.$convertergreatIpSetConfig,
      );
  static const VerificationMeta _oppositeNameMeta = const VerificationMeta(
    'oppositeName',
  );
  @override
  late final GeneratedColumn<String> oppositeName = GeneratedColumn<String>(
    'opposite_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    updatedAt,
    name,
    greatIpSetConfig,
    oppositeName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'great_ip_sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<GreatIpSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
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
    if (data.containsKey('opposite_name')) {
      context.handle(
        _oppositeNameMeta,
        oppositeName.isAcceptableOrUnknown(
          data['opposite_name']!,
          _oppositeNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  GreatIpSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GreatIpSet(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      greatIpSetConfig: $GreatIpSetsTable.$convertergreatIpSetConfig.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}great_ip_set_config'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      oppositeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}opposite_name'],
      ),
    );
  }

  @override
  $GreatIpSetsTable createAlias(String alias) {
    return $GreatIpSetsTable(attachedDatabase, alias);
  }

  static TypeConverter<GreatIPSetConfig, Uint8List> $convertergreatIpSetConfig =
      const GreatIpSetConverter();
}

class GreatIpSetsCompanion extends UpdateCompanion<GreatIpSet> {
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<GreatIPSetConfig> greatIpSetConfig;
  final Value<String?> oppositeName;
  final Value<int> rowid;
  const GreatIpSetsCompanion({
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.greatIpSetConfig = const Value.absent(),
    this.oppositeName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GreatIpSetsCompanion.insert({
    this.updatedAt = const Value.absent(),
    required String name,
    required GreatIPSetConfig greatIpSetConfig,
    this.oppositeName = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       greatIpSetConfig = Value(greatIpSetConfig);
  static Insertable<GreatIpSet> custom({
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<Uint8List>? greatIpSetConfig,
    Expression<String>? oppositeName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (greatIpSetConfig != null) 'great_ip_set_config': greatIpSetConfig,
      if (oppositeName != null) 'opposite_name': oppositeName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GreatIpSetsCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<GreatIPSetConfig>? greatIpSetConfig,
    Value<String?>? oppositeName,
    Value<int>? rowid,
  }) {
    return GreatIpSetsCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      greatIpSetConfig: greatIpSetConfig ?? this.greatIpSetConfig,
      oppositeName: oppositeName ?? this.oppositeName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (greatIpSetConfig.present) {
      map['great_ip_set_config'] = Variable<Uint8List>(
        $GreatIpSetsTable.$convertergreatIpSetConfig.toSql(
          greatIpSetConfig.value,
        ),
      );
    }
    if (oppositeName.present) {
      map['opposite_name'] = Variable<String>(oppositeName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GreatIpSetsCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('greatIpSetConfig: $greatIpSetConfig, ')
          ..write('oppositeName: $oppositeName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSetsTable extends AppSets with TableInfo<$AppSetsTable, AppSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSetsTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
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
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  clashRuleUrls = GeneratedColumn<String>(
    'clash_rule_urls',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<String>?>($AppSetsTable.$converterclashRuleUrlsn);
  @override
  List<GeneratedColumn> get $columns => [updatedAt, name, clashRuleUrls];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  AppSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSet(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      clashRuleUrls: $AppSetsTable.$converterclashRuleUrlsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}clash_rule_urls'],
        ),
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $AppSetsTable createAlias(String alias) {
    return $AppSetsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterclashRuleUrls =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterclashRuleUrlsn =
      NullAwareTypeConverter.wrap($converterclashRuleUrls);
}

class AppSetsCompanion extends UpdateCompanion<AppSet> {
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<List<String>?> clashRuleUrls;
  final Value<int> rowid;
  const AppSetsCompanion({
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.clashRuleUrls = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSetsCompanion.insert({
    this.updatedAt = const Value.absent(),
    required String name,
    this.clashRuleUrls = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<AppSet> custom({
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<String>? clashRuleUrls,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (clashRuleUrls != null) 'clash_rule_urls': clashRuleUrls,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSetsCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<List<String>?>? clashRuleUrls,
    Value<int>? rowid,
  }) {
    return AppSetsCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      clashRuleUrls: clashRuleUrls ?? this.clashRuleUrls,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (clashRuleUrls.present) {
      map['clash_rule_urls'] = Variable<String>(
        $AppSetsTable.$converterclashRuleUrlsn.toSql(clashRuleUrls.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSetsCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('clashRuleUrls: $clashRuleUrls, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppsTable extends Apps with TableInfo<$AppsTable, App> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _appSetNameMeta = const VerificationMeta(
    'appSetName',
  );
  @override
  late final GeneratedColumn<String> appSetName = GeneratedColumn<String>(
    'app_set_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_sets (name) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AppId, Uint8List> appId =
      GeneratedColumn<Uint8List>(
        'app_id',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
      ).withConverter<AppId>($AppsTable.$converterappId);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<Uint8List> icon = GeneratedColumn<Uint8List>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, appSetName, appId, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'apps';
  @override
  VerificationContext validateIntegrity(
    Insertable<App> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('app_set_name')) {
      context.handle(
        _appSetNameMeta,
        appSetName.isAcceptableOrUnknown(
          data['app_set_name']!,
          _appSetNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_appSetNameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {appId, appSetName},
  ];
  @override
  App map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return App(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      appSetName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_set_name'],
      )!,
      appId: $AppsTable.$converterappId.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}app_id'],
        )!,
      ),
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}icon'],
      ),
    );
  }

  @override
  $AppsTable createAlias(String alias) {
    return $AppsTable(attachedDatabase, alias);
  }

  static TypeConverter<AppId, Uint8List> $converterappId =
      const AppIdConverter();
}

class AppsCompanion extends UpdateCompanion<App> {
  final Value<int> id;
  final Value<String> appSetName;
  final Value<AppId> appId;
  final Value<Uint8List?> icon;
  const AppsCompanion({
    this.id = const Value.absent(),
    this.appSetName = const Value.absent(),
    this.appId = const Value.absent(),
    this.icon = const Value.absent(),
  });
  AppsCompanion.insert({
    this.id = const Value.absent(),
    required String appSetName,
    required AppId appId,
    this.icon = const Value.absent(),
  }) : appSetName = Value(appSetName),
       appId = Value(appId);
  static Insertable<App> custom({
    Expression<int>? id,
    Expression<String>? appSetName,
    Expression<Uint8List>? appId,
    Expression<Uint8List>? icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (appSetName != null) 'app_set_name': appSetName,
      if (appId != null) 'app_id': appId,
      if (icon != null) 'icon': icon,
    });
  }

  AppsCompanion copyWith({
    Value<int>? id,
    Value<String>? appSetName,
    Value<AppId>? appId,
    Value<Uint8List?>? icon,
  }) {
    return AppsCompanion(
      id: id ?? this.id,
      appSetName: appSetName ?? this.appSetName,
      appId: appId ?? this.appId,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (appSetName.present) {
      map['app_set_name'] = Variable<String>(appSetName.value);
    }
    if (appId.present) {
      map['app_id'] = Variable<Uint8List>(
        $AppsTable.$converterappId.toSql(appId.value),
      );
    }
    if (icon.present) {
      map['icon'] = Variable<Uint8List>(icon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppsCompanion(')
          ..write('id: $id, ')
          ..write('appSetName: $appSetName, ')
          ..write('appId: $appId, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

class $CidrsTable extends Cidrs with TableInfo<$CidrsTable, Cidr> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CidrsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _ipSetNameMeta = const VerificationMeta(
    'ipSetName',
  );
  @override
  late final GeneratedColumn<String> ipSetName = GeneratedColumn<String>(
    'ip_set_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES atomic_ip_sets (name) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<CIDR, Uint8List> cidr =
      GeneratedColumn<Uint8List>(
        'cidr',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
      ).withConverter<CIDR>($CidrsTable.$convertercidr);
  @override
  List<GeneratedColumn> get $columns => [id, ipSetName, cidr];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cidrs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cidr> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ip_set_name')) {
      context.handle(
        _ipSetNameMeta,
        ipSetName.isAcceptableOrUnknown(data['ip_set_name']!, _ipSetNameMeta),
      );
    } else if (isInserting) {
      context.missing(_ipSetNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {cidr, ipSetName},
  ];
  @override
  Cidr map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cidr(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ipSetName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ip_set_name'],
      )!,
      cidr: $CidrsTable.$convertercidr.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}cidr'],
        )!,
      ),
    );
  }

  @override
  $CidrsTable createAlias(String alias) {
    return $CidrsTable(attachedDatabase, alias);
  }

  static TypeConverter<CIDR, Uint8List> $convertercidr = const CidrConverter();
}

class CidrsCompanion extends UpdateCompanion<Cidr> {
  final Value<int> id;
  final Value<String> ipSetName;
  final Value<CIDR> cidr;
  const CidrsCompanion({
    this.id = const Value.absent(),
    this.ipSetName = const Value.absent(),
    this.cidr = const Value.absent(),
  });
  CidrsCompanion.insert({
    this.id = const Value.absent(),
    required String ipSetName,
    required CIDR cidr,
  }) : ipSetName = Value(ipSetName),
       cidr = Value(cidr);
  static Insertable<Cidr> custom({
    Expression<int>? id,
    Expression<String>? ipSetName,
    Expression<Uint8List>? cidr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ipSetName != null) 'ip_set_name': ipSetName,
      if (cidr != null) 'cidr': cidr,
    });
  }

  CidrsCompanion copyWith({
    Value<int>? id,
    Value<String>? ipSetName,
    Value<CIDR>? cidr,
  }) {
    return CidrsCompanion(
      id: id ?? this.id,
      ipSetName: ipSetName ?? this.ipSetName,
      cidr: cidr ?? this.cidr,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ipSetName.present) {
      map['ip_set_name'] = Variable<String>(ipSetName.value);
    }
    if (cidr.present) {
      map['cidr'] = Variable<Uint8List>(
        $CidrsTable.$convertercidr.toSql(cidr.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CidrsCompanion(')
          ..write('id: $id, ')
          ..write('ipSetName: $ipSetName, ')
          ..write('cidr: $cidr')
          ..write(')'))
        .toString();
  }
}

class $SshServersTable extends SshServers
    with TableInfo<$SshServersTable, SshServer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SshServersTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
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
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _storageKeyMeta = const VerificationMeta(
    'storageKey',
  );
  @override
  late final GeneratedColumn<String> storageKey = GeneratedColumn<String>(
    'storage_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AuthMethod, int> authMethod =
      GeneratedColumn<int>(
        'auth_method',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<AuthMethod>($SshServersTable.$converterauthMethod);
  @override
  List<GeneratedColumn> get $columns => [
    updatedAt,
    id,
    name,
    address,
    storageKey,
    country,
    authMethod,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ssh_servers';
  @override
  VerificationContext validateIntegrity(
    Insertable<SshServer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('storage_key')) {
      context.handle(
        _storageKeyMeta,
        storageKey.isAcceptableOrUnknown(data['storage_key']!, _storageKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_storageKeyMeta);
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SshServer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SshServer(
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
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      storageKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}storage_key'],
      )!,
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      authMethod: $SshServersTable.$converterauthMethod.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}auth_method'],
        )!,
      ),
    );
  }

  @override
  $SshServersTable createAlias(String alias) {
    return $SshServersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AuthMethod, int, int> $converterauthMethod =
      const EnumIndexConverter<AuthMethod>(AuthMethod.values);
}

class SshServer extends DataClass implements Insertable<SshServer> {
  final DateTime? updatedAt;
  final int id;
  final String name;
  final String address;
  final String storageKey;
  final String? country;
  final AuthMethod authMethod;
  const SshServer({
    this.updatedAt,
    required this.id,
    required this.name,
    required this.address,
    required this.storageKey,
    this.country,
    required this.authMethod,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['storage_key'] = Variable<String>(storageKey);
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    {
      map['auth_method'] = Variable<int>(
        $SshServersTable.$converterauthMethod.toSql(authMethod),
      );
    }
    return map;
  }

  SshServersCompanion toCompanion(bool nullToAbsent) {
    return SshServersCompanion(
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      id: Value(id),
      name: Value(name),
      address: Value(address),
      storageKey: Value(storageKey),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      authMethod: Value(authMethod),
    );
  }

  factory SshServer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SshServer(
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      storageKey: serializer.fromJson<String>(json['storageKey']),
      country: serializer.fromJson<String?>(json['country']),
      authMethod: $SshServersTable.$converterauthMethod.fromJson(
        serializer.fromJson<int>(json['authMethod']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'storageKey': serializer.toJson<String>(storageKey),
      'country': serializer.toJson<String?>(country),
      'authMethod': serializer.toJson<int>(
        $SshServersTable.$converterauthMethod.toJson(authMethod),
      ),
    };
  }

  SshServer copyWith({
    Value<DateTime?> updatedAt = const Value.absent(),
    int? id,
    String? name,
    String? address,
    String? storageKey,
    Value<String?> country = const Value.absent(),
    AuthMethod? authMethod,
  }) => SshServer(
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    id: id ?? this.id,
    name: name ?? this.name,
    address: address ?? this.address,
    storageKey: storageKey ?? this.storageKey,
    country: country.present ? country.value : this.country,
    authMethod: authMethod ?? this.authMethod,
  );
  SshServer copyWithCompanion(SshServersCompanion data) {
    return SshServer(
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      storageKey: data.storageKey.present
          ? data.storageKey.value
          : this.storageKey,
      country: data.country.present ? data.country.value : this.country,
      authMethod: data.authMethod.present
          ? data.authMethod.value
          : this.authMethod,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SshServer(')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('storageKey: $storageKey, ')
          ..write('country: $country, ')
          ..write('authMethod: $authMethod')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    updatedAt,
    id,
    name,
    address,
    storageKey,
    country,
    authMethod,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SshServer &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.storageKey == this.storageKey &&
          other.country == this.country &&
          other.authMethod == this.authMethod);
}

class SshServersCompanion extends UpdateCompanion<SshServer> {
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<String> storageKey;
  final Value<String?> country;
  final Value<AuthMethod> authMethod;
  const SshServersCompanion({
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.storageKey = const Value.absent(),
    this.country = const Value.absent(),
    this.authMethod = const Value.absent(),
  });
  SshServersCompanion.insert({
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required String address,
    required String storageKey,
    this.country = const Value.absent(),
    required AuthMethod authMethod,
  }) : name = Value(name),
       address = Value(address),
       storageKey = Value(storageKey),
       authMethod = Value(authMethod);
  static Insertable<SshServer> custom({
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? storageKey,
    Expression<String>? country,
    Expression<int>? authMethod,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (storageKey != null) 'storage_key': storageKey,
      if (country != null) 'country': country,
      if (authMethod != null) 'auth_method': authMethod,
    });
  }

  SshServersCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<String>? name,
    Value<String>? address,
    Value<String>? storageKey,
    Value<String?>? country,
    Value<AuthMethod>? authMethod,
  }) {
    return SshServersCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      storageKey: storageKey ?? this.storageKey,
      country: country ?? this.country,
      authMethod: authMethod ?? this.authMethod,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (storageKey.present) {
      map['storage_key'] = Variable<String>(storageKey.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (authMethod.present) {
      map['auth_method'] = Variable<int>(
        $SshServersTable.$converterauthMethod.toSql(authMethod.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SshServersCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('storageKey: $storageKey, ')
          ..write('country: $country, ')
          ..write('authMethod: $authMethod')
          ..write(')'))
        .toString();
  }
}

class $CommonSshKeysTable extends CommonSshKeys
    with TableInfo<$CommonSshKeysTable, CommonSshKey> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommonSshKeysTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, remark];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'common_ssh_keys';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommonSshKey> instance, {
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
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommonSshKey map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommonSshKey(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
    );
  }

  @override
  $CommonSshKeysTable createAlias(String alias) {
    return $CommonSshKeysTable(attachedDatabase, alias);
  }
}

class CommonSshKey extends DataClass implements Insertable<CommonSshKey> {
  final int id;
  final String name;
  final String? remark;
  const CommonSshKey({required this.id, required this.name, this.remark});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    return map;
  }

  CommonSshKeysCompanion toCompanion(bool nullToAbsent) {
    return CommonSshKeysCompanion(
      id: Value(id),
      name: Value(name),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
    );
  }

  factory CommonSshKey.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommonSshKey(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      remark: serializer.fromJson<String?>(json['remark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'remark': serializer.toJson<String?>(remark),
    };
  }

  CommonSshKey copyWith({
    int? id,
    String? name,
    Value<String?> remark = const Value.absent(),
  }) => CommonSshKey(
    id: id ?? this.id,
    name: name ?? this.name,
    remark: remark.present ? remark.value : this.remark,
  );
  CommonSshKey copyWithCompanion(CommonSshKeysCompanion data) {
    return CommonSshKey(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      remark: data.remark.present ? data.remark.value : this.remark,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommonSshKey(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, remark);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommonSshKey &&
          other.id == this.id &&
          other.name == this.name &&
          other.remark == this.remark);
}

class CommonSshKeysCompanion extends UpdateCompanion<CommonSshKey> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> remark;
  const CommonSshKeysCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.remark = const Value.absent(),
  });
  CommonSshKeysCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.remark = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CommonSshKey> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? remark,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (remark != null) 'remark': remark,
    });
  }

  CommonSshKeysCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? remark,
  }) {
    return CommonSshKeysCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      remark: remark ?? this.remark,
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
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommonSshKeysCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }
}

class $CustomRouteModesTable extends CustomRouteModes
    with TableInfo<$CustomRouteModesTable, CustomRouteMode> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomRouteModesTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  late final GeneratedColumnWithTypeConverter<RouterConfig, Uint8List>
  routerConfig = GeneratedColumn<Uint8List>(
    'router_config',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  ).withConverter<RouterConfig>($CustomRouteModesTable.$converterrouterConfig);
  @override
  late final GeneratedColumnWithTypeConverter<dns.DnsRules, Uint8List>
  dnsRules = GeneratedColumn<Uint8List>(
    'dns_rules',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
    defaultValue: Constant(dns.DnsRules().writeToBuffer()),
  ).withConverter<dns.DnsRules>($CustomRouteModesTable.$converterdnsRules);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  internalDnsServers =
      GeneratedColumn<String>(
        'internal_dns_servers',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>(
        $CustomRouteModesTable.$converterinternalDnsServers,
      );
  @override
  List<GeneratedColumn> get $columns => [
    updatedAt,
    id,
    name,
    routerConfig,
    dnsRules,
    internalDnsServers,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_route_modes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomRouteMode> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomRouteMode map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomRouteMode(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      routerConfig: $CustomRouteModesTable.$converterrouterConfig.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}router_config'],
        )!,
      ),
      dnsRules: $CustomRouteModesTable.$converterdnsRules.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}dns_rules'],
        )!,
      ),
      internalDnsServers: $CustomRouteModesTable.$converterinternalDnsServers
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}internal_dns_servers'],
            )!,
          ),
    );
  }

  @override
  $CustomRouteModesTable createAlias(String alias) {
    return $CustomRouteModesTable(attachedDatabase, alias);
  }

  static TypeConverter<RouterConfig, Uint8List> $converterrouterConfig =
      const RouterConfigConverter();
  static TypeConverter<dns.DnsRules, Uint8List> $converterdnsRules =
      const DnsRulesConverter();
  static TypeConverter<List<String>, String> $converterinternalDnsServers =
      const StringListConverter();
}

class CustomRouteModesCompanion extends UpdateCompanion<CustomRouteMode> {
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<String> name;
  final Value<RouterConfig> routerConfig;
  final Value<dns.DnsRules> dnsRules;
  final Value<List<String>> internalDnsServers;
  const CustomRouteModesCompanion({
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.routerConfig = const Value.absent(),
    this.dnsRules = const Value.absent(),
    this.internalDnsServers = const Value.absent(),
  });
  CustomRouteModesCompanion.insert({
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required RouterConfig routerConfig,
    this.dnsRules = const Value.absent(),
    required List<String> internalDnsServers,
  }) : name = Value(name),
       routerConfig = Value(routerConfig),
       internalDnsServers = Value(internalDnsServers);
  static Insertable<CustomRouteMode> custom({
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? name,
    Expression<Uint8List>? routerConfig,
    Expression<Uint8List>? dnsRules,
    Expression<String>? internalDnsServers,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (routerConfig != null) 'router_config': routerConfig,
      if (dnsRules != null) 'dns_rules': dnsRules,
      if (internalDnsServers != null)
        'internal_dns_servers': internalDnsServers,
    });
  }

  CustomRouteModesCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<String>? name,
    Value<RouterConfig>? routerConfig,
    Value<dns.DnsRules>? dnsRules,
    Value<List<String>>? internalDnsServers,
  }) {
    return CustomRouteModesCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      name: name ?? this.name,
      routerConfig: routerConfig ?? this.routerConfig,
      dnsRules: dnsRules ?? this.dnsRules,
      internalDnsServers: internalDnsServers ?? this.internalDnsServers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (routerConfig.present) {
      map['router_config'] = Variable<Uint8List>(
        $CustomRouteModesTable.$converterrouterConfig.toSql(routerConfig.value),
      );
    }
    if (dnsRules.present) {
      map['dns_rules'] = Variable<Uint8List>(
        $CustomRouteModesTable.$converterdnsRules.toSql(dnsRules.value),
      );
    }
    if (internalDnsServers.present) {
      map['internal_dns_servers'] = Variable<String>(
        $CustomRouteModesTable.$converterinternalDnsServers.toSql(
          internalDnsServers.value,
        ),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomRouteModesCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('routerConfig: $routerConfig, ')
          ..write('dnsRules: $dnsRules, ')
          ..write('internalDnsServers: $internalDnsServers')
          ..write(')'))
        .toString();
  }
}

class $HandlerSelectorsTable extends HandlerSelectors
    with TableInfo<$HandlerSelectorsTable, HandlerSelector> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HandlerSelectorsTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
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
  late final GeneratedColumnWithTypeConverter<SelectorConfig, Uint8List>
  config = GeneratedColumn<Uint8List>(
    'config',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  ).withConverter<SelectorConfig>($HandlerSelectorsTable.$converterconfig);
  @override
  List<GeneratedColumn> get $columns => [updatedAt, name, config];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'handler_selectors';
  @override
  VerificationContext validateIntegrity(
    Insertable<HandlerSelector> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  HandlerSelector map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HandlerSelector(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      config: $HandlerSelectorsTable.$converterconfig.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}config'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $HandlerSelectorsTable createAlias(String alias) {
    return $HandlerSelectorsTable(attachedDatabase, alias);
  }

  static TypeConverter<SelectorConfig, Uint8List> $converterconfig =
      const SelectorConfigConverter();
}

class HandlerSelectorsCompanion extends UpdateCompanion<HandlerSelector> {
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<SelectorConfig> config;
  final Value<int> rowid;
  const HandlerSelectorsCompanion({
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.config = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HandlerSelectorsCompanion.insert({
    this.updatedAt = const Value.absent(),
    required String name,
    required SelectorConfig config,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       config = Value(config);
  static Insertable<HandlerSelector> custom({
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<Uint8List>? config,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (config != null) 'config': config,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HandlerSelectorsCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<SelectorConfig>? config,
    Value<int>? rowid,
  }) {
    return HandlerSelectorsCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      config: config ?? this.config,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (config.present) {
      map['config'] = Variable<Uint8List>(
        $HandlerSelectorsTable.$converterconfig.toSql(config.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HandlerSelectorsCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('config: $config, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SelectorHandlerRelationsTable extends SelectorHandlerRelations
    with TableInfo<$SelectorHandlerRelationsTable, SelectorHandlerRelation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SelectorHandlerRelationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _selectorNameMeta = const VerificationMeta(
    'selectorName',
  );
  @override
  late final GeneratedColumn<String> selectorName = GeneratedColumn<String>(
    'selector_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES handler_selectors (name) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _handlerIdMeta = const VerificationMeta(
    'handlerId',
  );
  @override
  late final GeneratedColumn<int> handlerId = GeneratedColumn<int>(
    'handler_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES outbound_handlers (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, selectorName, handlerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'selector_handler_relations';
  @override
  VerificationContext validateIntegrity(
    Insertable<SelectorHandlerRelation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('selector_name')) {
      context.handle(
        _selectorNameMeta,
        selectorName.isAcceptableOrUnknown(
          data['selector_name']!,
          _selectorNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectorNameMeta);
    }
    if (data.containsKey('handler_id')) {
      context.handle(
        _handlerIdMeta,
        handlerId.isAcceptableOrUnknown(data['handler_id']!, _handlerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_handlerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {selectorName, handlerId},
  ];
  @override
  SelectorHandlerRelation map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SelectorHandlerRelation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      selectorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selector_name'],
      )!,
      handlerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}handler_id'],
      )!,
    );
  }

  @override
  $SelectorHandlerRelationsTable createAlias(String alias) {
    return $SelectorHandlerRelationsTable(attachedDatabase, alias);
  }
}

class SelectorHandlerRelation extends DataClass
    implements Insertable<SelectorHandlerRelation> {
  final int id;
  final String selectorName;
  final int handlerId;
  const SelectorHandlerRelation({
    required this.id,
    required this.selectorName,
    required this.handlerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['selector_name'] = Variable<String>(selectorName);
    map['handler_id'] = Variable<int>(handlerId);
    return map;
  }

  SelectorHandlerRelationsCompanion toCompanion(bool nullToAbsent) {
    return SelectorHandlerRelationsCompanion(
      id: Value(id),
      selectorName: Value(selectorName),
      handlerId: Value(handlerId),
    );
  }

  factory SelectorHandlerRelation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SelectorHandlerRelation(
      id: serializer.fromJson<int>(json['id']),
      selectorName: serializer.fromJson<String>(json['selectorName']),
      handlerId: serializer.fromJson<int>(json['handlerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'selectorName': serializer.toJson<String>(selectorName),
      'handlerId': serializer.toJson<int>(handlerId),
    };
  }

  SelectorHandlerRelation copyWith({
    int? id,
    String? selectorName,
    int? handlerId,
  }) => SelectorHandlerRelation(
    id: id ?? this.id,
    selectorName: selectorName ?? this.selectorName,
    handlerId: handlerId ?? this.handlerId,
  );
  SelectorHandlerRelation copyWithCompanion(
    SelectorHandlerRelationsCompanion data,
  ) {
    return SelectorHandlerRelation(
      id: data.id.present ? data.id.value : this.id,
      selectorName: data.selectorName.present
          ? data.selectorName.value
          : this.selectorName,
      handlerId: data.handlerId.present ? data.handlerId.value : this.handlerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SelectorHandlerRelation(')
          ..write('id: $id, ')
          ..write('selectorName: $selectorName, ')
          ..write('handlerId: $handlerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, selectorName, handlerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SelectorHandlerRelation &&
          other.id == this.id &&
          other.selectorName == this.selectorName &&
          other.handlerId == this.handlerId);
}

class SelectorHandlerRelationsCompanion
    extends UpdateCompanion<SelectorHandlerRelation> {
  final Value<int> id;
  final Value<String> selectorName;
  final Value<int> handlerId;
  const SelectorHandlerRelationsCompanion({
    this.id = const Value.absent(),
    this.selectorName = const Value.absent(),
    this.handlerId = const Value.absent(),
  });
  SelectorHandlerRelationsCompanion.insert({
    this.id = const Value.absent(),
    required String selectorName,
    required int handlerId,
  }) : selectorName = Value(selectorName),
       handlerId = Value(handlerId);
  static Insertable<SelectorHandlerRelation> custom({
    Expression<int>? id,
    Expression<String>? selectorName,
    Expression<int>? handlerId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (selectorName != null) 'selector_name': selectorName,
      if (handlerId != null) 'handler_id': handlerId,
    });
  }

  SelectorHandlerRelationsCompanion copyWith({
    Value<int>? id,
    Value<String>? selectorName,
    Value<int>? handlerId,
  }) {
    return SelectorHandlerRelationsCompanion(
      id: id ?? this.id,
      selectorName: selectorName ?? this.selectorName,
      handlerId: handlerId ?? this.handlerId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (selectorName.present) {
      map['selector_name'] = Variable<String>(selectorName.value);
    }
    if (handlerId.present) {
      map['handler_id'] = Variable<int>(handlerId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SelectorHandlerRelationsCompanion(')
          ..write('id: $id, ')
          ..write('selectorName: $selectorName, ')
          ..write('handlerId: $handlerId')
          ..write(')'))
        .toString();
  }
}

class $SelectorHandlerGroupRelationsTable extends SelectorHandlerGroupRelations
    with
        TableInfo<
          $SelectorHandlerGroupRelationsTable,
          SelectorHandlerGroupRelation
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SelectorHandlerGroupRelationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _selectorNameMeta = const VerificationMeta(
    'selectorName',
  );
  @override
  late final GeneratedColumn<String> selectorName = GeneratedColumn<String>(
    'selector_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES handler_selectors (name) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _groupNameMeta = const VerificationMeta(
    'groupName',
  );
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
    'group_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES outbound_handler_groups (name) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, selectorName, groupName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'selector_handler_group_relations';
  @override
  VerificationContext validateIntegrity(
    Insertable<SelectorHandlerGroupRelation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('selector_name')) {
      context.handle(
        _selectorNameMeta,
        selectorName.isAcceptableOrUnknown(
          data['selector_name']!,
          _selectorNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectorNameMeta);
    }
    if (data.containsKey('group_name')) {
      context.handle(
        _groupNameMeta,
        groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta),
      );
    } else if (isInserting) {
      context.missing(_groupNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {selectorName, groupName},
  ];
  @override
  SelectorHandlerGroupRelation map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SelectorHandlerGroupRelation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      selectorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selector_name'],
      )!,
      groupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_name'],
      )!,
    );
  }

  @override
  $SelectorHandlerGroupRelationsTable createAlias(String alias) {
    return $SelectorHandlerGroupRelationsTable(attachedDatabase, alias);
  }
}

class SelectorHandlerGroupRelation extends DataClass
    implements Insertable<SelectorHandlerGroupRelation> {
  final int id;
  final String selectorName;
  final String groupName;
  const SelectorHandlerGroupRelation({
    required this.id,
    required this.selectorName,
    required this.groupName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['selector_name'] = Variable<String>(selectorName);
    map['group_name'] = Variable<String>(groupName);
    return map;
  }

  SelectorHandlerGroupRelationsCompanion toCompanion(bool nullToAbsent) {
    return SelectorHandlerGroupRelationsCompanion(
      id: Value(id),
      selectorName: Value(selectorName),
      groupName: Value(groupName),
    );
  }

  factory SelectorHandlerGroupRelation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SelectorHandlerGroupRelation(
      id: serializer.fromJson<int>(json['id']),
      selectorName: serializer.fromJson<String>(json['selectorName']),
      groupName: serializer.fromJson<String>(json['groupName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'selectorName': serializer.toJson<String>(selectorName),
      'groupName': serializer.toJson<String>(groupName),
    };
  }

  SelectorHandlerGroupRelation copyWith({
    int? id,
    String? selectorName,
    String? groupName,
  }) => SelectorHandlerGroupRelation(
    id: id ?? this.id,
    selectorName: selectorName ?? this.selectorName,
    groupName: groupName ?? this.groupName,
  );
  SelectorHandlerGroupRelation copyWithCompanion(
    SelectorHandlerGroupRelationsCompanion data,
  ) {
    return SelectorHandlerGroupRelation(
      id: data.id.present ? data.id.value : this.id,
      selectorName: data.selectorName.present
          ? data.selectorName.value
          : this.selectorName,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SelectorHandlerGroupRelation(')
          ..write('id: $id, ')
          ..write('selectorName: $selectorName, ')
          ..write('groupName: $groupName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, selectorName, groupName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SelectorHandlerGroupRelation &&
          other.id == this.id &&
          other.selectorName == this.selectorName &&
          other.groupName == this.groupName);
}

class SelectorHandlerGroupRelationsCompanion
    extends UpdateCompanion<SelectorHandlerGroupRelation> {
  final Value<int> id;
  final Value<String> selectorName;
  final Value<String> groupName;
  const SelectorHandlerGroupRelationsCompanion({
    this.id = const Value.absent(),
    this.selectorName = const Value.absent(),
    this.groupName = const Value.absent(),
  });
  SelectorHandlerGroupRelationsCompanion.insert({
    this.id = const Value.absent(),
    required String selectorName,
    required String groupName,
  }) : selectorName = Value(selectorName),
       groupName = Value(groupName);
  static Insertable<SelectorHandlerGroupRelation> custom({
    Expression<int>? id,
    Expression<String>? selectorName,
    Expression<String>? groupName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (selectorName != null) 'selector_name': selectorName,
      if (groupName != null) 'group_name': groupName,
    });
  }

  SelectorHandlerGroupRelationsCompanion copyWith({
    Value<int>? id,
    Value<String>? selectorName,
    Value<String>? groupName,
  }) {
    return SelectorHandlerGroupRelationsCompanion(
      id: id ?? this.id,
      selectorName: selectorName ?? this.selectorName,
      groupName: groupName ?? this.groupName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (selectorName.present) {
      map['selector_name'] = Variable<String>(selectorName.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SelectorHandlerGroupRelationsCompanion(')
          ..write('id: $id, ')
          ..write('selectorName: $selectorName, ')
          ..write('groupName: $groupName')
          ..write(')'))
        .toString();
  }
}

class $SelectorSubscriptionRelationsTable extends SelectorSubscriptionRelations
    with
        TableInfo<
          $SelectorSubscriptionRelationsTable,
          SelectorSubscriptionRelation
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SelectorSubscriptionRelationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _selectorNameMeta = const VerificationMeta(
    'selectorName',
  );
  @override
  late final GeneratedColumn<String> selectorName = GeneratedColumn<String>(
    'selector_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES handler_selectors (name) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _subscriptionIdMeta = const VerificationMeta(
    'subscriptionId',
  );
  @override
  late final GeneratedColumn<int> subscriptionId = GeneratedColumn<int>(
    'subscription_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subscriptions (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, selectorName, subscriptionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'selector_subscription_relations';
  @override
  VerificationContext validateIntegrity(
    Insertable<SelectorSubscriptionRelation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('selector_name')) {
      context.handle(
        _selectorNameMeta,
        selectorName.isAcceptableOrUnknown(
          data['selector_name']!,
          _selectorNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectorNameMeta);
    }
    if (data.containsKey('subscription_id')) {
      context.handle(
        _subscriptionIdMeta,
        subscriptionId.isAcceptableOrUnknown(
          data['subscription_id']!,
          _subscriptionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subscriptionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {selectorName, subscriptionId},
  ];
  @override
  SelectorSubscriptionRelation map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SelectorSubscriptionRelation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      selectorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selector_name'],
      )!,
      subscriptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subscription_id'],
      )!,
    );
  }

  @override
  $SelectorSubscriptionRelationsTable createAlias(String alias) {
    return $SelectorSubscriptionRelationsTable(attachedDatabase, alias);
  }
}

class SelectorSubscriptionRelation extends DataClass
    implements Insertable<SelectorSubscriptionRelation> {
  final int id;
  final String selectorName;
  final int subscriptionId;
  const SelectorSubscriptionRelation({
    required this.id,
    required this.selectorName,
    required this.subscriptionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['selector_name'] = Variable<String>(selectorName);
    map['subscription_id'] = Variable<int>(subscriptionId);
    return map;
  }

  SelectorSubscriptionRelationsCompanion toCompanion(bool nullToAbsent) {
    return SelectorSubscriptionRelationsCompanion(
      id: Value(id),
      selectorName: Value(selectorName),
      subscriptionId: Value(subscriptionId),
    );
  }

  factory SelectorSubscriptionRelation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SelectorSubscriptionRelation(
      id: serializer.fromJson<int>(json['id']),
      selectorName: serializer.fromJson<String>(json['selectorName']),
      subscriptionId: serializer.fromJson<int>(json['subscriptionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'selectorName': serializer.toJson<String>(selectorName),
      'subscriptionId': serializer.toJson<int>(subscriptionId),
    };
  }

  SelectorSubscriptionRelation copyWith({
    int? id,
    String? selectorName,
    int? subscriptionId,
  }) => SelectorSubscriptionRelation(
    id: id ?? this.id,
    selectorName: selectorName ?? this.selectorName,
    subscriptionId: subscriptionId ?? this.subscriptionId,
  );
  SelectorSubscriptionRelation copyWithCompanion(
    SelectorSubscriptionRelationsCompanion data,
  ) {
    return SelectorSubscriptionRelation(
      id: data.id.present ? data.id.value : this.id,
      selectorName: data.selectorName.present
          ? data.selectorName.value
          : this.selectorName,
      subscriptionId: data.subscriptionId.present
          ? data.subscriptionId.value
          : this.subscriptionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SelectorSubscriptionRelation(')
          ..write('id: $id, ')
          ..write('selectorName: $selectorName, ')
          ..write('subscriptionId: $subscriptionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, selectorName, subscriptionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SelectorSubscriptionRelation &&
          other.id == this.id &&
          other.selectorName == this.selectorName &&
          other.subscriptionId == this.subscriptionId);
}

class SelectorSubscriptionRelationsCompanion
    extends UpdateCompanion<SelectorSubscriptionRelation> {
  final Value<int> id;
  final Value<String> selectorName;
  final Value<int> subscriptionId;
  const SelectorSubscriptionRelationsCompanion({
    this.id = const Value.absent(),
    this.selectorName = const Value.absent(),
    this.subscriptionId = const Value.absent(),
  });
  SelectorSubscriptionRelationsCompanion.insert({
    this.id = const Value.absent(),
    required String selectorName,
    required int subscriptionId,
  }) : selectorName = Value(selectorName),
       subscriptionId = Value(subscriptionId);
  static Insertable<SelectorSubscriptionRelation> custom({
    Expression<int>? id,
    Expression<String>? selectorName,
    Expression<int>? subscriptionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (selectorName != null) 'selector_name': selectorName,
      if (subscriptionId != null) 'subscription_id': subscriptionId,
    });
  }

  SelectorSubscriptionRelationsCompanion copyWith({
    Value<int>? id,
    Value<String>? selectorName,
    Value<int>? subscriptionId,
  }) {
    return SelectorSubscriptionRelationsCompanion(
      id: id ?? this.id,
      selectorName: selectorName ?? this.selectorName,
      subscriptionId: subscriptionId ?? this.subscriptionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (selectorName.present) {
      map['selector_name'] = Variable<String>(selectorName.value);
    }
    if (subscriptionId.present) {
      map['subscription_id'] = Variable<int>(subscriptionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SelectorSubscriptionRelationsCompanion(')
          ..write('id: $id, ')
          ..write('selectorName: $selectorName, ')
          ..write('subscriptionId: $subscriptionId')
          ..write(')'))
        .toString();
  }
}

class $DnsServersTable extends DnsServers
    with TableInfo<$DnsServersTable, DnsServer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DnsServersTable(this.attachedDatabase, [this._alias]);
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
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  late final GeneratedColumnWithTypeConverter<dns.DnsServerConfig, Uint8List>
  dnsServer = GeneratedColumn<Uint8List>(
    'dns_server',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  ).withConverter<dns.DnsServerConfig>($DnsServersTable.$converterdnsServer);
  @override
  List<GeneratedColumn> get $columns => [updatedAt, id, name, dnsServer];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dns_servers';
  @override
  VerificationContext validateIntegrity(
    Insertable<DnsServer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DnsServer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DnsServer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dnsServer: $DnsServersTable.$converterdnsServer.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.blob,
          data['${effectivePrefix}dns_server'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $DnsServersTable createAlias(String alias) {
    return $DnsServersTable(attachedDatabase, alias);
  }

  static TypeConverter<dns.DnsServerConfig, Uint8List> $converterdnsServer =
      const DnsServerConverter();
}

class DnsServersCompanion extends UpdateCompanion<DnsServer> {
  final Value<DateTime?> updatedAt;
  final Value<int> id;
  final Value<String> name;
  final Value<dns.DnsServerConfig> dnsServer;
  const DnsServersCompanion({
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dnsServer = const Value.absent(),
  });
  DnsServersCompanion.insert({
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required dns.DnsServerConfig dnsServer,
  }) : name = Value(name),
       dnsServer = Value(dnsServer);
  static Insertable<DnsServer> custom({
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? name,
    Expression<Uint8List>? dnsServer,
  }) {
    return RawValuesInsertable({
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dnsServer != null) 'dns_server': dnsServer,
    });
  }

  DnsServersCompanion copyWith({
    Value<DateTime?>? updatedAt,
    Value<int>? id,
    Value<String>? name,
    Value<dns.DnsServerConfig>? dnsServer,
  }) {
    return DnsServersCompanion(
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      name: name ?? this.name,
      dnsServer: dnsServer ?? this.dnsServer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dnsServer.present) {
      map['dns_server'] = Variable<Uint8List>(
        $DnsServersTable.$converterdnsServer.toSql(dnsServer.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DnsServersCompanion(')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dnsServer: $dnsServer')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubscriptionsTable subscriptions = $SubscriptionsTable(this);
  late final $OutboundHandlersTable outboundHandlers = $OutboundHandlersTable(
    this,
  );
  late final $OutboundHandlerGroupsTable outboundHandlerGroups =
      $OutboundHandlerGroupsTable(this);
  late final $OutboundHandlerGroupRelationsTable outboundHandlerGroupRelations =
      $OutboundHandlerGroupRelationsTable(this);
  late final $DnsRecordsTable dnsRecords = $DnsRecordsTable(this);
  late final $AtomicDomainSetsTable atomicDomainSets = $AtomicDomainSetsTable(
    this,
  );
  late final $GeoDomainsTable geoDomains = $GeoDomainsTable(this);
  late final $GreatDomainSetsTable greatDomainSets = $GreatDomainSetsTable(
    this,
  );
  late final $AtomicIpSetsTable atomicIpSets = $AtomicIpSetsTable(this);
  late final $GreatIpSetsTable greatIpSets = $GreatIpSetsTable(this);
  late final $AppSetsTable appSets = $AppSetsTable(this);
  late final $AppsTable apps = $AppsTable(this);
  late final $CidrsTable cidrs = $CidrsTable(this);
  late final $SshServersTable sshServers = $SshServersTable(this);
  late final $CommonSshKeysTable commonSshKeys = $CommonSshKeysTable(this);
  late final $CustomRouteModesTable customRouteModes = $CustomRouteModesTable(
    this,
  );
  late final $HandlerSelectorsTable handlerSelectors = $HandlerSelectorsTable(
    this,
  );
  late final $SelectorHandlerRelationsTable selectorHandlerRelations =
      $SelectorHandlerRelationsTable(this);
  late final $SelectorHandlerGroupRelationsTable selectorHandlerGroupRelations =
      $SelectorHandlerGroupRelationsTable(this);
  late final $SelectorSubscriptionRelationsTable selectorSubscriptionRelations =
      $SelectorSubscriptionRelationsTable(this);
  late final $DnsServersTable dnsServers = $DnsServersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    subscriptions,
    outboundHandlers,
    outboundHandlerGroups,
    outboundHandlerGroupRelations,
    dnsRecords,
    atomicDomainSets,
    geoDomains,
    greatDomainSets,
    atomicIpSets,
    greatIpSets,
    appSets,
    apps,
    cidrs,
    sshServers,
    commonSshKeys,
    customRouteModes,
    handlerSelectors,
    selectorHandlerRelations,
    selectorHandlerGroupRelations,
    selectorSubscriptionRelations,
    dnsServers,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'subscriptions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('outbound_handlers', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'outbound_handler_groups',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate(
          'outbound_handler_group_relations',
          kind: UpdateKind.delete,
        ),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'outbound_handlers',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate(
          'outbound_handler_group_relations',
          kind: UpdateKind.delete,
        ),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'atomic_domain_sets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('geo_domains', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'atomic_domain_sets',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('geo_domains', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_sets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('apps', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_sets',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('apps', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'atomic_ip_sets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cidrs', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'atomic_ip_sets',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('cidrs', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'handler_selectors',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('selector_handler_relations', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'outbound_handlers',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('selector_handler_relations', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'handler_selectors',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate(
          'selector_handler_group_relations',
          kind: UpdateKind.delete,
        ),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'outbound_handler_groups',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate(
          'selector_handler_group_relations',
          kind: UpdateKind.delete,
        ),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'handler_selectors',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('selector_subscription_relations', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'subscriptions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('selector_subscription_relations', kind: UpdateKind.delete),
      ],
    ),
  ]);
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$SubscriptionsTableCreateCompanionBuilder =
    SubscriptionsCompanion Function({
      Value<DateTime?> updatedAt,
      Value<int> id,
      required String name,
      required String link,
      Value<double?> remainingData,
      Value<int?> endTime,
      Value<String> website,
      Value<String> description,
      required int lastUpdate,
      required int lastSuccessUpdate,
      Value<bool> placeOnTop,
    });
typedef $$SubscriptionsTableUpdateCompanionBuilder =
    SubscriptionsCompanion Function({
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<String> name,
      Value<String> link,
      Value<double?> remainingData,
      Value<int?> endTime,
      Value<String> website,
      Value<String> description,
      Value<int> lastUpdate,
      Value<int> lastSuccessUpdate,
      Value<bool> placeOnTop,
    });

final class $$SubscriptionsTableReferences
    extends BaseReferences<_$AppDatabase, $SubscriptionsTable, Subscription> {
  $$SubscriptionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$OutboundHandlersTable, List<OutboundHandler>>
  _outboundHandlersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.outboundHandlers,
    aliasName: $_aliasNameGenerator(
      db.subscriptions.id,
      db.outboundHandlers.subId,
    ),
  );

  $$OutboundHandlersTableProcessedTableManager get outboundHandlersRefs {
    final manager = $$OutboundHandlersTableTableManager(
      $_db,
      $_db.outboundHandlers,
    ).filter((f) => f.subId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _outboundHandlersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SelectorSubscriptionRelationsTable,
    List<SelectorSubscriptionRelation>
  >
  _selectorSubscriptionRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.selectorSubscriptionRelations,
        aliasName: $_aliasNameGenerator(
          db.subscriptions.id,
          db.selectorSubscriptionRelations.subscriptionId,
        ),
      );

  $$SelectorSubscriptionRelationsTableProcessedTableManager
  get selectorSubscriptionRelationsRefs {
    final manager = $$SelectorSubscriptionRelationsTableTableManager(
      $_db,
      $_db.selectorSubscriptionRelations,
    ).filter((f) => f.subscriptionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _selectorSubscriptionRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SubscriptionsTableFilterComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  ColumnFilters<String> get link => $composableBuilder(
    column: $table.link,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get remainingData => $composableBuilder(
    column: $table.remainingData,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastSuccessUpdate => $composableBuilder(
    column: $table.lastSuccessUpdate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get placeOnTop => $composableBuilder(
    column: $table.placeOnTop,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> outboundHandlersRefs(
    Expression<bool> Function($$OutboundHandlersTableFilterComposer f) f,
  ) {
    final $$OutboundHandlersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.outboundHandlers,
      getReferencedColumn: (t) => t.subId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OutboundHandlersTableFilterComposer(
            $db: $db,
            $table: $db.outboundHandlers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> selectorSubscriptionRelationsRefs(
    Expression<bool> Function(
      $$SelectorSubscriptionRelationsTableFilterComposer f,
    )
    f,
  ) {
    final $$SelectorSubscriptionRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.selectorSubscriptionRelations,
          getReferencedColumn: (t) => t.subscriptionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorSubscriptionRelationsTableFilterComposer(
                $db: $db,
                $table: $db.selectorSubscriptionRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SubscriptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  ColumnOrderings<String> get link => $composableBuilder(
    column: $table.link,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get remainingData => $composableBuilder(
    column: $table.remainingData,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastSuccessUpdate => $composableBuilder(
    column: $table.lastSuccessUpdate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get placeOnTop => $composableBuilder(
    column: $table.placeOnTop,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubscriptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get link =>
      $composableBuilder(column: $table.link, builder: (column) => column);

  GeneratedColumn<double> get remainingData => $composableBuilder(
    column: $table.remainingData,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastSuccessUpdate => $composableBuilder(
    column: $table.lastSuccessUpdate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get placeOnTop => $composableBuilder(
    column: $table.placeOnTop,
    builder: (column) => column,
  );

  Expression<T> outboundHandlersRefs<T extends Object>(
    Expression<T> Function($$OutboundHandlersTableAnnotationComposer a) f,
  ) {
    final $$OutboundHandlersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.outboundHandlers,
      getReferencedColumn: (t) => t.subId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OutboundHandlersTableAnnotationComposer(
            $db: $db,
            $table: $db.outboundHandlers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> selectorSubscriptionRelationsRefs<T extends Object>(
    Expression<T> Function(
      $$SelectorSubscriptionRelationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$SelectorSubscriptionRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.selectorSubscriptionRelations,
          getReferencedColumn: (t) => t.subscriptionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorSubscriptionRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.selectorSubscriptionRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SubscriptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubscriptionsTable,
          Subscription,
          $$SubscriptionsTableFilterComposer,
          $$SubscriptionsTableOrderingComposer,
          $$SubscriptionsTableAnnotationComposer,
          $$SubscriptionsTableCreateCompanionBuilder,
          $$SubscriptionsTableUpdateCompanionBuilder,
          (Subscription, $$SubscriptionsTableReferences),
          Subscription,
          PrefetchHooks Function({
            bool outboundHandlersRefs,
            bool selectorSubscriptionRelationsRefs,
          })
        > {
  $$SubscriptionsTableTableManager(_$AppDatabase db, $SubscriptionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubscriptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubscriptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubscriptionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> link = const Value.absent(),
                Value<double?> remainingData = const Value.absent(),
                Value<int?> endTime = const Value.absent(),
                Value<String> website = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> lastUpdate = const Value.absent(),
                Value<int> lastSuccessUpdate = const Value.absent(),
                Value<bool> placeOnTop = const Value.absent(),
              }) => SubscriptionsCompanion(
                updatedAt: updatedAt,
                id: id,
                name: name,
                link: link,
                remainingData: remainingData,
                endTime: endTime,
                website: website,
                description: description,
                lastUpdate: lastUpdate,
                lastSuccessUpdate: lastSuccessUpdate,
                placeOnTop: placeOnTop,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
                required String link,
                Value<double?> remainingData = const Value.absent(),
                Value<int?> endTime = const Value.absent(),
                Value<String> website = const Value.absent(),
                Value<String> description = const Value.absent(),
                required int lastUpdate,
                required int lastSuccessUpdate,
                Value<bool> placeOnTop = const Value.absent(),
              }) => SubscriptionsCompanion.insert(
                updatedAt: updatedAt,
                id: id,
                name: name,
                link: link,
                remainingData: remainingData,
                endTime: endTime,
                website: website,
                description: description,
                lastUpdate: lastUpdate,
                lastSuccessUpdate: lastSuccessUpdate,
                placeOnTop: placeOnTop,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubscriptionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                outboundHandlersRefs = false,
                selectorSubscriptionRelationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (outboundHandlersRefs) db.outboundHandlers,
                    if (selectorSubscriptionRelationsRefs)
                      db.selectorSubscriptionRelations,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (outboundHandlersRefs)
                        await $_getPrefetchedData<
                          Subscription,
                          $SubscriptionsTable,
                          OutboundHandler
                        >(
                          currentTable: table,
                          referencedTable: $$SubscriptionsTableReferences
                              ._outboundHandlersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubscriptionsTableReferences(
                                db,
                                table,
                                p0,
                              ).outboundHandlersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (selectorSubscriptionRelationsRefs)
                        await $_getPrefetchedData<
                          Subscription,
                          $SubscriptionsTable,
                          SelectorSubscriptionRelation
                        >(
                          currentTable: table,
                          referencedTable: $$SubscriptionsTableReferences
                              ._selectorSubscriptionRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubscriptionsTableReferences(
                                db,
                                table,
                                p0,
                              ).selectorSubscriptionRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subscriptionId == item.id,
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

typedef $$SubscriptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubscriptionsTable,
      Subscription,
      $$SubscriptionsTableFilterComposer,
      $$SubscriptionsTableOrderingComposer,
      $$SubscriptionsTableAnnotationComposer,
      $$SubscriptionsTableCreateCompanionBuilder,
      $$SubscriptionsTableUpdateCompanionBuilder,
      (Subscription, $$SubscriptionsTableReferences),
      Subscription,
      PrefetchHooks Function({
        bool outboundHandlersRefs,
        bool selectorSubscriptionRelationsRefs,
      })
    >;
typedef $$OutboundHandlersTableCreateCompanionBuilder =
    OutboundHandlersCompanion Function({
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<bool> selected,
      Value<String> countryCode,
      Value<String> sni,
      Value<double> speed,
      Value<int> speedTestTime,
      Value<int> ping,
      Value<int> pingTestTime,
      Value<int> ok,
      Value<String> serverIp,
      required HandlerConfig config,
      Value<int> support6,
      Value<int> support6TestTime,
      Value<int?> subId,
    });
typedef $$OutboundHandlersTableUpdateCompanionBuilder =
    OutboundHandlersCompanion Function({
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<bool> selected,
      Value<String> countryCode,
      Value<String> sni,
      Value<double> speed,
      Value<int> speedTestTime,
      Value<int> ping,
      Value<int> pingTestTime,
      Value<int> ok,
      Value<String> serverIp,
      Value<HandlerConfig> config,
      Value<int> support6,
      Value<int> support6TestTime,
      Value<int?> subId,
    });

final class $$OutboundHandlersTableReferences
    extends
        BaseReferences<_$AppDatabase, $OutboundHandlersTable, OutboundHandler> {
  $$OutboundHandlersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SubscriptionsTable _subIdTable(_$AppDatabase db) =>
      db.subscriptions.createAlias(
        $_aliasNameGenerator(db.outboundHandlers.subId, db.subscriptions.id),
      );

  $$SubscriptionsTableProcessedTableManager? get subId {
    final $_column = $_itemColumn<int>('sub_id');
    if ($_column == null) return null;
    final manager = $$SubscriptionsTableTableManager(
      $_db,
      $_db.subscriptions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $OutboundHandlerGroupRelationsTable,
    List<OutboundHandlerGroupRelation>
  >
  _outboundHandlerGroupRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.outboundHandlerGroupRelations,
        aliasName: $_aliasNameGenerator(
          db.outboundHandlers.id,
          db.outboundHandlerGroupRelations.handlerId,
        ),
      );

  $$OutboundHandlerGroupRelationsTableProcessedTableManager
  get outboundHandlerGroupRelationsRefs {
    final manager = $$OutboundHandlerGroupRelationsTableTableManager(
      $_db,
      $_db.outboundHandlerGroupRelations,
    ).filter((f) => f.handlerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _outboundHandlerGroupRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SelectorHandlerRelationsTable,
    List<SelectorHandlerRelation>
  >
  _selectorHandlerRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.selectorHandlerRelations,
        aliasName: $_aliasNameGenerator(
          db.outboundHandlers.id,
          db.selectorHandlerRelations.handlerId,
        ),
      );

  $$SelectorHandlerRelationsTableProcessedTableManager
  get selectorHandlerRelationsRefs {
    final manager = $$SelectorHandlerRelationsTableTableManager(
      $_db,
      $_db.selectorHandlerRelations,
    ).filter((f) => f.handlerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _selectorHandlerRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OutboundHandlersTableFilterComposer
    extends Composer<_$AppDatabase, $OutboundHandlersTable> {
  $$OutboundHandlersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get selected => $composableBuilder(
    column: $table.selected,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sni => $composableBuilder(
    column: $table.sni,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get speedTestTime => $composableBuilder(
    column: $table.speedTestTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ping => $composableBuilder(
    column: $table.ping,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pingTestTime => $composableBuilder(
    column: $table.pingTestTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ok => $composableBuilder(
    column: $table.ok,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverIp => $composableBuilder(
    column: $table.serverIp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<HandlerConfig, HandlerConfig, Uint8List>
  get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get support6 => $composableBuilder(
    column: $table.support6,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get support6TestTime => $composableBuilder(
    column: $table.support6TestTime,
    builder: (column) => ColumnFilters(column),
  );

  $$SubscriptionsTableFilterComposer get subId {
    final $$SubscriptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableFilterComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> outboundHandlerGroupRelationsRefs(
    Expression<bool> Function(
      $$OutboundHandlerGroupRelationsTableFilterComposer f,
    )
    f,
  ) {
    final $$OutboundHandlerGroupRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.outboundHandlerGroupRelations,
          getReferencedColumn: (t) => t.handlerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OutboundHandlerGroupRelationsTableFilterComposer(
                $db: $db,
                $table: $db.outboundHandlerGroupRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> selectorHandlerRelationsRefs(
    Expression<bool> Function($$SelectorHandlerRelationsTableFilterComposer f)
    f,
  ) {
    final $$SelectorHandlerRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.selectorHandlerRelations,
          getReferencedColumn: (t) => t.handlerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorHandlerRelationsTableFilterComposer(
                $db: $db,
                $table: $db.selectorHandlerRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$OutboundHandlersTableOrderingComposer
    extends Composer<_$AppDatabase, $OutboundHandlersTable> {
  $$OutboundHandlersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get selected => $composableBuilder(
    column: $table.selected,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sni => $composableBuilder(
    column: $table.sni,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get speedTestTime => $composableBuilder(
    column: $table.speedTestTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ping => $composableBuilder(
    column: $table.ping,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pingTestTime => $composableBuilder(
    column: $table.pingTestTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ok => $composableBuilder(
    column: $table.ok,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverIp => $composableBuilder(
    column: $table.serverIp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get support6 => $composableBuilder(
    column: $table.support6,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get support6TestTime => $composableBuilder(
    column: $table.support6TestTime,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubscriptionsTableOrderingComposer get subId {
    final $$SubscriptionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableOrderingComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OutboundHandlersTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutboundHandlersTable> {
  $$OutboundHandlersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get selected =>
      $composableBuilder(column: $table.selected, builder: (column) => column);

  GeneratedColumn<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sni =>
      $composableBuilder(column: $table.sni, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<int> get speedTestTime => $composableBuilder(
    column: $table.speedTestTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ping =>
      $composableBuilder(column: $table.ping, builder: (column) => column);

  GeneratedColumn<int> get pingTestTime => $composableBuilder(
    column: $table.pingTestTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ok =>
      $composableBuilder(column: $table.ok, builder: (column) => column);

  GeneratedColumn<String> get serverIp =>
      $composableBuilder(column: $table.serverIp, builder: (column) => column);

  GeneratedColumnWithTypeConverter<HandlerConfig, Uint8List> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);

  GeneratedColumn<int> get support6 =>
      $composableBuilder(column: $table.support6, builder: (column) => column);

  GeneratedColumn<int> get support6TestTime => $composableBuilder(
    column: $table.support6TestTime,
    builder: (column) => column,
  );

  $$SubscriptionsTableAnnotationComposer get subId {
    final $$SubscriptionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableAnnotationComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> outboundHandlerGroupRelationsRefs<T extends Object>(
    Expression<T> Function(
      $$OutboundHandlerGroupRelationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$OutboundHandlerGroupRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.outboundHandlerGroupRelations,
          getReferencedColumn: (t) => t.handlerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OutboundHandlerGroupRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.outboundHandlerGroupRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> selectorHandlerRelationsRefs<T extends Object>(
    Expression<T> Function($$SelectorHandlerRelationsTableAnnotationComposer a)
    f,
  ) {
    final $$SelectorHandlerRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.selectorHandlerRelations,
          getReferencedColumn: (t) => t.handlerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorHandlerRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.selectorHandlerRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$OutboundHandlersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OutboundHandlersTable,
          OutboundHandler,
          $$OutboundHandlersTableFilterComposer,
          $$OutboundHandlersTableOrderingComposer,
          $$OutboundHandlersTableAnnotationComposer,
          $$OutboundHandlersTableCreateCompanionBuilder,
          $$OutboundHandlersTableUpdateCompanionBuilder,
          (OutboundHandler, $$OutboundHandlersTableReferences),
          OutboundHandler,
          PrefetchHooks Function({
            bool subId,
            bool outboundHandlerGroupRelationsRefs,
            bool selectorHandlerRelationsRefs,
          })
        > {
  $$OutboundHandlersTableTableManager(
    _$AppDatabase db,
    $OutboundHandlersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutboundHandlersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutboundHandlersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutboundHandlersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<bool> selected = const Value.absent(),
                Value<String> countryCode = const Value.absent(),
                Value<String> sni = const Value.absent(),
                Value<double> speed = const Value.absent(),
                Value<int> speedTestTime = const Value.absent(),
                Value<int> ping = const Value.absent(),
                Value<int> pingTestTime = const Value.absent(),
                Value<int> ok = const Value.absent(),
                Value<String> serverIp = const Value.absent(),
                Value<HandlerConfig> config = const Value.absent(),
                Value<int> support6 = const Value.absent(),
                Value<int> support6TestTime = const Value.absent(),
                Value<int?> subId = const Value.absent(),
              }) => OutboundHandlersCompanion(
                updatedAt: updatedAt,
                id: id,
                selected: selected,
                countryCode: countryCode,
                sni: sni,
                speed: speed,
                speedTestTime: speedTestTime,
                ping: ping,
                pingTestTime: pingTestTime,
                ok: ok,
                serverIp: serverIp,
                config: config,
                support6: support6,
                support6TestTime: support6TestTime,
                subId: subId,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<bool> selected = const Value.absent(),
                Value<String> countryCode = const Value.absent(),
                Value<String> sni = const Value.absent(),
                Value<double> speed = const Value.absent(),
                Value<int> speedTestTime = const Value.absent(),
                Value<int> ping = const Value.absent(),
                Value<int> pingTestTime = const Value.absent(),
                Value<int> ok = const Value.absent(),
                Value<String> serverIp = const Value.absent(),
                required HandlerConfig config,
                Value<int> support6 = const Value.absent(),
                Value<int> support6TestTime = const Value.absent(),
                Value<int?> subId = const Value.absent(),
              }) => OutboundHandlersCompanion.insert(
                updatedAt: updatedAt,
                id: id,
                selected: selected,
                countryCode: countryCode,
                sni: sni,
                speed: speed,
                speedTestTime: speedTestTime,
                ping: ping,
                pingTestTime: pingTestTime,
                ok: ok,
                serverIp: serverIp,
                config: config,
                support6: support6,
                support6TestTime: support6TestTime,
                subId: subId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OutboundHandlersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                subId = false,
                outboundHandlerGroupRelationsRefs = false,
                selectorHandlerRelationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (outboundHandlerGroupRelationsRefs)
                      db.outboundHandlerGroupRelations,
                    if (selectorHandlerRelationsRefs)
                      db.selectorHandlerRelations,
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
                        if (subId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.subId,
                                    referencedTable:
                                        $$OutboundHandlersTableReferences
                                            ._subIdTable(db),
                                    referencedColumn:
                                        $$OutboundHandlersTableReferences
                                            ._subIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (outboundHandlerGroupRelationsRefs)
                        await $_getPrefetchedData<
                          OutboundHandler,
                          $OutboundHandlersTable,
                          OutboundHandlerGroupRelation
                        >(
                          currentTable: table,
                          referencedTable: $$OutboundHandlersTableReferences
                              ._outboundHandlerGroupRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OutboundHandlersTableReferences(
                                db,
                                table,
                                p0,
                              ).outboundHandlerGroupRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.handlerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (selectorHandlerRelationsRefs)
                        await $_getPrefetchedData<
                          OutboundHandler,
                          $OutboundHandlersTable,
                          SelectorHandlerRelation
                        >(
                          currentTable: table,
                          referencedTable: $$OutboundHandlersTableReferences
                              ._selectorHandlerRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OutboundHandlersTableReferences(
                                db,
                                table,
                                p0,
                              ).selectorHandlerRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.handlerId == item.id,
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

typedef $$OutboundHandlersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OutboundHandlersTable,
      OutboundHandler,
      $$OutboundHandlersTableFilterComposer,
      $$OutboundHandlersTableOrderingComposer,
      $$OutboundHandlersTableAnnotationComposer,
      $$OutboundHandlersTableCreateCompanionBuilder,
      $$OutboundHandlersTableUpdateCompanionBuilder,
      (OutboundHandler, $$OutboundHandlersTableReferences),
      OutboundHandler,
      PrefetchHooks Function({
        bool subId,
        bool outboundHandlerGroupRelationsRefs,
        bool selectorHandlerRelationsRefs,
      })
    >;
typedef $$OutboundHandlerGroupsTableCreateCompanionBuilder =
    OutboundHandlerGroupsCompanion Function({
      Value<DateTime?> updatedAt,
      required String name,
      Value<bool> placeOnTop,
      Value<int> rowid,
    });
typedef $$OutboundHandlerGroupsTableUpdateCompanionBuilder =
    OutboundHandlerGroupsCompanion Function({
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<bool> placeOnTop,
      Value<int> rowid,
    });

final class $$OutboundHandlerGroupsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $OutboundHandlerGroupsTable,
          OutboundHandlerGroup
        > {
  $$OutboundHandlerGroupsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $OutboundHandlerGroupRelationsTable,
    List<OutboundHandlerGroupRelation>
  >
  _outboundHandlerGroupRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.outboundHandlerGroupRelations,
        aliasName: $_aliasNameGenerator(
          db.outboundHandlerGroups.name,
          db.outboundHandlerGroupRelations.groupName,
        ),
      );

  $$OutboundHandlerGroupRelationsTableProcessedTableManager
  get outboundHandlerGroupRelationsRefs {
    final manager = $$OutboundHandlerGroupRelationsTableTableManager(
      $_db,
      $_db.outboundHandlerGroupRelations,
    ).filter((f) => f.groupName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(
      _outboundHandlerGroupRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SelectorHandlerGroupRelationsTable,
    List<SelectorHandlerGroupRelation>
  >
  _selectorHandlerGroupRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.selectorHandlerGroupRelations,
        aliasName: $_aliasNameGenerator(
          db.outboundHandlerGroups.name,
          db.selectorHandlerGroupRelations.groupName,
        ),
      );

  $$SelectorHandlerGroupRelationsTableProcessedTableManager
  get selectorHandlerGroupRelationsRefs {
    final manager = $$SelectorHandlerGroupRelationsTableTableManager(
      $_db,
      $_db.selectorHandlerGroupRelations,
    ).filter((f) => f.groupName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(
      _selectorHandlerGroupRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OutboundHandlerGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $OutboundHandlerGroupsTable> {
  $$OutboundHandlerGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get placeOnTop => $composableBuilder(
    column: $table.placeOnTop,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> outboundHandlerGroupRelationsRefs(
    Expression<bool> Function(
      $$OutboundHandlerGroupRelationsTableFilterComposer f,
    )
    f,
  ) {
    final $$OutboundHandlerGroupRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.outboundHandlerGroupRelations,
          getReferencedColumn: (t) => t.groupName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OutboundHandlerGroupRelationsTableFilterComposer(
                $db: $db,
                $table: $db.outboundHandlerGroupRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> selectorHandlerGroupRelationsRefs(
    Expression<bool> Function(
      $$SelectorHandlerGroupRelationsTableFilterComposer f,
    )
    f,
  ) {
    final $$SelectorHandlerGroupRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.selectorHandlerGroupRelations,
          getReferencedColumn: (t) => t.groupName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorHandlerGroupRelationsTableFilterComposer(
                $db: $db,
                $table: $db.selectorHandlerGroupRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$OutboundHandlerGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $OutboundHandlerGroupsTable> {
  $$OutboundHandlerGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get placeOnTop => $composableBuilder(
    column: $table.placeOnTop,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OutboundHandlerGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutboundHandlerGroupsTable> {
  $$OutboundHandlerGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get placeOnTop => $composableBuilder(
    column: $table.placeOnTop,
    builder: (column) => column,
  );

  Expression<T> outboundHandlerGroupRelationsRefs<T extends Object>(
    Expression<T> Function(
      $$OutboundHandlerGroupRelationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$OutboundHandlerGroupRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.outboundHandlerGroupRelations,
          getReferencedColumn: (t) => t.groupName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OutboundHandlerGroupRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.outboundHandlerGroupRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> selectorHandlerGroupRelationsRefs<T extends Object>(
    Expression<T> Function(
      $$SelectorHandlerGroupRelationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$SelectorHandlerGroupRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.selectorHandlerGroupRelations,
          getReferencedColumn: (t) => t.groupName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorHandlerGroupRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.selectorHandlerGroupRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$OutboundHandlerGroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OutboundHandlerGroupsTable,
          OutboundHandlerGroup,
          $$OutboundHandlerGroupsTableFilterComposer,
          $$OutboundHandlerGroupsTableOrderingComposer,
          $$OutboundHandlerGroupsTableAnnotationComposer,
          $$OutboundHandlerGroupsTableCreateCompanionBuilder,
          $$OutboundHandlerGroupsTableUpdateCompanionBuilder,
          (OutboundHandlerGroup, $$OutboundHandlerGroupsTableReferences),
          OutboundHandlerGroup,
          PrefetchHooks Function({
            bool outboundHandlerGroupRelationsRefs,
            bool selectorHandlerGroupRelationsRefs,
          })
        > {
  $$OutboundHandlerGroupsTableTableManager(
    _$AppDatabase db,
    $OutboundHandlerGroupsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutboundHandlerGroupsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$OutboundHandlerGroupsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$OutboundHandlerGroupsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> placeOnTop = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OutboundHandlerGroupsCompanion(
                updatedAt: updatedAt,
                name: name,
                placeOnTop: placeOnTop,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                Value<bool> placeOnTop = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OutboundHandlerGroupsCompanion.insert(
                updatedAt: updatedAt,
                name: name,
                placeOnTop: placeOnTop,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OutboundHandlerGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                outboundHandlerGroupRelationsRefs = false,
                selectorHandlerGroupRelationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (outboundHandlerGroupRelationsRefs)
                      db.outboundHandlerGroupRelations,
                    if (selectorHandlerGroupRelationsRefs)
                      db.selectorHandlerGroupRelations,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (outboundHandlerGroupRelationsRefs)
                        await $_getPrefetchedData<
                          OutboundHandlerGroup,
                          $OutboundHandlerGroupsTable,
                          OutboundHandlerGroupRelation
                        >(
                          currentTable: table,
                          referencedTable:
                              $$OutboundHandlerGroupsTableReferences
                                  ._outboundHandlerGroupRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OutboundHandlerGroupsTableReferences(
                                db,
                                table,
                                p0,
                              ).outboundHandlerGroupRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.groupName == item.name,
                              ),
                          typedResults: items,
                        ),
                      if (selectorHandlerGroupRelationsRefs)
                        await $_getPrefetchedData<
                          OutboundHandlerGroup,
                          $OutboundHandlerGroupsTable,
                          SelectorHandlerGroupRelation
                        >(
                          currentTable: table,
                          referencedTable:
                              $$OutboundHandlerGroupsTableReferences
                                  ._selectorHandlerGroupRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OutboundHandlerGroupsTableReferences(
                                db,
                                table,
                                p0,
                              ).selectorHandlerGroupRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.groupName == item.name,
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

typedef $$OutboundHandlerGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OutboundHandlerGroupsTable,
      OutboundHandlerGroup,
      $$OutboundHandlerGroupsTableFilterComposer,
      $$OutboundHandlerGroupsTableOrderingComposer,
      $$OutboundHandlerGroupsTableAnnotationComposer,
      $$OutboundHandlerGroupsTableCreateCompanionBuilder,
      $$OutboundHandlerGroupsTableUpdateCompanionBuilder,
      (OutboundHandlerGroup, $$OutboundHandlerGroupsTableReferences),
      OutboundHandlerGroup,
      PrefetchHooks Function({
        bool outboundHandlerGroupRelationsRefs,
        bool selectorHandlerGroupRelationsRefs,
      })
    >;
typedef $$OutboundHandlerGroupRelationsTableCreateCompanionBuilder =
    OutboundHandlerGroupRelationsCompanion Function({
      required String groupName,
      required int handlerId,
      Value<int> rowid,
    });
typedef $$OutboundHandlerGroupRelationsTableUpdateCompanionBuilder =
    OutboundHandlerGroupRelationsCompanion Function({
      Value<String> groupName,
      Value<int> handlerId,
      Value<int> rowid,
    });

final class $$OutboundHandlerGroupRelationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $OutboundHandlerGroupRelationsTable,
          OutboundHandlerGroupRelation
        > {
  $$OutboundHandlerGroupRelationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $OutboundHandlerGroupsTable _groupNameTable(_$AppDatabase db) =>
      db.outboundHandlerGroups.createAlias(
        $_aliasNameGenerator(
          db.outboundHandlerGroupRelations.groupName,
          db.outboundHandlerGroups.name,
        ),
      );

  $$OutboundHandlerGroupsTableProcessedTableManager get groupName {
    final $_column = $_itemColumn<String>('group_name')!;

    final manager = $$OutboundHandlerGroupsTableTableManager(
      $_db,
      $_db.outboundHandlerGroups,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OutboundHandlersTable _handlerIdTable(_$AppDatabase db) =>
      db.outboundHandlers.createAlias(
        $_aliasNameGenerator(
          db.outboundHandlerGroupRelations.handlerId,
          db.outboundHandlers.id,
        ),
      );

  $$OutboundHandlersTableProcessedTableManager get handlerId {
    final $_column = $_itemColumn<int>('handler_id')!;

    final manager = $$OutboundHandlersTableTableManager(
      $_db,
      $_db.outboundHandlers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_handlerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OutboundHandlerGroupRelationsTableFilterComposer
    extends Composer<_$AppDatabase, $OutboundHandlerGroupRelationsTable> {
  $$OutboundHandlerGroupRelationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$OutboundHandlerGroupsTableFilterComposer get groupName {
    final $$OutboundHandlerGroupsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupName,
          referencedTable: $db.outboundHandlerGroups,
          getReferencedColumn: (t) => t.name,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OutboundHandlerGroupsTableFilterComposer(
                $db: $db,
                $table: $db.outboundHandlerGroups,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$OutboundHandlersTableFilterComposer get handlerId {
    final $$OutboundHandlersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handlerId,
      referencedTable: $db.outboundHandlers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OutboundHandlersTableFilterComposer(
            $db: $db,
            $table: $db.outboundHandlers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OutboundHandlerGroupRelationsTableOrderingComposer
    extends Composer<_$AppDatabase, $OutboundHandlerGroupRelationsTable> {
  $$OutboundHandlerGroupRelationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$OutboundHandlerGroupsTableOrderingComposer get groupName {
    final $$OutboundHandlerGroupsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupName,
          referencedTable: $db.outboundHandlerGroups,
          getReferencedColumn: (t) => t.name,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OutboundHandlerGroupsTableOrderingComposer(
                $db: $db,
                $table: $db.outboundHandlerGroups,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$OutboundHandlersTableOrderingComposer get handlerId {
    final $$OutboundHandlersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handlerId,
      referencedTable: $db.outboundHandlers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OutboundHandlersTableOrderingComposer(
            $db: $db,
            $table: $db.outboundHandlers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OutboundHandlerGroupRelationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutboundHandlerGroupRelationsTable> {
  $$OutboundHandlerGroupRelationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$OutboundHandlerGroupsTableAnnotationComposer get groupName {
    final $$OutboundHandlerGroupsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupName,
          referencedTable: $db.outboundHandlerGroups,
          getReferencedColumn: (t) => t.name,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OutboundHandlerGroupsTableAnnotationComposer(
                $db: $db,
                $table: $db.outboundHandlerGroups,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$OutboundHandlersTableAnnotationComposer get handlerId {
    final $$OutboundHandlersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handlerId,
      referencedTable: $db.outboundHandlers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OutboundHandlersTableAnnotationComposer(
            $db: $db,
            $table: $db.outboundHandlers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OutboundHandlerGroupRelationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OutboundHandlerGroupRelationsTable,
          OutboundHandlerGroupRelation,
          $$OutboundHandlerGroupRelationsTableFilterComposer,
          $$OutboundHandlerGroupRelationsTableOrderingComposer,
          $$OutboundHandlerGroupRelationsTableAnnotationComposer,
          $$OutboundHandlerGroupRelationsTableCreateCompanionBuilder,
          $$OutboundHandlerGroupRelationsTableUpdateCompanionBuilder,
          (
            OutboundHandlerGroupRelation,
            $$OutboundHandlerGroupRelationsTableReferences,
          ),
          OutboundHandlerGroupRelation,
          PrefetchHooks Function({bool groupName, bool handlerId})
        > {
  $$OutboundHandlerGroupRelationsTableTableManager(
    _$AppDatabase db,
    $OutboundHandlerGroupRelationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutboundHandlerGroupRelationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$OutboundHandlerGroupRelationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$OutboundHandlerGroupRelationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> groupName = const Value.absent(),
                Value<int> handlerId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OutboundHandlerGroupRelationsCompanion(
                groupName: groupName,
                handlerId: handlerId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String groupName,
                required int handlerId,
                Value<int> rowid = const Value.absent(),
              }) => OutboundHandlerGroupRelationsCompanion.insert(
                groupName: groupName,
                handlerId: handlerId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OutboundHandlerGroupRelationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({groupName = false, handlerId = false}) {
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
                    if (groupName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.groupName,
                                referencedTable:
                                    $$OutboundHandlerGroupRelationsTableReferences
                                        ._groupNameTable(db),
                                referencedColumn:
                                    $$OutboundHandlerGroupRelationsTableReferences
                                        ._groupNameTable(db)
                                        .name,
                              )
                              as T;
                    }
                    if (handlerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.handlerId,
                                referencedTable:
                                    $$OutboundHandlerGroupRelationsTableReferences
                                        ._handlerIdTable(db),
                                referencedColumn:
                                    $$OutboundHandlerGroupRelationsTableReferences
                                        ._handlerIdTable(db)
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

typedef $$OutboundHandlerGroupRelationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OutboundHandlerGroupRelationsTable,
      OutboundHandlerGroupRelation,
      $$OutboundHandlerGroupRelationsTableFilterComposer,
      $$OutboundHandlerGroupRelationsTableOrderingComposer,
      $$OutboundHandlerGroupRelationsTableAnnotationComposer,
      $$OutboundHandlerGroupRelationsTableCreateCompanionBuilder,
      $$OutboundHandlerGroupRelationsTableUpdateCompanionBuilder,
      (
        OutboundHandlerGroupRelation,
        $$OutboundHandlerGroupRelationsTableReferences,
      ),
      OutboundHandlerGroupRelation,
      PrefetchHooks Function({bool groupName, bool handlerId})
    >;
typedef $$DnsRecordsTableCreateCompanionBuilder =
    DnsRecordsCompanion Function({
      Value<int> id,
      required dns.Record dnsRecord,
    });
typedef $$DnsRecordsTableUpdateCompanionBuilder =
    DnsRecordsCompanion Function({Value<int> id, Value<dns.Record> dnsRecord});

class $$DnsRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $DnsRecordsTable> {
  $$DnsRecordsTableFilterComposer({
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

  ColumnWithTypeConverterFilters<dns.Record, dns.Record, Uint8List>
  get dnsRecord => $composableBuilder(
    column: $table.dnsRecord,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$DnsRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $DnsRecordsTable> {
  $$DnsRecordsTableOrderingComposer({
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

  ColumnOrderings<Uint8List> get dnsRecord => $composableBuilder(
    column: $table.dnsRecord,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DnsRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DnsRecordsTable> {
  $$DnsRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<dns.Record, Uint8List> get dnsRecord =>
      $composableBuilder(column: $table.dnsRecord, builder: (column) => column);
}

class $$DnsRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DnsRecordsTable,
          DnsRecord,
          $$DnsRecordsTableFilterComposer,
          $$DnsRecordsTableOrderingComposer,
          $$DnsRecordsTableAnnotationComposer,
          $$DnsRecordsTableCreateCompanionBuilder,
          $$DnsRecordsTableUpdateCompanionBuilder,
          (
            DnsRecord,
            BaseReferences<_$AppDatabase, $DnsRecordsTable, DnsRecord>,
          ),
          DnsRecord,
          PrefetchHooks Function()
        > {
  $$DnsRecordsTableTableManager(_$AppDatabase db, $DnsRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DnsRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DnsRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DnsRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<dns.Record> dnsRecord = const Value.absent(),
              }) => DnsRecordsCompanion(id: id, dnsRecord: dnsRecord),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required dns.Record dnsRecord,
              }) => DnsRecordsCompanion.insert(id: id, dnsRecord: dnsRecord),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DnsRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DnsRecordsTable,
      DnsRecord,
      $$DnsRecordsTableFilterComposer,
      $$DnsRecordsTableOrderingComposer,
      $$DnsRecordsTableAnnotationComposer,
      $$DnsRecordsTableCreateCompanionBuilder,
      $$DnsRecordsTableUpdateCompanionBuilder,
      (DnsRecord, BaseReferences<_$AppDatabase, $DnsRecordsTable, DnsRecord>),
      DnsRecord,
      PrefetchHooks Function()
    >;
typedef $$AtomicDomainSetsTableCreateCompanionBuilder =
    AtomicDomainSetsCompanion Function({
      Value<DateTime?> updatedAt,
      required String name,
      Value<GeositeConfig?> geositeConfig,
      Value<bool> useBloomFilter,
      Value<List<String>?> clashRuleUrls,
      Value<String?> geoUrl,
      Value<bool> inverse,
      Value<int> rowid,
    });
typedef $$AtomicDomainSetsTableUpdateCompanionBuilder =
    AtomicDomainSetsCompanion Function({
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<GeositeConfig?> geositeConfig,
      Value<bool> useBloomFilter,
      Value<List<String>?> clashRuleUrls,
      Value<String?> geoUrl,
      Value<bool> inverse,
      Value<int> rowid,
    });

final class $$AtomicDomainSetsTableReferences
    extends
        BaseReferences<_$AppDatabase, $AtomicDomainSetsTable, AtomicDomainSet> {
  $$AtomicDomainSetsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$GeoDomainsTable, List<GeoDomain>>
  _geoDomainsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.geoDomains,
    aliasName: $_aliasNameGenerator(
      db.atomicDomainSets.name,
      db.geoDomains.domainSetName,
    ),
  );

  $$GeoDomainsTableProcessedTableManager get geoDomainsRefs {
    final manager = $$GeoDomainsTableTableManager($_db, $_db.geoDomains).filter(
      (f) => f.domainSetName.name.sqlEquals($_itemColumn<String>('name')!),
    );

    final cache = $_typedResult.readTableOrNull(_geoDomainsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AtomicDomainSetsTableFilterComposer
    extends Composer<_$AppDatabase, $AtomicDomainSetsTable> {
  $$AtomicDomainSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<GeositeConfig?, GeositeConfig, Uint8List>
  get geositeConfig => $composableBuilder(
    column: $table.geositeConfig,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get useBloomFilter => $composableBuilder(
    column: $table.useBloomFilter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get clashRuleUrls => $composableBuilder(
    column: $table.clashRuleUrls,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get geoUrl => $composableBuilder(
    column: $table.geoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get inverse => $composableBuilder(
    column: $table.inverse,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> geoDomainsRefs(
    Expression<bool> Function($$GeoDomainsTableFilterComposer f) f,
  ) {
    final $$GeoDomainsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.geoDomains,
      getReferencedColumn: (t) => t.domainSetName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeoDomainsTableFilterComposer(
            $db: $db,
            $table: $db.geoDomains,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AtomicDomainSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $AtomicDomainSetsTable> {
  $$AtomicDomainSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get geositeConfig => $composableBuilder(
    column: $table.geositeConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get useBloomFilter => $composableBuilder(
    column: $table.useBloomFilter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clashRuleUrls => $composableBuilder(
    column: $table.clashRuleUrls,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get geoUrl => $composableBuilder(
    column: $table.geoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get inverse => $composableBuilder(
    column: $table.inverse,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AtomicDomainSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AtomicDomainSetsTable> {
  $$AtomicDomainSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GeositeConfig?, Uint8List>
  get geositeConfig => $composableBuilder(
    column: $table.geositeConfig,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get useBloomFilter => $composableBuilder(
    column: $table.useBloomFilter,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>?, String> get clashRuleUrls =>
      $composableBuilder(
        column: $table.clashRuleUrls,
        builder: (column) => column,
      );

  GeneratedColumn<String> get geoUrl =>
      $composableBuilder(column: $table.geoUrl, builder: (column) => column);

  GeneratedColumn<bool> get inverse =>
      $composableBuilder(column: $table.inverse, builder: (column) => column);

  Expression<T> geoDomainsRefs<T extends Object>(
    Expression<T> Function($$GeoDomainsTableAnnotationComposer a) f,
  ) {
    final $$GeoDomainsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.geoDomains,
      getReferencedColumn: (t) => t.domainSetName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeoDomainsTableAnnotationComposer(
            $db: $db,
            $table: $db.geoDomains,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AtomicDomainSetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AtomicDomainSetsTable,
          AtomicDomainSet,
          $$AtomicDomainSetsTableFilterComposer,
          $$AtomicDomainSetsTableOrderingComposer,
          $$AtomicDomainSetsTableAnnotationComposer,
          $$AtomicDomainSetsTableCreateCompanionBuilder,
          $$AtomicDomainSetsTableUpdateCompanionBuilder,
          (AtomicDomainSet, $$AtomicDomainSetsTableReferences),
          AtomicDomainSet,
          PrefetchHooks Function({bool geoDomainsRefs})
        > {
  $$AtomicDomainSetsTableTableManager(
    _$AppDatabase db,
    $AtomicDomainSetsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AtomicDomainSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AtomicDomainSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AtomicDomainSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<GeositeConfig?> geositeConfig = const Value.absent(),
                Value<bool> useBloomFilter = const Value.absent(),
                Value<List<String>?> clashRuleUrls = const Value.absent(),
                Value<String?> geoUrl = const Value.absent(),
                Value<bool> inverse = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AtomicDomainSetsCompanion(
                updatedAt: updatedAt,
                name: name,
                geositeConfig: geositeConfig,
                useBloomFilter: useBloomFilter,
                clashRuleUrls: clashRuleUrls,
                geoUrl: geoUrl,
                inverse: inverse,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                Value<GeositeConfig?> geositeConfig = const Value.absent(),
                Value<bool> useBloomFilter = const Value.absent(),
                Value<List<String>?> clashRuleUrls = const Value.absent(),
                Value<String?> geoUrl = const Value.absent(),
                Value<bool> inverse = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AtomicDomainSetsCompanion.insert(
                updatedAt: updatedAt,
                name: name,
                geositeConfig: geositeConfig,
                useBloomFilter: useBloomFilter,
                clashRuleUrls: clashRuleUrls,
                geoUrl: geoUrl,
                inverse: inverse,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AtomicDomainSetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({geoDomainsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (geoDomainsRefs) db.geoDomains],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (geoDomainsRefs)
                    await $_getPrefetchedData<
                      AtomicDomainSet,
                      $AtomicDomainSetsTable,
                      GeoDomain
                    >(
                      currentTable: table,
                      referencedTable: $$AtomicDomainSetsTableReferences
                          ._geoDomainsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AtomicDomainSetsTableReferences(
                            db,
                            table,
                            p0,
                          ).geoDomainsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.domainSetName == item.name,
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

typedef $$AtomicDomainSetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AtomicDomainSetsTable,
      AtomicDomainSet,
      $$AtomicDomainSetsTableFilterComposer,
      $$AtomicDomainSetsTableOrderingComposer,
      $$AtomicDomainSetsTableAnnotationComposer,
      $$AtomicDomainSetsTableCreateCompanionBuilder,
      $$AtomicDomainSetsTableUpdateCompanionBuilder,
      (AtomicDomainSet, $$AtomicDomainSetsTableReferences),
      AtomicDomainSet,
      PrefetchHooks Function({bool geoDomainsRefs})
    >;
typedef $$GeoDomainsTableCreateCompanionBuilder =
    GeoDomainsCompanion Function({
      Value<int> id,
      required Domain geoDomain,
      required String domainSetName,
    });
typedef $$GeoDomainsTableUpdateCompanionBuilder =
    GeoDomainsCompanion Function({
      Value<int> id,
      Value<Domain> geoDomain,
      Value<String> domainSetName,
    });

final class $$GeoDomainsTableReferences
    extends BaseReferences<_$AppDatabase, $GeoDomainsTable, GeoDomain> {
  $$GeoDomainsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AtomicDomainSetsTable _domainSetNameTable(_$AppDatabase db) =>
      db.atomicDomainSets.createAlias(
        $_aliasNameGenerator(
          db.geoDomains.domainSetName,
          db.atomicDomainSets.name,
        ),
      );

  $$AtomicDomainSetsTableProcessedTableManager get domainSetName {
    final $_column = $_itemColumn<String>('domain_set_name')!;

    final manager = $$AtomicDomainSetsTableTableManager(
      $_db,
      $_db.atomicDomainSets,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_domainSetNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GeoDomainsTableFilterComposer
    extends Composer<_$AppDatabase, $GeoDomainsTable> {
  $$GeoDomainsTableFilterComposer({
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

  ColumnWithTypeConverterFilters<Domain, Domain, Uint8List> get geoDomain =>
      $composableBuilder(
        column: $table.geoDomain,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$AtomicDomainSetsTableFilterComposer get domainSetName {
    final $$AtomicDomainSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.domainSetName,
      referencedTable: $db.atomicDomainSets,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtomicDomainSetsTableFilterComposer(
            $db: $db,
            $table: $db.atomicDomainSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GeoDomainsTableOrderingComposer
    extends Composer<_$AppDatabase, $GeoDomainsTable> {
  $$GeoDomainsTableOrderingComposer({
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

  ColumnOrderings<Uint8List> get geoDomain => $composableBuilder(
    column: $table.geoDomain,
    builder: (column) => ColumnOrderings(column),
  );

  $$AtomicDomainSetsTableOrderingComposer get domainSetName {
    final $$AtomicDomainSetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.domainSetName,
      referencedTable: $db.atomicDomainSets,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtomicDomainSetsTableOrderingComposer(
            $db: $db,
            $table: $db.atomicDomainSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GeoDomainsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GeoDomainsTable> {
  $$GeoDomainsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Domain, Uint8List> get geoDomain =>
      $composableBuilder(column: $table.geoDomain, builder: (column) => column);

  $$AtomicDomainSetsTableAnnotationComposer get domainSetName {
    final $$AtomicDomainSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.domainSetName,
      referencedTable: $db.atomicDomainSets,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtomicDomainSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.atomicDomainSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GeoDomainsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GeoDomainsTable,
          GeoDomain,
          $$GeoDomainsTableFilterComposer,
          $$GeoDomainsTableOrderingComposer,
          $$GeoDomainsTableAnnotationComposer,
          $$GeoDomainsTableCreateCompanionBuilder,
          $$GeoDomainsTableUpdateCompanionBuilder,
          (GeoDomain, $$GeoDomainsTableReferences),
          GeoDomain,
          PrefetchHooks Function({bool domainSetName})
        > {
  $$GeoDomainsTableTableManager(_$AppDatabase db, $GeoDomainsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GeoDomainsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GeoDomainsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GeoDomainsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<Domain> geoDomain = const Value.absent(),
                Value<String> domainSetName = const Value.absent(),
              }) => GeoDomainsCompanion(
                id: id,
                geoDomain: geoDomain,
                domainSetName: domainSetName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required Domain geoDomain,
                required String domainSetName,
              }) => GeoDomainsCompanion.insert(
                id: id,
                geoDomain: geoDomain,
                domainSetName: domainSetName,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GeoDomainsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({domainSetName = false}) {
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
                    if (domainSetName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.domainSetName,
                                referencedTable: $$GeoDomainsTableReferences
                                    ._domainSetNameTable(db),
                                referencedColumn: $$GeoDomainsTableReferences
                                    ._domainSetNameTable(db)
                                    .name,
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

typedef $$GeoDomainsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GeoDomainsTable,
      GeoDomain,
      $$GeoDomainsTableFilterComposer,
      $$GeoDomainsTableOrderingComposer,
      $$GeoDomainsTableAnnotationComposer,
      $$GeoDomainsTableCreateCompanionBuilder,
      $$GeoDomainsTableUpdateCompanionBuilder,
      (GeoDomain, $$GeoDomainsTableReferences),
      GeoDomain,
      PrefetchHooks Function({bool domainSetName})
    >;
typedef $$GreatDomainSetsTableCreateCompanionBuilder =
    GreatDomainSetsCompanion Function({
      Value<DateTime?> updatedAt,
      required String name,
      Value<String?> oppositeName,
      required GreatDomainSetConfig set,
      Value<int> rowid,
    });
typedef $$GreatDomainSetsTableUpdateCompanionBuilder =
    GreatDomainSetsCompanion Function({
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<String?> oppositeName,
      Value<GreatDomainSetConfig> set,
      Value<int> rowid,
    });

class $$GreatDomainSetsTableFilterComposer
    extends Composer<_$AppDatabase, $GreatDomainSetsTable> {
  $$GreatDomainSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get oppositeName => $composableBuilder(
    column: $table.oppositeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    GreatDomainSetConfig,
    GreatDomainSetConfig,
    Uint8List
  >
  get set => $composableBuilder(
    column: $table.set,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$GreatDomainSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $GreatDomainSetsTable> {
  $$GreatDomainSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oppositeName => $composableBuilder(
    column: $table.oppositeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get set => $composableBuilder(
    column: $table.set,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GreatDomainSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GreatDomainSetsTable> {
  $$GreatDomainSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get oppositeName => $composableBuilder(
    column: $table.oppositeName,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<GreatDomainSetConfig, Uint8List> get set =>
      $composableBuilder(column: $table.set, builder: (column) => column);
}

class $$GreatDomainSetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GreatDomainSetsTable,
          GreatDomainSet,
          $$GreatDomainSetsTableFilterComposer,
          $$GreatDomainSetsTableOrderingComposer,
          $$GreatDomainSetsTableAnnotationComposer,
          $$GreatDomainSetsTableCreateCompanionBuilder,
          $$GreatDomainSetsTableUpdateCompanionBuilder,
          (
            GreatDomainSet,
            BaseReferences<
              _$AppDatabase,
              $GreatDomainSetsTable,
              GreatDomainSet
            >,
          ),
          GreatDomainSet,
          PrefetchHooks Function()
        > {
  $$GreatDomainSetsTableTableManager(
    _$AppDatabase db,
    $GreatDomainSetsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GreatDomainSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GreatDomainSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GreatDomainSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> oppositeName = const Value.absent(),
                Value<GreatDomainSetConfig> set = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GreatDomainSetsCompanion(
                updatedAt: updatedAt,
                name: name,
                oppositeName: oppositeName,
                set: set,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                Value<String?> oppositeName = const Value.absent(),
                required GreatDomainSetConfig set,
                Value<int> rowid = const Value.absent(),
              }) => GreatDomainSetsCompanion.insert(
                updatedAt: updatedAt,
                name: name,
                oppositeName: oppositeName,
                set: set,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GreatDomainSetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GreatDomainSetsTable,
      GreatDomainSet,
      $$GreatDomainSetsTableFilterComposer,
      $$GreatDomainSetsTableOrderingComposer,
      $$GreatDomainSetsTableAnnotationComposer,
      $$GreatDomainSetsTableCreateCompanionBuilder,
      $$GreatDomainSetsTableUpdateCompanionBuilder,
      (
        GreatDomainSet,
        BaseReferences<_$AppDatabase, $GreatDomainSetsTable, GreatDomainSet>,
      ),
      GreatDomainSet,
      PrefetchHooks Function()
    >;
typedef $$AtomicIpSetsTableCreateCompanionBuilder =
    AtomicIpSetsCompanion Function({
      Value<DateTime?> updatedAt,
      required String name,
      Value<bool> inverse,
      Value<GeoIPConfig?> geoIpConfig,
      Value<List<String>?> clashRuleUrls,
      Value<String?> geoUrl,
      Value<int> rowid,
    });
typedef $$AtomicIpSetsTableUpdateCompanionBuilder =
    AtomicIpSetsCompanion Function({
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<bool> inverse,
      Value<GeoIPConfig?> geoIpConfig,
      Value<List<String>?> clashRuleUrls,
      Value<String?> geoUrl,
      Value<int> rowid,
    });

final class $$AtomicIpSetsTableReferences
    extends BaseReferences<_$AppDatabase, $AtomicIpSetsTable, AtomicIpSet> {
  $$AtomicIpSetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CidrsTable, List<Cidr>> _cidrsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.cidrs,
    aliasName: $_aliasNameGenerator(db.atomicIpSets.name, db.cidrs.ipSetName),
  );

  $$CidrsTableProcessedTableManager get cidrsRefs {
    final manager = $$CidrsTableTableManager(
      $_db,
      $_db.cidrs,
    ).filter((f) => f.ipSetName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(_cidrsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AtomicIpSetsTableFilterComposer
    extends Composer<_$AppDatabase, $AtomicIpSetsTable> {
  $$AtomicIpSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get inverse => $composableBuilder(
    column: $table.inverse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<GeoIPConfig?, GeoIPConfig, Uint8List>
  get geoIpConfig => $composableBuilder(
    column: $table.geoIpConfig,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get clashRuleUrls => $composableBuilder(
    column: $table.clashRuleUrls,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get geoUrl => $composableBuilder(
    column: $table.geoUrl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cidrsRefs(
    Expression<bool> Function($$CidrsTableFilterComposer f) f,
  ) {
    final $$CidrsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.cidrs,
      getReferencedColumn: (t) => t.ipSetName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CidrsTableFilterComposer(
            $db: $db,
            $table: $db.cidrs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AtomicIpSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $AtomicIpSetsTable> {
  $$AtomicIpSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get inverse => $composableBuilder(
    column: $table.inverse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get geoIpConfig => $composableBuilder(
    column: $table.geoIpConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clashRuleUrls => $composableBuilder(
    column: $table.clashRuleUrls,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get geoUrl => $composableBuilder(
    column: $table.geoUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AtomicIpSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AtomicIpSetsTable> {
  $$AtomicIpSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get inverse =>
      $composableBuilder(column: $table.inverse, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GeoIPConfig?, Uint8List> get geoIpConfig =>
      $composableBuilder(
        column: $table.geoIpConfig,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<String>?, String> get clashRuleUrls =>
      $composableBuilder(
        column: $table.clashRuleUrls,
        builder: (column) => column,
      );

  GeneratedColumn<String> get geoUrl =>
      $composableBuilder(column: $table.geoUrl, builder: (column) => column);

  Expression<T> cidrsRefs<T extends Object>(
    Expression<T> Function($$CidrsTableAnnotationComposer a) f,
  ) {
    final $$CidrsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.cidrs,
      getReferencedColumn: (t) => t.ipSetName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CidrsTableAnnotationComposer(
            $db: $db,
            $table: $db.cidrs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AtomicIpSetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AtomicIpSetsTable,
          AtomicIpSet,
          $$AtomicIpSetsTableFilterComposer,
          $$AtomicIpSetsTableOrderingComposer,
          $$AtomicIpSetsTableAnnotationComposer,
          $$AtomicIpSetsTableCreateCompanionBuilder,
          $$AtomicIpSetsTableUpdateCompanionBuilder,
          (AtomicIpSet, $$AtomicIpSetsTableReferences),
          AtomicIpSet,
          PrefetchHooks Function({bool cidrsRefs})
        > {
  $$AtomicIpSetsTableTableManager(_$AppDatabase db, $AtomicIpSetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AtomicIpSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AtomicIpSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AtomicIpSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> inverse = const Value.absent(),
                Value<GeoIPConfig?> geoIpConfig = const Value.absent(),
                Value<List<String>?> clashRuleUrls = const Value.absent(),
                Value<String?> geoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AtomicIpSetsCompanion(
                updatedAt: updatedAt,
                name: name,
                inverse: inverse,
                geoIpConfig: geoIpConfig,
                clashRuleUrls: clashRuleUrls,
                geoUrl: geoUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                Value<bool> inverse = const Value.absent(),
                Value<GeoIPConfig?> geoIpConfig = const Value.absent(),
                Value<List<String>?> clashRuleUrls = const Value.absent(),
                Value<String?> geoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AtomicIpSetsCompanion.insert(
                updatedAt: updatedAt,
                name: name,
                inverse: inverse,
                geoIpConfig: geoIpConfig,
                clashRuleUrls: clashRuleUrls,
                geoUrl: geoUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AtomicIpSetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cidrsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cidrsRefs) db.cidrs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cidrsRefs)
                    await $_getPrefetchedData<
                      AtomicIpSet,
                      $AtomicIpSetsTable,
                      Cidr
                    >(
                      currentTable: table,
                      referencedTable: $$AtomicIpSetsTableReferences
                          ._cidrsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AtomicIpSetsTableReferences(
                            db,
                            table,
                            p0,
                          ).cidrsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.ipSetName == item.name,
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

typedef $$AtomicIpSetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AtomicIpSetsTable,
      AtomicIpSet,
      $$AtomicIpSetsTableFilterComposer,
      $$AtomicIpSetsTableOrderingComposer,
      $$AtomicIpSetsTableAnnotationComposer,
      $$AtomicIpSetsTableCreateCompanionBuilder,
      $$AtomicIpSetsTableUpdateCompanionBuilder,
      (AtomicIpSet, $$AtomicIpSetsTableReferences),
      AtomicIpSet,
      PrefetchHooks Function({bool cidrsRefs})
    >;
typedef $$GreatIpSetsTableCreateCompanionBuilder =
    GreatIpSetsCompanion Function({
      Value<DateTime?> updatedAt,
      required String name,
      required GreatIPSetConfig greatIpSetConfig,
      Value<String?> oppositeName,
      Value<int> rowid,
    });
typedef $$GreatIpSetsTableUpdateCompanionBuilder =
    GreatIpSetsCompanion Function({
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<GreatIPSetConfig> greatIpSetConfig,
      Value<String?> oppositeName,
      Value<int> rowid,
    });

class $$GreatIpSetsTableFilterComposer
    extends Composer<_$AppDatabase, $GreatIpSetsTable> {
  $$GreatIpSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<GreatIPSetConfig, GreatIPSetConfig, Uint8List>
  get greatIpSetConfig => $composableBuilder(
    column: $table.greatIpSetConfig,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get oppositeName => $composableBuilder(
    column: $table.oppositeName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GreatIpSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $GreatIpSetsTable> {
  $$GreatIpSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get greatIpSetConfig => $composableBuilder(
    column: $table.greatIpSetConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oppositeName => $composableBuilder(
    column: $table.oppositeName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GreatIpSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GreatIpSetsTable> {
  $$GreatIpSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GreatIPSetConfig, Uint8List>
  get greatIpSetConfig => $composableBuilder(
    column: $table.greatIpSetConfig,
    builder: (column) => column,
  );

  GeneratedColumn<String> get oppositeName => $composableBuilder(
    column: $table.oppositeName,
    builder: (column) => column,
  );
}

class $$GreatIpSetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GreatIpSetsTable,
          GreatIpSet,
          $$GreatIpSetsTableFilterComposer,
          $$GreatIpSetsTableOrderingComposer,
          $$GreatIpSetsTableAnnotationComposer,
          $$GreatIpSetsTableCreateCompanionBuilder,
          $$GreatIpSetsTableUpdateCompanionBuilder,
          (
            GreatIpSet,
            BaseReferences<_$AppDatabase, $GreatIpSetsTable, GreatIpSet>,
          ),
          GreatIpSet,
          PrefetchHooks Function()
        > {
  $$GreatIpSetsTableTableManager(_$AppDatabase db, $GreatIpSetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GreatIpSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GreatIpSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GreatIpSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<GreatIPSetConfig> greatIpSetConfig = const Value.absent(),
                Value<String?> oppositeName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GreatIpSetsCompanion(
                updatedAt: updatedAt,
                name: name,
                greatIpSetConfig: greatIpSetConfig,
                oppositeName: oppositeName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                required GreatIPSetConfig greatIpSetConfig,
                Value<String?> oppositeName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GreatIpSetsCompanion.insert(
                updatedAt: updatedAt,
                name: name,
                greatIpSetConfig: greatIpSetConfig,
                oppositeName: oppositeName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GreatIpSetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GreatIpSetsTable,
      GreatIpSet,
      $$GreatIpSetsTableFilterComposer,
      $$GreatIpSetsTableOrderingComposer,
      $$GreatIpSetsTableAnnotationComposer,
      $$GreatIpSetsTableCreateCompanionBuilder,
      $$GreatIpSetsTableUpdateCompanionBuilder,
      (
        GreatIpSet,
        BaseReferences<_$AppDatabase, $GreatIpSetsTable, GreatIpSet>,
      ),
      GreatIpSet,
      PrefetchHooks Function()
    >;
typedef $$AppSetsTableCreateCompanionBuilder =
    AppSetsCompanion Function({
      Value<DateTime?> updatedAt,
      required String name,
      Value<List<String>?> clashRuleUrls,
      Value<int> rowid,
    });
typedef $$AppSetsTableUpdateCompanionBuilder =
    AppSetsCompanion Function({
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<List<String>?> clashRuleUrls,
      Value<int> rowid,
    });

final class $$AppSetsTableReferences
    extends BaseReferences<_$AppDatabase, $AppSetsTable, AppSet> {
  $$AppSetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AppsTable, List<App>> _appsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.apps,
    aliasName: $_aliasNameGenerator(db.appSets.name, db.apps.appSetName),
  );

  $$AppsTableProcessedTableManager get appsRefs {
    final manager = $$AppsTableTableManager(
      $_db,
      $_db.apps,
    ).filter((f) => f.appSetName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(_appsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AppSetsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSetsTable> {
  $$AppSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get clashRuleUrls => $composableBuilder(
    column: $table.clashRuleUrls,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> appsRefs(
    Expression<bool> Function($$AppsTableFilterComposer f) f,
  ) {
    final $$AppsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.apps,
      getReferencedColumn: (t) => t.appSetName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppsTableFilterComposer(
            $db: $db,
            $table: $db.apps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AppSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSetsTable> {
  $$AppSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clashRuleUrls => $composableBuilder(
    column: $table.clashRuleUrls,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSetsTable> {
  $$AppSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get clashRuleUrls =>
      $composableBuilder(
        column: $table.clashRuleUrls,
        builder: (column) => column,
      );

  Expression<T> appsRefs<T extends Object>(
    Expression<T> Function($$AppsTableAnnotationComposer a) f,
  ) {
    final $$AppsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.apps,
      getReferencedColumn: (t) => t.appSetName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppsTableAnnotationComposer(
            $db: $db,
            $table: $db.apps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AppSetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSetsTable,
          AppSet,
          $$AppSetsTableFilterComposer,
          $$AppSetsTableOrderingComposer,
          $$AppSetsTableAnnotationComposer,
          $$AppSetsTableCreateCompanionBuilder,
          $$AppSetsTableUpdateCompanionBuilder,
          (AppSet, $$AppSetsTableReferences),
          AppSet,
          PrefetchHooks Function({bool appsRefs})
        > {
  $$AppSetsTableTableManager(_$AppDatabase db, $AppSetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<List<String>?> clashRuleUrls = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSetsCompanion(
                updatedAt: updatedAt,
                name: name,
                clashRuleUrls: clashRuleUrls,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                Value<List<String>?> clashRuleUrls = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSetsCompanion.insert(
                updatedAt: updatedAt,
                name: name,
                clashRuleUrls: clashRuleUrls,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AppSetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({appsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (appsRefs) db.apps],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (appsRefs)
                    await $_getPrefetchedData<AppSet, $AppSetsTable, App>(
                      currentTable: table,
                      referencedTable: $$AppSetsTableReferences._appsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$AppSetsTableReferences(db, table, p0).appsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.appSetName == item.name,
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

typedef $$AppSetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSetsTable,
      AppSet,
      $$AppSetsTableFilterComposer,
      $$AppSetsTableOrderingComposer,
      $$AppSetsTableAnnotationComposer,
      $$AppSetsTableCreateCompanionBuilder,
      $$AppSetsTableUpdateCompanionBuilder,
      (AppSet, $$AppSetsTableReferences),
      AppSet,
      PrefetchHooks Function({bool appsRefs})
    >;
typedef $$AppsTableCreateCompanionBuilder =
    AppsCompanion Function({
      Value<int> id,
      required String appSetName,
      required AppId appId,
      Value<Uint8List?> icon,
    });
typedef $$AppsTableUpdateCompanionBuilder =
    AppsCompanion Function({
      Value<int> id,
      Value<String> appSetName,
      Value<AppId> appId,
      Value<Uint8List?> icon,
    });

final class $$AppsTableReferences
    extends BaseReferences<_$AppDatabase, $AppsTable, App> {
  $$AppsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AppSetsTable _appSetNameTable(_$AppDatabase db) => db.appSets
      .createAlias($_aliasNameGenerator(db.apps.appSetName, db.appSets.name));

  $$AppSetsTableProcessedTableManager get appSetName {
    final $_column = $_itemColumn<String>('app_set_name')!;

    final manager = $$AppSetsTableTableManager(
      $_db,
      $_db.appSets,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_appSetNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AppsTableFilterComposer extends Composer<_$AppDatabase, $AppsTable> {
  $$AppsTableFilterComposer({
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

  ColumnWithTypeConverterFilters<AppId, AppId, Uint8List> get appId =>
      $composableBuilder(
        column: $table.appId,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<Uint8List> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  $$AppSetsTableFilterComposer get appSetName {
    final $$AppSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appSetName,
      referencedTable: $db.appSets,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppSetsTableFilterComposer(
            $db: $db,
            $table: $db.appSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppsTableOrderingComposer extends Composer<_$AppDatabase, $AppsTable> {
  $$AppsTableOrderingComposer({
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

  ColumnOrderings<Uint8List> get appId => $composableBuilder(
    column: $table.appId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppSetsTableOrderingComposer get appSetName {
    final $$AppSetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appSetName,
      referencedTable: $db.appSets,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppSetsTableOrderingComposer(
            $db: $db,
            $table: $db.appSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppsTable> {
  $$AppsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AppId, Uint8List> get appId =>
      $composableBuilder(column: $table.appId, builder: (column) => column);

  GeneratedColumn<Uint8List> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  $$AppSetsTableAnnotationComposer get appSetName {
    final $$AppSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appSetName,
      referencedTable: $db.appSets,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.appSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppsTable,
          App,
          $$AppsTableFilterComposer,
          $$AppsTableOrderingComposer,
          $$AppsTableAnnotationComposer,
          $$AppsTableCreateCompanionBuilder,
          $$AppsTableUpdateCompanionBuilder,
          (App, $$AppsTableReferences),
          App,
          PrefetchHooks Function({bool appSetName})
        > {
  $$AppsTableTableManager(_$AppDatabase db, $AppsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> appSetName = const Value.absent(),
                Value<AppId> appId = const Value.absent(),
                Value<Uint8List?> icon = const Value.absent(),
              }) => AppsCompanion(
                id: id,
                appSetName: appSetName,
                appId: appId,
                icon: icon,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String appSetName,
                required AppId appId,
                Value<Uint8List?> icon = const Value.absent(),
              }) => AppsCompanion.insert(
                id: id,
                appSetName: appSetName,
                appId: appId,
                icon: icon,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AppsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({appSetName = false}) {
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
                    if (appSetName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.appSetName,
                                referencedTable: $$AppsTableReferences
                                    ._appSetNameTable(db),
                                referencedColumn: $$AppsTableReferences
                                    ._appSetNameTable(db)
                                    .name,
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

typedef $$AppsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppsTable,
      App,
      $$AppsTableFilterComposer,
      $$AppsTableOrderingComposer,
      $$AppsTableAnnotationComposer,
      $$AppsTableCreateCompanionBuilder,
      $$AppsTableUpdateCompanionBuilder,
      (App, $$AppsTableReferences),
      App,
      PrefetchHooks Function({bool appSetName})
    >;
typedef $$CidrsTableCreateCompanionBuilder =
    CidrsCompanion Function({
      Value<int> id,
      required String ipSetName,
      required CIDR cidr,
    });
typedef $$CidrsTableUpdateCompanionBuilder =
    CidrsCompanion Function({
      Value<int> id,
      Value<String> ipSetName,
      Value<CIDR> cidr,
    });

final class $$CidrsTableReferences
    extends BaseReferences<_$AppDatabase, $CidrsTable, Cidr> {
  $$CidrsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AtomicIpSetsTable _ipSetNameTable(_$AppDatabase db) =>
      db.atomicIpSets.createAlias(
        $_aliasNameGenerator(db.cidrs.ipSetName, db.atomicIpSets.name),
      );

  $$AtomicIpSetsTableProcessedTableManager get ipSetName {
    final $_column = $_itemColumn<String>('ip_set_name')!;

    final manager = $$AtomicIpSetsTableTableManager(
      $_db,
      $_db.atomicIpSets,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ipSetNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CidrsTableFilterComposer extends Composer<_$AppDatabase, $CidrsTable> {
  $$CidrsTableFilterComposer({
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

  ColumnWithTypeConverterFilters<CIDR, CIDR, Uint8List> get cidr =>
      $composableBuilder(
        column: $table.cidr,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$AtomicIpSetsTableFilterComposer get ipSetName {
    final $$AtomicIpSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ipSetName,
      referencedTable: $db.atomicIpSets,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtomicIpSetsTableFilterComposer(
            $db: $db,
            $table: $db.atomicIpSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CidrsTableOrderingComposer
    extends Composer<_$AppDatabase, $CidrsTable> {
  $$CidrsTableOrderingComposer({
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

  ColumnOrderings<Uint8List> get cidr => $composableBuilder(
    column: $table.cidr,
    builder: (column) => ColumnOrderings(column),
  );

  $$AtomicIpSetsTableOrderingComposer get ipSetName {
    final $$AtomicIpSetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ipSetName,
      referencedTable: $db.atomicIpSets,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtomicIpSetsTableOrderingComposer(
            $db: $db,
            $table: $db.atomicIpSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CidrsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CidrsTable> {
  $$CidrsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CIDR, Uint8List> get cidr =>
      $composableBuilder(column: $table.cidr, builder: (column) => column);

  $$AtomicIpSetsTableAnnotationComposer get ipSetName {
    final $$AtomicIpSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ipSetName,
      referencedTable: $db.atomicIpSets,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtomicIpSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.atomicIpSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CidrsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CidrsTable,
          Cidr,
          $$CidrsTableFilterComposer,
          $$CidrsTableOrderingComposer,
          $$CidrsTableAnnotationComposer,
          $$CidrsTableCreateCompanionBuilder,
          $$CidrsTableUpdateCompanionBuilder,
          (Cidr, $$CidrsTableReferences),
          Cidr,
          PrefetchHooks Function({bool ipSetName})
        > {
  $$CidrsTableTableManager(_$AppDatabase db, $CidrsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CidrsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CidrsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CidrsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> ipSetName = const Value.absent(),
                Value<CIDR> cidr = const Value.absent(),
              }) => CidrsCompanion(id: id, ipSetName: ipSetName, cidr: cidr),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String ipSetName,
                required CIDR cidr,
              }) => CidrsCompanion.insert(
                id: id,
                ipSetName: ipSetName,
                cidr: cidr,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$CidrsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({ipSetName = false}) {
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
                    if (ipSetName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ipSetName,
                                referencedTable: $$CidrsTableReferences
                                    ._ipSetNameTable(db),
                                referencedColumn: $$CidrsTableReferences
                                    ._ipSetNameTable(db)
                                    .name,
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

typedef $$CidrsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CidrsTable,
      Cidr,
      $$CidrsTableFilterComposer,
      $$CidrsTableOrderingComposer,
      $$CidrsTableAnnotationComposer,
      $$CidrsTableCreateCompanionBuilder,
      $$CidrsTableUpdateCompanionBuilder,
      (Cidr, $$CidrsTableReferences),
      Cidr,
      PrefetchHooks Function({bool ipSetName})
    >;
typedef $$SshServersTableCreateCompanionBuilder =
    SshServersCompanion Function({
      Value<DateTime?> updatedAt,
      Value<int> id,
      required String name,
      required String address,
      required String storageKey,
      Value<String?> country,
      required AuthMethod authMethod,
    });
typedef $$SshServersTableUpdateCompanionBuilder =
    SshServersCompanion Function({
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<String> name,
      Value<String> address,
      Value<String> storageKey,
      Value<String?> country,
      Value<AuthMethod> authMethod,
    });

class $$SshServersTableFilterComposer
    extends Composer<_$AppDatabase, $SshServersTable> {
  $$SshServersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get storageKey => $composableBuilder(
    column: $table.storageKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AuthMethod, AuthMethod, int> get authMethod =>
      $composableBuilder(
        column: $table.authMethod,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$SshServersTableOrderingComposer
    extends Composer<_$AppDatabase, $SshServersTable> {
  $$SshServersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get storageKey => $composableBuilder(
    column: $table.storageKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get authMethod => $composableBuilder(
    column: $table.authMethod,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SshServersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SshServersTable> {
  $$SshServersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get storageKey => $composableBuilder(
    column: $table.storageKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AuthMethod, int> get authMethod =>
      $composableBuilder(
        column: $table.authMethod,
        builder: (column) => column,
      );
}

class $$SshServersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SshServersTable,
          SshServer,
          $$SshServersTableFilterComposer,
          $$SshServersTableOrderingComposer,
          $$SshServersTableAnnotationComposer,
          $$SshServersTableCreateCompanionBuilder,
          $$SshServersTableUpdateCompanionBuilder,
          (
            SshServer,
            BaseReferences<_$AppDatabase, $SshServersTable, SshServer>,
          ),
          SshServer,
          PrefetchHooks Function()
        > {
  $$SshServersTableTableManager(_$AppDatabase db, $SshServersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SshServersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SshServersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SshServersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> storageKey = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<AuthMethod> authMethod = const Value.absent(),
              }) => SshServersCompanion(
                updatedAt: updatedAt,
                id: id,
                name: name,
                address: address,
                storageKey: storageKey,
                country: country,
                authMethod: authMethod,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
                required String address,
                required String storageKey,
                Value<String?> country = const Value.absent(),
                required AuthMethod authMethod,
              }) => SshServersCompanion.insert(
                updatedAt: updatedAt,
                id: id,
                name: name,
                address: address,
                storageKey: storageKey,
                country: country,
                authMethod: authMethod,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SshServersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SshServersTable,
      SshServer,
      $$SshServersTableFilterComposer,
      $$SshServersTableOrderingComposer,
      $$SshServersTableAnnotationComposer,
      $$SshServersTableCreateCompanionBuilder,
      $$SshServersTableUpdateCompanionBuilder,
      (SshServer, BaseReferences<_$AppDatabase, $SshServersTable, SshServer>),
      SshServer,
      PrefetchHooks Function()
    >;
typedef $$CommonSshKeysTableCreateCompanionBuilder =
    CommonSshKeysCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> remark,
    });
typedef $$CommonSshKeysTableUpdateCompanionBuilder =
    CommonSshKeysCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> remark,
    });

class $$CommonSshKeysTableFilterComposer
    extends Composer<_$AppDatabase, $CommonSshKeysTable> {
  $$CommonSshKeysTableFilterComposer({
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

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CommonSshKeysTableOrderingComposer
    extends Composer<_$AppDatabase, $CommonSshKeysTable> {
  $$CommonSshKeysTableOrderingComposer({
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

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CommonSshKeysTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommonSshKeysTable> {
  $$CommonSshKeysTableAnnotationComposer({
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

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);
}

class $$CommonSshKeysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommonSshKeysTable,
          CommonSshKey,
          $$CommonSshKeysTableFilterComposer,
          $$CommonSshKeysTableOrderingComposer,
          $$CommonSshKeysTableAnnotationComposer,
          $$CommonSshKeysTableCreateCompanionBuilder,
          $$CommonSshKeysTableUpdateCompanionBuilder,
          (
            CommonSshKey,
            BaseReferences<_$AppDatabase, $CommonSshKeysTable, CommonSshKey>,
          ),
          CommonSshKey,
          PrefetchHooks Function()
        > {
  $$CommonSshKeysTableTableManager(_$AppDatabase db, $CommonSshKeysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommonSshKeysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommonSshKeysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommonSshKeysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> remark = const Value.absent(),
              }) => CommonSshKeysCompanion(id: id, name: name, remark: remark),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> remark = const Value.absent(),
              }) => CommonSshKeysCompanion.insert(
                id: id,
                name: name,
                remark: remark,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CommonSshKeysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommonSshKeysTable,
      CommonSshKey,
      $$CommonSshKeysTableFilterComposer,
      $$CommonSshKeysTableOrderingComposer,
      $$CommonSshKeysTableAnnotationComposer,
      $$CommonSshKeysTableCreateCompanionBuilder,
      $$CommonSshKeysTableUpdateCompanionBuilder,
      (
        CommonSshKey,
        BaseReferences<_$AppDatabase, $CommonSshKeysTable, CommonSshKey>,
      ),
      CommonSshKey,
      PrefetchHooks Function()
    >;
typedef $$CustomRouteModesTableCreateCompanionBuilder =
    CustomRouteModesCompanion Function({
      Value<DateTime?> updatedAt,
      Value<int> id,
      required String name,
      required RouterConfig routerConfig,
      Value<dns.DnsRules> dnsRules,
      required List<String> internalDnsServers,
    });
typedef $$CustomRouteModesTableUpdateCompanionBuilder =
    CustomRouteModesCompanion Function({
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<String> name,
      Value<RouterConfig> routerConfig,
      Value<dns.DnsRules> dnsRules,
      Value<List<String>> internalDnsServers,
    });

class $$CustomRouteModesTableFilterComposer
    extends Composer<_$AppDatabase, $CustomRouteModesTable> {
  $$CustomRouteModesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  ColumnWithTypeConverterFilters<RouterConfig, RouterConfig, Uint8List>
  get routerConfig => $composableBuilder(
    column: $table.routerConfig,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<dns.DnsRules, dns.DnsRules, Uint8List>
  get dnsRules => $composableBuilder(
    column: $table.dnsRules,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get internalDnsServers => $composableBuilder(
    column: $table.internalDnsServers,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$CustomRouteModesTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomRouteModesTable> {
  $$CustomRouteModesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  ColumnOrderings<Uint8List> get routerConfig => $composableBuilder(
    column: $table.routerConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get dnsRules => $composableBuilder(
    column: $table.dnsRules,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get internalDnsServers => $composableBuilder(
    column: $table.internalDnsServers,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomRouteModesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomRouteModesTable> {
  $$CustomRouteModesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RouterConfig, Uint8List> get routerConfig =>
      $composableBuilder(
        column: $table.routerConfig,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<dns.DnsRules, Uint8List> get dnsRules =>
      $composableBuilder(column: $table.dnsRules, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
  get internalDnsServers => $composableBuilder(
    column: $table.internalDnsServers,
    builder: (column) => column,
  );
}

class $$CustomRouteModesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomRouteModesTable,
          CustomRouteMode,
          $$CustomRouteModesTableFilterComposer,
          $$CustomRouteModesTableOrderingComposer,
          $$CustomRouteModesTableAnnotationComposer,
          $$CustomRouteModesTableCreateCompanionBuilder,
          $$CustomRouteModesTableUpdateCompanionBuilder,
          (
            CustomRouteMode,
            BaseReferences<
              _$AppDatabase,
              $CustomRouteModesTable,
              CustomRouteMode
            >,
          ),
          CustomRouteMode,
          PrefetchHooks Function()
        > {
  $$CustomRouteModesTableTableManager(
    _$AppDatabase db,
    $CustomRouteModesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomRouteModesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomRouteModesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomRouteModesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<RouterConfig> routerConfig = const Value.absent(),
                Value<dns.DnsRules> dnsRules = const Value.absent(),
                Value<List<String>> internalDnsServers = const Value.absent(),
              }) => CustomRouteModesCompanion(
                updatedAt: updatedAt,
                id: id,
                name: name,
                routerConfig: routerConfig,
                dnsRules: dnsRules,
                internalDnsServers: internalDnsServers,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
                required RouterConfig routerConfig,
                Value<dns.DnsRules> dnsRules = const Value.absent(),
                required List<String> internalDnsServers,
              }) => CustomRouteModesCompanion.insert(
                updatedAt: updatedAt,
                id: id,
                name: name,
                routerConfig: routerConfig,
                dnsRules: dnsRules,
                internalDnsServers: internalDnsServers,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomRouteModesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomRouteModesTable,
      CustomRouteMode,
      $$CustomRouteModesTableFilterComposer,
      $$CustomRouteModesTableOrderingComposer,
      $$CustomRouteModesTableAnnotationComposer,
      $$CustomRouteModesTableCreateCompanionBuilder,
      $$CustomRouteModesTableUpdateCompanionBuilder,
      (
        CustomRouteMode,
        BaseReferences<_$AppDatabase, $CustomRouteModesTable, CustomRouteMode>,
      ),
      CustomRouteMode,
      PrefetchHooks Function()
    >;
typedef $$HandlerSelectorsTableCreateCompanionBuilder =
    HandlerSelectorsCompanion Function({
      Value<DateTime?> updatedAt,
      required String name,
      required SelectorConfig config,
      Value<int> rowid,
    });
typedef $$HandlerSelectorsTableUpdateCompanionBuilder =
    HandlerSelectorsCompanion Function({
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<SelectorConfig> config,
      Value<int> rowid,
    });

final class $$HandlerSelectorsTableReferences
    extends
        BaseReferences<_$AppDatabase, $HandlerSelectorsTable, HandlerSelector> {
  $$HandlerSelectorsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $SelectorHandlerRelationsTable,
    List<SelectorHandlerRelation>
  >
  _selectorHandlerRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.selectorHandlerRelations,
        aliasName: $_aliasNameGenerator(
          db.handlerSelectors.name,
          db.selectorHandlerRelations.selectorName,
        ),
      );

  $$SelectorHandlerRelationsTableProcessedTableManager
  get selectorHandlerRelationsRefs {
    final manager =
        $$SelectorHandlerRelationsTableTableManager(
          $_db,
          $_db.selectorHandlerRelations,
        ).filter(
          (f) => f.selectorName.name.sqlEquals($_itemColumn<String>('name')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _selectorHandlerRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SelectorHandlerGroupRelationsTable,
    List<SelectorHandlerGroupRelation>
  >
  _selectorHandlerGroupRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.selectorHandlerGroupRelations,
        aliasName: $_aliasNameGenerator(
          db.handlerSelectors.name,
          db.selectorHandlerGroupRelations.selectorName,
        ),
      );

  $$SelectorHandlerGroupRelationsTableProcessedTableManager
  get selectorHandlerGroupRelationsRefs {
    final manager =
        $$SelectorHandlerGroupRelationsTableTableManager(
          $_db,
          $_db.selectorHandlerGroupRelations,
        ).filter(
          (f) => f.selectorName.name.sqlEquals($_itemColumn<String>('name')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _selectorHandlerGroupRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SelectorSubscriptionRelationsTable,
    List<SelectorSubscriptionRelation>
  >
  _selectorSubscriptionRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.selectorSubscriptionRelations,
        aliasName: $_aliasNameGenerator(
          db.handlerSelectors.name,
          db.selectorSubscriptionRelations.selectorName,
        ),
      );

  $$SelectorSubscriptionRelationsTableProcessedTableManager
  get selectorSubscriptionRelationsRefs {
    final manager =
        $$SelectorSubscriptionRelationsTableTableManager(
          $_db,
          $_db.selectorSubscriptionRelations,
        ).filter(
          (f) => f.selectorName.name.sqlEquals($_itemColumn<String>('name')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _selectorSubscriptionRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HandlerSelectorsTableFilterComposer
    extends Composer<_$AppDatabase, $HandlerSelectorsTable> {
  $$HandlerSelectorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SelectorConfig, SelectorConfig, Uint8List>
  get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> selectorHandlerRelationsRefs(
    Expression<bool> Function($$SelectorHandlerRelationsTableFilterComposer f)
    f,
  ) {
    final $$SelectorHandlerRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.selectorHandlerRelations,
          getReferencedColumn: (t) => t.selectorName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorHandlerRelationsTableFilterComposer(
                $db: $db,
                $table: $db.selectorHandlerRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> selectorHandlerGroupRelationsRefs(
    Expression<bool> Function(
      $$SelectorHandlerGroupRelationsTableFilterComposer f,
    )
    f,
  ) {
    final $$SelectorHandlerGroupRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.selectorHandlerGroupRelations,
          getReferencedColumn: (t) => t.selectorName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorHandlerGroupRelationsTableFilterComposer(
                $db: $db,
                $table: $db.selectorHandlerGroupRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> selectorSubscriptionRelationsRefs(
    Expression<bool> Function(
      $$SelectorSubscriptionRelationsTableFilterComposer f,
    )
    f,
  ) {
    final $$SelectorSubscriptionRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.selectorSubscriptionRelations,
          getReferencedColumn: (t) => t.selectorName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorSubscriptionRelationsTableFilterComposer(
                $db: $db,
                $table: $db.selectorSubscriptionRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$HandlerSelectorsTableOrderingComposer
    extends Composer<_$AppDatabase, $HandlerSelectorsTable> {
  $$HandlerSelectorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HandlerSelectorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HandlerSelectorsTable> {
  $$HandlerSelectorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SelectorConfig, Uint8List> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);

  Expression<T> selectorHandlerRelationsRefs<T extends Object>(
    Expression<T> Function($$SelectorHandlerRelationsTableAnnotationComposer a)
    f,
  ) {
    final $$SelectorHandlerRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.selectorHandlerRelations,
          getReferencedColumn: (t) => t.selectorName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorHandlerRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.selectorHandlerRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> selectorHandlerGroupRelationsRefs<T extends Object>(
    Expression<T> Function(
      $$SelectorHandlerGroupRelationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$SelectorHandlerGroupRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.selectorHandlerGroupRelations,
          getReferencedColumn: (t) => t.selectorName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorHandlerGroupRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.selectorHandlerGroupRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> selectorSubscriptionRelationsRefs<T extends Object>(
    Expression<T> Function(
      $$SelectorSubscriptionRelationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$SelectorSubscriptionRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.selectorSubscriptionRelations,
          getReferencedColumn: (t) => t.selectorName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SelectorSubscriptionRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.selectorSubscriptionRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$HandlerSelectorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HandlerSelectorsTable,
          HandlerSelector,
          $$HandlerSelectorsTableFilterComposer,
          $$HandlerSelectorsTableOrderingComposer,
          $$HandlerSelectorsTableAnnotationComposer,
          $$HandlerSelectorsTableCreateCompanionBuilder,
          $$HandlerSelectorsTableUpdateCompanionBuilder,
          (HandlerSelector, $$HandlerSelectorsTableReferences),
          HandlerSelector,
          PrefetchHooks Function({
            bool selectorHandlerRelationsRefs,
            bool selectorHandlerGroupRelationsRefs,
            bool selectorSubscriptionRelationsRefs,
          })
        > {
  $$HandlerSelectorsTableTableManager(
    _$AppDatabase db,
    $HandlerSelectorsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HandlerSelectorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HandlerSelectorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HandlerSelectorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<SelectorConfig> config = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HandlerSelectorsCompanion(
                updatedAt: updatedAt,
                name: name,
                config: config,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                required SelectorConfig config,
                Value<int> rowid = const Value.absent(),
              }) => HandlerSelectorsCompanion.insert(
                updatedAt: updatedAt,
                name: name,
                config: config,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HandlerSelectorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                selectorHandlerRelationsRefs = false,
                selectorHandlerGroupRelationsRefs = false,
                selectorSubscriptionRelationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (selectorHandlerRelationsRefs)
                      db.selectorHandlerRelations,
                    if (selectorHandlerGroupRelationsRefs)
                      db.selectorHandlerGroupRelations,
                    if (selectorSubscriptionRelationsRefs)
                      db.selectorSubscriptionRelations,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (selectorHandlerRelationsRefs)
                        await $_getPrefetchedData<
                          HandlerSelector,
                          $HandlerSelectorsTable,
                          SelectorHandlerRelation
                        >(
                          currentTable: table,
                          referencedTable: $$HandlerSelectorsTableReferences
                              ._selectorHandlerRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HandlerSelectorsTableReferences(
                                db,
                                table,
                                p0,
                              ).selectorHandlerRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.selectorName == item.name,
                              ),
                          typedResults: items,
                        ),
                      if (selectorHandlerGroupRelationsRefs)
                        await $_getPrefetchedData<
                          HandlerSelector,
                          $HandlerSelectorsTable,
                          SelectorHandlerGroupRelation
                        >(
                          currentTable: table,
                          referencedTable: $$HandlerSelectorsTableReferences
                              ._selectorHandlerGroupRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HandlerSelectorsTableReferences(
                                db,
                                table,
                                p0,
                              ).selectorHandlerGroupRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.selectorName == item.name,
                              ),
                          typedResults: items,
                        ),
                      if (selectorSubscriptionRelationsRefs)
                        await $_getPrefetchedData<
                          HandlerSelector,
                          $HandlerSelectorsTable,
                          SelectorSubscriptionRelation
                        >(
                          currentTable: table,
                          referencedTable: $$HandlerSelectorsTableReferences
                              ._selectorSubscriptionRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HandlerSelectorsTableReferences(
                                db,
                                table,
                                p0,
                              ).selectorSubscriptionRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.selectorName == item.name,
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

typedef $$HandlerSelectorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HandlerSelectorsTable,
      HandlerSelector,
      $$HandlerSelectorsTableFilterComposer,
      $$HandlerSelectorsTableOrderingComposer,
      $$HandlerSelectorsTableAnnotationComposer,
      $$HandlerSelectorsTableCreateCompanionBuilder,
      $$HandlerSelectorsTableUpdateCompanionBuilder,
      (HandlerSelector, $$HandlerSelectorsTableReferences),
      HandlerSelector,
      PrefetchHooks Function({
        bool selectorHandlerRelationsRefs,
        bool selectorHandlerGroupRelationsRefs,
        bool selectorSubscriptionRelationsRefs,
      })
    >;
typedef $$SelectorHandlerRelationsTableCreateCompanionBuilder =
    SelectorHandlerRelationsCompanion Function({
      Value<int> id,
      required String selectorName,
      required int handlerId,
    });
typedef $$SelectorHandlerRelationsTableUpdateCompanionBuilder =
    SelectorHandlerRelationsCompanion Function({
      Value<int> id,
      Value<String> selectorName,
      Value<int> handlerId,
    });

final class $$SelectorHandlerRelationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SelectorHandlerRelationsTable,
          SelectorHandlerRelation
        > {
  $$SelectorHandlerRelationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HandlerSelectorsTable _selectorNameTable(_$AppDatabase db) =>
      db.handlerSelectors.createAlias(
        $_aliasNameGenerator(
          db.selectorHandlerRelations.selectorName,
          db.handlerSelectors.name,
        ),
      );

  $$HandlerSelectorsTableProcessedTableManager get selectorName {
    final $_column = $_itemColumn<String>('selector_name')!;

    final manager = $$HandlerSelectorsTableTableManager(
      $_db,
      $_db.handlerSelectors,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_selectorNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OutboundHandlersTable _handlerIdTable(_$AppDatabase db) =>
      db.outboundHandlers.createAlias(
        $_aliasNameGenerator(
          db.selectorHandlerRelations.handlerId,
          db.outboundHandlers.id,
        ),
      );

  $$OutboundHandlersTableProcessedTableManager get handlerId {
    final $_column = $_itemColumn<int>('handler_id')!;

    final manager = $$OutboundHandlersTableTableManager(
      $_db,
      $_db.outboundHandlers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_handlerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SelectorHandlerRelationsTableFilterComposer
    extends Composer<_$AppDatabase, $SelectorHandlerRelationsTable> {
  $$SelectorHandlerRelationsTableFilterComposer({
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

  $$HandlerSelectorsTableFilterComposer get selectorName {
    final $$HandlerSelectorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.selectorName,
      referencedTable: $db.handlerSelectors,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HandlerSelectorsTableFilterComposer(
            $db: $db,
            $table: $db.handlerSelectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OutboundHandlersTableFilterComposer get handlerId {
    final $$OutboundHandlersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handlerId,
      referencedTable: $db.outboundHandlers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OutboundHandlersTableFilterComposer(
            $db: $db,
            $table: $db.outboundHandlers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SelectorHandlerRelationsTableOrderingComposer
    extends Composer<_$AppDatabase, $SelectorHandlerRelationsTable> {
  $$SelectorHandlerRelationsTableOrderingComposer({
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

  $$HandlerSelectorsTableOrderingComposer get selectorName {
    final $$HandlerSelectorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.selectorName,
      referencedTable: $db.handlerSelectors,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HandlerSelectorsTableOrderingComposer(
            $db: $db,
            $table: $db.handlerSelectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OutboundHandlersTableOrderingComposer get handlerId {
    final $$OutboundHandlersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handlerId,
      referencedTable: $db.outboundHandlers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OutboundHandlersTableOrderingComposer(
            $db: $db,
            $table: $db.outboundHandlers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SelectorHandlerRelationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SelectorHandlerRelationsTable> {
  $$SelectorHandlerRelationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$HandlerSelectorsTableAnnotationComposer get selectorName {
    final $$HandlerSelectorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.selectorName,
      referencedTable: $db.handlerSelectors,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HandlerSelectorsTableAnnotationComposer(
            $db: $db,
            $table: $db.handlerSelectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OutboundHandlersTableAnnotationComposer get handlerId {
    final $$OutboundHandlersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handlerId,
      referencedTable: $db.outboundHandlers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OutboundHandlersTableAnnotationComposer(
            $db: $db,
            $table: $db.outboundHandlers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SelectorHandlerRelationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SelectorHandlerRelationsTable,
          SelectorHandlerRelation,
          $$SelectorHandlerRelationsTableFilterComposer,
          $$SelectorHandlerRelationsTableOrderingComposer,
          $$SelectorHandlerRelationsTableAnnotationComposer,
          $$SelectorHandlerRelationsTableCreateCompanionBuilder,
          $$SelectorHandlerRelationsTableUpdateCompanionBuilder,
          (SelectorHandlerRelation, $$SelectorHandlerRelationsTableReferences),
          SelectorHandlerRelation,
          PrefetchHooks Function({bool selectorName, bool handlerId})
        > {
  $$SelectorHandlerRelationsTableTableManager(
    _$AppDatabase db,
    $SelectorHandlerRelationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SelectorHandlerRelationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SelectorHandlerRelationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SelectorHandlerRelationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> selectorName = const Value.absent(),
                Value<int> handlerId = const Value.absent(),
              }) => SelectorHandlerRelationsCompanion(
                id: id,
                selectorName: selectorName,
                handlerId: handlerId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String selectorName,
                required int handlerId,
              }) => SelectorHandlerRelationsCompanion.insert(
                id: id,
                selectorName: selectorName,
                handlerId: handlerId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SelectorHandlerRelationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({selectorName = false, handlerId = false}) {
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
                    if (selectorName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.selectorName,
                                referencedTable:
                                    $$SelectorHandlerRelationsTableReferences
                                        ._selectorNameTable(db),
                                referencedColumn:
                                    $$SelectorHandlerRelationsTableReferences
                                        ._selectorNameTable(db)
                                        .name,
                              )
                              as T;
                    }
                    if (handlerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.handlerId,
                                referencedTable:
                                    $$SelectorHandlerRelationsTableReferences
                                        ._handlerIdTable(db),
                                referencedColumn:
                                    $$SelectorHandlerRelationsTableReferences
                                        ._handlerIdTable(db)
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

typedef $$SelectorHandlerRelationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SelectorHandlerRelationsTable,
      SelectorHandlerRelation,
      $$SelectorHandlerRelationsTableFilterComposer,
      $$SelectorHandlerRelationsTableOrderingComposer,
      $$SelectorHandlerRelationsTableAnnotationComposer,
      $$SelectorHandlerRelationsTableCreateCompanionBuilder,
      $$SelectorHandlerRelationsTableUpdateCompanionBuilder,
      (SelectorHandlerRelation, $$SelectorHandlerRelationsTableReferences),
      SelectorHandlerRelation,
      PrefetchHooks Function({bool selectorName, bool handlerId})
    >;
typedef $$SelectorHandlerGroupRelationsTableCreateCompanionBuilder =
    SelectorHandlerGroupRelationsCompanion Function({
      Value<int> id,
      required String selectorName,
      required String groupName,
    });
typedef $$SelectorHandlerGroupRelationsTableUpdateCompanionBuilder =
    SelectorHandlerGroupRelationsCompanion Function({
      Value<int> id,
      Value<String> selectorName,
      Value<String> groupName,
    });

final class $$SelectorHandlerGroupRelationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SelectorHandlerGroupRelationsTable,
          SelectorHandlerGroupRelation
        > {
  $$SelectorHandlerGroupRelationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HandlerSelectorsTable _selectorNameTable(_$AppDatabase db) =>
      db.handlerSelectors.createAlias(
        $_aliasNameGenerator(
          db.selectorHandlerGroupRelations.selectorName,
          db.handlerSelectors.name,
        ),
      );

  $$HandlerSelectorsTableProcessedTableManager get selectorName {
    final $_column = $_itemColumn<String>('selector_name')!;

    final manager = $$HandlerSelectorsTableTableManager(
      $_db,
      $_db.handlerSelectors,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_selectorNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OutboundHandlerGroupsTable _groupNameTable(_$AppDatabase db) =>
      db.outboundHandlerGroups.createAlias(
        $_aliasNameGenerator(
          db.selectorHandlerGroupRelations.groupName,
          db.outboundHandlerGroups.name,
        ),
      );

  $$OutboundHandlerGroupsTableProcessedTableManager get groupName {
    final $_column = $_itemColumn<String>('group_name')!;

    final manager = $$OutboundHandlerGroupsTableTableManager(
      $_db,
      $_db.outboundHandlerGroups,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SelectorHandlerGroupRelationsTableFilterComposer
    extends Composer<_$AppDatabase, $SelectorHandlerGroupRelationsTable> {
  $$SelectorHandlerGroupRelationsTableFilterComposer({
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

  $$HandlerSelectorsTableFilterComposer get selectorName {
    final $$HandlerSelectorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.selectorName,
      referencedTable: $db.handlerSelectors,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HandlerSelectorsTableFilterComposer(
            $db: $db,
            $table: $db.handlerSelectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OutboundHandlerGroupsTableFilterComposer get groupName {
    final $$OutboundHandlerGroupsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupName,
          referencedTable: $db.outboundHandlerGroups,
          getReferencedColumn: (t) => t.name,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OutboundHandlerGroupsTableFilterComposer(
                $db: $db,
                $table: $db.outboundHandlerGroups,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SelectorHandlerGroupRelationsTableOrderingComposer
    extends Composer<_$AppDatabase, $SelectorHandlerGroupRelationsTable> {
  $$SelectorHandlerGroupRelationsTableOrderingComposer({
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

  $$HandlerSelectorsTableOrderingComposer get selectorName {
    final $$HandlerSelectorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.selectorName,
      referencedTable: $db.handlerSelectors,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HandlerSelectorsTableOrderingComposer(
            $db: $db,
            $table: $db.handlerSelectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OutboundHandlerGroupsTableOrderingComposer get groupName {
    final $$OutboundHandlerGroupsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupName,
          referencedTable: $db.outboundHandlerGroups,
          getReferencedColumn: (t) => t.name,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OutboundHandlerGroupsTableOrderingComposer(
                $db: $db,
                $table: $db.outboundHandlerGroups,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SelectorHandlerGroupRelationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SelectorHandlerGroupRelationsTable> {
  $$SelectorHandlerGroupRelationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$HandlerSelectorsTableAnnotationComposer get selectorName {
    final $$HandlerSelectorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.selectorName,
      referencedTable: $db.handlerSelectors,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HandlerSelectorsTableAnnotationComposer(
            $db: $db,
            $table: $db.handlerSelectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OutboundHandlerGroupsTableAnnotationComposer get groupName {
    final $$OutboundHandlerGroupsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupName,
          referencedTable: $db.outboundHandlerGroups,
          getReferencedColumn: (t) => t.name,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OutboundHandlerGroupsTableAnnotationComposer(
                $db: $db,
                $table: $db.outboundHandlerGroups,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SelectorHandlerGroupRelationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SelectorHandlerGroupRelationsTable,
          SelectorHandlerGroupRelation,
          $$SelectorHandlerGroupRelationsTableFilterComposer,
          $$SelectorHandlerGroupRelationsTableOrderingComposer,
          $$SelectorHandlerGroupRelationsTableAnnotationComposer,
          $$SelectorHandlerGroupRelationsTableCreateCompanionBuilder,
          $$SelectorHandlerGroupRelationsTableUpdateCompanionBuilder,
          (
            SelectorHandlerGroupRelation,
            $$SelectorHandlerGroupRelationsTableReferences,
          ),
          SelectorHandlerGroupRelation,
          PrefetchHooks Function({bool selectorName, bool groupName})
        > {
  $$SelectorHandlerGroupRelationsTableTableManager(
    _$AppDatabase db,
    $SelectorHandlerGroupRelationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SelectorHandlerGroupRelationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SelectorHandlerGroupRelationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SelectorHandlerGroupRelationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> selectorName = const Value.absent(),
                Value<String> groupName = const Value.absent(),
              }) => SelectorHandlerGroupRelationsCompanion(
                id: id,
                selectorName: selectorName,
                groupName: groupName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String selectorName,
                required String groupName,
              }) => SelectorHandlerGroupRelationsCompanion.insert(
                id: id,
                selectorName: selectorName,
                groupName: groupName,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SelectorHandlerGroupRelationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({selectorName = false, groupName = false}) {
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
                    if (selectorName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.selectorName,
                                referencedTable:
                                    $$SelectorHandlerGroupRelationsTableReferences
                                        ._selectorNameTable(db),
                                referencedColumn:
                                    $$SelectorHandlerGroupRelationsTableReferences
                                        ._selectorNameTable(db)
                                        .name,
                              )
                              as T;
                    }
                    if (groupName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.groupName,
                                referencedTable:
                                    $$SelectorHandlerGroupRelationsTableReferences
                                        ._groupNameTable(db),
                                referencedColumn:
                                    $$SelectorHandlerGroupRelationsTableReferences
                                        ._groupNameTable(db)
                                        .name,
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

typedef $$SelectorHandlerGroupRelationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SelectorHandlerGroupRelationsTable,
      SelectorHandlerGroupRelation,
      $$SelectorHandlerGroupRelationsTableFilterComposer,
      $$SelectorHandlerGroupRelationsTableOrderingComposer,
      $$SelectorHandlerGroupRelationsTableAnnotationComposer,
      $$SelectorHandlerGroupRelationsTableCreateCompanionBuilder,
      $$SelectorHandlerGroupRelationsTableUpdateCompanionBuilder,
      (
        SelectorHandlerGroupRelation,
        $$SelectorHandlerGroupRelationsTableReferences,
      ),
      SelectorHandlerGroupRelation,
      PrefetchHooks Function({bool selectorName, bool groupName})
    >;
typedef $$SelectorSubscriptionRelationsTableCreateCompanionBuilder =
    SelectorSubscriptionRelationsCompanion Function({
      Value<int> id,
      required String selectorName,
      required int subscriptionId,
    });
typedef $$SelectorSubscriptionRelationsTableUpdateCompanionBuilder =
    SelectorSubscriptionRelationsCompanion Function({
      Value<int> id,
      Value<String> selectorName,
      Value<int> subscriptionId,
    });

final class $$SelectorSubscriptionRelationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SelectorSubscriptionRelationsTable,
          SelectorSubscriptionRelation
        > {
  $$SelectorSubscriptionRelationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HandlerSelectorsTable _selectorNameTable(_$AppDatabase db) =>
      db.handlerSelectors.createAlias(
        $_aliasNameGenerator(
          db.selectorSubscriptionRelations.selectorName,
          db.handlerSelectors.name,
        ),
      );

  $$HandlerSelectorsTableProcessedTableManager get selectorName {
    final $_column = $_itemColumn<String>('selector_name')!;

    final manager = $$HandlerSelectorsTableTableManager(
      $_db,
      $_db.handlerSelectors,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_selectorNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SubscriptionsTable _subscriptionIdTable(_$AppDatabase db) =>
      db.subscriptions.createAlias(
        $_aliasNameGenerator(
          db.selectorSubscriptionRelations.subscriptionId,
          db.subscriptions.id,
        ),
      );

  $$SubscriptionsTableProcessedTableManager get subscriptionId {
    final $_column = $_itemColumn<int>('subscription_id')!;

    final manager = $$SubscriptionsTableTableManager(
      $_db,
      $_db.subscriptions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subscriptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SelectorSubscriptionRelationsTableFilterComposer
    extends Composer<_$AppDatabase, $SelectorSubscriptionRelationsTable> {
  $$SelectorSubscriptionRelationsTableFilterComposer({
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

  $$HandlerSelectorsTableFilterComposer get selectorName {
    final $$HandlerSelectorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.selectorName,
      referencedTable: $db.handlerSelectors,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HandlerSelectorsTableFilterComposer(
            $db: $db,
            $table: $db.handlerSelectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubscriptionsTableFilterComposer get subscriptionId {
    final $$SubscriptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableFilterComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SelectorSubscriptionRelationsTableOrderingComposer
    extends Composer<_$AppDatabase, $SelectorSubscriptionRelationsTable> {
  $$SelectorSubscriptionRelationsTableOrderingComposer({
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

  $$HandlerSelectorsTableOrderingComposer get selectorName {
    final $$HandlerSelectorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.selectorName,
      referencedTable: $db.handlerSelectors,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HandlerSelectorsTableOrderingComposer(
            $db: $db,
            $table: $db.handlerSelectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubscriptionsTableOrderingComposer get subscriptionId {
    final $$SubscriptionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableOrderingComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SelectorSubscriptionRelationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SelectorSubscriptionRelationsTable> {
  $$SelectorSubscriptionRelationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$HandlerSelectorsTableAnnotationComposer get selectorName {
    final $$HandlerSelectorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.selectorName,
      referencedTable: $db.handlerSelectors,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HandlerSelectorsTableAnnotationComposer(
            $db: $db,
            $table: $db.handlerSelectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubscriptionsTableAnnotationComposer get subscriptionId {
    final $$SubscriptionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableAnnotationComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SelectorSubscriptionRelationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SelectorSubscriptionRelationsTable,
          SelectorSubscriptionRelation,
          $$SelectorSubscriptionRelationsTableFilterComposer,
          $$SelectorSubscriptionRelationsTableOrderingComposer,
          $$SelectorSubscriptionRelationsTableAnnotationComposer,
          $$SelectorSubscriptionRelationsTableCreateCompanionBuilder,
          $$SelectorSubscriptionRelationsTableUpdateCompanionBuilder,
          (
            SelectorSubscriptionRelation,
            $$SelectorSubscriptionRelationsTableReferences,
          ),
          SelectorSubscriptionRelation,
          PrefetchHooks Function({bool selectorName, bool subscriptionId})
        > {
  $$SelectorSubscriptionRelationsTableTableManager(
    _$AppDatabase db,
    $SelectorSubscriptionRelationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SelectorSubscriptionRelationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SelectorSubscriptionRelationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SelectorSubscriptionRelationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> selectorName = const Value.absent(),
                Value<int> subscriptionId = const Value.absent(),
              }) => SelectorSubscriptionRelationsCompanion(
                id: id,
                selectorName: selectorName,
                subscriptionId: subscriptionId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String selectorName,
                required int subscriptionId,
              }) => SelectorSubscriptionRelationsCompanion.insert(
                id: id,
                selectorName: selectorName,
                subscriptionId: subscriptionId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SelectorSubscriptionRelationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({selectorName = false, subscriptionId = false}) {
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
                    if (selectorName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.selectorName,
                                referencedTable:
                                    $$SelectorSubscriptionRelationsTableReferences
                                        ._selectorNameTable(db),
                                referencedColumn:
                                    $$SelectorSubscriptionRelationsTableReferences
                                        ._selectorNameTable(db)
                                        .name,
                              )
                              as T;
                    }
                    if (subscriptionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.subscriptionId,
                                referencedTable:
                                    $$SelectorSubscriptionRelationsTableReferences
                                        ._subscriptionIdTable(db),
                                referencedColumn:
                                    $$SelectorSubscriptionRelationsTableReferences
                                        ._subscriptionIdTable(db)
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

typedef $$SelectorSubscriptionRelationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SelectorSubscriptionRelationsTable,
      SelectorSubscriptionRelation,
      $$SelectorSubscriptionRelationsTableFilterComposer,
      $$SelectorSubscriptionRelationsTableOrderingComposer,
      $$SelectorSubscriptionRelationsTableAnnotationComposer,
      $$SelectorSubscriptionRelationsTableCreateCompanionBuilder,
      $$SelectorSubscriptionRelationsTableUpdateCompanionBuilder,
      (
        SelectorSubscriptionRelation,
        $$SelectorSubscriptionRelationsTableReferences,
      ),
      SelectorSubscriptionRelation,
      PrefetchHooks Function({bool selectorName, bool subscriptionId})
    >;
typedef $$DnsServersTableCreateCompanionBuilder =
    DnsServersCompanion Function({
      Value<DateTime?> updatedAt,
      Value<int> id,
      required String name,
      required dns.DnsServerConfig dnsServer,
    });
typedef $$DnsServersTableUpdateCompanionBuilder =
    DnsServersCompanion Function({
      Value<DateTime?> updatedAt,
      Value<int> id,
      Value<String> name,
      Value<dns.DnsServerConfig> dnsServer,
    });

class $$DnsServersTableFilterComposer
    extends Composer<_$AppDatabase, $DnsServersTable> {
  $$DnsServersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  ColumnWithTypeConverterFilters<
    dns.DnsServerConfig,
    dns.DnsServerConfig,
    Uint8List
  >
  get dnsServer => $composableBuilder(
    column: $table.dnsServer,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$DnsServersTableOrderingComposer
    extends Composer<_$AppDatabase, $DnsServersTable> {
  $$DnsServersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  ColumnOrderings<Uint8List> get dnsServer => $composableBuilder(
    column: $table.dnsServer,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DnsServersTableAnnotationComposer
    extends Composer<_$AppDatabase, $DnsServersTable> {
  $$DnsServersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<dns.DnsServerConfig, Uint8List>
  get dnsServer =>
      $composableBuilder(column: $table.dnsServer, builder: (column) => column);
}

class $$DnsServersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DnsServersTable,
          DnsServer,
          $$DnsServersTableFilterComposer,
          $$DnsServersTableOrderingComposer,
          $$DnsServersTableAnnotationComposer,
          $$DnsServersTableCreateCompanionBuilder,
          $$DnsServersTableUpdateCompanionBuilder,
          (
            DnsServer,
            BaseReferences<_$AppDatabase, $DnsServersTable, DnsServer>,
          ),
          DnsServer,
          PrefetchHooks Function()
        > {
  $$DnsServersTableTableManager(_$AppDatabase db, $DnsServersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DnsServersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DnsServersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DnsServersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<dns.DnsServerConfig> dnsServer = const Value.absent(),
              }) => DnsServersCompanion(
                updatedAt: updatedAt,
                id: id,
                name: name,
                dnsServer: dnsServer,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
                required dns.DnsServerConfig dnsServer,
              }) => DnsServersCompanion.insert(
                updatedAt: updatedAt,
                id: id,
                name: name,
                dnsServer: dnsServer,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DnsServersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DnsServersTable,
      DnsServer,
      $$DnsServersTableFilterComposer,
      $$DnsServersTableOrderingComposer,
      $$DnsServersTableAnnotationComposer,
      $$DnsServersTableCreateCompanionBuilder,
      $$DnsServersTableUpdateCompanionBuilder,
      (DnsServer, BaseReferences<_$AppDatabase, $DnsServersTable, DnsServer>),
      DnsServer,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SubscriptionsTableTableManager get subscriptions =>
      $$SubscriptionsTableTableManager(_db, _db.subscriptions);
  $$OutboundHandlersTableTableManager get outboundHandlers =>
      $$OutboundHandlersTableTableManager(_db, _db.outboundHandlers);
  $$OutboundHandlerGroupsTableTableManager get outboundHandlerGroups =>
      $$OutboundHandlerGroupsTableTableManager(_db, _db.outboundHandlerGroups);
  $$OutboundHandlerGroupRelationsTableTableManager
  get outboundHandlerGroupRelations =>
      $$OutboundHandlerGroupRelationsTableTableManager(
        _db,
        _db.outboundHandlerGroupRelations,
      );
  $$DnsRecordsTableTableManager get dnsRecords =>
      $$DnsRecordsTableTableManager(_db, _db.dnsRecords);
  $$AtomicDomainSetsTableTableManager get atomicDomainSets =>
      $$AtomicDomainSetsTableTableManager(_db, _db.atomicDomainSets);
  $$GeoDomainsTableTableManager get geoDomains =>
      $$GeoDomainsTableTableManager(_db, _db.geoDomains);
  $$GreatDomainSetsTableTableManager get greatDomainSets =>
      $$GreatDomainSetsTableTableManager(_db, _db.greatDomainSets);
  $$AtomicIpSetsTableTableManager get atomicIpSets =>
      $$AtomicIpSetsTableTableManager(_db, _db.atomicIpSets);
  $$GreatIpSetsTableTableManager get greatIpSets =>
      $$GreatIpSetsTableTableManager(_db, _db.greatIpSets);
  $$AppSetsTableTableManager get appSets =>
      $$AppSetsTableTableManager(_db, _db.appSets);
  $$AppsTableTableManager get apps => $$AppsTableTableManager(_db, _db.apps);
  $$CidrsTableTableManager get cidrs =>
      $$CidrsTableTableManager(_db, _db.cidrs);
  $$SshServersTableTableManager get sshServers =>
      $$SshServersTableTableManager(_db, _db.sshServers);
  $$CommonSshKeysTableTableManager get commonSshKeys =>
      $$CommonSshKeysTableTableManager(_db, _db.commonSshKeys);
  $$CustomRouteModesTableTableManager get customRouteModes =>
      $$CustomRouteModesTableTableManager(_db, _db.customRouteModes);
  $$HandlerSelectorsTableTableManager get handlerSelectors =>
      $$HandlerSelectorsTableTableManager(_db, _db.handlerSelectors);
  $$SelectorHandlerRelationsTableTableManager get selectorHandlerRelations =>
      $$SelectorHandlerRelationsTableTableManager(
        _db,
        _db.selectorHandlerRelations,
      );
  $$SelectorHandlerGroupRelationsTableTableManager
  get selectorHandlerGroupRelations =>
      $$SelectorHandlerGroupRelationsTableTableManager(
        _db,
        _db.selectorHandlerGroupRelations,
      );
  $$SelectorSubscriptionRelationsTableTableManager
  get selectorSubscriptionRelations =>
      $$SelectorSubscriptionRelationsTableTableManager(
        _db,
        _db.selectorSubscriptionRelations,
      );
  $$DnsServersTableTableManager get dnsServers =>
      $$DnsServersTableTableManager(_db, _db.dnsServers);
}

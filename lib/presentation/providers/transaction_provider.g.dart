// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionRepositoryHash() =>
    r'5f9b9568805d3e6acab6d47005d94bef273317b2';

/// See also [transactionRepository].
@ProviderFor(transactionRepository)
final transactionRepositoryProvider =
    AutoDisposeProvider<TransactionRepository>.internal(
  transactionRepository,
  name: r'transactionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TransactionRepositoryRef
    = AutoDisposeProviderRef<TransactionRepository>;
String _$transactionsStreamHash() =>
    r'864a031d23910402bc9dbfd7fd3d836d360ffab4';

/// See also [transactionsStream].
@ProviderFor(transactionsStream)
final transactionsStreamProvider =
    AutoDisposeStreamProvider<List<TransactionWithCustomer>>.internal(
  transactionsStream,
  name: r'transactionsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TransactionsStreamRef
    = AutoDisposeStreamProviderRef<List<TransactionWithCustomer>>;
String _$transactionDetailsHash() =>
    r'ec1a1f0ed5e56cdcd6f52ec65c8b3fc3236e4dd7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [transactionDetails].
@ProviderFor(transactionDetails)
const transactionDetailsProvider = TransactionDetailsFamily();

/// See also [transactionDetails].
class TransactionDetailsFamily
    extends Family<AsyncValue<TransactionFullDetails>> {
  /// See also [transactionDetails].
  const TransactionDetailsFamily();

  /// See also [transactionDetails].
  TransactionDetailsProvider call(
    String transactionId,
  ) {
    return TransactionDetailsProvider(
      transactionId,
    );
  }

  @override
  TransactionDetailsProvider getProviderOverride(
    covariant TransactionDetailsProvider provider,
  ) {
    return call(
      provider.transactionId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'transactionDetailsProvider';
}

/// See also [transactionDetails].
class TransactionDetailsProvider
    extends AutoDisposeFutureProvider<TransactionFullDetails> {
  /// See also [transactionDetails].
  TransactionDetailsProvider(
    String transactionId,
  ) : this._internal(
          (ref) => transactionDetails(
            ref as TransactionDetailsRef,
            transactionId,
          ),
          from: transactionDetailsProvider,
          name: r'transactionDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionDetailsHash,
          dependencies: TransactionDetailsFamily._dependencies,
          allTransitiveDependencies:
              TransactionDetailsFamily._allTransitiveDependencies,
          transactionId: transactionId,
        );

  TransactionDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.transactionId,
  }) : super.internal();

  final String transactionId;

  @override
  Override overrideWith(
    FutureOr<TransactionFullDetails> Function(TransactionDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransactionDetailsProvider._internal(
        (ref) => create(ref as TransactionDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        transactionId: transactionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TransactionFullDetails> createElement() {
    return _TransactionDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionDetailsProvider &&
        other.transactionId == transactionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, transactionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TransactionDetailsRef
    on AutoDisposeFutureProviderRef<TransactionFullDetails> {
  /// The parameter `transactionId` of this provider.
  String get transactionId;
}

class _TransactionDetailsProviderElement
    extends AutoDisposeFutureProviderElement<TransactionFullDetails>
    with TransactionDetailsRef {
  _TransactionDetailsProviderElement(super.provider);

  @override
  String get transactionId =>
      (origin as TransactionDetailsProvider).transactionId;
}

String _$paymentsForTransactionHash() =>
    r'0c0b12fb768d09a7ac89e64adba5c199b5e4823d';

/// See also [paymentsForTransaction].
@ProviderFor(paymentsForTransaction)
const paymentsForTransactionProvider = PaymentsForTransactionFamily();

/// See also [paymentsForTransaction].
class PaymentsForTransactionFamily
    extends Family<AsyncValue<List<PaymentData>>> {
  /// See also [paymentsForTransaction].
  const PaymentsForTransactionFamily();

  /// See also [paymentsForTransaction].
  PaymentsForTransactionProvider call(
    String transactionId,
  ) {
    return PaymentsForTransactionProvider(
      transactionId,
    );
  }

  @override
  PaymentsForTransactionProvider getProviderOverride(
    covariant PaymentsForTransactionProvider provider,
  ) {
    return call(
      provider.transactionId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'paymentsForTransactionProvider';
}

/// See also [paymentsForTransaction].
class PaymentsForTransactionProvider
    extends AutoDisposeStreamProvider<List<PaymentData>> {
  /// See also [paymentsForTransaction].
  PaymentsForTransactionProvider(
    String transactionId,
  ) : this._internal(
          (ref) => paymentsForTransaction(
            ref as PaymentsForTransactionRef,
            transactionId,
          ),
          from: paymentsForTransactionProvider,
          name: r'paymentsForTransactionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentsForTransactionHash,
          dependencies: PaymentsForTransactionFamily._dependencies,
          allTransitiveDependencies:
              PaymentsForTransactionFamily._allTransitiveDependencies,
          transactionId: transactionId,
        );

  PaymentsForTransactionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.transactionId,
  }) : super.internal();

  final String transactionId;

  @override
  Override overrideWith(
    Stream<List<PaymentData>> Function(PaymentsForTransactionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PaymentsForTransactionProvider._internal(
        (ref) => create(ref as PaymentsForTransactionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        transactionId: transactionId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<PaymentData>> createElement() {
    return _PaymentsForTransactionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentsForTransactionProvider &&
        other.transactionId == transactionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, transactionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaymentsForTransactionRef
    on AutoDisposeStreamProviderRef<List<PaymentData>> {
  /// The parameter `transactionId` of this provider.
  String get transactionId;
}

class _PaymentsForTransactionProviderElement
    extends AutoDisposeStreamProviderElement<List<PaymentData>>
    with PaymentsForTransactionRef {
  _PaymentsForTransactionProviderElement(super.provider);

  @override
  String get transactionId =>
      (origin as PaymentsForTransactionProvider).transactionId;
}

String _$dashboardStatsHash() => r'cb883dcaffaae400a6298a36abb78cf16e96a73e';

/// See also [dashboardStats].
@ProviderFor(dashboardStats)
final dashboardStatsProvider =
    AutoDisposeFutureProvider<DashboardStats>.internal(
  dashboardStats,
  name: r'dashboardStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DashboardStatsRef = AutoDisposeFutureProviderRef<DashboardStats>;
String _$filteredTransactionsHash() =>
    r'0a678b8a46407255cd3fdf561f1c87a5f1276c71';

/// See also [filteredTransactions].
@ProviderFor(filteredTransactions)
const filteredTransactionsProvider = FilteredTransactionsFamily();

/// See also [filteredTransactions].
class FilteredTransactionsFamily
    extends Family<AsyncValue<List<TransactionWithCustomer>>> {
  /// See also [filteredTransactions].
  const FilteredTransactionsFamily();

  /// See also [filteredTransactions].
  FilteredTransactionsProvider call({
    DateTime? startDate,
    DateTime? endDate,
    List<String>? statuses,
  }) {
    return FilteredTransactionsProvider(
      startDate: startDate,
      endDate: endDate,
      statuses: statuses,
    );
  }

  @override
  FilteredTransactionsProvider getProviderOverride(
    covariant FilteredTransactionsProvider provider,
  ) {
    return call(
      startDate: provider.startDate,
      endDate: provider.endDate,
      statuses: provider.statuses,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredTransactionsProvider';
}

/// See also [filteredTransactions].
class FilteredTransactionsProvider
    extends AutoDisposeStreamProvider<List<TransactionWithCustomer>> {
  /// See also [filteredTransactions].
  FilteredTransactionsProvider({
    DateTime? startDate,
    DateTime? endDate,
    List<String>? statuses,
  }) : this._internal(
          (ref) => filteredTransactions(
            ref as FilteredTransactionsRef,
            startDate: startDate,
            endDate: endDate,
            statuses: statuses,
          ),
          from: filteredTransactionsProvider,
          name: r'filteredTransactionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredTransactionsHash,
          dependencies: FilteredTransactionsFamily._dependencies,
          allTransitiveDependencies:
              FilteredTransactionsFamily._allTransitiveDependencies,
          startDate: startDate,
          endDate: endDate,
          statuses: statuses,
        );

  FilteredTransactionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
    required this.statuses,
  }) : super.internal();

  final DateTime? startDate;
  final DateTime? endDate;
  final List<String>? statuses;

  @override
  Override overrideWith(
    Stream<List<TransactionWithCustomer>> Function(
            FilteredTransactionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredTransactionsProvider._internal(
        (ref) => create(ref as FilteredTransactionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
        statuses: statuses,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<TransactionWithCustomer>>
      createElement() {
    return _FilteredTransactionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredTransactionsProvider &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.statuses == statuses;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, statuses.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredTransactionsRef
    on AutoDisposeStreamProviderRef<List<TransactionWithCustomer>> {
  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;

  /// The parameter `statuses` of this provider.
  List<String>? get statuses;
}

class _FilteredTransactionsProviderElement
    extends AutoDisposeStreamProviderElement<List<TransactionWithCustomer>>
    with FilteredTransactionsRef {
  _FilteredTransactionsProviderElement(super.provider);

  @override
  DateTime? get startDate => (origin as FilteredTransactionsProvider).startDate;
  @override
  DateTime? get endDate => (origin as FilteredTransactionsProvider).endDate;
  @override
  List<String>? get statuses =>
      (origin as FilteredTransactionsProvider).statuses;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

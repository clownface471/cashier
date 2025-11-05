// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentRepositoryHash() => r'0e9e93d678c7bee6fd07ddc870478b3a9f472c93';

/// See also [paymentRepository].
@ProviderFor(paymentRepository)
final paymentRepositoryProvider =
    AutoDisposeProvider<PaymentRepository>.internal(
  paymentRepository,
  name: r'paymentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PaymentRepositoryRef = AutoDisposeProviderRef<PaymentRepository>;
String _$paymentsStreamHash() => r'0aca54a5633915f3a6343f3e5397abb374dd95c2';

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

/// See also [paymentsStream].
@ProviderFor(paymentsStream)
const paymentsStreamProvider = PaymentsStreamFamily();

/// See also [paymentsStream].
class PaymentsStreamFamily extends Family<AsyncValue<List<PaymentData>>> {
  /// See also [paymentsStream].
  const PaymentsStreamFamily();

  /// See also [paymentsStream].
  PaymentsStreamProvider call(
    String transactionId,
  ) {
    return PaymentsStreamProvider(
      transactionId,
    );
  }

  @override
  PaymentsStreamProvider getProviderOverride(
    covariant PaymentsStreamProvider provider,
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
  String? get name => r'paymentsStreamProvider';
}

/// See also [paymentsStream].
class PaymentsStreamProvider
    extends AutoDisposeStreamProvider<List<PaymentData>> {
  /// See also [paymentsStream].
  PaymentsStreamProvider(
    String transactionId,
  ) : this._internal(
          (ref) => paymentsStream(
            ref as PaymentsStreamRef,
            transactionId,
          ),
          from: paymentsStreamProvider,
          name: r'paymentsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentsStreamHash,
          dependencies: PaymentsStreamFamily._dependencies,
          allTransitiveDependencies:
              PaymentsStreamFamily._allTransitiveDependencies,
          transactionId: transactionId,
        );

  PaymentsStreamProvider._internal(
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
    Stream<List<PaymentData>> Function(PaymentsStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PaymentsStreamProvider._internal(
        (ref) => create(ref as PaymentsStreamRef),
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
    return _PaymentsStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentsStreamProvider &&
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
mixin PaymentsStreamRef on AutoDisposeStreamProviderRef<List<PaymentData>> {
  /// The parameter `transactionId` of this provider.
  String get transactionId;
}

class _PaymentsStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<PaymentData>>
    with PaymentsStreamRef {
  _PaymentsStreamProviderElement(super.provider);

  @override
  String get transactionId => (origin as PaymentsStreamProvider).transactionId;
}

String _$paymentSummaryHash() => r'789183747028764af51c2322cf452dc8f505693b';

/// See also [paymentSummary].
@ProviderFor(paymentSummary)
const paymentSummaryProvider = PaymentSummaryFamily();

/// See also [paymentSummary].
class PaymentSummaryFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [paymentSummary].
  const PaymentSummaryFamily();

  /// See also [paymentSummary].
  PaymentSummaryProvider call(
    String transactionId,
  ) {
    return PaymentSummaryProvider(
      transactionId,
    );
  }

  @override
  PaymentSummaryProvider getProviderOverride(
    covariant PaymentSummaryProvider provider,
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
  String? get name => r'paymentSummaryProvider';
}

/// See also [paymentSummary].
class PaymentSummaryProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [paymentSummary].
  PaymentSummaryProvider(
    String transactionId,
  ) : this._internal(
          (ref) => paymentSummary(
            ref as PaymentSummaryRef,
            transactionId,
          ),
          from: paymentSummaryProvider,
          name: r'paymentSummaryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentSummaryHash,
          dependencies: PaymentSummaryFamily._dependencies,
          allTransitiveDependencies:
              PaymentSummaryFamily._allTransitiveDependencies,
          transactionId: transactionId,
        );

  PaymentSummaryProvider._internal(
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
    FutureOr<Map<String, dynamic>> Function(PaymentSummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PaymentSummaryProvider._internal(
        (ref) => create(ref as PaymentSummaryRef),
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
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PaymentSummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentSummaryProvider &&
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
mixin PaymentSummaryRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `transactionId` of this provider.
  String get transactionId;
}

class _PaymentSummaryProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PaymentSummaryRef {
  _PaymentSummaryProviderElement(super.provider);

  @override
  String get transactionId => (origin as PaymentSummaryProvider).transactionId;
}

String _$overdueTransactionsHash() =>
    r'ad7344ac87af3b69cf328df5cd650310d110b7b4';

/// See also [overdueTransactions].
@ProviderFor(overdueTransactions)
final overdueTransactionsProvider =
    AutoDisposeFutureProvider<List<TransactionData>>.internal(
  overdueTransactions,
  name: r'overdueTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$overdueTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OverdueTransactionsRef
    = AutoDisposeFutureProviderRef<List<TransactionData>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

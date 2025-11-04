// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customerRepositoryHash() =>
    r'db788e1f0fecdeabd1b378c0e3dbf557dfed0f0d';

/// See also [customerRepository].
@ProviderFor(customerRepository)
final customerRepositoryProvider =
    AutoDisposeProvider<CustomerRepository>.internal(
  customerRepository,
  name: r'customerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CustomerRepositoryRef = AutoDisposeProviderRef<CustomerRepository>;
String _$customersStreamHash() => r'dfcf5727f12001de3437d7b9077b2959e1d96a1b';

/// See also [customersStream].
@ProviderFor(customersStream)
final customersStreamProvider =
    AutoDisposeStreamProvider<List<CustomerData>>.internal(
  customersStream,
  name: r'customersStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customersStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CustomersStreamRef = AutoDisposeStreamProviderRef<List<CustomerData>>;
String _$activeCustomersHash() => r'72a888dd000da26d54601e2cdcf7965006c2658f';

/// See also [activeCustomers].
@ProviderFor(activeCustomers)
final activeCustomersProvider =
    AutoDisposeFutureProvider<List<CustomerData>>.internal(
  activeCustomers,
  name: r'activeCustomersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeCustomersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveCustomersRef = AutoDisposeFutureProviderRef<List<CustomerData>>;
String _$searchCustomersHash() => r'9c0d17765dd40e2033e5bf6c12e790dec874edb3';

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

/// See also [searchCustomers].
@ProviderFor(searchCustomers)
const searchCustomersProvider = SearchCustomersFamily();

/// See also [searchCustomers].
class SearchCustomersFamily extends Family<AsyncValue<List<CustomerData>>> {
  /// See also [searchCustomers].
  const SearchCustomersFamily();

  /// See also [searchCustomers].
  SearchCustomersProvider call(
    String query,
  ) {
    return SearchCustomersProvider(
      query,
    );
  }

  @override
  SearchCustomersProvider getProviderOverride(
    covariant SearchCustomersProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'searchCustomersProvider';
}

/// See also [searchCustomers].
class SearchCustomersProvider
    extends AutoDisposeFutureProvider<List<CustomerData>> {
  /// See also [searchCustomers].
  SearchCustomersProvider(
    String query,
  ) : this._internal(
          (ref) => searchCustomers(
            ref as SearchCustomersRef,
            query,
          ),
          from: searchCustomersProvider,
          name: r'searchCustomersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchCustomersHash,
          dependencies: SearchCustomersFamily._dependencies,
          allTransitiveDependencies:
              SearchCustomersFamily._allTransitiveDependencies,
          query: query,
        );

  SearchCustomersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<CustomerData>> Function(SearchCustomersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchCustomersProvider._internal(
        (ref) => create(ref as SearchCustomersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CustomerData>> createElement() {
    return _SearchCustomersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchCustomersProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchCustomersRef on AutoDisposeFutureProviderRef<List<CustomerData>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchCustomersProviderElement
    extends AutoDisposeFutureProviderElement<List<CustomerData>>
    with SearchCustomersRef {
  _SearchCustomersProviderElement(super.provider);

  @override
  String get query => (origin as SearchCustomersProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$restClientHash() => r'9ac7d91d216dbfa8d4c4a1dfc24e01b38bf3f0a5';

/// See also [restClient].
@ProviderFor(restClient)
final restClientProvider = Provider<RestClient>.internal(
  restClient,
  name: r'restClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$restClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RestClientRef = ProviderRef<RestClient>;
String _$userRepositoryHash() => r'1090ee38f89dfb23cb1bb567462b99372ac93cc8';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = Provider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRepositoryRef = ProviderRef<UserRepository>;
String _$userLoginServiceHash() => r'3b64f21b060001f1ea39249a947d41e285091f7c';

/// See also [userLoginService].
@ProviderFor(userLoginService)
final userLoginServiceProvider = Provider<UserLoginService>.internal(
  userLoginService,
  name: r'userLoginServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userLoginServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserLoginServiceRef = ProviderRef<UserLoginService>;
String _$getMeHash() => r'754137d5d72ac0ed42f828fb1c86cc560ec99c15';

/// See also [getMe].
@ProviderFor(getMe)
final getMeProvider = FutureProvider<UserModel>.internal(
  getMe,
  name: r'getMeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getMeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetMeRef = FutureProviderRef<UserModel>;
String _$imovelRepositoryHash() => r'a148e98d4c194c47c113107b8a03d0af09c77e96';

/// See also [imovelRepository].
@ProviderFor(imovelRepository)
final imovelRepositoryProvider = Provider<ImovelRepository>.internal(
  imovelRepository,
  name: r'imovelRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imovelRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImovelRepositoryRef = ProviderRef<ImovelRepository>;
String _$getImovelHash() => r'ccea6156da008631e56518859c9ce282d5aea949';

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

/// See also [getImovel].
@ProviderFor(getImovel)
const getImovelProvider = GetImovelFamily();

/// See also [getImovel].
class GetImovelFamily extends Family<AsyncValue<ImovelModel>> {
  /// See also [getImovel].
  const GetImovelFamily();

  /// See also [getImovel].
  GetImovelProvider call(
    int imovelId,
  ) {
    return GetImovelProvider(
      imovelId,
    );
  }

  @override
  GetImovelProvider getProviderOverride(
    covariant GetImovelProvider provider,
  ) {
    return call(
      provider.imovelId,
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
  String? get name => r'getImovelProvider';
}

/// See also [getImovel].
class GetImovelProvider extends FutureProvider<ImovelModel> {
  /// See also [getImovel].
  GetImovelProvider(
    int imovelId,
  ) : this._internal(
          (ref) => getImovel(
            ref as GetImovelRef,
            imovelId,
          ),
          from: getImovelProvider,
          name: r'getImovelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getImovelHash,
          dependencies: GetImovelFamily._dependencies,
          allTransitiveDependencies: GetImovelFamily._allTransitiveDependencies,
          imovelId: imovelId,
        );

  GetImovelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.imovelId,
  }) : super.internal();

  final int imovelId;

  @override
  Override overrideWith(
    FutureOr<ImovelModel> Function(GetImovelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetImovelProvider._internal(
        (ref) => create(ref as GetImovelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        imovelId: imovelId,
      ),
    );
  }

  @override
  FutureProviderElement<ImovelModel> createElement() {
    return _GetImovelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetImovelProvider && other.imovelId == imovelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, imovelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetImovelRef on FutureProviderRef<ImovelModel> {
  /// The parameter `imovelId` of this provider.
  int get imovelId;
}

class _GetImovelProviderElement extends FutureProviderElement<ImovelModel>
    with GetImovelRef {
  _GetImovelProviderElement(super.provider);

  @override
  int get imovelId => (origin as GetImovelProvider).imovelId;
}

String _$getImoveisHash() => r'cb6f3cdf8aec2f6a0716abc7bae6d587926bc097';

/// See also [getImoveis].
@ProviderFor(getImoveis)
final getImoveisProvider =
    FutureProvider<Either<RepositoryException, List<ImovelModel>>>.internal(
  getImoveis,
  name: r'getImoveisProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getImoveisHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetImoveisRef
    = FutureProviderRef<Either<RepositoryException, List<ImovelModel>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

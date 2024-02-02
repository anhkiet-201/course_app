/// A key-value pair for storing and retrieving data from local storage.
class LocalStorageKey<T> {
  final String key;
  final String boxName;

  /// Creates a new [LocalStorageKey] with the given [key] and [boxName] flag.
  const LocalStorageKey(this.key, {this.boxName = LocalStorage.defaultBox});

  const LocalStorageKey.setting(this.key) : boxName = LocalStorage.settingsBox;

  const LocalStorageKey.secure(this.key) : boxName = LocalStorage.secureBox;
}

/// An interface for local storage.
abstract class LocalStorage {
  static const String defaultBox = 'default';
  static const String settingsBox = 'settings';
  static const String secureBox = 'secure';
  static const String tokenBox = 'token';

  /// The version of the local storage.
  int get version;

  /// Migrates the local storage to a new version.
  Future migrate();

  /// Retrieves the value associated with the given [key].
  ///
  /// Returns `null` if the key is not found.
  T? get<T>(LocalStorageKey<T> key);

  /// Retrieves the list associated with the given [key].
  ///
  /// Returns `null` if the key is not found.
  List<T>? getList<T>(LocalStorageKey<List<T>> key);

  /// Stores the given [value] with the given [key].
  Future put<T>(LocalStorageKey<T> key, T value);

  /// Deletes the value associated with the given [key].
  Future delete(LocalStorageKey key);
}

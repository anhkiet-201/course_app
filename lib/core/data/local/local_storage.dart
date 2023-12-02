/// An enum representing different storage boxes for local storage.
enum StorageBox {
  /// The default storage box.
  defaultS,

  /// The storage box for settings.
  setting,

  /// The secure storage box.
  secure;

  /// Returns the name of the storage box.
  String get name {
    switch (this) {
      case StorageBox.defaultS:
        return 'default';
      case StorageBox.setting:
        return 'setting';
      case StorageBox.secure:
        return 'secure';
    }
  }
}

/// A key-value pair for storing and retrieving data from local storage.
class LocalStorageKey<T> {
  final String key;
  final StorageBox box;

  /// Creates a new [LocalStorageKey] with the given [key] and [isSecure] flag.
  const LocalStorageKey(this.key, {this.box = StorageBox.defaultS});
}

/// An interface for local storage.
abstract class LocalStorage {
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

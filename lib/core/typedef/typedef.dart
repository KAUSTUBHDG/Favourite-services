/// Callback for when a __MethodChannel__ function is called.
typedef MethodResponse<T> = void Function(
  T value,
);

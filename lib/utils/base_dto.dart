mixin BaseDto<T, V> {
  T fromJson(Map<String, dynamic> json);
  V toDomain();
}
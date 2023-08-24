class RouteDefinition<Extra> {
  RouteDefinition({
    required this.name,
  });

  /// Then name of the route
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteDefinition &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

enum Flavor {
  prod('production'),
  dev('development');

  final String name;

  const Flavor(this.name);
}

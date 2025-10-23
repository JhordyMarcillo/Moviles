class DiscoModel {
  final double gigabytes;

  DiscoModel(this.gigabytes);

  double get megabytes => gigabytes * 1024;
  double get kilobytes => megabytes * 1024;
  double get bytes => kilobytes * 1024;
}

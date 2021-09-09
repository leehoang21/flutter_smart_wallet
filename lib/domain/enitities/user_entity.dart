class UserEntity {
  final String? accountName;
  final String? avatar;
  final String? email;
  final String? phone;
  final int? createAt;
  final int? lastUpdate;

  UserEntity(
      {this.accountName,
      this.avatar,
      this.email,
      this.phone,
      this.createAt,
      this.lastUpdate});
}

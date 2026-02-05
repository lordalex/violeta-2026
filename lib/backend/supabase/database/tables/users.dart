import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  dynamic get userDoc => getField<dynamic>('userDoc')!;
  set userDoc(dynamic value) => setField<dynamic>('userDoc', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  dynamic get profile => getField<dynamic>('Profile');
  set profile(dynamic value) => setField<dynamic>('Profile', value);
}

import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'contact.g.dart';

const String contactBoxName = 'contacts';
const Uuid uuid = Uuid();

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  final String id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  bool isFavorite;

  Contact({
    required this.id,
    required this.name,
    required this.age,
    required this.phoneNumber,
    this.isFavorite = false,
  });
}

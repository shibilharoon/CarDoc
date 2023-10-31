import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class CustomerModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? phone;
  @HiveField(2)
  final String? date;
  @HiveField(3)
  final String? carNumber;
  @HiveField(4)
  final String? carModel;
  @HiveField(5)
  final String? amount;

  CustomerModel(
      {required this.name,
      required this.phone,
      required this.date,
      required this.carNumber,
      required this.carModel,
      required this.amount});
}

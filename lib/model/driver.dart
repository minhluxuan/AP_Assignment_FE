class Driver {
  final String id;
  final String name;
  final String date;
  final String tuyen;
  final String add;
  final String phonenumber;
  final String email;
  final String lisence;
  final String typeCar;
  final String sex;
  Driver({
    required this.id,
    required this.name,
    required this.tuyen,
    required this.add,
    required this.phonenumber,
    required this.email,
    required this.date,
    required this.lisence,
    required this.typeCar,
    required this.sex,
  });
}

// class bioDriver extends Driver {
//   @override
//   String add = '';
//   @override
//   String phonenumber = '';
//   @override
//   String email = "";
//   @override
//   String lisence;
//   @override
//   String typeCar;
//   bioDriver(
//     id,
//     name,
//     tuyen,
//     this.add,
//     this.email,
//     this.lisence,
//     this.phonenumber,
//     this.typeCar,
//   ) : super(id: '', name: '', tuyen: '');
// }

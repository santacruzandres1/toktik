import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadebleNumber(double number) {
    //va a ser una propiedad statica para poder llamar al metodo sin la necesidad de crear una instancia
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);

    return formatterNumber;
  }
}

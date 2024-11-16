class CheckoutModel {
  final String kosName;
  final String location;
  final String facilities;
  final DateTime bookingDate;
  final double price;
  final String? voucherCode;

  CheckoutModel({
    required this.kosName,
    required this.location,
    required this.facilities,
    required this.bookingDate,
    required this.price,
    this.voucherCode,
  });
}
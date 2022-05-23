
class OrderEntity{
  final String productName;
  final String productPrice;
  final String productQuantity;
  final String productImageNumber;
  final String userId;

  OrderEntity(
      {required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.productImageNumber,
      required this.userId});
}
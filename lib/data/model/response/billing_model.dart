class BillingModel{
  int? id;
  String? orderId;
  String? orderCOD;
  String? orderXpress;
  String? orderPaid;
  String? receiverName;
  String? receiverPhone;
  String? receiverCash;

  BillingModel(
      this.id,
      this.orderId,
      this.orderCOD,
      this.orderXpress,
      this.orderPaid,
      this.receiverName,
      this.receiverPhone,
      this.receiverCash
      );
}
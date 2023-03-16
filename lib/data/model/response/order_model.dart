class OrderModel{
  int? id;
  String? senderId;
  String? senderAddress;
  String? sendercash;
  String? senderparcel;
  String? receiverName;
  String? receiverAddress;
  String? receiverPhone;
  String? senderDate;
  String? receiverDate;

  OrderModel(
      this.id,
      this.senderId,
      this.senderAddress,
      this.sendercash,
      this.senderparcel,
      this.receiverName,
      this.receiverAddress,
      this.receiverPhone,
      this.senderDate,
      this.receiverDate,
      );
}
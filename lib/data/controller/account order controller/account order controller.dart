import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:merchant/data/model/response/rider%20model/account_order_model.dart';
import '../../../helper/pagination_filter.dart';
import '../../model/response/base/response_model.dart';
import '../../model/request/rider repository/account order repository.dart';

class AccountOrderController extends GetxController{
  AccountOrderRepo accountOrderRepo;
  AccountOrderController({required this.accountOrderRepo});

  /// ----------->>>>>>>>>>>> Page Data list limit check Helper
  final _paginationFilter = PaginationFilter().obs;
  bool _lastPage = false;

  /// onno method get korar jonno
  int? get limit => _paginationFilter.value.limit;
  int get page => _paginationFilter.value.page;
  bool get lastPage => _lastPage;

  /// ----------->>>>>>>>>>>> Account order Response <<<<<<<<<<<---------------
  final List<AccountOrderData> _accountOrderList = <AccountOrderData>[].obs;
  List<AccountOrderData> get accountsOrderList => _accountOrderList;


  /// ----------------->>>> Account Order List <<<<<<<-----------------
  Future<ResponseModel> accountOrderList(String orderType, int page, String? fromDate, String? toDate) async{
    Response apiResponse = await accountOrderRepo.accountOrderList(orderType, page, fromDate, toDate);
    ResponseModel responseModel;
    if(apiResponse.statusCode == 200){
      AccountOrderResponse accountOrderResponse = AccountOrderResponse.fromJson(apiResponse.body);
      accountOrderResponse.data.forEach((element) {
        _accountOrderList.add(element);
        isSelected?.add(false);
      });
      if(accountOrderResponse.meta.currentPage == accountOrderResponse.meta.lastPage){
        _lastPage = true;
      }
      debugPrint("Account Order List ------->>>>>>>>> $_accountOrderList");
      responseModel = ResponseModel(true, "Success");
    } else{
      responseModel = ResponseModel(false, "Failed");
    }
    update();
    return responseModel;
  }

  /// ----------->>>>>>>>>>>> Init State Check <<<<<<<<<-------------
  String orderType = "not_yet_handed_over"; ///Confution
  @override
  onInit(){
    ever(_paginationFilter, (_) => accountOrderList(orderType, page, fromDate, toDate));
    print("Curent page: $page");
    super.onInit();
  }

  /// -------------->>>>> 10ta data load neyar por jate r 10ta data load nei tai ei meta method toiri kora hoy..
  void _changePaginationFilter(int page, int? limit){
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = 10;
    });
    print("ChangePaginationFilter: $page");
  }

  /// -------------->>>>> 1page e 10ta data load neya ses hole jate r ekta data load nei tai ei method toiri kora hoy..
  void loadNextPage(){
    ever(_paginationFilter, (_) => accountOrderList(orderType, page, fromDate, toDate));
    _changePaginationFilter(page + 1, limit);
  }

  /// ----------->>>>>>>>> from or to date diye list check korar jonno <<<<<<<<--------------
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  var selectedFromDate = DateTime(2022, 01,01).obs;
  var selectedToDate = DateTime.now().obs;
  final DateFormat format = DateFormat('yyyy-MM-dd');
  String? get  fromDate => format.format(selectedFromDate.value) ?? "";
  String? get  toDate => format.format(selectedToDate.value) ?? "";

  final List<bool> _isSelectedList = [];
  List<bool> get isSelectedList => _isSelectedList;

  /// -------------->>>>> from and to date check korar jonno ei method ta toiri kora hoy..
  Future<DateTime?> getDate(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.green,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
  }

  /// -------------->>>>> From data theke to data modde koto ta data ace deta janar jonno..
  chooseFromDate(BuildContext context) async{
    DateTime? pickedDate = await getDate(context);
    if(pickedDate != null && pickedDate != selectedFromDate.value){
      selectedFromDate.value = pickedDate;
      fromDateController.text = fromDate.toString();
      update();
    }
  }
  
  chooseToDate(BuildContext context) async{
    DateTime? pickedDate = await getDate(context);
    if(pickedDate != null && pickedDate != selectedToDate.value){
      selectedToDate.value = pickedDate;
      toDateController.text = toDate.toString();
      update();
    }
  }

  /// searh button from and to data click kore check korar jonno eikhane data clear kore oi time er modde new data add korar jonno..
  dateWiseSearch(String orderType){
    _accountOrderList.clear();
    _changePaginationFilter(1, 10);
    orderType = orderType;
    ever(_paginationFilter, (_) => accountOrderList(orderType, page, fromDate, toDate));
    update();
  }

  double _amout = 0.0;
  double get amount => _amout;

  final List<int> _selectedIdList = [];
  List<int> get selectedIdList => _selectedIdList;

  changeSelection(int index, bool value){
    _isSelectedList[index]=value;
    if(value){
      _selectedIdList.add(_accountOrderList[index].id);
      _amout+=_accountOrderList[index].amount;
    }else{
      _selectedIdList.remove(_accountOrderList[index].id);
      _amout-=_accountOrderList[index].amount;
    }

  }

  /// OnLongPress CheckBok er jonno ei method..
  RxList<bool?>? isSelected= <bool>[].obs;
  selectAll(bool value){
   for(int i=0; i<accountsOrderList.length; i++){
     _isSelectedList[i]=value;
   }
    update();
  }

}
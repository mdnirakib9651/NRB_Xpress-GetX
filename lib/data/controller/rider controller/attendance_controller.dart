import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:merchant/data/model/request/rider%20repository/rider_attendence_repo.dart';
import 'package:merchant/data/model/response/base/response_model.dart';
import 'package:merchant/data/model/response/rider%20model/rider_attendence_model.dart';
import 'package:merchant/helper/pagination_filter.dart';
import 'package:merchant/helper/remote/api_client.dart';

class RiderAttendenceController extends GetxController{
  RiderAttendenceRepo riderAttendenceRepo;

  RiderAttendenceController({required this.riderAttendenceRepo});

  /// ----------->>>>>>>>>>>> Page Data list limit check Helper
  var _paginationFilter = PaginationFilter().obs;
  bool _lastPage = false;

  /// onno method get korar jonno
  int? get limit => _paginationFilter.value.limit;
  int get page => _paginationFilter.value.page;
  bool get lastPage => _lastPage;

  /// ----------->>>>>>>>> from or to date diye list check korar jonno <<<<<<<<--------------
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  var selectedFromDate = DateTime(2022, 01,01).obs;
  var selectedToDate = DateTime.now().obs;
  final DateFormat format = DateFormat('yyyy-MM-dd');
  String? get  fromDate => format.format(selectedFromDate.value) ?? "";
  String? get  toDate => format.format(selectedToDate.value) ?? "";

  List<bool> _isSelectedList = [];
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
    _riderAttendenceList.clear();
    _changePaginationFilter(1, 10);
    ever(_paginationFilter, (_) => getRiderAttendence(fromDate, toDate));
    update();
  }

  // /// ------------>>>>>>>>>>> Get Rider Attendence <<<<<<<<<<<<------------

  List<RiderAttendenceData> _riderAttendenceList = <RiderAttendenceData>[].obs;
  List<RiderAttendenceData> get riderAttendenceList => _riderAttendenceList;

  Future<ResponseModel> getRiderAttendence(String? fromDate, String? toDate) async {
    Response apiResponse = await riderAttendenceRepo.riderAttendenceList(fromDate, toDate);
    ResponseModel responseModel;
    if(apiResponse.statusCode == 200){
      RiderAttendenceModel riderAttendenceModel = RiderAttendenceModel.fromJson(apiResponse.body);
      riderAttendenceModel.data.forEach((element) {
        _riderAttendenceList.add(element);
      });
      if(riderAttendenceModel.meta.currentPage == riderAttendenceModel.meta.lastPage){
        _lastPage = true;
      }
      responseModel = ResponseModel(true, "Success");
    } else{
      responseModel = ResponseModel(false, "Failed");
    }
    update();
    return responseModel;
  }

  // var parts = _riderAttendenceList.sublist(start)

  /// ----------->>>>>>>>>>>> Init State Check <<<<<<<<<-------------
  onInit(){
    ever(_paginationFilter, (_) => getRiderAttendence(fromDate, toDate));
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

  void loadNextPage(){
    ever(_paginationFilter, (_) => getRiderAttendence(fromDate, toDate));
    _changePaginationFilter(page + 1, limit);
  }

}

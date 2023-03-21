import 'package:get/get.dart';
import 'package:merchant/data/model/request/rider%20repository/check_repo.dart';

import '../../model/response/rider model/check_box_state.dart';

class CheckController extends GetxController{
  CheckRepo checkRepo;

  CheckController({required this.checkRepo});

  List<CheckModel> _checkList = [];
  List<CheckModel> get checkList => _checkList;



  List<bool> _isSelectedList = [];
  List<bool> get isSelectedList => _isSelectedList;

  double _amout = 0.0;
  double get amount => _amout;

  List<int> _selectedIdList = [];
  List<int> get selectedIdList => _selectedIdList;


  bool _isSelectAll = true;
  bool get isSelectedAll => _isSelectAll;

  void getCartData(){
    _checkList = [];
    _checkList.addAll(checkRepo.getCheckList());
  }

  void addToCheck(CheckModel checkModel){
    _checkList.add(checkModel);
    _isSelectedList.add(true);
    // checkRepo.addToCheeckList(_checkList);
    _amout = _amout + checkModel.accountOrderData!.amount;
    update();

  }

  void removeFromCheck(CheckModel check){
    // if(_isSelectedList[index]){
    //   _amout = _amout - (_checkList[index].accountOrderData!.amount * _checkList[index].quantity);
    // }
    // _checkList.removeAt(index);
    // _isSelectedList.removeAt(index);
    // checkRepo.addToCheeckList(_checkList);
    // update();
    _checkList.removeWhere((item) => item.accountOrderData!.id == check.accountOrderData!.id);
    _amout = _amout - check.accountOrderData!.amount;
    update();
  }

  bool isCheck(CheckModel check){
    return _checkList.any((item) => item.accountOrderData!.id == check.accountOrderData!.id);
  }

  void removeCheckBoxItem(List<CheckModel> checks){
    checks.forEach((check) {
      _amout = _amout - (check.accountOrderData!.amount * check.quantity);
      _checkList.removeWhere((checkModel) => checkModel.accountOrderData!.id == checkModel.accountOrderData!.id);
      _isSelectedList.removeWhere((selected) => selected);
    });
    checkRepo.addToCheeckList(_checkList);
    update();
  }



}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_flutter/common/cv.dart';
import 'package:template_flutter/data_package/request/search_address_requ.dart';
import 'package:template_flutter/util/ui_helper.dart';

class Exam4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Exam4State();
  }
}

class Exam4State extends State<Exam4> {
  final bool _loading = false;
  final _searchText = TextEditingController();
  final _detailAddress = TextEditingController();
  final _scrollController = ScrollController();
  final _addressBloc = AddressBloc();
  List<Juso> _addressList = [];
  String? _keyword;
  String _errorMessage = "검색어를 입력하세요.";
  int? _page;

  cancelWidget() {
    if (_keyword == null || _keyword!.isEmpty) {
      return Container();
    }
    return GestureDetector(
      child: const Icon(
        Icons.cancel,
        color: Color(0xFFBFBFBF),
        size: 20,
      ),
      onTap: () => _searchText.clear(),
    );
  }

  addTextEditListener() {
    _searchText.addListener(() async {
      if (_keyword == _searchText.text) return;
      _keyword = _searchText.text;
      _page = 1;
      _addressBloc.fetchAddress(_keyword!, _page!);
    });
  }

  addAddressStreamListener() {
    _addressBloc.address.listen(
      (list) {
        _addressList = list;
        setState(() {});
      },
      onError: (error, stacktrace) {
        print("onError: $error");
        print(stacktrace.toString());

        if (error is AddressErrorModel == false) return;

        AddressErrorModel errorModel = error;
        if (_page == 1) _addressList = [];
        if (errorModel.error == -101) _page = -1;

        _errorMessage = errorModel.message;
        setState(() {});
      },
    );
  }

  addScrollListener() {
    _scrollController.addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  listView() {
    if (_addressList.isEmpty) {
      return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 15,
              color: const Color(0xFFEdEdEd),
            ),
            Expanded(
                child: Center(
              child: Text(_errorMessage),
            ))
          ],
        ),
      );
    }
    return ListView.builder(
      controller: _scrollController,
      itemCount: _addressList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0)
          return Container(height: 15, color: const Color(0xFFEdEdEd));
        if (index == _addressList.length) addAddressList();

        final address = _addressList[index - 1];
        return Column(
          children: [
            listItem(address),
            Container(height: 1, color: const Color(0xFFEdEdEd)),
          ],
        );
      },
    );
  }

  listItem(Juso address) {
    final roadLast = address.buldSlno == '0' ? '' : '-' + address.buldSlno!;
    final rodaTitle = '${address.rn} ${address.buldMnnm}$roadLast';
    final title = address.bdNm!.isEmpty ? rodaTitle : address.bdNm;

    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: InkWell(
        onTap: () async {
          context.read<CV>().searchedAddress = address.roadAddr!;
          print(context.read<CV>().searchedAddress);
          var dialogWidth = MediaQuery.of(context).size.width * 0.6;
          var dialogHeight = MediaQuery.of(context).size.height * 0.4;
          print('width : $dialogWidth');
          print('height : $dialogHeight');
          UIH().cDis.dialog(
                context,
                dialogWidth,
                dialogHeight,
                inBody: Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child:
                      UIH().cTex.text(context.read<CV>().searchedAddress, 15),
                ),
              );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              address.jibunAddr!,
              style: const TextStyle(color: Color(0xFFA8A8A8)),
            ),
            Text(
              '[도로명] ' + address.roadAddr!,
              style: const TextStyle(color: Color(0xFFA8A8A8)),
            ),
          ],
        ),
      ),
    );
  }

  addAddressList() {
    if (_page == -1) return;
    _page = _page! + 1;
    _addressBloc.fetchAddress(_keyword!, _page!);
  }

  @override
  void initState() {
    super.initState();
    context.read<CV>().searchedAddress = '';
    context.read<CV>().searchedDetailAddress = '';
    context.read<CV>().searchedLat = 0;
    context.read<CV>().searchedLng = 0;
    addAddressStreamListener();
    addScrollListener();
    addTextEditListener();
  }

  @override
  void dispose() {
    _addressBloc.dispose();
    _detailAddress.dispose();
    _searchText.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        if (_loading) return Future.value(false);
        Navigator.pop(context, false);
        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              UIH().cDis.divider_H(10.0),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 50,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: _searchText,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "주소 입력",
                            hintStyle: TextStyle(color: Color(0xFFA0A0A0)),
                          ),
                        ),
                      ),
                    ),
                    cancelWidget(),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              Expanded(
                flex: 25,
                child: _loading
                    ? const Center(child: Text('로딩 중...'))
                    : listView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:softbenz/model/app_models/user_model.dart';
import 'package:softbenz/model/app_repository/base_repo.dart';

class BasePageProvider extends ChangeNotifier {
  final List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSOTYWgxPXreV9kemXRCko4SsUqJUpIz7zHg&s',
    'https://m.media-amazon.com/images/I/61nqgl4atFL._AC_SL1500_.jpg',
    'https://m.media-amazon.com/images/I/61qJX973fRL._AC_SL1500_.jpg',
    'https://images.samsung.com/is/image/samsung/assets/in/explore/brand/5-best-android-mobile-phones-2022-in-india/banner-mobile-720x761-080422.jpg',
  ];

  final BaseRepo _baseRepo = BaseRepo();
  List<UserModelMeta?> homeModel = [];
  List<UserModelMeta> homeList = [];
  Future<UserModelMeta?>? homeFuture;

  String? errorOfHome;

  // Future<void> initHomeFuture({bool showNotify = true}) async {
  //   homeFuture = fetchHomeList();

  //   if (showNotify) {
  //     notifyListeners();
  //   }
  // }

  List<Specification>? specification;
  List<VariantDetail>? variantDetails;
  List<PhoneImages>? phoneimages;
  List<DataVariant>? variants;

  VendorDetail? vendorDetail;

  Data? homedata;

  Future<Data?> fetchHomeList() async {
    final response = await _baseRepo.getHomeDatas();

    response.fold((l) => errorOfHome = l, (r) => homedata = r);
    notifyListeners();

    if (homedata != null) {
      specification = homedata?.specification;
      variantDetails = homedata?.variantDetails;
      phoneimages = homedata?.image;
      variants = homedata?.variants;
    }
    notifyListeners();
    return homedata;
  }
}

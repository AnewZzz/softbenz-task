import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:softbenz/view/conponents/html_helper.dart';
import 'package:softbenz/view_model/providers/basepage_provider.dart';
import 'package:softbenz/view_model/utils/export_utls.dart';
import '../features/home_widgets/export_widgets.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  static const String routeName = "/basepage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const BasePage());
  }

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int carouselIndex = 0;

  late Future<void> _initializeFuture;

  @override
  void initState() {
    super.initState();
    _initializeFuture = _initialize();
  }

  Future<void> _initialize() async {
    await Provider.of<BasePageProvider>(context, listen: false).fetchHomeList();
  }

  double calculateDiscount(double strikePrice, double price) {
    if (strikePrice == 0) return 0;
    return ((strikePrice - price) / strikePrice) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BasePageProvider>(builder: (context, baseProv, child) {
      print(baseProv.variantDetails?.length);
      double? strikePrice = baseProv.homedata?.strikePrice?.toDouble();
      double? price = baseProv.homedata?.price?.toDouble();

      double? discountPercentage;
      if (strikePrice != null && price != null && strikePrice > price) {
        discountPercentage = ((strikePrice - price) / strikePrice) * 100;
      }
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary1,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.white,
              )),
        ),
        body: Consumer<BasePageProvider>(
          builder: (context, baseProv, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: sizewidth(context),
                    child: CarouselWidget(
                      imagesList: baseProv.imageUrls,
                      input: carouselIndex,
                      aspectRatio: 1,
                      autoPlay: true,
                      fit: BoxFit.cover,
                      onPageChanged: (index, reason) {
                        setState(() {
                          carouselIndex = index;
                        });
                      },
                      viewportFraction: 1,
                    ),
                  ),
                  Container(
                    width: sizewidth(context),
                    height: sizeHeight(context) * .08.h,
                    decoration: BoxDecoration(color: AppColor.primary),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizewidth(context) * .05.h,
                            vertical: sizeHeight(context) * 0.02),
                        child: Row(
                          children: [
                            const Text("Rs.",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontWeight: AppFontWeight.bold,
                                  fontSize: 14,
                                )),
                            Text(
                                baseProv.homedata?.strikePrice.toString() ?? "",
                                style: const TextStyle(
                                  color: AppColor.white,
                                  fontWeight: AppFontWeight.bold,
                                  fontSize: 18,
                                )),
                            SizedBox(
                              width: sizewidth(context) * 0.03.w,
                            ),
                            Text(
                              baseProv.homedata?.price.toString() ?? "",
                              style: const TextStyle(
                                  color: AppColor.white,
                                  fontWeight: AppFontWeight.regular,
                                  fontSize: 14,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(
                              width: sizewidth(context) * 0.03.w,
                            ),
                            DisctountPercentageWidget(
                              discountPercentage: discountPercentage,
                              discount: discountPercentage ?? 0,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: sizeHeight(context) * 0.01,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: sizeHeight(context) * .005,
                          horizontal: sizewidth(context) * .05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //NAME WIDGETS
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                baseProv.homedata?.name ?? "",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: AppFontWeight.bold),
                              ),
                              CircleAvatar(
                                backgroundColor: AppColor.primary,
                                radius: 20,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: AppColor.white,
                                  ),
                                ),
                              )
                            ],
                          ),

                          //RATING AND VIEW
                          RatingandReviewWidget(
                            view: baseProv.homedata?.viewCount.toString() ?? "",
                          ),
                          const DividerWidget(),

                          //VARIANTS

                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: baseProv.homedata?.variants?.length ?? 0,
                            itemBuilder: (context, index) {
                              final variants =
                                  baseProv.homedata?.variants?[index];

                              final typeName =
                                  variants?.type?.name ?? "Unknown Type";

                              final valueNames = variants?.values?.isNotEmpty ==
                                      true
                                  ? variants?.values
                                          ?.map((value) =>
                                              value?.value ?? "Unknown Value")
                                          .toList() ??
                                      []
                                  : ["Unknown Value"];

                              return VariantsWidgets(
                                typeName: typeName,
                                valueNames: valueNames,
                              );
                            },
                          ),

                          const DividerWidget(),

                          // VENDOR INFORMATION
                          VendorInformationWidget(
                            vendorName:
                                baseProv.homedata?.vendorDetail?.companyName ??
                                    "",
                            vendorLocation: baseProv
                                    .homedata?.vendorDetail?.companyAddress ??
                                "",
                            vendorPhone:
                                baseProv.homedata?.vendorDetail?.companyPhone ??
                                    "",
                          ),
                          SizedBox(
                            height: sizeHeight(context) * .01,
                          ),

                          //TAB CONTROLLER
                          DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                // Tab Bar
                                TabBar(
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  unselectedLabelStyle: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.darkGray.withOpacity(0.7),
                                      fontWeight: AppFontWeight.medium),
                                  labelStyle: const TextStyle(
                                      fontSize: 14,
                                      color: AppColor.black,
                                      fontWeight: AppFontWeight.semiBold),
                                  unselectedLabelColor: Colors.black54,
                                  dividerColor: AppColor.black.withOpacity(0.1),
                                  indicatorColor: AppColor.primary,
                                  labelColor: AppColor.primary,
                                  tabs: const [
                                    Tab(
                                      text: 'Description',
                                    ),
                                    Tab(text: 'Specification'),
                                    Tab(text: 'Review'),
                                  ],
                                ),

                                SizedBox(
                                  height: sizeHeight(context) * 0.7,
                                  child: TabBarView(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: sizeHeight(context) * .01,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Descriptions",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      AppFontWeight.semiBold),
                                            ),
                                            HtmlHelper().customSizesHtml(
                                              data: baseProv
                                                      .homedata?.description ??
                                                  "",
                                              color: AppColor.black
                                                  .withOpacity(0.7),
                                              fontStyle: FontStyle.normal,
                                              textAlign: TextAlign.start,
                                              margin: Margins.zero,
                                              padding: HtmlPaddings.zero,
                                              lineHeight: LineHeight(1.5),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Specification Tab Content
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: sizeHeight(context) * 0.01,
                                          ),
                                          const Text(
                                            "Specification",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight:
                                                    AppFontWeight.semiBold),
                                          ),
                                          SizedBox(
                                            height: sizeHeight(context) * 0.01,
                                          ),
                                          SizedBox(
                                            height: sizeHeight(context) * 0.2,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: baseProv
                                                      .specification?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                final spec = baseProv
                                                    .specification![index];
                                                return SpecificationWidgets(
                                                  type: spec.type ?? "",
                                                  value: spec.value ?? "",
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Reviews Tab Content
                                      ReviewtabWidgets(
                                        productImage: baseProv
                                                .homedata?.image?.first.path ??
                                            "",
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          //RELATED PRODUCT

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Related Product",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const DividerWidget(),
                              SizedBox(
                                height: sizeHeight(context) * 0.02,
                              ),
                              SizedBox(
                                height: 200.0,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      baseProv.variantDetails?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final variantDetails =
                                        baseProv.variantDetails?[index];
                                    return Container(
                                      width: 150.0,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: RelatedWidget(
                                        discount: discountPercentage ?? 0,
                                        productName:
                                            baseProv.homedata?.name ?? "",
                                        price: variantDetails?.price ?? 0,
                                        strikePrice:
                                            variantDetails?.strikePrice ?? 0,
                                        productImage:
                                            variantDetails?.image?.first.path ??
                                                "",
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),

                          const DividerWidget()
                        ],
                      )),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: const BottomNavWidget(),
      ));
    });
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.5,
      color: AppColor.darkGray.withOpacity(0.5),
    );
  }
}

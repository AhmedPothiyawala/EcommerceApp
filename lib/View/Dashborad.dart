import 'package:ecommerce_app/View/widgets/custome_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/ApiServices.dart';
import '../Controller/ExitController.dart';
import '../Custome_Functions/Colors/constants.dart';
import '../Models/TaskModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final exitConfirmationController = Get.put(ExitConfirmationController());
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  late final data;
  int length = 0;
  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitConfirmationController.showExitConfirmation(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          bottomNavigationBar: buildBottomAppBar(length),
          appBar: _scrollPosition == 0
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(200.0),
                  child: AppBar(
                    leading: IconButton(
                      onPressed: () =>
                          exitConfirmationController.showExitConfirmation(),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    actions: const [],
                    flexibleSpace: Image.asset(
                      'assets/images/homepage.png',
                      fit: BoxFit.fill,
                    ),
                  ))
              : AppBar(
                  title: const Text('Bhavani parlour'),
                  backgroundColor: AppColors.kPrimaryColor,
                ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 4,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search  *',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: AppColors.kPrimaryDarkColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _scrollPosition == 0 ? 352 : 496,
                child: Center(
                  child: Container(
                    child: FutureBuilder<DaoModel>(
                      future: ApiService().fetchDataFromApi(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot.data!;
                          length = snapshot.data!.product!.length;
                          return buildDataWidget(data, _scrollController);
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import '../../Custome_Functions/Colors/constants.dart';
import '../../Models/TaskModel.dart';

Widget buildDataWidget(DaoModel data, ScrollController _scrollController) {
  return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: data.product!.length,
      itemBuilder: (context, index) {
        return buildProductItem(data.product![index], data);
      });
}

Widget buildProductItem(Product product, DaoModel dataModel) {
  return Card(
    elevation: 2.0, // Adding elevation
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: const BorderSide(color: Colors.transparent, width: 1),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          '${dataModel.link}${product.prdImage}',
          height: 80,
        ),
        const SizedBox(height: 8),
        Text(
          product.prdShortname.toString(),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kPrimaryColor,
              ),
              child: IconButton(
                icon: const Icon(Icons.add),
                iconSize: 20.0,
                onPressed: () {},
                color: AppColors.kPrimaryLightColor, // Icon color
                splashRadius: 25.0,
                tooltip: 'Add',
                splashColor: AppColors.kPrimaryColor,
                highlightColor: AppColors.kPrimaryColor,
                padding: const EdgeInsets.all(10.0),
                constraints: const BoxConstraints(),
                alignment: Alignment.center,
                focusColor: AppColors.kPrimaryColor,
                hoverColor: AppColors.kPrimaryColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                '0',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kPrimaryColor,
              ),
              child: IconButton(
                icon: const Icon(Icons.remove),
                iconSize: 20.0,
                onPressed: () {},
                color: AppColors.kPrimaryLightColor,
                splashRadius: 25.0,
                tooltip: 'Remove',
                splashColor: AppColors.kPrimaryColor,
                highlightColor: AppColors.kPrimaryColor,
                padding: const EdgeInsets.all(10.0),
                constraints: const BoxConstraints(),
                alignment: Alignment.center,
                focusColor: AppColors.kPrimaryColor,
                hoverColor: AppColors.kPrimaryColor,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget buildBottomAppBar(int length) {
  return Container(
    height: 131,
    color: AppColors.kPrimaryColor,
    child: BottomAppBar(
      color: AppColors.kPrimaryColor,
      shape: const CircularNotchedRectangle(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Showing $length of $length',
                  style: const TextStyle(
                      color: AppColors.kPrimaryLightColor, fontSize: 18),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  'Filter',
                  style: TextStyle(
                      color: AppColors.kPrimaryLightColor, fontSize: 18),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.filter_list_outlined,
                  color: AppColors.kPrimaryLightColor,
                  size: 30,
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.kPrimaryLightColor,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: AppColors.kPrimaryLightColor,
                  size: 30,
                ),
                const Text(
                  '0',
                  style: TextStyle(
                      color: AppColors.kPrimaryLightColor, fontSize: 18),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  '₹ 0',
                  style: TextStyle(
                      color: AppColors.kPrimaryLightColor, fontSize: 18),
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kPrimaryLightColor,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    iconSize: 20.0,
                    onPressed: () {},
                    color: AppColors.kPrimaryColor,
                    splashRadius: 25.0,
                    tooltip: 'Next',
                    splashColor: AppColors.kPrimaryColor,
                    highlightColor: AppColors.kPrimaryColor,
                    padding: const EdgeInsets.all(10.0),
                    constraints: const BoxConstraints(),
                    alignment: Alignment.center,
                    focusColor: AppColors.kPrimaryColor,
                    hoverColor: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

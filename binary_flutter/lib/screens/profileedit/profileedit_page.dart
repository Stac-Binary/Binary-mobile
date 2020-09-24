import 'package:binary_flutter/components/dog_manage_item.dart';
import 'package:binary_flutter/components/profile_edit_item.dart';
import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/provider/dog_provider.dart';
import 'package:binary_flutter/provider/login_provider.dart';
import 'package:binary_flutter/screens/dogs/second_screen/dog_register_second.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: kLightBlack,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "프로필 수정",
          style: kNanumLight.copyWith(fontSize: 20, color: kLightBlack),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(25),
                vertical: getProportionateScreenHeight(15)),
            child: Text(
              "내 정보",
              style: kNanumBold.copyWith(fontSize: 24),
            ),
          ),
          ProfileEditItem(
            name: "박상아",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(25),
              vertical: getProportionateScreenHeight(15),
            ),
            child: Text(
              "내 강아지 관리",
              style: kNanumBold.copyWith(fontSize: 24),
            ),
          ),
          Consumer<DogProvider>(
            builder: (context, item, _) {
              return Expanded(
                child: ListView(
                  children: item.dogs
                      .map<Widget>((e) => DogManageItem(
                            dog: e,
                            dogName: e.dogName,
                            dogBreed: e.breed,
                            dogBlood: "DEA ${e.bloodType}",
                          ))
                      .toList()
                        ..add(
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(25),
                                vertical: getProportionateScreenHeight(10)),
                            child: Container(
                              height: getProportionateScreenHeight(100),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: kWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 0),
                                  )
                                ],
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 24.0,
                                    color: kLightBlack,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DogRegisterSecond(
                                            Provider.of<LoginProvider>(context)
                                                .model
                                                .data
                                                .id),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

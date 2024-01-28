import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_assets.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Data/Models/chat.dart';
import 'package:healthapp/Screens/chat/widgets/chat_message_widget.dart';
import 'package:healthapp/Widgets/custom_text_falid.dart';
import 'package:sizer/sizer.dart';

class ChatBotScreen extends StatelessWidget {
  ChatBotScreen({super.key});
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: chatModelList.length,
          itemBuilder: (context, index) {
            return ChatMessageWidget(
                message: chatModelList[index].message!,
                myMessage: chatModelList[index].myMessage!);
          },
          shrinkWrap: true,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: CustomTextField(
            controller: messageController,
            prefixIcon: IconButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                icon: Image(
                  image: const AssetImage(AppAssets.searchIcon),
                  color: AppColors.primaryColor,
                  width: 5.w,
                  height: 2.h,
                  fit: BoxFit.cover,
                )),
            textInputType: TextInputType.visiblePassword,
            fillColor: AppColors.blueLightColor,
            hintText: "What you want",
          ),
        ),
      ],
    );
  }
}

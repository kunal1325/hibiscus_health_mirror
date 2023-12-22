import '../../../../import.dart';

class PersonalDataView extends GetView<PersonalDataController> {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalDataController>(
      init: PersonalDataController(),
      builder: (controller) => ConnectivityCheckWidget(
          body: Scaffold(
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 46,
                      ),
                      Stack(
                        children: [
                          Utils.assetSVGImage(AppImages.FigureSvg,
                            width: 128,
                            height: 196,
                          ),
                          Utils.assetImage(AppImages.Figure,
                              width: 128,
                              height: 196,
                              boxFit: BoxFit.cover),
                        ],
                      ),
                      SizedBox(
                        height: 54,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Strings.physicalAttributes,
                            style: GoogleFonts.inter(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        Strings.physicalAttributesDescription,
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.kPrimaryColorText,
                            height: 1.3),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.disabled,
                        // key: controller.formKeySignIn,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: TextInputField(
                                    fillColor: false,
                                    hintText: Strings.heightFtHint,
                                    labelText: Strings.heightFt,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    focusNode: controller.heightFtFocusNode,
                                    requestFocusNode: controller.heightInFocusNode,
                                    controller: controller.heightFtController,
                                    validator: controller.isValidHeightFt,
                                    obscureText: false,
                                    suffixIcon: SizedBox(),
                                    prefixIcon: SizedBox(),
                                    onSaved: (value) => controller.heightFtController.text = value!,
                                  ),
                                  width: (Get.width/2) - 30,
                                ),
                                SizedBox(
                                  child: TextInputField(
                                    fillColor: false,
                                    hintText: Strings.heightInHint,
                                    labelText: Strings.heightIn,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    focusNode: controller.heightInFocusNode,
                                    requestFocusNode: controller.weightFocusNode,
                                    controller: controller.heightInController,
                                    validator: controller.isValidHeightFt,
                                    obscureText: false,
                                    suffixIcon: SizedBox(),
                                    prefixIcon: SizedBox(),
                                    onSaved: (value) => controller.heightInController.text = value!,
                                  ),
                                  width: (Get.width/2) - 30,
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            SizedBox(height: 30,),
                            TextInputField(
                              fillColor: false,
                              hintText: Strings.weightLbsHint,
                              labelText: Strings.weightLbs,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              focusNode: controller.weightFocusNode,
                              requestFocusNode: controller.weightFocusNode,
                              controller: controller.weightController,
                              validator: controller.isValidWeight,
                              obscureText: false,
                              suffixIcon: SizedBox(),
                              prefixIcon: SizedBox(),
                              onSaved: (value) => controller.weightController.text = value!,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
      )
    );
  }
}


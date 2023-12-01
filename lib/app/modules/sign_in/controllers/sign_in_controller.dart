
import '../../../../import.dart';

class SignInController extends GetxController {

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPinInVisible = true.obs;
  GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();
  var isLoading = false.obs;
  var errorMsg = Strings.emptyString.obs;
  final ApiHelper _apiHelper = Get.find();
  void changeVisibility () {
    isPinInVisible.value = !isPinInVisible.value;
  }
  String? isValidEmail(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyEmailError;
    } else if (!GetUtils.isEmail(text))
      return Strings.invalidEmailError;
    else
      return null;
  }
  String? isValidPassword(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyPasswordError;
    }
    final hasLetter = text.contains(RegExp(r'[a-zA-Z]'));
    final hasNumber = text.contains(RegExp(r'[0-9]'));
    if (!hasLetter || !hasNumber) {
      return Strings.invalidPasswordError;
    }
    if (text.length < 8) {
      return Strings.shortPasswordError;
    }
    return null;
  }
  void navigateToSignUp(){
    Get.off(SignUpView());
  }
  void navigateToForgotPassword(){
    print("Forgot Password");
    // Get.toNamed("/forgotPassword");
    Get.toNamed("/home");
  }
  navigateBack(){
    Get.offNamedUntil("/welcomeScreen", (route) => false);
  }
  navigateHome(){
    // Get.offNamedUntil("/startMyJourney", (route) => false);
    Get.toNamed("/startMyJourney");
  }


  Future<void> checkConnectivity() async {
    Utils.dismissKeyboard();
    isLoading.value = true;
    try {
      final isValid = formKeySignIn.currentState!.validate();
      if (!isValid) return;
      formKeySignIn.currentState!.save();
        var isConnected =
            await Utils.checkInternetConnectivity();
        if (isConnected) {
          errorMsg.value = Strings.emptyString;

          _apiHelper
              .login(
              LoginRequest(email: emailController.text, password: passwordController.text))
              .futureValue((value) {
            var userResponse = UserModel.fromJson(value);

            if(userResponse.status == 200 && userResponse.msg == "Login Success"){
              Storage.saveValue(Constants.accessToken, userResponse.token?.access);
              Storage.saveValue(Constants.refreshToken, userResponse.token?.refresh);
              Storage.saveValue(Constants.userId, userResponse.userID);
              Storage.saveValue(Constants.dietitianId, userResponse.dietitianID);

              navigateHome();
            }else{
              Utils.showSnackBarFun(Get.context, userResponse.msg ?? "Something Went Wrong !!!");
            }
          }, onError: (error) {
            print("Login Response Error $error");
          });

        } else {
          errorMsg.value = Strings.noConnection;
        }
    } catch (e) {
      print("===================>>>>>>>>>>>>>>> eeeeeeeeeeeeeeee");
      print(e);
    }
    isLoading.value = false;
  }


  @override
  void onInit() {
    // TODO: implement onInit
    Storage.removeValue(Constants.accessToken);
    Storage.removeValue(Constants.refreshToken);
    Storage.removeValue(Constants.userId);
    Storage.removeValue(Constants.dietitianId);
    super.onInit();
  }

}

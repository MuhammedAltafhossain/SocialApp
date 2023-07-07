import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_app/src/controllers/data_controllers/local_data_controller.dart';
import 'package:social_app/src/controllers/data_controllers/firebase_controller.dart';
import 'package:social_app/src/controllers/services/handle_error/error_handler.dart';
import 'package:social_app/src/controllers/services/user_message/snackbar.dart';
import 'package:social_app/src/models/app_classes/app_data_model.dart';
import 'package:social_app/src/models/app_classes/return_type_model.dart';
import 'package:social_app/src/models/pojo_classes/user_model.dart';

class DataController extends GetxController {
  final LocalDataController _localData = LocalDataController();
  final FirebaseController _firebase = FirebaseController();
  final RxBool isRequesting = false.obs;

  final Rx<UserModel?> user = Rxn();
  final Rx<AppDataModel> appData = Rx(AppDataModel());

  Future<void> initApp() async {
    await _localData.init();
    await _firebase.init();

    //* Initializing user data
    user.value = FirebaseAuth.instance.currentUser == null ? null : _localData.localData.value.user; // Make local user = null when firebase auth is not valid
    if (user.value == null) FirebaseAuth.instance.signOut(); // Sign out from firebase when local user = null
    await _readUserAuth();
    await _readUserStatus();

    //* Initializing app data
    appData.value = _localData.localData.value.appSetting;

    //* Listener for triggering local data change
    user.listen((_) => _localData.localData.value = _localData.localData.value.copyWith(user: user.value)); // for user
    appData.listen((_) => _localData.localData.value = _localData.localData.value.copyWith(appSetting: appData.value)); // for app setting

    //* Listener for FirebaseAuth
    FirebaseAuth.instance.userChanges().listen((_) async {
      print("-----------------------------------------------------------------------");
      if (FirebaseAuth.instance.currentUser == null) user.value = null;
      await _readUserStatus();
    });
  }

  //! Error handler ////////////////////////////////////////////////////////////
  Future<ReturnType<T>> _errorHandler<T>({bool showError = true, required Function function}) async {
    isRequesting.value = true;
    T? value;
    bool isValid = await ErrorHandler.errorHandler(
      showError: showError,
      function: () async => value = await function(),
    );
    isRequesting.value = false;
    return ReturnType<T>(value: value, isValid: isValid);
  }
  //! //////////////////////////////////////////////////////////////////////////

  Future<void> _readUserAuth() async => await _errorHandler(function: () async => await _firebase.readUserAuth());

  Future<void> _readUserStatus() async => await _errorHandler(
        showError: false,
        function: () async {
          if (FirebaseAuth.instance.currentUser == null) return;
          user.value = await _firebase.fetchUserData();
        },
      );

  //! Login Screen
  Future<bool> signIn({required String email, required String password}) async {
    ReturnType res = await _errorHandler(function: () async => _firebase.signIn(email, password));
    if (res.isValid) {
      showSnackBar(title: "Success", message: "Login Successful");
    }
    return res.isValid;
  }

  //! Signup Screen
  Future<bool> signup({required UserModel userModel, required String password}) async {
    ReturnType res = await _errorHandler<UserCredential>(function: () async => _firebase.signup(userModel, password));
    if (res.isValid) {
      showSnackBar(title: "Success", message: "Account has been created");
    }
    return res.isValid;
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}

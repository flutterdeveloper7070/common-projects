import 'package:commonsprojects/common_imports.dart';

void warningToast(String msg, Color color, {int? maxLine}) {
  BotToast.showNotification(
    // leading: (icons) => AppImageAsset(image: AssetsConstant.warning),
    title: (_) => Text(
      msg,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: (_) => Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        msg,
        style: const TextStyle(color: Colors.white, fontSize: 11.5,),
        maxLines: maxLine ?? 2,
      ),
    ),
    backgroundColor: color,
    borderRadius: 15.0,
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(seconds: 1),
  );
}

void successToast(String msg) {
  BotToast.showNotification(
    title: (_) => Text(
      msg,
      style: const TextStyle(
        color: Colors.white,
        fontSize:  11.5,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: Colors.green,
    borderRadius: 15.0,
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(seconds: 1),
  );
}

void errorToast(String msg) {
  BotToast.showNotification(
    // leading: (icons) => const Icon(Icons.close,color: Colors.red,),
    title: (_) => Text(
      msg,
      style: const TextStyle(
        color: AppColorConstants.appWhite,
        fontSize: 11.5,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: AppColorConstants.appRed,
    borderRadius: 15.0,
    duration: const Duration(seconds: 5),
    animationDuration: const Duration(seconds: 1),
  );
}
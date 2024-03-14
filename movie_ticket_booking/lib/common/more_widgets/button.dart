import 'package:flutter/material.dart';
import 'package:movie_ticket_booking/generated/colors.gen.dart';

class AppButton extends ElevatedButton {
  AppButton.widget({
    super.key,
    required Widget super.child,
    required VoidCallback onPressed,
    bool enable = true,
    Alignment alignment = Alignment.centerLeft,
  }) : super(
          onPressed: enable ? onPressed : null,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.zero,
            ),
            foregroundColor: MaterialStateProperty.all(
              Colors.white.withOpacity(0),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.white.withOpacity(0),
            ),
            overlayColor: MaterialStateProperty.all(
              UIColors.white.withOpacity(0.2),
            ),
            elevation: MaterialStateProperty.all(0),
            minimumSize: MaterialStateProperty.all(
              Size.zero,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: alignment,
          ),
        );

  AppButton.fill({
    super.key,
    required VoidCallback onPressed,
    String? title,
    bool isYellow = false,
    bool enable = true,
    EdgeInsets titlePadding = EdgeInsets.zero,
    double? width,
    Widget? titleWidget,
    bool hideKeyboardWhenClick = false,
  }) : super(
          onPressed: () {
            if (hideKeyboardWhenClick) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
            onPressed();
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.zero,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              enable
                  ? isYellow
                      ? UIColors.black
                      : UIColors.white
                  : isYellow
                      ? UIColors.black.withOpacity(0.4)
                      : UIColors.white.withOpacity(0.4),
            ),
            elevation: MaterialStateProperty.all(0),
            overlayColor: MaterialStateProperty.all(
              UIColors.white.withOpacity(0.2),
            ),
          ),
          child: Container(
            height: 54,
            width: width,
            padding: titlePadding,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: titleWidget ??
                  Text(
                    title ?? '',
                    style: TextStyle(color:  enable
                        ? isYellow
                            ? UIColors.black
                            : UIColors.white
                        : UIColors.white,),
                  ),
            ),
          ),
        );

  AppButton.outline({
    super.key,
    required VoidCallback onPressed,
    required String title,
    bool isYellow = false,
    bool enable = true,
    EdgeInsets titlePadding = EdgeInsets.zero,
  }) : super(
          onPressed: () => onPressed(),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.zero,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              UIColors.white,
            ),
            elevation: MaterialStateProperty.all(0),
            overlayColor: MaterialStateProperty.all(
              UIColors.black.withOpacity(0.4),
            ),
          ),
          child: Container(
            height: 54,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: UIColors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: titlePadding,
                child:Text(title, style: const TextStyle(fontSize: 14,),),
              ),
            ),
          ),
        );
}

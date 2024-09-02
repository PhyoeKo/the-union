import 'package:MultiCal/app/constant/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    Key? key,
    this.elevation,
    this.borderRadius,
    required this.title,
    required this.message,
    this.cancelButtonShow = false,
    this.onPressed,
  }) : super(key: key);
  final double? elevation;
  final double? borderRadius;
  final String title;
  final String message;
  final Function()? onPressed;
  final bool? cancelButtonShow;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.colorPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          Column(
            children: [
              // body
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Divider(),
          ),
          // footer
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              cancelButtonShow == true
                  ? TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    )
                  : const SizedBox(),
              TextButton(
                onPressed: onPressed ?? () => Navigator.of(context).pop(),
                child: const Text(
                  'Ok',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

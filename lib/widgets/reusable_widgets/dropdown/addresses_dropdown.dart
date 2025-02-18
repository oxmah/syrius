import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:zenon_syrius_wallet_flutter/utils/app_colors.dart';
import 'package:zenon_syrius_wallet_flutter/utils/global.dart';

class AddressesDropdown extends StatelessWidget {
  final Function(String?)? onChangedCallback;
  final String? _selectedSelfAddress;

  const AddressesDropdown(
    this._selectedSelfAddress,
    this.onChangedCallback, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _selectedSelfAddress!,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).inputDecorationTheme.fillColor,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              icon: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Icon(
                  SimpleLineIcons.arrow_down,
                  size: 10.0,
                  color: onChangedCallback != null
                      ? AppColors.znnColor
                      : AppColors.lightSecondary,
                ),
              ),
              value: _selectedSelfAddress,
              items: kDefaultAddressList.map(
                (String? value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      kAddressLabelMap[value]!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: _selectedSelfAddress == value
                                ? onChangedCallback != null
                                    ? AppColors.znnColor
                                    : AppColors.lightSecondary
                                : null,
                          ),
                    ),
                  );
                },
              ).toList(),
              onChanged: onChangedCallback,
            ),
          ),
        ),
      ),
    );
  }
}

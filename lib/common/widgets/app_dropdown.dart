import 'package:alexo_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProductConditionDropdown extends StatefulWidget {
  const ProductConditionDropdown({super.key});

  @override
  State<ProductConditionDropdown> createState() => _ProductConditionDropdownState();
}

class _ProductConditionDropdownState extends State<ProductConditionDropdown> {
  final List<String> _items = const ['New Product', 'Used Product'];
  String? _selected = 'Used Product';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: _selected,
        isExpanded: true,
        items: _items.map((item) {
          final bool isSelected = item == _selected;
          return DropdownMenuItem<String>(
            value: item,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: isSelected
                  ? BoxDecoration(
                color:  AppColors().primary,
                borderRadius: BorderRadius.circular(10),
              )
                  : null,
              child: Text(
                item,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: (value) => setState(() => _selected = value),

        buttonStyleData: ButtonStyleData(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          iconSize: 22,
          openMenuIcon: Icon(Icons.keyboard_arrow_up_rounded),
        ),

        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          maxHeight: 180,
          elevation: 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        menuItemStyleData: const MenuItemStyleData(
          height: 42,
          padding: EdgeInsets.symmetric(horizontal: 4),
        ),

        selectedItemBuilder: (context) => _items
            .map((e) => Align(
          alignment: Alignment.centerLeft,
          child: Text(
            e,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ))
            .toList(),
      ),
    );
  }
}

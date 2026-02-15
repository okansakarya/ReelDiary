import 'package:flutter/material.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/filter_card_widget.dart';
import 'package:movieapp/utils/screen_utils.dart';

class FilterListview extends StatefulWidget {
  const FilterListview({
    required this.filterDisplayLabels,
    required this.filterValues,
    required this.selectedFilterNotifier,
    super.key,
  });

  final List<String> filterDisplayLabels;
  final List<String?> filterValues;
  final ValueNotifier<String?> selectedFilterNotifier;

  @override
  State<FilterListview> createState() => _FilterListviewState();
}

class _FilterListviewState extends State<FilterListview> {
  late String? _selectedFilterValue;

  @override
  void initState() {
    super.initState();
    _selectedFilterValue = widget.selectedFilterNotifier.value;
    widget.selectedFilterNotifier.addListener(_syncFromNotifier);
  }

  @override
  void dispose() {
    widget.selectedFilterNotifier.removeListener(_syncFromNotifier);
    super.dispose();
  }

  void _syncFromNotifier() {
    setState(() {
      _selectedFilterValue = widget.selectedFilterNotifier.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = ScreenUtils.getHorizontalPadding(context);
    final gap = horizontalPadding * 0.4;

    return SizedBox(
      height: ScreenUtils.getScreenHeight(context) * 0.06,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filterDisplayLabels.length,
        itemBuilder: (context, index) {
          final displayLabel = widget.filterDisplayLabels[index];
          final filterValue = widget.filterValues[index];
          final isSelected = _selectedFilterValue == filterValue ||
              (_selectedFilterValue == null && filterValue == null);

          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? horizontalPadding : gap,
              right: index == widget.filterDisplayLabels.length - 1
                  ? horizontalPadding
                  : 0,
            ),
            child: SizedBox(
              width: 100,
              child: FilterCardWidget(
                text: displayLabel,
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    _selectedFilterValue = filterValue;
                  });
                  widget.selectedFilterNotifier.value = filterValue;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

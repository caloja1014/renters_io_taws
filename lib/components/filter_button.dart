import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterButton extends StatefulWidget {
  final String text;

  const FilterButton({super.key, required this.text});

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool _isFilterOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFilterOpen = !_isFilterOpen;
        });
        if (_isFilterOpen) {
          _showFilterPopup(context);
        } else {
          Navigator.of(context).pop();
        }
      },
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/filter.svg',
                colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 8.0),
              Text(
                widget.text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Lato',
                )
              ),
              Icon(_isFilterOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aplicar filtros'),
          content: const Text('Elige los filtros'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _isFilterOpen = false;
                });
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}




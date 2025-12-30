import 'package:flutter/material.dart';
import '../../theme/spacing.dart';
import '../widgets/section_header.dart';
import '../widgets/component_showcase.dart';
import '../../widgets/app_dropdown.dart';
import '../../widgets/app_calendar.dart';

class FormsSection extends StatefulWidget {
  const FormsSection({super.key});

  @override
  State<FormsSection> createState() => _FormsSectionState();
}

class _FormsSectionState extends State<FormsSection> {
  bool _checkboxValue = false;
  bool _switchValue = false;
  String? _selectedDropdownValue;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Forms',
          subtitle: 'Text inputs, checkboxes, switches, and form controls.',
        ),

        ComponentShowcase(
          title: 'Text Input Field',
          description: 'Default, focused, error, and disabled states',
          specs: {
            'Height': '56dp',
            'Border Radius': '12px',
            'Focus Border': 'Sage 600, 2px',
          },
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Label',
                hintText: 'Placeholder text',
              ),
            ),
            SizedBox(height: AppSpacing.stackMd),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Error State',
                hintText: 'Invalid input',
                errorText: 'This field is required',
              ),
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Checkbox',
          description: 'Unchecked, checked, and disabled states',
          children: [
            CheckboxListTile(
              value: _checkboxValue,
              onChanged: (value) => setState(() => _checkboxValue = value ?? false),
              title: const Text('Checkbox option'),
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Switch',
          description: 'Toggle between on and off states',
          children: [
            SwitchListTile(
              value: _switchValue,
              onChanged: (value) => setState(() => _switchValue = value),
              title: const Text('Enable feature'),
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Dropdown',
          description: 'Dropdown menus with 16px radius, flat design',
          children: [
            AppDropdown<String>(
              label: 'Select Option',
              value: _selectedDropdownValue,
              items: const [
                AppDropdownItem(value: 'option1', label: 'Option 1', icon: Icons.star),
                AppDropdownItem(value: 'option2', label: 'Option 2', icon: Icons.favorite),
                AppDropdownItem(value: 'option3', label: 'Option 3', icon: Icons.settings),
              ],
              onChanged: (value) => setState(() => _selectedDropdownValue = value),
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Date Picker',
          description: 'Date and date range pickers with 16px radius',
          children: [
            AppDatePickerField(
              label: 'Select Date',
              selectedDate: _selectedDate,
              onDateSelected: (date) => setState(() => _selectedDate = date),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.stackXl),
      ],
    );
  }
}

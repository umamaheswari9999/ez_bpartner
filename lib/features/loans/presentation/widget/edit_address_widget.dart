import 'package:ez_flutter/features/loans/domain/entity/customer_address.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_location.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class EditAddressWidget extends StatefulWidget {
  final List<CustomerLocation> locations;
  final String? defaultLocationId;
  const EditAddressWidget({Key? key, required this.locations, required this.defaultLocationId})
      : super(key: key);

  @override
  State<EditAddressWidget> createState() => _EditAddressWidgetState();
}

class _EditAddressWidgetState extends State<EditAddressWidget> {
  CustomerLocation? _selectedLocation;
  @override
  void initState() {
    super.initState();
    final matchedlocations = widget.locations.where((e) => e.currentAddress?.id == widget.defaultLocationId).toList();
    if(matchedlocations.isNotEmpty) {
      _selectedLocation = matchedlocations.first;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(FeatherIcons.arrowLeftCircle, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(_selectedLocation),
        ),
        title: Text(
          'Edit Address',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(4),
        shrinkWrap: true,
        itemCount: widget.locations.length,
        itemBuilder: (c, index) {
          final location = widget.locations[index];
          return InkWell(
            onTap: () {
              setState(() {
                _selectedLocation = location;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 10,
                  child: _selectedLocation == location
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        )
                      : null,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      children: [
                        formatAddressToString(
                            location.permanentAddress!, 'Permanent Address'),
                        const Divider(color: Colors.black),
                        formatAddressToString(
                            location.currentAddress!, 'Current Address'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget formatAddressToString(CustomerAddress addres, String title) {
    final textStyle =
        Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black);
    final addLine1 = addres.addressLine1;
    final addLine2 = addres.addressLine2;
    final city = addres.cityName;
    final state = addres.stateName;
    final country = addres.countryName;
    final postal = addres.postalCode;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                '$addLine1, $addLine2',
                style: textStyle,
              ),
              const SizedBox(height: 2),
              Text(
                '$state, $country',
                style: textStyle,
              ),
              const SizedBox(height: 2),
              Text(
                '$city, $postal',
                style: textStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/create_tag/views/create_tag.dart';
import 'package:abiola_along_client_app/src/features/create_tag/widgets/image_field.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/app_textfield.dart';
import '../../../widgets/custom_drop_down.dart';
import '../../auth/widgets/field_heading.dart';

class AddTag extends ConsumerStatefulWidget {
  const AddTag.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "/add_tag";
  static const name = "add_tag";

  @override
  ConsumerState createState() => _AddTagState();
}

class _AddTagState extends ConsumerState<AddTag> {
  final TextEditingController _tagNameController = TextEditingController();
  final TextEditingController _dimensionController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _packageSizeNameController =
      TextEditingController();
  final TextEditingController _deliveryTimeController = TextEditingController();
  final TextEditingController _senderPointController = TextEditingController();
  final TextEditingController _receiverPointController =
      TextEditingController();

  String nameOfImage = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(
        title: "Create Tag",
        isHome: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FieldHeading(
              text: "Tag Name",
            ),
            AppTextField(
              textEditingController: _tagNameController,
              hint: "Tag e.g Bicycle, chair,etc",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
            ),
            const FieldHeading(
              text: "Dimension",
            ),
            AppTextField(
              textEditingController: _dimensionController,
              hint: "Width X Height",
              keyboardType: const TextInputType.numberWithOptions(),
              textInputAction: TextInputAction.go,
            ),
            const FieldHeading(
              text: "Notes",
            ),
            AppTextField(
              textEditingController: _notesController,
              hint: "Food, Wooden,etc",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
            ),
            const FieldHeading(
              text: "Package Size",
            ),
            AppTextField(
              textEditingController: _packageSizeNameController,
              hint: "Less Than 1kg",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
            ),
            const FieldHeading(
              text: "Delivery Time",
            ),
            CustomDropdown(
              validator: (value) {
                if (value == null) {
                  return 'Delivery time is required.';
                }
                return null;
              },
              hint: 'Select Delivery Time',
              dynamicValues: DeliveryTime.values,
              builder: (v) => v.name,
              // onSaved: stateNotifier.changeEmployment,
              // onChanged: stateNotifier.changeEmployment,
              // value: state.request.employmentType,
            ),
            const FieldHeading(
              text: "Sender Point",
            ),
            AppTextField(
              suffixIcon: SvgPicture.asset(
                AppAssets.locationGreyIcon,
                fit: BoxFit.scaleDown,
              ),
              textEditingController: _senderPointController,
              hint: "Enter location",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
            ),
            const FieldHeading(
              text: "Receiver Point",
            ),
            AppTextField(
              suffixIcon: SvgPicture.asset(
                AppAssets.locationGreyIcon,
                fit: BoxFit.scaleDown,
              ),
              textEditingController: _receiverPointController,
              hint: "Enter location",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
            ),
            const FieldHeading(
              text: "Image",
            ),
            ImageFieldCreateTag(
              onImageSelect: (file) {
                nameOfImage = file.path;
              },
              packageImage: nameOfImage,
            ),
            50.heightBox,
            AppButton(
              isLoading: isLoading,
              onPressed: () {
                context.pushNamed(CreateTag.name);
              },
              text: "Proceed",
            ),
          ],
        ),
      ),
    );
  }
}

enum DeliveryTime {
  urgent('Urgent'),
  threeDays('3 Days');

  const DeliveryTime(this.name);

  final String name;
}

import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/profile/widgets/profile_picture_widget.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/app_textfield.dart';
import '../../../widgets/primary_button.dart';
import '../../auth/widgets/field_heading.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = 'edit-profile';
  static const name = 'editProfile';

  @override
  ConsumerState createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  String nameOfImage = '';

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _vehicleModelController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _vehicleModelController.dispose();
    _licenseController.dispose();
    _locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(localDataProvider).getUserType;
    bool isDriver = _.contains('driver');
    print("isDriver on edit profile: $isDriver");
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(title: "Edit Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePictureWidget(
              onImageSelect: (file) {
                nameOfImage = file.path;
              },
              // profileImage: value?.profilePicture,
            ),
            30.heightBox,
            const FieldHeading(
              text: "Full Name",
            ),
            AppTextField(
              textEditingController: _fullNameController,
              hint: "Brooklyn Simmons",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.go,
            ),
            const FieldHeading(
              text: "Email",
            ),
            AppTextField(
              textEditingController: _emailController,
              hint: "Email Address",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
            ),
            const FieldHeading(text: "Phone"),
            AppTextField(
              textEditingController: _phoneController,
              hint: "Phone Number",
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              textInputAction: TextInputAction.go,
            ),
            const FieldHeading(
              text: "Location",
            ),
            AppTextField(
              textEditingController: _locationController,
              hint: "Washington DC, USA",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
            ),
            if (isDriver) ...[
              const FieldHeading(text: "Vehicle Model"),
              AppTextField(
                textEditingController: _vehicleModelController,
                hint: "Model Name",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
              ),
              const FieldHeading(text: "License"),
              AppTextField(
                textEditingController: _licenseController,
                hint: "License Plate Number",
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textInputAction: TextInputAction.go,
              ),
            ],
            50.heightBox,
            AppButton(
                isLoading: false, onPressed: () {}, text: "Update Profile"),
          ],
        ),
      ),
    );
  }
}

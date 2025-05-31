import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../bloc/Profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late ProfileCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ProfileCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        body: ProfileScreen(),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<bool> _isSelectedTab = [true, false]; // Profile, Settings

  // Controllers for TextFormFields
  final _fullNameController = TextEditingController(text: 'John Doe');
  final _emailController = TextEditingController(text: 'john.doe@example.com');
  final _phoneController = TextEditingController(text: '+1 (555) 123-4567');
  final _bioController = TextEditingController(text: 'Product Manager with 5+ years of experience. Love organizing team events and activities.');

  String? _selectedTimezone = 'Eastern Time (ET)';
  final List<String> _timezones = [
    'Eastern Time (ET)',
    'Central Time (CT)',
    'Mountain Time (MT)',
    'Pacific Time (PT)',
    'GMT (Greenwich Mean Time)',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Widget _buildProfileAvatar() {
    const double avatarRadius = 40.0;
    const double indicatorSize = 15.0; // Size of the green dot container
    const double indicatorBorderSize = 2.5; // White border thickness

    return Stack(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundImage: const NetworkImage('https://randomuser.me/api/portraits/men/75.jpg'), // Placeholder
          backgroundColor: Colors.grey[300],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: indicatorSize + indicatorBorderSize * 2,
            height: indicatorSize + indicatorBorderSize * 2,
            decoration: BoxDecoration(
              color: Colors.white, // White border
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: indicatorSize,
                height: indicatorSize,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? currentValue,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: currentValue,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87)),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: const InputDecoration(), // Uses global theme
          icon: Icon(Icons.unfold_more_rounded, color: Colors.grey[600]),
        ),
        const SizedBox(height: 16),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screen Title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),

              // Avatar and User Info - Centered
              Center(
                child: Column(
                  children: [
                    _buildProfileAvatar(),
                    const SizedBox(height: 12),
                    Text(
                      _fullNameController.text, // Or fetch dynamically
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _emailController.text, // Or fetch dynamically
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Toggle Buttons: Profile / Settings
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Background for the unselected part
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ToggleButtons(
                  isSelected: _isSelectedTab,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _isSelectedTab.length; i++) {
                        _isSelectedTab[i] = i == index;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(8),
                  selectedColor: Colors.black87,
                  color: Colors.grey[700],
                  fillColor: Colors.white, // Background for selected button
                  splashColor: Theme.of(context).primaryColor.withOpacity(0.12),
                  hoverColor: Theme.of(context).primaryColor.withOpacity(0.04),
                  renderBorder: false,
                  constraints: BoxConstraints.expand(
                    height: 48, // Increased height for better touch target
                    width: (MediaQuery.of(context).size.width - 40 - 4) / 2, // Screen width - horizontal padding - internal spacing
                  ),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Profile', style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Settings', style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Conditional Content based on Tab
              if (_isSelectedTab[0]) _buildProfileForm(),
              if (_isSelectedTab[1]) _buildSettingsContent(),
              // Placeholder for settings
              SizedBox(height:kBottomNavigationBarHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileForm() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Update your personal details here',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            _buildTextField(
              label: 'Full Name',
              controller: _fullNameController,
            ),
            _buildTextField(
              label: 'Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            _buildTextField(
              label: 'Phone Number',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
            ),
            _buildDropdownField(
              label: 'Timezone',
              currentValue: _selectedTimezone,
              items: _timezones,
              onChanged: (newValue) {
                setState(() {
                  _selectedTimezone = newValue;
                });
              },
            ),
            _buildTextField(
              label: 'Bio',
              controller: _bioController,
              maxLines: 4, // Allow multiple lines for bio
              hintText: 'Tell us a bit about yourself...',
            ),
            const SizedBox(height: 16), // Space before button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle save changes
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Changes Saved (Not really!)')),
                  );
                },
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsContent() {
    // Placeholder for Settings UI
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            'Settings Content Goes Here',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
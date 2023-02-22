class ProfileSettings {
  ProfileSettings({
    required this.pushEnabled,
    required this.timezone,
  });

  final bool pushEnabled;
  final String timezone;

  factory ProfileSettings.from(Map setting) {
    return ProfileSettings(
      pushEnabled: setting['push_enabled'] ?? false,
      timezone: setting['timezone'] ?? '',
    );
  }
}

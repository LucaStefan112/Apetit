class ServerRoutes {
  static const String _baseUrl = "http://10.0.2.2:5000/";

  static const test = "${_baseUrl}test";

  // auth routes
  static const String register = "${_baseUrl}auth/register";
  static const String resendActivationCode = "${_baseUrl}auth/resend-activation-code";
  static const String activateAccount = "${_baseUrl}auth/activate-account";
  static const String login = "${_baseUrl}auth/login";
  static const String resetPassword = "${_baseUrl}auth/reset-password";
  static const String checkResetPasswordCode = "${_baseUrl}auth/check-reset-password-code";
  static const String changePassword = "${_baseUrl}auth/change-password";
  static const String logout = "${_baseUrl}auth/logout";

  // user routes
  static const String getPreferences = "${_baseUrl}user/preferences";
  static const String updatePreferences = "${_baseUrl}user/preferences";
  static const String getLikedRecipes = "${_baseUrl}user/liked-recipes";
  static const String getCookingHistory = "${_baseUrl}user/cooking-history";
  static const String getUserData = "${_baseUrl}user/data";
  static const String updateUserData = "${_baseUrl}user/data";

  // recipe routes
  static const String generateRecipe = "${_baseUrl}recipe/generate";
  static String likeRecipe (recipeId) { return "${_baseUrl}recipe/like/$recipeId"; }
  static String unlikeRecipe (recipeId) { return "${_baseUrl}recipe/unlike/$recipeId"; }
  static String cookRecipe (recipeId) { return "${_baseUrl}recipe/cook/$recipeId"; }
}
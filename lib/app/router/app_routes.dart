enum AppRoutes {
  home("/home"),
  chat("/chat"),
  onBoarding("/"),
  signIn("/signIn"),
  signUp("/signUp"),
  forgotPassword("/forgotPassword");

  final String route;

  const AppRoutes(this.route);

  static AppRoutes? fromRoute(String? route) {
    for (AppRoutes value in AppRoutes.values) {
      if (value.route == route) return value;
    }
    return null;
  }
}

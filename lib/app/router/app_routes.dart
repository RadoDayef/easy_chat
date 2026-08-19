enum AppRoutes {
  home("/home"),
  chat("/chat"),
  signIn("/signIn"),
  signUp("/signUp"),
  onBoarding("/onBoarding"),
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

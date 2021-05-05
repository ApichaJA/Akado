export default function ({ req, res, redirect, $auth, route }) {
  console.log(21)
  if (
    !$auth.loggedIn &&
    (route.name !== "login" || route.name !== "register")
  ) {
    return redirect("/login")
  } else if (
    $auth.loggedIn &&
    (route.name === "login" || route.name === "register")
  ) {
    return redirect("/control")
  }
}

export default async function ({ store, redirect, app }) {
  app.$auth.fetchUser()
  if (app.$auth.loggedIn) {
    await app.$auth.strategy.token.sync()
    return redirect({ name: 'account' })
  } else {
    return redirect('/login')
  }
}

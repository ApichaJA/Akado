export default async function ({ store, redirect }) {
  if (store.state.auth.loggedIn) {
    await this.$auth.strategy.token.sync()
    return redirect({ name: 'account' })
  } else {
    return redirect('/login')
  }
}

export default function ({ store, redirect}) {
  if (store.state.auth.loggedIn) {
    redirect({ name: 'control' })
  } else {
    redirect('/login')
  }
}

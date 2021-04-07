/* eslint-disable */
export const actions = {
  nuxtServerInit({ commit }, { app, error }) {
    const data = app.$http
      .$get('http://localhost:5000')
      .then((res) => {
        commit('hotels/setHotels', res)
      })
      .catch(e => error(e))

    return data
  },
}

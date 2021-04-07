export const actions = {
  async nuxtServerInit({ commit }, { app, error }) {
    try {
      const data = await app.$http.$get('localhost:5000')
      console.log(1)
      commit('hotels/setHotels', data)
    } catch (e) {
      error(e)
    }
  },
}

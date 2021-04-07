export const actions = {
  async nuxtServerInit({ commit }, { error }) {
    try {
      const data = await this.$http.$get('localhost:5000')
      await commit('hotels/setHotels', data)
    } catch (e) {
      error(e)
    }
  },
}

export default {
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: "Akado",
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      { hid: "description", name: "description", content: "" },
    ],
    link: [
      {
        rel: "icon",
        type: "image/x-icon",
        href: "/favicon.ico",
      },
      {
        rel: "preconnect",
        href: "https://fonts.gstatic.com",
      },
      {
        rel: "stylesheet",
        href:
          "https://fonts.googleapis.com/css2?family=Kanit:wght@100;200;300;400;500;600&family=Raleway:wght@100;200;300;400;500;600;700;800;900&display=swap",
      },
    ],
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    "./node_modules/@splidejs/splide/dist/css/themes/splide-skyblue.min.css",
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [{ src: "~/plugins/splide.client.js", mode: "client" }],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: false,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/eslint
    "@nuxtjs/eslint-module",
    // https://go.nuxtjs.dev/stylelint
    "@nuxtjs/stylelint-module",
    // https://go.nuxtjs.dev/tailwindcss
    "@nuxtjs/tailwindcss",
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    "@nuxtjs/axios",
    // https://go.nuxtjs.dev/pwa
    "@nuxtjs/pwa",
    // https://go.nuxtjs.dev/content
    "@nuxt/content",
    "@nuxt/http",
    "@nuxtjs/auth-next",
    ["nuxt-buefy", { css: true, materialDesignIcons: true }],
  ],

  auth: {
    redirect: {
      logout: "/?ref=loggedOut",
      home: "/",
      callback: "/account"
    },
    watchLoggedIn: true,
    localStorage: false,
    rewriteRedirects: true,
    fullPathRedirect: false,
    strategies: {
      local: {
        endpoints: {
          login: {
            url: "/connect/auth/login",
            method: "post",
          },
          logout: { url: "/connect/auth/logout", method: "get" },
          user: {
            url: "/connect/auth/callback",
            method: "get",
          },
        },
        token: {
          property: "accessToken",
          maxAge: 86400,
        },
        user: {
          property: 'userDetail',
          autoFetch: true
        },
      },
    },
  },

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {},

  // PWA module configuration: https://go.nuxtjs.dev/pwa
  pwa: {
    manifest: {
      lang: "en",
    },
  },

  serverMiddleware: [{ path: "/connect", handler: "@/server/index.js" }],

  // Content module configuration: https://go.nuxtjs.dev/config-content
  content: {},

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {},
}

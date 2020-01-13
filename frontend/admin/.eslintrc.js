module.exports = {
    "env": {
        "browser": true,
        "commonjs": true,
        "es6": true
    },
    "extends": ["vue", "standard", "plugin:vue/recommended"],
    "parserOptions": {
        "parser": "vue-eslint-parser",
        "parserOptions": {
          "parser": "babel-eslint",
          "ecmaVersion": 8,
          "sourceType": "module"
        },
        "ecmaFeatures": {
            "jsx": true
        },
        "sourceType": "module"
    },
    "rules": {
        "allowFirstLine": true,
        "linebreak-style": [0, "error", "windows"],
        "space-before-function-paren": 0,
        "indent": [
            "off",
            2
        ],
        "linebreak-style": [
            "error",
            "unix"
        ],
        "quotes": [
            "error",
            "single"
        ],
        "semi": ["off", "always"],
        "vue/max-attributes-per-line": ["error", {
          "singleline": 5,
          "multiline": {
            "max": 5,
            "allowFirstLine": true
          }
        }],
        "vue/html-self-closing": ["error", {
          "html": {
            "void": "always",
            "normal": "never",
            "component": "any"
          },
          "svg": "always",
          "math": "always"
        }]
    }
};
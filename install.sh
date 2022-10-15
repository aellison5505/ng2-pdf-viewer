#!/bin/sh

# cp -r . *TARGET*
# install.sh *NAME*
# add to package json
#   "packageManager": "yarn@3.2.0"
#   add pnpify before all ng  in scripts

#alias yarn='docker run -it --rm -v $(pwd):/usr/src/task/ -v /root:/root -w /usr/src/task node-build'
yarn set version berry
yarn init -2
rm ./package.json
rm .gitignore
rm .editorconfig
rm README.md
#yarn dlx --package @angular/cli ng new $1 --skip-install --directory=. --package-manager=yarn 
yarn dlx --package @angular/cli ng new $1 --skip-install --directory=. --package-manager=yarn --no-create-application
yarn install
yarn dlx --package @angular/cli ng generate library ngx-print-es --skip-install
yarn install
#yarn add @angular/pwa
#yarn add @angular/service-worker
#yarn unplug @angular/service-worker
yarn unplug @angular/cli
yarn unplug @angular/compiler-cli
yarn add --dev eslint prettier stylelint
yarn add -D @typescript-eslint/parser @typescript-eslint/eslint-plugin
yarn add -D eslint-plugin-import eslint-import-resolver-typescript
yarn plugin import typescript
yarn plugin import interactive-tools
yarn dlx @yarnpkg/sdks vscode
#yarn ng add @angular/pwa --project $1
yarn add @yarnpkg/pnpify
#yarn add @types/node@~16 -D

cat <<\EOF >> ".eslintrc.json"
{
  "root": true,
  "settings": {
    "import/resolver": {
      "typescript": {}
    }
  },
  "parser": "@typescript-eslint/parser",
  "plugins": [
    "@typescript-eslint",
    "import"
  ],
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:@typescript-eslint/recommended-requiring-type-checking"
  ]
}
EOF

cat <<\EOF >> ".gitignore"

#yarn
.yarn/*
!.yarn/patches
!.yarn/plugins
!.yarn/releases
!.yarn/sdks
!.yarn/versions

# Swap the comments on the following lines if you don't wish to use zero-installs
# Documentation here: https://yarnpkg.com/features/zero-installs
.yarn/cache
#.pnp.*
EOF

cat <<\EOF >> ".editorconfig"
root = true

[*]
end_of_line = lf
insert_final_newline = true

[*.{js,json,yml}]
charset = utf-8
indent_style = space
indent_size = 2
EOF


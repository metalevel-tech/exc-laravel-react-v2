# Laravel and React Full-stack App Exercise

This is an exercise project for the Laravel and React Full-stack App course of the [Laravel Bootcamp](https://bootcamp.laravel.com/). In addition I've decided to use TypeScript/TSX instead of JavaScript/JSX.

**Resources**

- [ ] Laravel: [Starter Kits](https://laravel.com/docs/10.x/starter-kits#breeze-and-inertia)
- [ ] Laravel: [Bootcamp](https://bootcamp.laravel.com/)
- [ ] Laravel: [Asset Bundling (**Vite**)](https://laravel.com/docs/10.x/vite)
- [ ] Inertia: [JavaScript apps the monolith way](https://inertiajs.com/)
- [ ] Axios: [Promise based HTTP client for the browser and node.js](https://axios-http.com/)
- [ ] Laracasts: [Learn Laravel Path](https://laracasts.com/path)

**See also**

- [Laravel Nova](https://nova.laravel.com/): Nova is a beautifully-designed administration panel for Laravel. Carefully crafted by the creators of Laravel, Nova is designed to make you the most productive developer in the galaxy.
- [Nova Dark Theme](https://github.com/David-Griffiths/Nova-Dark-Theme)

**Repositories of this project**

- [GitHub/metalevel-tech/exc-laravel-react-v2](https://github.com/metalevel-tech/exc-laravel-react-v2)
- [GitLab/metalevel-tech/exc-laravel-react-v2](https://gitlab.com/metalevel-tech/exc-laravel-react-v2)

**Todo**

- [x] Switch to TypeScript/TSX.
- [x] Install Dark theme.
- [ ] Setup Nginx as a reverse proxy for the Laravel app dev server.
- [ ] Migrate all the components from [JavaScript/JSX](resources/js) to [TypeScript/TSX](resources/ts).

## Initial Setup/Deployment

**0.** You need to have installed PHP, the necessary modules, Composer, NodeJs, etc. For reference see the [Deploy the dependencies](https://github.com/metalevel-tech/exc-laravel-react-v1#deploy-the-dependencies) section within the other Laravel+React exercise project of mine.

**1.** Crete a new Laravel project.

```bash
composer create-project laravel/laravel exc-laravel-react-v2
cd exc-laravel-react-v2
```

**2.** Use the SQL scripts provided within the [`assets/sql`](assets/) directory to create the database and tables. Then, update the [`.env`](.env) file with the database credentials.

**3.** Install the [React@Breeze](https://bootcamp.laravel.com/inertia/installation#installing-laravel-breeze) package.

```bash
composer require laravel/breeze --dev
```

```bash
php artisan breeze:install react
```

Or if you want to use the dark theme (this could be done later as well):

```bash
php artisan breeze:install react --dark
```

- Laravel Breeze: [Dark mode](https://laravel.com/docs/10.x/starter-kits#dark-mode)

You alco can require Inertia to be installed in Server Side Rendering mode -  Inertia SSR:

```bash
php artisan breeze:install react --ssr
```

- Laravel Breeze: [React / Vue](https://laravel.com/docs/10.x/starter-kits#server-side-rendering)
- Inertia: [Server-side Rendering (SSR)](https://inertiajs.com/server-side-rendering)

**4.** Modify the scripts section in the [`package.json`](exc-laravel-react-v2/package.json) file, according to your chosen development port and host.

**5.** Turn on the dev servers in two separate terminal windows.

- Laravel app

  ```bash
  php artisan serve
  ```

- React app via Vite's dev server

  ```bash
  npm run dev
  ```

Once the Vite's dev server is running, it automatically inject the changes into the browser and you can see them via the Laravel app. If it is not running you need to build the assets first. in order to see the changes in the browser.

```bash
npm run build
```

**6.** Install [`concurrently`](https://www.npmjs.com/package/concurrently) to run multiple commands concurrently. Then edit [`package.json`](exc-laravel-react-v2/package.json) and create a new script to run both the Laravel and React apps - name it `start`.

```bash
npm i concurrently --save-dev
```

```json
"scripts": {
  "start": "concurrently --kill-others \"npm run dev\" \"php artisan serve\"",
}
```

**7.** Setup a new GitHub as `origin` remote repository and GitLab as `upstream`, and then push the project to them.

```bash
git config --global user.name "Spas Z. Spasov"
git config --global user.email "spas.z.spasov@metalevel.tech"
git config --global init.defaultBranch "master"
```

```bash
git init
git remote add origin git@github.com:metalevel-tech/exc-laravel-react-v2.git
git add .
git branch -M master
git commit -m "Initial commit: Laravel&React/JS/JSX"
git push -u origin master
```

```bash
git remote add upstream git@gitlab.com:metalevel-tech/exc-laravel-react-v2.git
git push -u upstream --all
git push -u upstream --tags
```

```bash
git remote -v
git push --force origin master
git push --force upstream master
```

**8.** Migrate to TypeScript.

1. Install the necessary packages. And modify the `build` command in the [`package.json`](./package-lock.json) file.

    ```bash
    npm i --save-dev typescript @types/react @types/react-dom postcss-import
    ```

2. Rename [`jsconfig.json`](https://github.com/metalevel-tech/exc-laravel-react-v2/blob/JS/JSX/jsconfig.json) to [**`tsconfig.json`**](./tsconfig.json) and modify it accordingly.

    - Be aware of the paths, here we need to include the `resources/ts` directory as well, but not `src` as in the case of a pure Vite/React/TypeScript project.

3. Create [`tsconfig.node.json`](./tsconfig.node.json).

4. Rename [`vite.config.js`](https://github.com/metalevel-tech/exc-laravel-react-v2/blob/JS/JSX/vite.config.js) to [**`vite.config.ts`**](./vite.config.ts) and modify it accordingly.

5. Modify [`tailwind.config.js`](./tailwind.config.js) and [`postcss.config.js`](./postcss.config.js) accordingly.

6. Modify [`resources/views/app.blade.php`](./resources/views/app.blade.php)

7. Create the directory [`resources/ts`](./resources/ts) and inside create the following files:

    - [`vite-env.d.ts`](./resources/ts/vite-env.d.ts) - this is needed for the `import.meta.env` to work, see also [`tsconfig.json`](./tsconfig.json): `compilerOptions.types`;
    - [**`resources/ts/app.tsx`**](./resources/ts/app.tsx) on the base of [`resources/js/app.js`](./resources/js/app.js);
    - [`resources/ts/Pages/Welcome.tsx`](./resources/ts/Pages/Welcome.tsx).

The next steps are to convert the existing Laravel's React components to TypeScript.

References:

- Laravel Docs: [Asset Bundling (Vite) > **Working with JavaScript**](https://laravel.com/docs/10.x/vite#working-with-scripts)
- Laravel/vite-plugin GitHub: [TypeError: laravel is not a function #187](https://github.com/laravel/vite-plugin/issues/187#issuecomment-1355037204)
- Inertiajs/inertia GitHub: [Setup Inertia JS with Typescript #925](https://github.com/inertiajs/inertia/discussions/925)

## Deployment

```bash
OWNER="www-data"
```

```bash
sudo -u "$OWNER" composer install
sudo -u "$OWNER" php artisan migrate
sudo -u "$OWNER" php artisan key:generate --ansi
sudo -u "$OWNER" php artisan config:cache
```

```bash
sudo -u "$OWNER" npm install
sudo -u "$OWNER" npm run build
```

## References

- MLT: [Laravel and React Full-stack App Exercise v1](https://github.com/metalevel-tech/exc-laravel-react-v1)

- React Router Web Docs: [Scroll Restoration](https://v5.reactrouter.com/web/guides/scroll-restoration)
- NPM: [DOM to Image](https://www.npmjs.com/package/dom-to-image)
- Pluralsight: [Re-render a React Component on Window Resize](https://www.pluralsight.com/guides/re-render-react-component-on-window-resize)
- Pluralsight: [How to Show Components Conditionally in React](https://www.pluralsight.com/guides/how-to-show-components-conditionally-react)
- Free online web fonts: [Fingerprint icon](https://www.onlinewebfonts.com/icon/search?q=fingerprint)
- Font Awesome: [Fingerprint](https://fontawesome.com/icons/fingerprint)
- QR Code generator: [qr-code-generator.org](https://qr-code-generator.org/), [qrgenerator.org](https://qrgenerator.org/)
- **Stack Overflow: [Add a tooltip to a div](https://stackoverflow.com/a/25813336/6543935)**
- **Stack Overflow: [Anyway to prevent the Blue highlighting of elements in Chrome when clicking quickly?](https://stackoverflow.com/a/21003770/6543935)**
- Jigarius Blog: [Working with Git remotes and pushing to multiple Git repositories](https://jigarius.com/blog/multiple-git-remote-repositories)

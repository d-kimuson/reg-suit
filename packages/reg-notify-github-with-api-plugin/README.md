# reg-notify-github-with-api-plugin

reg-suit plugin to send notification the testing result to your GitHub repository.

**It's similar to [reg-notify-github-plugin](https://www.npmjs.com/package/reg-notify-github-plugin). While reg-notify-github-plugin uses GitHub App, this plugin uses GitHub API with personal access token.
We create this plugin for GitHub Enterprise user. reg-notify-github-plugin is strongly recommended if you use `github.com`.**

## Install

```sh
npm i reg-notify-github-with-api-plugin -D
reg-suit prepare -p notify-github-with-api
```

## Configure

```ts
{
  githubUrl?: string;
  owner: string;
  repository: string;
  privateToken: string;
  ref?: string;
  shortDescription?: boolean;
}
```

- `githubUrl` - _Optional_ - URL for your GitHub Enterprise. Default: `https://api.github.com/graphql`.
- `owner` - _Required_ - GitHub owner name.
- `repository` - _Required_ - GitHub repository name.
- `privateToken` - _Required_ Private access token. The `repo` scope is required if the repository is private.
- `ref` - _Optional_ Git branch ref value. If specified, this plugin searches PRs to comment using this value.
- `shortDescription` - _Optional_ Returns a small table with the item counts.
  Example:

  | 🔴 Changed | ⚪️ New | 🔵 Passing |
  | ---------- | ------- | ---------- |
  | 3          | 4       | 120        |

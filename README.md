## Git Repository Mirror

Universal repository mirroring tool.

### Syntax

```yml
name: "Git Repo Mirror"

on:
  - push

jobs:
  mirror:
    runs-on: ubuntu-latest
    name: "Mirror"
    steps:
      - uses: pkgstore/github-actions-sync@main
        with:
          source: ${{ secrets.MIRROR_SOURCE_URL }}
          target: ${{ secrets.MIRROR_TARGET_URL }}
          username: ${{ secrets.MIRROR_USER_NAME }}
          token: ${{ secrets.MIRROR_USER_TOKEN }}
```

GitHub secrets:

- `MIRROR_SOURCE_URL` - source repository URL.
- `MIRROR_TARGET_URL` - target repository URL.
- `MIRROR_USER_NAME` - user for target repository.
- `MIRROR_USER_TOKEN` - user token for target repository.

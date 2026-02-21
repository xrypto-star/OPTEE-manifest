# Repo manifest for OP-TEE development
This git contains repo manifests to be able to clone all source code needed to
be able to setup a full OP-TEE developer build.

All official OP-TEE documentation has moved to http://optee.readthedocs.io. The
information that used to be here in this git can be found under [manifests].

// OP-TEE core maintainers

[manifests]: https://optee.readthedocs.io/en/latest/building/gits/build.html#manifests

## Quick start for `default.xml`

To fetch all projects declared in `default.xml` and start a build, run:

```bash
./fetch_and_build_default.sh
```

By default this uses `.worktrees/default` under this repository as workspace.
You can pass another path as the first argument.

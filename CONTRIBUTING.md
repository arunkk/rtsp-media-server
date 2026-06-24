# Contributing to rtsp-media-server

Thanks for your interest in contributing! This is a small project, so the
process is lightweight.

## Reporting issues

Open a GitHub issue and include:

- What you expected to happen and what actually happened
- Steps to reproduce (the exact `make`/`docker` command and the RTSP URL)
- Your OS, Docker version, and — if relevant — the client (VLC, ffplay, …)
- Relevant logs (the container runs at `logLevel: debug` by default)

## Development setup

You need Docker, an RTSP client, and at least one `.mp4` file.

```bash
make docker      # build the image
make runlocal    # build + run, mounting ./videos
ffplay rtsp://localhost:8554/sample
make stoplocal   # stop
```

## Making changes

1. Fork the repo and create a branch off `main`.
2. Keep changes focused — one logical change per pull request.
3. Match the existing style (POSIX/Bash for scripts, the upstream YAML
   structure for config).
4. **Test your change end to end**: build the image, run it, and confirm a
   stream plays. There is no automated test suite, so manual verification is
   required.
5. If you change behavior, update [`README.md`](README.md) to match.

### Shell scripts

- Keep scripts `bash`-compatible and quote variable expansions.
- A quick lint pass with [`shellcheck`](https://www.shellcheck.net/) is
  appreciated:

  ```bash
  shellcheck *.sh
  ```

### Upgrading rtsp-simple-server / MediaMTX

The version is pinned in the [`Dockerfile`](Dockerfile). If you bump it, also
reconcile [`rtsp-simple-server.yml`](rtsp-simple-server.yml) with the new
release's config schema (the project is now
[MediaMTX](https://github.com/bluenviron/mediamtx)) and note the change in the
PR description.

## Pull requests

- Describe what changed and why.
- Confirm you tested it (see above).
- By contributing, you agree your contributions are licensed under the
  project's [Apache License 2.0](LICENSE).

## Code of conduct

Be respectful and constructive. Harassment or abuse of any kind is not
tolerated.

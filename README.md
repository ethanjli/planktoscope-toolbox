# planktoscope-toolbox

planktoscope-toolbox is an OCI image (automatically built on GitHub Actions) for Distrobox/Toolbx providing all dependencies necessary for developing the PlanktoScope software.

## How to use

### Instantiate

If you use distrobox:

    distrobox create -i ghcr.io/ethanjli/planktoscope-toolbox -n planktoscope
    distrobox enter planktoscope

If you use toolbx:

    toolbox create -i ghcr.io/ethanjli/planktoscope-toolbox -c planktoscope
    toolbox enter toolbox

### Set up developer tools

In your instance of `planktoscope-toolbox`, run:
```
python3 -m pip install --user pipx
python3 -m pipx ensurepath
pipx install poetry==1.7.1
```

### Develop the PlanktoScope documentation

In your instance of `planktoscope-toolbox`, navigate to a local copy of the PlanktoScope Git repository. Within the repository, navigate to the `documentation` directory. Then run the following command to install the various dependencies needed to develop the PlanktoScope documentation:

```
poetry install --no-root --with docs
```

Then follow the remaining usage instructions from the PlanktoScope Git repository's `documentation/README.md` file.

## Verification

These images are signed with Sigstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/ethanjli/planktoscope-toolbox

If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign (using `cosign generate-key-pair` with no password for the private key). The public key should be in your public repo (your users need it to check the signatures), and you should paste the private key in Settings -> Secrets -> Actions as a repository secret named `SIGNING_SECRET`.

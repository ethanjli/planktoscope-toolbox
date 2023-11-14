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

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/ethanjli/planktoscope-toolbox

If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.

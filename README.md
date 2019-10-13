# Operator-SDK Github Action

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

`builder`

**Optional** Tool to build OCI images. One of: [docker, podman, buildah] (default "docker")

`image`

**Required** The name of the docker image.

`tag`

**Optional** The tag of the docker image. Default `"latest"`.

## Outputs

`image`

Built image name

## Example usage

```yaml
uses: xunholy/operator-sdk-action
with:
    builder: docker
    image: ""
    tag: 1.0
```

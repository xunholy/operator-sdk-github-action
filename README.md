# Operator-SDK Github Action

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

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
    image: "example"
    tag: 1.0
```

## Limitation

Currently `--build-args` are not supported.

# List personal logins

Lists the personal logins of a series or event.

## Usage

``` r
list_personal_logins(api, password)
```

## Arguments

- api:

  Your Sportity API key. Avoid writing it in scripts; store it in the
  `SPORTITY_API` environment variable and use
  `Sys.getenv("SPORTITY_API")`.

- password:

  The password of the series or event.

## Value

A list with one element per login, as returned by the API.

## See also

Other event functions:
[`list_active_events()`](https://loprtq.github.io/sportity/dev/reference/list_active_events.md),
[`list_all_events()`](https://loprtq.github.io/sportity/dev/reference/list_all_events.md),
[`list_deleted_events()`](https://loprtq.github.io/sportity/dev/reference/list_deleted_events.md),
[`list_past_events()`](https://loprtq.github.io/sportity/dev/reference/list_past_events.md)

## Examples

``` r
if (FALSE) { # \dontrun{
list_personal_logins(
  api = Sys.getenv("SPORTITY_API"),
  password = "my_password"
)
} # }
```

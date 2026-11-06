# List all events

Lists all events of your account: active, past and deleted. Combines
[`list_active_events()`](https://loprtq.github.io/sportity/dev/reference/list_active_events.md),
[`list_past_events()`](https://loprtq.github.io/sportity/dev/reference/list_past_events.md)
and
[`list_deleted_events()`](https://loprtq.github.io/sportity/dev/reference/list_deleted_events.md).

## Usage

``` r
list_all_events(api)
```

## Arguments

- api:

  Your Sportity API key. Avoid writing it in scripts; store it in the
  `SPORTITY_API` environment variable and use
  `Sys.getenv("SPORTITY_API")`.

## Value

A data frame with one row per event and columns `event_id`, `name`,
`start_date`, `end_date`, `cover`, `place`, `timezone`, `serie_id` and
`password`.

## See also

Other event functions:
[`list_active_events()`](https://loprtq.github.io/sportity/dev/reference/list_active_events.md),
[`list_deleted_events()`](https://loprtq.github.io/sportity/dev/reference/list_deleted_events.md),
[`list_past_events()`](https://loprtq.github.io/sportity/dev/reference/list_past_events.md),
[`list_personal_logins()`](https://loprtq.github.io/sportity/dev/reference/list_personal_logins.md)

## Examples

``` r
if (FALSE) { # \dontrun{
list_all_events(api = Sys.getenv("SPORTITY_API"))
} # }
```

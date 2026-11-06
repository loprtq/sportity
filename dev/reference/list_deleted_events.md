# List deleted events

Lists the deleted events of your account.

## Usage

``` r
list_deleted_events(api)
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
[`list_all_events()`](https://loprtq.github.io/sportity/dev/reference/list_all_events.md),
[`list_past_events()`](https://loprtq.github.io/sportity/dev/reference/list_past_events.md),
[`list_personal_logins()`](https://loprtq.github.io/sportity/dev/reference/list_personal_logins.md)

## Examples

``` r
if (FALSE) { # \dontrun{
list_deleted_events(api = Sys.getenv("SPORTITY_API"))
} # }
```

# List documents

Lists the documents (including folders) in a series or event.

## Usage

``` r
list_documents(api, password, event_id = "")
```

## Arguments

- api:

  Your Sportity API key. Avoid writing it in scripts; store it in the
  `SPORTITY_API` environment variable and use
  `Sys.getenv("SPORTITY_API")`.

- password:

  The password of the series or event.

- event_id:

  Id of the event. `""` (default) lists all documents in the series.

## Value

A data frame with one row per document and columns `event_id`,
`document_id`, `name`, `sort_order`, `type` (e.g. `"Folder"`, `"Text"`,
`"PDF"`), `text`, `url`, `created_at` and `updated_at`.

## See also

Other document functions:
[`create_folder()`](https://loprtq.github.io/sportity/dev/reference/create_folder.md),
[`create_image()`](https://loprtq.github.io/sportity/dev/reference/create_image.md),
[`create_link()`](https://loprtq.github.io/sportity/dev/reference/create_link.md),
[`create_pdf()`](https://loprtq.github.io/sportity/dev/reference/create_pdf.md),
[`create_text()`](https://loprtq.github.io/sportity/dev/reference/create_text.md),
[`delete_document()`](https://loprtq.github.io/sportity/dev/reference/delete_document.md),
[`reorder_document()`](https://loprtq.github.io/sportity/dev/reference/reorder_document.md)

## Examples

``` r
if (FALSE) { # \dontrun{
docs <- list_documents(
  api = Sys.getenv("SPORTITY_API"),
  password = "my_password"
)

# Only the folders
docs[docs$type == "Folder", ]
} # }
```

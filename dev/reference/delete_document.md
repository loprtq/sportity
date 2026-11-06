# Delete a document

Deletes a document or folder.

## Usage

``` r
delete_document(api, document_id)
```

## Arguments

- api:

  Your Sportity API key. Avoid writing it in scripts; store it in the
  `SPORTITY_API` environment variable and use
  `Sys.getenv("SPORTITY_API")`.

- document_id:

  Id of the document, as returned by
  [`list_documents()`](https://loprtq.github.io/sportity/dev/reference/list_documents.md).

## Value

No return value, called for side effects. Prints a confirmation message.

## See also

Other document functions:
[`create_folder()`](https://loprtq.github.io/sportity/dev/reference/create_folder.md),
[`create_image()`](https://loprtq.github.io/sportity/dev/reference/create_image.md),
[`create_link()`](https://loprtq.github.io/sportity/dev/reference/create_link.md),
[`create_pdf()`](https://loprtq.github.io/sportity/dev/reference/create_pdf.md),
[`create_text()`](https://loprtq.github.io/sportity/dev/reference/create_text.md),
[`list_documents()`](https://loprtq.github.io/sportity/dev/reference/list_documents.md),
[`reorder_document()`](https://loprtq.github.io/sportity/dev/reference/reorder_document.md)

## Examples

``` r
if (FALSE) { # \dontrun{
delete_document(
  api = Sys.getenv("SPORTITY_API"),
  document_id = "my_document_id"
)
} # }
```

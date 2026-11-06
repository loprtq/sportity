# Move a document

Changes the position of a document in its list.

## Usage

``` r
reorder_document(api, document_id, position)
```

## Arguments

- api:

  Your Sportity API key. Avoid writing it in scripts; store it in the
  `SPORTITY_API` environment variable and use
  `Sys.getenv("SPORTITY_API")`.

- document_id:

  Id of the document, as returned by
  [`list_documents()`](https://loprtq.github.io/sportity/dev/reference/list_documents.md).

- position:

  New position of the document. The current positions are in the
  `sort_order` column of
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
[`delete_document()`](https://loprtq.github.io/sportity/dev/reference/delete_document.md),
[`list_documents()`](https://loprtq.github.io/sportity/dev/reference/list_documents.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Move a document to the top
reorder_document(
  api = Sys.getenv("SPORTITY_API"),
  document_id = "my_document_id",
  position = 1
)
} # }
```

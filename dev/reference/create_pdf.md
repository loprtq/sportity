# Upload a PDF document

Uploads a PDF file to a series or event.

## Usage

``` r
create_pdf(
  api,
  password,
  filepath = file.choose(),
  document_name = tools::file_path_sans_ext(basename(filepath)),
  folder_id = NULL,
  event_id = NULL,
  push_notification = TRUE,
  push_notification_title = NULL,
  show_time = FALSE
)
```

## Arguments

- api:

  Your Sportity API key. Avoid writing it in scripts; store it in the
  `SPORTITY_API` environment variable and use
  `Sys.getenv("SPORTITY_API")`.

- password:

  The password of the series or event.

- filepath:

  Path to the PDF file to upload. If not given, a file picker opens.

- document_name:

  Name of the document, as shown in the app. Defaults to the file name
  without extension.

- folder_id:

  Id of the folder to add the document to. `NULL` (default) uses the
  root folder.

- event_id:

  Id of the event to add the document to. `NULL` (default) adds it to
  the series.

- push_notification:

  Send a push notification to users? Default `TRUE`.

- push_notification_title:

  Title of the push notification. Defaults to `document_name`.

- show_time:

  Show the time of the document in the app? Default `FALSE`.

## Value

No return value, called for side effects. Prints a confirmation message.

## Details

The document is added to the root folder of the series unless `event_id`
and/or `folder_id` is given. Find these ids with
[`list_active_events()`](https://loprtq.github.io/sportity/dev/reference/list_active_events.md)
and
[`list_documents()`](https://loprtq.github.io/sportity/dev/reference/list_documents.md).

## See also

Other document functions:
[`create_folder()`](https://loprtq.github.io/sportity/dev/reference/create_folder.md),
[`create_image()`](https://loprtq.github.io/sportity/dev/reference/create_image.md),
[`create_link()`](https://loprtq.github.io/sportity/dev/reference/create_link.md),
[`create_text()`](https://loprtq.github.io/sportity/dev/reference/create_text.md),
[`delete_document()`](https://loprtq.github.io/sportity/dev/reference/delete_document.md),
[`list_documents()`](https://loprtq.github.io/sportity/dev/reference/list_documents.md),
[`reorder_document()`](https://loprtq.github.io/sportity/dev/reference/reorder_document.md)

## Examples

``` r
if (FALSE) { # \dontrun{
create_pdf(
  api = Sys.getenv("SPORTITY_API"),
  password = "my_password",
  filepath = "race_guide.pdf"
)
} # }
```

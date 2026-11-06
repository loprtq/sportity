# Create a text document

Adds a text document to a series or event.

## Usage

``` r
create_text(
  api,
  password,
  document_name,
  text,
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

- document_name:

  Name of the document, as shown in the app.

- text:

  Text content of the document.

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
[`create_pdf()`](https://loprtq.github.io/sportity/dev/reference/create_pdf.md),
[`delete_document()`](https://loprtq.github.io/sportity/dev/reference/delete_document.md),
[`list_documents()`](https://loprtq.github.io/sportity/dev/reference/list_documents.md),
[`reorder_document()`](https://loprtq.github.io/sportity/dev/reference/reorder_document.md)

## Examples

``` r
if (FALSE) { # \dontrun{
api <- Sys.getenv("SPORTITY_API")

create_text(
  api = api,
  password = "my_password",
  document_name = "Welcome",
  text = "See you at the start line!"
)

# Add it to the "Info" folder of an event instead
events <- list_active_events(api)
event_id <- events$event_id[1]
docs <- list_documents(api, "my_password", event_id = event_id)

create_text(
  api = api,
  password = "my_password",
  document_name = "Schedule",
  text = "Doors open at 8:00.",
  folder_id = docs$document_id[docs$name == "Info"],
  event_id = event_id
)
} # }
```

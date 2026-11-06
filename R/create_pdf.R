#' Upload a PDF document
#'
#' Uploads a PDF file to a series or event.
#'
#' The document is added to the root folder of the series unless `event_id`
#' and/or `folder_id` is given. Find these ids with [list_active_events()] and
#' [list_documents()].
#'
#' @inheritParams create_text
#' @param filepath Path to the PDF file to upload. If not given, a file
#'   picker opens.
#' @param document_name Name of the document, as shown in the app. Defaults to
#'   the file name without extension.
#'
#' @return No return value, called for side effects. Prints a confirmation
#'   message.
#' @family document functions
#' @export
#'
#' @examples
#' \dontrun{
#' create_pdf(
#'   api = Sys.getenv("SPORTITY_API"),
#'   password = "my_password",
#'   filepath = "race_guide.pdf"
#' )
#' }

create_pdf <- function(
  api,
  password,
  filepath = file.choose(),
  document_name = tools::file_path_sans_ext(basename(filepath)),
  folder_id = NULL,
  event_id = NULL,
  push_notification = TRUE,
  push_notification_title = NULL,
  show_time = FALSE
) {
  # Check push notification title
  if (push_notification && is.null(push_notification_title)) {
    push_notification_title <- document_name
  }

  # HTTP request
  httr2::request(
    "https://admin.sportity.com/api/document/create"
  ) |>
    httr2::req_headers(
      "X-Sportity-ApiKey" = api,
      "Content-Type" = "application/json"
    ) |>
    httr2::req_body_json(
      list(
        name = document_name,
        password = password,
        filename = filepath,
        type = "PDF",
        body = base64enc::base64encode(
          readBin(filepath, "raw", file.info(filepath)$size)
        ),
        parent_id = folder_id,
        event_id = event_id,
        push_notification = push_notification,
        push_custom_title = push_notification_title,
        show_time = show_time
      )
    ) |>
    httr2::req_perform()

  # Return console message
  cli::cli_alert_success("PDF '{document_name}' has been created.")
}

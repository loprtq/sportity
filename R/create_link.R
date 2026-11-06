#' Create a link document
#'
#' Adds a link to a series or event.
#'
#' The document is added to the root folder of the series unless `event_id`
#' and/or `folder_id` is given. Find these ids with [list_active_events()] and
#' [list_documents()].
#'
#' @inheritParams create_text
#' @param url The URL to link to.
#' @param open_ext Open the link in an external browser? Default `TRUE`.
#'
#' @return No return value, called for side effects. Prints a confirmation
#'   message.
#' @family document functions
#' @export
#'
#' @examples
#' \dontrun{
#' create_link(
#'   api = Sys.getenv("SPORTITY_API"),
#'   password = "my_password",
#'   document_name = "Results",
#'   url = "https://www.example.com/results"
#' )
#' }

create_link <- function(
  api,
  password,
  document_name,
  url,
  open_ext = TRUE,
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
        type = "Link",
        text = url,
        open_ext = open_ext,
        parent_id = folder_id,
        push_notification = push_notification,
        push_custom_title = push_notification_title,
        event_id = event_id,
        show_time = show_time
      )
    ) |>
    httr2::req_perform()

  # Return console message
  cli::cli_alert_success("Link '{document_name}' has been created.")
}

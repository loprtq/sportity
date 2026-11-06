#' Create a text document
#'
#' Adds a text document to a series or event.
#'
#' The document is added to the root folder of the series unless `event_id`
#' and/or `folder_id` is given. Find these ids with [list_active_events()] and
#' [list_documents()].
#'
#' @param api Your Sportity API key. Avoid writing it in scripts; store it in
#'   the `SPORTITY_API` environment variable and use
#'   `Sys.getenv("SPORTITY_API")`.
#' @param password The password of the series or event.
#' @param document_name Name of the document, as shown in the app.
#' @param text Text content of the document.
#' @param folder_id Id of the folder to add the document to. `NULL` (default)
#'   uses the root folder.
#' @param event_id Id of the event to add the document to. `NULL` (default)
#'   adds it to the series.
#' @param push_notification Send a push notification to users? Default `TRUE`.
#' @param push_notification_title Title of the push notification. Defaults to
#'   `document_name`.
#' @param show_time Show the time of the document in the app? Default `FALSE`.
#'
#' @return No return value, called for side effects. Prints a confirmation
#'   message.
#' @family document functions
#' @export
#'
#' @examples
#' \dontrun{
#' api <- Sys.getenv("SPORTITY_API")
#'
#' create_text(
#'   api = api,
#'   password = "my_password",
#'   document_name = "Welcome",
#'   text = "See you at the start line!"
#' )
#'
#' # Add it to the "Info" folder of an event instead
#' events <- list_active_events(api)
#' event_id <- events$event_id[1]
#' docs <- list_documents(api, "my_password", event_id = event_id)
#'
#' create_text(
#'   api = api,
#'   password = "my_password",
#'   document_name = "Schedule",
#'   text = "Doors open at 8:00.",
#'   folder_id = docs$document_id[docs$name == "Info"],
#'   event_id = event_id
#' )
#' }

create_text <- function(
  api,
  password,
  document_name,
  text,
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
        type = "Text",
        text = text,
        parent_id = folder_id,
        event_id = event_id,
        push_notification = push_notification,
        push_custom_title = push_notification_title,
        show_time = show_time
      )
    ) |>
    httr2::req_perform()

  # Return console message
  cli::cli_alert_success("Text '{document_name}' has been created.")
}

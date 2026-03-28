#' Create folder document
#'
#' @description
#' Create a folder document in an event or series.
#'
#' @param api An API key from Sportity.
#' @param password The event/series password.
#' @param document_name The name of the folder to be created.
#' @param folder_id The id of the folder to create the document in. To create a
#' document in the root folder do not specify a ´folder_id´. If to create a
#' document in a particular folder, then specify ´folder_id´.
#' @param event_id The id of the event. To create series folder do not specify
#' an ´event_id´. If to create a document in a particular event, then specify
#' ´event_id´.
#' @param push_notification Whether to send a push notification to the users
#' when the document is created. Default is TRUE.
#' @param push_notification_title The title of the push notification.
#' @param show_time Whether the time of the document should be shown. Default is
#' FALSE.
#'
#' @return A console message.
#' @export
#'
#' @examples
#' \dontrun{
#' create_folder(
#'   api = "your_api_key",
#'   password = "your_password",
#'   document_name = "Your Folder Name"
#' )
#' }

create_folder <- function(
  api,
  password,
  document_name,
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
        type = "Folder",
        parent_id = folder_id,
        push_notification = push_notification,
        push_custom_title = push_notification_title,
        event_id = event_id,
        show_time = show_time
      )
    ) |>
    httr2::req_perform()

  # Return console message
  cli::cli_alert_success("Folder '{document_name}' has been created.")
}

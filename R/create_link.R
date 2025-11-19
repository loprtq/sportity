#' Create link document
#'
#' @description
#' Create a link document in an event or series.
#'
#'
#' @param api An API key from Sportity.
#' @param password The event/series password.
#' @param document_name The name of the document to be created.
#' @param url The link to create a link document from.
#' @param event_id The id of the event. To create series folder do not specify an ´event_id´. If to create a document in a particular event, then specify ´event_id´.
#'
#' @export
#'

create_link <- function(
    api,
    password,
    document_name,
    url,
    event_id = NULL
) {
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
        event_id = event_id,
        open_ext = TRUE
      )
    ) |>
    httr2::req_perform()
}

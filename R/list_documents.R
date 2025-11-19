#' List documents
#'
#' @description
#' List all documents in an event or series.
#'
#'
#' @param api An API key from Sportity.
#' @param password The event/series password.
#' @param event_id The id of the event. To list all document in a series do not specify an ´event_id´. If to only list documents in a particular event, then specify ´event_id´.
#'
#' @return A data frame.
#' @export
#'

list_documents <- function(
    api,
    password,
    event_id = ""
) {
  httr2::request(
      glue::glue("https://admin.sportity.com/api/documents/{password}/{event_id}")
    ) |>
    httr2::req_headers(
      "X-Sportity-ApiKey" = api
    ) |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    purrr::map_df(~
      data.frame(
        event_id = if (!is.null(.x$event_id)) .x$event_id else NA,
        document_id = .x$id,
        name = .x$name,
        sort_order = .x$sort_order,
        type = .x$type,
        text = if (!is.null(.x$text)) .x$text else NA,
        url = if (!is.null(.x$url)) .x$url else NA,
        created_at = .x$created_at,
        updated_at = .x$updated_at,
        stringsAsFactors = FALSE
      )
    )
}

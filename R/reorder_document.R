#' Reorder document
#'
#' @description
#' Reorder a document in an event or series.
#'
#' @param api An API key from Sportity
#' @param document_id The id of the document to be reordered. The id can either
#' be retrieved using ´list_documents´ or from Sportity.
#' @param position The new position of the document.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' reorder_document(
#'   api = "your_api_key",
#'   document_id = "your_document_id",
#'   position = 1
#' )
#' }

reorder_document <- function(
  api,
  document_id,
  position
) {
  # HTTP request
  httr2::request(
    glue::glue("https://admin.sportity.com/api/document/{document_id}/reorder")
  ) |>
    httr2::req_method("PUT") |>
    httr2::req_headers(
      "X-Sportity-ApiKey" = api,
      "Content-Type" = "application/json"
    ) |>
    httr2::req_body_json(
      list(position = position)
    ) |>
    httr2::req_perform()

  # Return console message
  cli::cli_alert_success("Document '{document_name}' has been reordered.")
}

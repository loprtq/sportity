#' Delete document
#'
#' @description
#' Delete a document from an event or series.
#'
#'
#' @param api An API key from Sportity
#' @param document_id The id of the document to be deleted. The id can either be retrieved using ´list_documents´ or from Sportity.
#'
#' @export
#'

delete_document <- function(
    api,
    document_id
) {
  httr2::request(
    glue::glue("https://admin.sportity.com/api/document/delete/{document_id}")
  ) |>
    httr2::req_method("DELETE") |>
    httr2::req_headers(
      "X-Sportity-ApiKey" = api
    ) |>
    httr2::req_perform()
}

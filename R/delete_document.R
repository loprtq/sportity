#' Delete document
#'
#' @description
#' Delete a document from an event or series.
#'
#' @param api An API key from Sportity
#' @param document_id The id of the document to be deleted. The id can either be
#' retrieved using ´list_documents´ or from Sportity.
#'
#' @return A console message.
#' @export
#'
#' @examples
#' \dontrun{
#' delete_document(api = "your_api_key", document_id = "your_document_id")
#' }

delete_document <- function(
  api,
  document_id
) {
  # HTTP request
  httr2::request(
    glue::glue("https://admin.sportity.com/api/document/delete/{document_id}")
  ) |>
    httr2::req_method("DELETE") |>
    httr2::req_headers(
      "X-Sportity-ApiKey" = api
    ) |>
    httr2::req_perform()

  # Return console message
  cli::cli_alert_success("Document with id {document_id} has been deleted.")
}

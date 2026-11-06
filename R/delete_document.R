#' Delete a document
#'
#' Deletes a document or folder.
#'
#' @inheritParams create_text
#' @param document_id Id of the document, as returned by [list_documents()].
#'
#' @return No return value, called for side effects. Prints a confirmation
#'   message.
#' @family document functions
#' @export
#'
#' @examples
#' \dontrun{
#' delete_document(
#'   api = Sys.getenv("SPORTITY_API"),
#'   document_id = "my_document_id"
#' )
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

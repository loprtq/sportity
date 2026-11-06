#' Move a document
#'
#' Changes the position of a document in its list.
#'
#' @inheritParams delete_document
#' @param position New position of the document. The current positions are in
#'   the `sort_order` column of [list_documents()].
#'
#' @return No return value, called for side effects. Prints a confirmation
#'   message.
#' @family document functions
#' @export
#'
#' @examples
#' \dontrun{
#' # Move a document to the top
#' reorder_document(
#'   api = Sys.getenv("SPORTITY_API"),
#'   document_id = "my_document_id",
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
  cli::cli_alert_success(
    "Document with id {document_id} has been moved to position {position}."
  )
}

#' List documents
#'
#' Lists the documents (including folders) in a series or event.
#'
#' @inheritParams create_text
#' @param event_id Id of the event. `""` (default) lists all documents in the
#'   series.
#'
#' @return A data frame with one row per document and columns `event_id`,
#'   `document_id`, `name`, `sort_order`, `type` (e.g. `"Folder"`, `"Text"`,
#'   `"PDF"`), `text`, `url`, `created_at` and `updated_at`.
#' @family document functions
#' @export
#'
#' @examples
#' \dontrun{
#' docs <- list_documents(
#'   api = Sys.getenv("SPORTITY_API"),
#'   password = "my_password"
#' )
#'
#' # Only the folders
#' docs[docs$type == "Folder", ]
#' }

list_documents <- function(
  api,
  password,
  event_id = ""
) {
  # HTTP request
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

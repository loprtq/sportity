#' Create/upload pdf
#'
#' @description
#' Create a pdf document in an event or series.
#'
#'
#' @param api An API key from Sportity.
#' @param password The event/series password.
#' @param filepath The path to the document to be created/uploaded.
#' @param document_name The id of the document to be deleted.
#' @param event_id The id of the event. To create series folder do not specify an ´event_id´. If to create a document in a particular event, then specify ´event_id´.
#'
#' @export
#'

create_pdf <- function(
    api,
    password,
    filepath = file.choose(),
    document_name = tools::file_path_sans_ext(basename(filepath)),
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
        filename = filepath,
        type = "PDF",
        event_id = event_id,
        body = base64enc::base64encode(
          readBin(filepath, "raw", file.info(filepath)$size)
        )
      )
    ) |>
    httr2::req_perform()
}

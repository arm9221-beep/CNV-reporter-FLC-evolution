read_extract_singleMOD <- function(fcs_path) {
  ff <- read.FCS(fcs_path, transformation = FALSE, truncate_max_range = FALSE)
  mat <- exprs(ff)
  ch <- find_channelsMOD(colnames(mat))
  if (any(is.na(unlist(ch)))) {
    stop(sprintf("Channels not found in %s. Available: %s", basename(fcs_path), paste(colnames(mat), collapse = ", ")))
  }
  #10/12: also keep the plate well and the SpectroFlo group name (the condition label) from the FCS keywords
  kw <- keyword(ff)
  well <- if (!is.null(kw[["$WELLID"]])) trimws(kw[["$WELLID"]]) else NA_character_
  group <- if (!is.null(kw[["GROUPNAME"]])) trimws(kw[["GROUPNAME"]]) else NA_character_
  data.frame(
    file = basename(fcs_path),
    Well = well,
    Group = group,
    event = seq_len(nrow(mat)),
    B2_A = mat[, ch$B2],
    YG3_A = mat[, ch$YG3],
    FSC_A = mat[, ch$FSC],
    SSC_A = mat[, ch$SSCA],
    SSC_H = mat[, ch$SSCH],
    stringsAsFactors = FALSE
  )
}

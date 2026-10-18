read_extract_dirMOD <- function(dir_path) {
  files <- list.files(dir_path, pattern = "\\.fcs$", full.names = TRUE, ignore.case = TRUE)
  if (length(files) == 0) stop("No .fcs files found in directory: ", dir_path)
  out <- lapply(files, function(f) {
    tryCatch(read_extract_singleMOD(f),
             error = function(e) { message("Skipping ", basename(f), ": ", e$message); NULL })
  })
  do.call(rbind, out)
}
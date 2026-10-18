find_channelsMOD <- function(colnames_vec) {
  b2 <- colnames_vec[colnames_vec %in% c("B2-A","B2 A","B2_A","B2A")]
  if (length(b2) == 0) b2 <- grep("(?i)B\\s*2.*A|B2-?A|B2_A|B2A", colnames_vec, value = TRUE, perl = TRUE)
  yg3 <- colnames_vec[colnames_vec %in% c("YG3-A","YG3 A","YG3_A","YG3A")]
  if (length(yg3) == 0) yg3 <- grep("(?i)YG\\s*3.*A|YG3-?A|YG3_A|YG3A", colnames_vec, value = TRUE, perl = TRUE)
  fsc <- colnames_vec[colnames_vec %in% c("FSC-A","FSC A","FSC_A","FSCA")]
  if (length(fsc) == 0) fsc <- grep("(?i)FS\\s*C.*A|FSC-?A|FSC_A|FSCA", colnames_vec, value = TRUE, perl = TRUE)
  #10/12: added SSC-A and SSC-H for the SSC singlet gate (and fixed FSC fallback, which used to overwrite yg3)
  ssca <- colnames_vec[colnames_vec %in% c("SSC-A","SSC A","SSC_A","SSCA")]
  ssch <- colnames_vec[colnames_vec %in% c("SSC-H","SSC H","SSC_H","SSCH")]
  list(B2 = ifelse(length(b2) > 0, b2[1], NA_character_),
       YG3 = ifelse(length(yg3) > 0, yg3[1], NA_character_),
       FSC = ifelse(length(fsc) > 0, fsc[1], NA_character_),
       SSCA = ifelse(length(ssca) > 0, ssca[1], NA_character_),
       SSCH = ifelse(length(ssch) > 0, ssch[1], NA_character_))
}

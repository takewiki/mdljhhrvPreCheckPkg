#' ODS表的差异检查
#'
#' @param token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' diffOdsBill_query()
diffOdsBill_query <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql <- paste0("select a.FNumber as FSourceNumber,a.FCategoryType,a.FExpenseOrgID,a.FTaxDeclarationOrg,a.FBankType,
b.FBankType,b.FNumber as FTplNumber
from rds_hrv_ods_vw_billList a
left join rds_hrv_ods_rule_voucher b
on a.FCategoryType = b.FCategoryType and a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg
and a.FBankType  = b.FBankType
where   b.FNumber is null ")
  data <- tsda::sql_select2(token = token,sql = sql)
  return(data)

}

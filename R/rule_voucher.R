#' 凭证规则表异常检验主要是银行类型
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
rule_voucherCheck_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("
select a.FTaxDeclarationOrg,a.FExpenseOrgID,a.FCategoryType,a.FBankType,b.FBankType from rds_hrv_ods_rule_preCheck a
left join   rds_hrv_ods_rule_voucher b
on  a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg and a.FCategoryType = b.FCategoryType
where a.FBankType <> b.FBankType")
  data <- tsda::sql_select2(token = FToken,sql = sql)
  return(data)
}


#' 凭证规则表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
rule_voucherCheck_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("update b set   b.FBankType = a.FBankType from rds_hrv_ods_rule_preCheck a
left join   rds_hrv_ods_rule_voucher b
on  a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg and a.FCategoryType = b.FCategoryType
where a.FBankType <> b.FBankType")
  data <- tsda::sql_update2(token = FToken,sql_str = sql)
  return(data)
}


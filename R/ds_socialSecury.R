#' 社保ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
ds_socialSecuryOdsCheck_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {
  data_bank = ds_socialSecuryOdsCheckBank_query(FToken = FToken)
  data_dept = ds_socialSecuryOdsCheckDept_query(FToken = FToken)
  res = rbind(data_bank,data_dept)
  return(res)

  }

#' 社保ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
ds_socialSecuryOdsCheckBank_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("
select a.FBankType as source , b.FBankType as target from rds_hrv_ods_rule_preCheck a
left join   rds_hrv_ods_ds_socialsecurity  b
on  a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg and a.FCategoryType = b.FCategoryType
where a.FBankType <> b.FBankType")
  data <- tsda::sql_select2(token = FToken,sql = sql)
  return(data)
}








#' 社保ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
ds_socialSecuryOdsCheckDept_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("
select FOldDept as source ,FHightechDept as target  from rds_hrv_ods_ds_socialsecurity
where   FOldDept =''")
  data <- tsda::sql_select2(token = FToken,sql = sql)
  return(data)
}

#' 社保ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_socialSecuryOdsCheck_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  ds_socialSecuryOdsCheckBank_deal(FToken = FToken)
  ds_socialSecuryOdsCheckDept_deal(FToken = FToken)
}

#' 社保ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_socialSecuryOdsCheckBank_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("update b set   b.FBankType = a.FBankType from rds_hrv_ods_rule_preCheck a
left join   rds_hrv_ods_ds_socialsecurity b
on  a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg and a.FCategoryType = b.FCategoryType
where a.FBankType <> b.FBankType")
  data <- tsda::sql_update2(token = FToken,sql_str = sql)
  return(data)
}

#' 社保ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_socialSecuryOdsCheckDept_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("update a set  FOldDept = FHightechDept  from rds_hrv_ods_ds_socialsecurity  a
where   FOldDept =''")
  data <- tsda::sql_update2(token = FToken,sql_str = sql)
  return(data)
}

#' 社保ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
ds_socialSecuryStdCheck_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {
  data_bank = ds_socialSecuryStdCheckBank_query(FToken = FToken)
  data_dept = ds_socialSecuryStdCheckDept_query(FToken = FToken)
  res = rbind(data_bank,data_dept)
  return(res)

}

#' 社保ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
ds_socialSecuryStdCheckBank_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("
select a.FTaxDeclarationOrg,a.FExpenseOrgID,a.FCategoryType,a.FBankType,b.FBankType from rds_hrv_ods_rule_preCheck a
left join   rds_hrv_Std_ds_socialsecurity  b
on  a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg and a.FCategoryType = b.FCategoryType
where a.FBankType <> b.FBankType")
  data <- tsda::sql_select2(token = FToken,sql = sql)
  return(data)
}

#' 社保ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
ds_socialSecuryStdCheckDept_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("
select FOldDept,FHightechDept  from rds_hrv_Std_ds_socialsecurity
where   FOldDept =''")
  data <- tsda::sql_select2(token = FToken,sql = sql)
  return(data)
}

#' 社保ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_socialSecuryStdCheck_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {
  ds_socialSecuryStdCheckBank_deal(FToken = FToken)
  ds_socialSecuryStdCheckDept_deal(FToken = FToken)
}

#' 社保ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_socialSecuryStdCheckBank_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("update b set   b.FBankType = a.FBankType from rds_hrv_ods_rule_preCheck a
left join   rds_hrv_Std_ds_socialsecurity b
on  a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg and a.FCategoryType = b.FCategoryType
where a.FBankType <> b.FBankType")
  data <- tsda::sql_update2(token = FToken,sql_str = sql)
  return(data)
}

#' 社保ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_socialSecuryStdCheckDept_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("update a set  FOldDept = FHightechDept  from rds_hrv_Std_ds_socialsecurity a
where   FOldDept =''")
  data <- tsda::sql_update2(token = FToken,sql_str = sql)
  return(data)
}





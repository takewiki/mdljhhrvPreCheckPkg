#' 工资ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' ds_salaryOdsCheck_query()
ds_salaryOdsCheck_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB'){
  data_bank = ds_salaryOdsCheckBank_query(FToken = FToken)
  data_dept = ds_salaryOdsCheckDept_query(FToken = FToken)
  res = rbind(data_bank,data_dept)
  return(res)
}

#' 工资ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
ds_salaryOdsCheckBank_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("
select a.FBankType as source,b.FBankType as target from rds_hrv_ods_rule_preCheck a
left join   rds_hrv_ods_ds_salary b
on  a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg and a.FCategoryType = b.FCategoryType
where a.FBankType <> b.FBankType")
  data <- tsda::sql_select2(token = FToken,sql = sql)
  return(data)
}
#' 工资ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
ds_salaryOdsCheckDept_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("
select FOldDept as source,FHightechDept as target  from rds_hrv_ods_ds_salary
where   FOldDept =''")
  data <- tsda::sql_select2(token = FToken,sql = sql)
  return(data)
}



#' 工资ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_salaryOdsCheck_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {
  ds_salaryOdsCheckBank_deal(FToken = FToken)
  ds_salaryOdsCheckDept_deal(FToken = FToken)
}


#' 工资ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_salaryOdsCheckBank_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("update b set   b.FBankType = a.FBankType from rds_hrv_ods_rule_preCheck a
left join   rds_hrv_ods_ds_salary b
on  a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg and a.FCategoryType = b.FCategoryType
where a.FBankType <> b.FBankType")
  data <- tsda::sql_update2(token = FToken,sql_str = sql)
  return(data)
}




#' 工资ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_salaryOdsCheckDept_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("update a set  FOldDept = FHightechDept  from rds_hrv_ods_ds_salary a
where   FOldDept =''")
  data <- tsda::sql_update2(token = FToken,sql_str = sql)
  return(data)
}


#' 工资ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' ds_salaryStdCheck_query()
ds_salaryStdCheck_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {
  data_bank = ds_salaryStdCheckBank_query(FToken = FToken)
  data_dept = ds_salaryStdCheckDept_query(FToken = FToken)
  res = rbind(data_bank,data_dept)
  return(res)

}

#' 工资ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
ds_salaryStdCheckBank_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("
select a.FTaxDeclarationOrg,a.FExpenseOrgID,a.FCategoryType,a.FBankType,b.FBankType from rds_hrv_ods_rule_preCheck a
left join   rds_hrv_Std_ds_salary b
on  a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg and a.FCategoryType = b.FCategoryType
where a.FBankType <> b.FBankType")
  data <- tsda::sql_select2(token = FToken,sql = sql)
  return(data)
}

#' 工资ODS表异常检查
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_query()
ds_salaryStdCheckDept_query <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("
select FOldDept,FHightechDept  from rds_hrv_Std_ds_salary
where   FOldDept =''")
  data <- tsda::sql_select2(token = FToken,sql = sql)
  return(data)
}

#' 工资ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_salaryStdCheck_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {
  ds_salaryStdCheckBank_deal(FToken = FToken)
  ds_salaryStdCheckDept_deal(FToken = FToken)
}

#' 工资ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_salaryStdCheckBank_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("update b set   b.FBankType = a.FBankType from rds_hrv_ods_rule_preCheck a
left join   rds_hrv_Std_ds_salary b
on  a.FExpenseOrgID = b.FExpenseOrgID and a.FTaxDeclarationOrg = b.FTaxDeclarationOrg and a.FCategoryType = b.FCategoryType
where a.FBankType <> b.FBankType")
  data <- tsda::sql_update2(token = FToken,sql_str = sql)
  return(data)
}














#' 工资ODS表异常处理
#'
#' @param FToken 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' voucherRuleCheck_deal()
ds_salaryStdCheckDept_deal <- function(FToken='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql <- paste0("update a set  FOldDept = FHightechDept  from rds_hrv_Std_ds_salary a
where   FOldDept =''")
  data <- tsda::sql_update2(token = FToken,sql_str = sql)
  return(data)
}



#' 单据对象查询
#'
#' @param token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' odsBillList_Query()
odsBillList_Query <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
sql <- paste0("create view  rds_hrv_ods_vw_billList
as
select FNumber,FCategoryType,FExpenseOrgID,FTaxDeclarationOrg,FBankType,'rds_hrv_ods_ds_salary' as FTableName  from rds_hrv_std_ds_salary
union all
select FNumber,FCategoryType,FExpenseOrgID,FTaxDeclarationOrg,FBankType,'rds_hrv_ods_ds_socialsecurity' as FTableName  from rds_hrv_std_ds_socialsecurity")
tsda::sql_update2(token = token,sql_str = sql)


}

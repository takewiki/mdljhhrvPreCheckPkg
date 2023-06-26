#' 插入研发支出的工资数据
#'
#' @param token 口令
#' @param FNumber 模板编号
#' @param FSeq_ref 模板序号
#' @param FSeq_new 模板新行事收
#'
#' @return 返回值
#' @export
#'
#' @examples
#' tpl_rdSalary_add()
tpl_rdSalary_add <- function(token='057A7F0E-F187-4975-8873-AF71666429AB',
                             FNumber ='B012' ,
                             FSeq_ref =2,
                             FSeq_new=3) {
  sql <-paste0("insert into  rds_hrv_ods_tpl_voucher
SELECT  [FNumber]
      ,[FName]
      ,[FCategoryType]
      , ",FSeq_new," as [FSeq]
      ,[FNotes]
      ,'5301.01.01' as [FSubjectNumber]
      ,'研发支出_人员人工费_工资' as [FSubjectName]
      , 3 as [FAccountNumber]
      ,'研发项目/责任中心/重分类' as [FLexitemProperty]
      ,'A03,A04,A05,A06,C02.部门' as [FObtainSource]
      ,[FAccountBorrow]
      ,[FAccountLoan]
      ,[FSettleMethod]
      ,[FSettleNumber]
      ,[FAccountBookID]
      ,[FFirstAcct]
      ,[FAccountBorrowSql]
      ,[FAccountLoanSql]
  FROM  [rds_hrv_ods_tpl_voucher]
  where FNumber ='",FNumber,"' and FSeq =",FSeq_ref,"")
  tsda::sql_insert2(token = token,sql_str = sql)

}


#' 插入研发支出的社保数据
#'
#' @param token 口令
#' @param FNumber 模板编号
#' @param FSeq_ref 模板序号
#' @param FSeq_new 模板新行事收
#'
#' @return 返回值
#' @export
#'
#' @examples
#' tpl_rdSocialSecurity_add()
tpl_rdSocialSecurity_add <- function(token='057A7F0E-F187-4975-8873-AF71666429AB',
                             FNumber ='B017' ,
                             FSeq_ref =2,
                             FSeq_new=3) {
  sql <-paste0("insert into  rds_hrv_ods_tpl_voucher
SELECT  [FNumber]
      ,[FName]
      ,[FCategoryType]
       , ",FSeq_new," as [FSeq]
      ,[FNotes]
      ,'5301.01.02' as [FSubjectNumber]
      ,'研发支出_人员人工费_社会保险费' as [FSubjectName]
      , 3 as [FAccountNumber]
      ,'研发项目/责任中心/重分类' as [FLexitemProperty]
      ,'A03,A04,A05,A06,C02.部门' as [FObtainSource]
      ,[FAccountBorrow]
      ,[FAccountLoan]
      ,[FSettleMethod]
      ,[FSettleNumber]
      ,[FAccountBookID]
      ,[FFirstAcct]
      ,[FAccountBorrowSql]
      ,[FAccountLoanSql]
  FROM [rds_hrv_ods_tpl_voucher]
  where FNumber ='",FNumber,"' and FSeq =",FSeq_ref,"")
  tsda::sql_insert2(token = token,sql_str = sql)


}



#' 插入研发支出的公积金数据
#'
#' @param token 口令
#' @param FNumber 模板编号
#' @param FSeq_ref 模板序号
#' @param FSeq_new 模板新行事收
#'
#' @return 返回值
#' @export
#'
#' @examples
#' tpl_rdSocialSecurity_add()
tpl_rdCumFund_add <- function(token='057A7F0E-F187-4975-8873-AF71666429AB',
                                     FNumber ='B018' ,
                                     FSeq_ref =2,
                                     FSeq_new=3) {
  sql <-paste0("insert into  rds_hrv_ods_tpl_voucher
SELECT  [FNumber]
      ,[FName]
      ,[FCategoryType]
       , ",FSeq_new," as [FSeq]
      ,[FNotes]
      ,'5301.01.05' as [FSubjectNumber]
      ,'研发支出_人员人工费_公积金	' as [FSubjectName]
      , 3 as [FAccountNumber]
      ,'研发项目/责任中心/重分类' as [FLexitemProperty]
      ,'A03,A04,A05,A06,C02.部门' as [FObtainSource]
      ,[FAccountBorrow]
      ,[FAccountLoan]
      ,[FSettleMethod]
      ,[FSettleNumber]
      ,[FAccountBookID]
      ,[FFirstAcct]
      ,[FAccountBorrowSql]
      ,[FAccountLoanSql]
  FROM [rds_hrv_ods_tpl_voucher]
  where FNumber ='",FNumber,"' and FSeq =",FSeq_ref,"")
  tsda::sql_insert2(token = token,sql_str = sql)


}



#' 插入管理费用-社保
#'
#' @param token 口令
#' @param FNumber 模板编号
#' @param FSeq_ref 模板序号
#' @param FSeq_new 模板新行事收
#'
#' @return 返回值
#' @export
#'
#' @examples
#' tpl_socialSecurityMngr_add()
tpl_socialSecurityMngr_add <- function(token='057A7F0E-F187-4975-8873-AF71666429AB',
                              FNumber ='B018' ,
                              FSeq_ref =2,
                              FSeq_new=3) {
  sql <-paste0("insert into [rds_hrv_ods_tpl_voucher]
SELECT [FNumber]
      ,[FName]
      ,[FCategoryType]
      ,",FSeq_new," as [FSeq]
      ,[FNotes]
      ,'6602.01.02' as [FSubjectNumber]
      ,'管理费用_职工薪酬_社保' as [FSubjectName]
      ,3 as [FAccountNumber]
      ,'部门/责任中心/重分类'  as [FLexitemProperty]
      ,'A03,A04,A05,A06,C02.部门' as [FObtainSource]
      ,[FAccountBorrow]
      ,[FAccountLoan]
      ,[FSettleMethod]
      ,[FSettleNumber]
      ,[FAccountBookID]
      ,[FFirstAcct]
      ,[FAccountBorrowSql]
      ,[FAccountLoanSql]
  FROM [dbo].[rds_hrv_ods_tpl_voucher]
 where FNumber='",FNumber,"'
and  fseq =",FSeq_ref,"")
  tsda::sql_insert2(token = token,sql_str = sql)


}







#' 插入管理费用-社保
#'
#' @param token 口令
#' @param FNumber 模板编号
#' @param FSeq_ref 模板序号
#' @param FSeq_new 模板新行事收
#'
#' @return 返回值
#' @export
#'
#' @examples
#' tpl_socialSecurityDisability_add()
tpl_socialSecurityDisability_add <- function(token='057A7F0E-F187-4975-8873-AF71666429AB',
                                       FNumber ='B018' ,
                                       FSeq_ref =2,
                                       FSeq_new=3) {
  sql <-paste0("insert into [rds_hrv_ods_tpl_voucher]
SELECT [FNumber]
      ,[FName]
      ,[FCategoryType]
      ,",FSeq_new," as [FSeq]
      ,[FNotes]
      ,'2211.03' as [FSubjectNumber]
      ,'应付职工薪酬_残疾人保障金' as [FSubjectName]
      ,0 as [FAccountNumber]
      ,''  as [FLexitemProperty]
      ,'' as [FObtainSource]
      ,[FAccountBorrow]
      ,'求和项:异地残障金'  as [FAccountLoan]
      ,[FSettleMethod]
      ,[FSettleNumber]
      ,[FAccountBookID]
      ,[FFirstAcct]
      ,[FAccountBorrowSql]
      ,'rds_hrv_src_ds_socialsecurity.FComDisabilityBenefitsAmt' as [FAccountLoanSql]
  FROM [dbo].[rds_hrv_ods_tpl_voucher]
 where FNumber='",FNumber,"'
and  fseq =",FSeq_ref,"")
  tsda::sql_insert2(token = token,sql_str = sql)


}








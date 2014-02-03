//
//  config.h
//  mic
//
//  Created by Codeguesser on 13/2/27.
//  Copyright (c) 2013年 Codeguesser. All rights reserved.
//

#ifndef mic_config_h
#define mic_config_h

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define webUrl @"http://snakeheaduat.sourcedemo.com/"

#define UserLoginUrl @"http://snakeheaduat.sourcedemo.com/api/employee/login"

#define UserRegisterUrl @"http://snakeheaduat.sourcedemo.com/member/employee_register"

#define UserDetailInfoUrl @"http://snakeheaduat.sourcedemo.com/api/employee/info"

#define UserDetailInfoEditeUrl @"http://snakeheaduat.sourcedemo.com/api/employee/account"

#define UserDetailCoverLetterUrl @"http://snakeheaduat.sourcedemo.com/api/employee/cover_letter"

#define UserBookmarkUrl @"http://snakeheaduat.sourcedemo.com/api/employee/employee_save_job"

#define UserBookmarkDeleteUrl @"http://snakeheaduat.sourcedemo.com/api/employee/del_employee_wish_list"

#define UserApplyUrl @"http://snakeheaduat.sourcedemo.com/api/employee/employee_apply_job"

#define UserBookmarkListUrl @"http://snakeheaduat.sourcedemo.com/api/employee/employee_wish_list"

#define UserAlertUrl @"http://snakeheaduat.sourcedemo.com/api/employee/employee_alert_list"

#define CompanyDetailUrl @"http://snakeheaduat.sourcedemo.com/api/employer/employer_detail"

#define EmployeeDetailUrl @"http://snakeheaduat.sourcedemo.com/api/employer/employer_apply_detail"

#define EmployerLoginUrl @"http://snakeheaduat.sourcedemo.com/api/employer/login"

#define EmployerRegisterUrl @"http://snakeheaduat.sourcedemo.com/member/employer_register"

#define EmployerBookmarkListUrl @"http://snakeheaduat.sourcedemo.com/api/employer/employer_wish_list"

#define EmployerBookmarkUrl @"http://snakeheaduat.sourcedemo.com/api/employer/employer_bookmark"

#define EmployerDeleteBookmarkUrl @"http://snakeheaduat.sourcedemo.com/api/employer/del_employer_wish_list"

#define EmployerPostJobUrl @"http://snakeheaduat.sourcedemo.com/api/employer/employer_post_job_list"

#define EmployerPostJobApplyUrl @"http://snakeheaduat.sourcedemo.com/api/employer/employer_apply_list"

#define CategoryListUrl @"http://snakeheaduat.sourcedemo.com/api/category/all_categories"

#define PositionsListUrl @"http://snakeheaduat.sourcedemo.com/api/category/positions"

#define CompanyListUrl @"http://snakeheaduat.sourcedemo.com/api/category/company_list"

#define ProductListUrl @"http://snakeheaduat.sourcedemo.com/api/product/lists"

#define LocationProductUrl @"http://snakeheaduat.sourcedemo.com/api/product/lists_by_location"

#define CompanyProductUrl @"http://snakeheaduat.sourcedemo.com/api/product/lists_by_company"

#define DateProductUrl @"http://snakeheaduat.sourcedemo.com/api/product/lists_by_date"

#define TodayJobNumUrl @"http://snakeheaduat.sourcedemo.com/api/product/today_job_num"

#define ProductDetailUrl @"http://snakeheaduat.sourcedemo.com/api/product/detail"

#define AboutUsUrl @"http://snakeheaduat.sourcedemo.com/content/page/about_us"

#define ContactUsUrl @"http://snakeheaduat.sourcedemo.com/content/page/contact-us"

#define PrivacyUrl @"http://snakeheaduat.sourcedemo.com/content/page/privacy-statement"

#define TearmsUrl @"http://snakeheaduat.sourcedemo.com/content/page/terms-conditions"

#endif

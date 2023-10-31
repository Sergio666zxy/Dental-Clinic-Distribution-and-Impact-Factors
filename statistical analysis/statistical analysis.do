cd "" // change your working directory

use "..\regression analysis\regression_analysis.dta", clear

global Control_Variables elect_store kind age hotel_num mall museum_num old ktv mid primary west_food super green_ratio number_building tihu sub floor_ratio residence park  

generate have_kou = 1 if kou > 0
replace have_kou = 0 if have_kou == .

// summary statistics

logout, save("ttest_with_result.rtf") word replace: ttable3 kou end_price_pers pop light pm25 $Control_Variables, by(have_kou) tvalue
logout, save("ttest_with_result_mean_std.rtf") word replace: tabstat kou end_price_pers pop light pm25 $Control_Variables, by(have_kou) stat(mean sd) nototal long col(stat)


Select DISTINCT W1.STATE,(W3.Custodial_Rape+W3.Custodial_GangRape) as Custodial_Rape,(W1.Rape_1+W2.Rape_2+W3.Gang_Rape+W3.Rape_3)as Other_Rape,
(W1.Dowry_1+W2.Dowry_2+W3.Dowry_3+Dowry_Acts) as Dowry_Case,W3.Sexual_Harassment,
(W1.Assault_Modesty_1+W2.Assault_Modesty_2+W3.Sexual_Harassment+W3.Assault+W3.Voyeurism+W3.Stalking+W3.Other) as Assault_Modesty,
(W1.Insult_Modesty_1+W2.Insult_Modesty_2+W3.Insult_Modesty_3) as Insult_Modesty,
(W1.Husband_Cruelty_1+W2.Husband_Cruelty_2+W3.Husband_Cruelty_3)as Cruelty_by_Husband,W3.Murder,W3.Women_Suicides 
FROM
(Select State,DISTRICT,Year,Sum(Rape)as Rape_1,Sum(DowryDeaths)as Dowry_1,
Sum(Assaultonwomenwithintenttooutragehermodesty) as Assault_Modesty_1,Sum(InsulttomodestyofWomen)as Insult_Modesty_1,
Sum(CrueltybyHusbandorhisRelatives)as Husband_Cruelty_1
FROM "42_District_wise_crimes_committed_against_women_2001_2012"
WHERE DISTRICT NOT like '%TOTAL'
group by STATE)W1
JOIN
(Select State,DISTRICT,Year,Sum(Rape)as Rape_2,Sum(DowryDeaths)as Dowry_2,
Sum(Assaultonwomenwithintenttooutragehermodesty) as Assault_Modesty_2,Sum(InsulttomodestyofWomen)as Insult_Modesty_2,
Sum(CrueltybyHusbandorhisRelatives)as Husband_Cruelty_2
FROM "42_District_wise_crimes_committed_against_women_2013"
WHERE DISTRICT NOT like '%TOTAL'
group by STATE)W2
on W1.STATE=W2.STATE
JOIN
(Select State,DISTRICT,Year,Sum(CustodialOtherRape)as Custodial_Rape,Sum(CustodialGangRape)as Custodial_GangRape,
Sum(RapeGangRape) as Gang_Rape,sum(RapeOthers)as Rape_3,Sum(DowryDeaths)as Dowry_3,
Sum(SexualHarassment) as Sexual_Harassment,Sum(AssaultonwomenwithintenttoDisrobe)as Assault,Sum(Voyeurism) as Voyeurism,Sum(Stalking) as Stalking,
Sum(Others) as Other,Sum(InsulttotheModestyofWomenTotal)as Insult_Modesty_3,Sum(CrueltybyHusbandorhisRelatives)as Husband_Cruelty_3,Sum(Murder) as Murder,
Sum(AbetmentofSuicidesofWomen) as Women_Suicides,Sum(DowryProhibitionAct1961)as Dowry_Acts
FROM "42_District_wise_crimes_committed_against_women_2014"
WHERE DISTRICT NOT like '%TOTAL'
group by STATE)W3
on W1.STATE=W3.STATE


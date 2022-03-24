Select DISTINCT C1.STATE,(C1.Rape_1+C2.Rape_1)as Total_Rape,(C1.Murder_1+C2.Murder_1)as
Total_Murder,(C1.Buying+C2.Buying)as Total_ProstitutionBuy,(C1.Sell+C2.Sell)as Total_ProstitutionSell,
(C1.Buying+C2.Buying+C1.Sell+C2.Sell)as Total_ProstitutionCase,(C1.Kidnapping+C2.Kidnapping)as Total_Kidnapping,
(C1.Child_Marriage+C2.Child_Marriage)as Total_ChildMarriageCase,(C1.Suicide+C2.Suicide)as Total_Suicide,
(C1.Other+C2.Other+C2.Other_Crime)as Total_OtherCrime
FROM
(Select State,DISTRICT,Year,sum(Murder)as Murder_1,Sum(Rape)as Rape_1,Sum(KidnappingandAbduction)as Kidnapping,Sum(Abetmentofsuicide)as Suicide,
Sum(Buyingofgirlsforprostitution) as Buying,Sum(Sellingofgirlsforprostitution)as Sell,Sum(Prohibitionofchildmarriageact)as Child_Marriage,
sum(OtherCrimes)as Other
FROM "03_District_wise_crimes_committed_against_children_2001_2012"
WHERE DISTRICT NOT like '%TOTAL'
group by STATE)C1
JOIN
(Select State,DISTRICT,Year,Sum(Infanticid)as Other_Crime,sum(Othermurder)as Murder_1,Sum(Rape)as Rape_1,Sum(KidnappingandAbduction)as Kidnapping,
sum(Abetmentofsuicide)as Suicide,sum(Buyingofgirlsforprostitution) as Buying,sum(Sellingofgirlsforprostitution)as Sell,Sum(Prohibitionofchildmarriageact)as Child_Marriage,sum(OtherCrimes)as Other
FROM "03_District_wise_crimes_committed_against_children_2013"
WHERE DISTRICT NOT LIKE '%TOTAL'
group by STATE)C2
on C1.STATE=C2.STATE

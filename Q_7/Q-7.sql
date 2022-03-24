Select *
From "23_Anti_corruprion_cases"  a1
JOIN "24_Anti_corruption_arrests" a2
on a1.AreaName = a2.AreaName
and a1.Year = a2.Year
Group by a1.AreaName, a1.Year
order by a1.AreaName ASC; 
------
Select DISTINCT ACS.AreaName,ACS.Investigation_Case,ACS.Case_For_Trails,(ACS.Investigation_Case+ACS.Case_For_Trails) as Total_Case,
ACA.Total_Arrested,ACA.Total_under_Trial,(ACA.Group_A_Officers+ACA.Group_B_Officers) as Total_Group_Officers,
ACA.Group_A_Officers,ACA.Group_B_Officers,ACA.Private_Persons,ACS.Property_Recovereds_Rs,ACS.Amount_Imposed_Rs,
(ACS.Property_Recovereds_Rs+ACS.Amount_Imposed_Rs) as Total_Amount_Rs
From
(Select AreaName,Year,sum(TotalNoofcasesforinvestigationduringtheyear) as Investigation_Case,
sum(TotalNoofcasesfortrialduringtheyear) as Case_For_Trails,
sum(Noofcasespendinginvestigationattheendoftheyear) as Case_Pending_at_end,
sum(ValueofpropertyrecoveredseizedduringtheyearinRs) as Property_Recovereds_RS,
sum(TotalamountoffineimposedduringtheyearinRs) as Amount_Imposed_Rs
from "23_Anti_corruprion_cases"
group by AreaName)ACS
JOIN
(select AreaName,year,sum(Noofpersonsarrestedduringtheyear) as Total_Arrested,
sum (TotalNoofpersonsundertrialduringtheyear) as Total_under_Trial,
sum (NoofGroupAOfficersoutofabove) as Group_A_Officers,
sum (NoofGroupBOfficersoutofabove) as Group_B_Officers,
sum (Noofprivatepersonsinvolvedduringtheyear) as Private_Persons
from "24_Anti_corruption_arrests"
group by AreaName)ACA
on ACS.AreaName=ACA.AreaName


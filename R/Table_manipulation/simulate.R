library(dplyr)
set.seed(111)

student = data.frame(
  studentID = paste0("S",sample(10:99, 30, replace = F)),
  birthDay = sample(1:360,30, replace = T)+ as.Date("2006-01-01"),
  teacherID = sample(paste0("T",1:6))
)

teacher = data.frame(
  teacherID = paste0("TEA",1:6),
  degree = c("bachelor","bachelor","bachelor","master","master","master"),
  gender = sample(c("M","F"),6,replace = T)
)

student$year1score = 5*(teacher$degree=="master")+abs(rnorm(30,60,5))
student$year2score = 2*(teacher$degree=="master")+abs(rnorm(30,65,5))

student = student%>%
  mutate(year1score = round(year1score),
         year2score = round(year2score))

write.csv(student,"student.csv",row.names = F)
write.csv(teacher,"teacher.csv",row.names = F)

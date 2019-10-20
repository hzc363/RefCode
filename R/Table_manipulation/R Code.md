---
output:
  html_document: default
  pdf_document: default
  word_document: default
---
<style> 
.vertical { 
border-left: 2px solid #AEB6BF; 
height: 850px;
margin-top: 2%;
margin-bottom: 2%;
position:absolute; 
left: 50%; 
} 
</style> 

<center><h1>Table manipulation with dplyr</h1></center>


<div style="width: 100%; overflow: hidden;">
<div style="width: 48%; float: left;"> 
Q1
</div>
<div class="vertical">
</div>
<div style="width: 48%; float: right;">
Q2
</div>
</div>

<div style="page-break-after: always; visibility: hidden"> 
\pagebreak 
</div>


<div style="width: 100%; overflow: hidden;">
<div style="width: 48%; float: left;"> 
### Load data and package
Q3
</div>
<div class="vertical">
</div>
<div style="width: 48%; float: right;">
Q4
</div>
</div>

### Load data and package
```R
# load dplyr
library("dplyr")

# load information about students and teachers
student = read.csv("student.csv")
teacher = read.csv("teacher.csv")
```

### Filter Rows

```R
# Filter individual row
filter(student, teacherID == "T1" & year2score < 80) 

# Filter groups
student %>% group_by(teacherID) %>% filter(mean(year1score) > 65)
```

### Select columns
```R
# Select columns
select(student, studentID, birthDay)

# Exclude columns
select(student, -studentID, -birthDay)
```

### Sort rows
```R
# Small to large
arrange(student, year1score)

# Large to small
arrange(student, desc(year1score))
```

###Group rows
```R
# Grouping
student %>% group_by(teacherID) 

# Ungrouping
student %>% ungroup()
```

### Summarise by group
```R
student %>% group_by(teacherID) %>% 
  summarise(mean_score1 = mean(year1score),
            mean_score2 = mean(year2score))
```
### Add or edit column
```R
# Add new column
student %>%  
  mutate(mean_score = (year1score + year2score)/2)
  
# Edit existing column
student %>%  
  mutate(year1score = scale(year1score))
```

### Identify Unique rows
```R
# unique values of all columns
student %>% distinct()

# unique values of teacherID
student %>% distinct(teacherID)
```

### Sample Rows
```R
# sample 10 rows
sample_n(student, 10)

# sample 30% of the rows
sample_frac(student, 0.3)
``` 
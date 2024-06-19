---
title: <% tp.file.title %>
tag: weekly
---

## [[<% tp.date.now("YYYY-[W]WW", -7) %>| <<]] | <% tp.file.title %> | [[<%  tp.date.now("YYYY-[W]WW", 7) %> | >> ]]

## 🏆 Goal

## ✅ Tasks
### 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    start,
    end,
    "진행 중" as Status
FROM #
WHERE contains(file.path, "Working") AND !contains(file.path, "Templates") 
SORT start DESC
```
# 회고
## 업무
- 
## 개인
- 

## 📅 Schedule
###  🗒️[[due <% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>]] Mon
#### 할 일
```tasks 
due due <% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
#### 한 일
```tasks 
done due <% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
###  🗒️ [[due <% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>]]  Tue
#### 할 일
```tasks 
due due <% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
#### 한 일
```tasks 
done due <% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
```
###  🗒️ [[due <% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>]]  Wed
#### 할 일
```tasks 
due due <% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
#### 한 일
```tasks 
done due <% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
###  🗒️ [[due <% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>]]  Thu
#### 할 일
```tasks 
due due <% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
#### 한 일
```tasks 
done due <% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
###  🗒️ [[due <% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>]]  Fri
#### 할 일
```tasks 
due due <% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
#### 한 일
```tasks 
done due <% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
###  🗒️ [[due <% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>]]  Sat
#### 할 일
```tasks 
due due <% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
#### 한 일
```tasks 
done due <% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
###  🗒️[[due <% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>]]  Sun
#### 할 일
```tasks 
due due <% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
#### 한 일
```tasks 
done due <% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
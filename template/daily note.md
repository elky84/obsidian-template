---
title: <% tp.file.title %>
created:  <% tp.file.creation_date() %>
tags: dailynote
---
## [[<% tp.date.now("YYYY-MM-DD", -1, tp.file.title, "YYYY-MM-DD") %>| <<]] | <% tp.file.title %> | [[<% tp.date.now("YYYY-MM-DD", 1, tp.file.title, "YYYY-MM-DD") %> | >> ]]

# 📅  일정
- [ ] 

# 📒 메모
- 

# 🗓️ 할 일
```tasks 
not done 
due <% tp.file.title %> 
hide due date
```
## ⌛ 놓친 일
```tasks 
not done 
due before <% tp.file.title %> 
```

# 📃 회고
## ⏰ 습관
```tasks 
done <% tp.file.title %> 
hide due date
hide done date
heading includes 매일
heading does not include Day Planner
```

##  🗒️ 한 일
```tasks 
done <% tp.file.title %> 
hide due date
hide done date
heading does not include 매일
heading does not include Day Planner
```

## 🗄️ 기록

## 📅 Full Calendar

## Day Planner
- [ ] 00:00 휴식
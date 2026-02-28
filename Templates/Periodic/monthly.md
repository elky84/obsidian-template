---
title: <% tp.file.title %>
tags:
  - Monthly
---

## [[<% moment().add(-1, 'month').format('YYYY-MM') %>| <<]] | <% tp.file.title %> | [[<% moment().add(1, 'month').format('YYYY-MM') %> | >> ]]

## 🏆 Goal

## ✅ Tasks
- [ ] 회고 ⏰<% moment().endOf('month').format('YYYY-MM-DD') %> 18:00 📅 <% moment().endOf('month').format('YYYY-MM-DD') %>
- [ ] Monthly 노트 생성 ⏰<% moment().startOf('month').add(1, 'month').format('YYYY-MM-DD') %> 00:00 📅 <% moment().startOf('month').add(1, 'month').format('YYYY-MM-DD') %> 
# 회고
- 

# 주간 노트
<%*  
let base = moment(tp.file.title, "YYYY-MM");  
  
if (!base.isValid()) {  
tR += "파일 이름이 YYYY-MM 형식이 아닙니다.";  
return;  
}  
  
let start = base.clone().startOf("month");  
let end = base.clone().endOf("month");  
  
let current = start.clone().startOf("isoWeek");  
let weeks = [];  
  
while (current.isSameOrBefore(end)) {  
weeks.push(current.format("GGGG-[W]WW"));  
current.add(1, "week");  
}  
  
weeks = [...new Set(weeks)];  
  
for (let w of weeks) {  
tR += `[[${w}]]\n`;  
}  
%>
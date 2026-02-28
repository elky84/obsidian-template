---
title: <% tp.file.title %>
tags:
  - Yearly
---

## [[<% moment().add(-1, 'year').format('YYYY') %>| <<]] | <% tp.file.title %> | [[<% moment().add(1, 'year').format('YYYY') %> | >> ]]

## 🏆 Goal

## ✅ Tasks
- [ ] 회고 ⏰<% moment().endOf('year').format('YYYY-MM-DD') %> 13:00 📅 <% moment().endOf('year').format('YYYY-MM-DD') %>
- [ ] Yearly 노트 생성 ⏰<% moment().startOf('year').add(1, 'year').format('YYYY-MM-DD') %> 00:00 📅 <% moment().startOf('year').add(1, 'year').format('YYYY-MM-DD') %>
# 회고
- 

# 월간 노트
<%*
let year = tp.file.title;

if (!/^\d{4}$/.test(year)) {
    tR += "파일 이름이 YYYY 형식이 아닙니다.";
    return;
}

for (let i = 1; i <= 12; i++) {
    let month = String(i).padStart(2, "0");
    tR += `[[${year}-${month}]]\n`;
}
%>
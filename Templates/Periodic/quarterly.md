---
title: <% tp.file.title %>
tags:
  - Quarterly
---

## [[<% moment().subtract(1, "quarter").format("YYYY-[Q]Q") %>| <<]] | <% tp.file.title %> | [[<% moment().add(1, "quarter").format("YYYY-[Q]Q") %> | >> ]]

## 🏆 Goal

## ✅ Tasks
- [ ] 회고 ⏰<% moment().endOf('quarter').format('YYYY-MM-DD') %> 13:00 📅 <% moment().endOf('quarter').format('YYYY-MM-DD') %>
- [ ] Quarterly 노트 생성 ⏰<% moment().startOf('quarter').add(1, 'quarter').format('YYYY-MM-DD') %> 00:00 📅 <% moment().startOf('quarter').add(1, 'quarter').format('YYYY-MM-DD') %>
# 회고
- 

# 월간 노트
<%*
let title = tp.file.title;
let match = title.match(/^(\d{4})-Q([1-4])$/);

if (!match) {
    tR += "파일 이름이 YYYY-QN 형식이 아닙니다.";
    return;
}

let year = match[1];
let quarter = parseInt(match[2]);

let startMonth = (quarter - 1) * 3 + 1;

for (let i = 0; i < 3; i++) {
    let month = String(startMonth + i).padStart(2, "0");
    tR += `[[${year}-${month}]]\n`;
}
%>
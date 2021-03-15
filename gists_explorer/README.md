# gists_explorer

## Gists Explorer parser



- [ ] Получить список gists на поисковое выражение
- [ ] Получить информацию по конкретному gist используя API


## Поисковый запрос с использованием специальных тегов

language:dart
https://gist.github.com/search?q=language%3Adart+solution.txt&ref=searchresults


## Использование API на примере

curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/gists/db904ce7cf1fa7602bb5c519ab05d8f2|jora -p
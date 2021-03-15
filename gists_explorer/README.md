# gists_explorer

## Gists Explorer parser



- [ ] Получить список gists на поисковое выражение
- [ ] Получить информацию по конкретному gist используя API
- [ ] Сделать переход по авторам (не поиском, а получить список gists по указанному URL)

## Поисковый запрос с использованием специальных тегов

language:dart
https://gist.github.com/search?q=language%3Adart+solution.txt&ref=searchresults


## Использование API на примере

curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/gists/db904ce7cf1fa7602bb5c519ab05d8f2|jora -p
  
  

https://docs.github.com/en/rest/reference/gists#authentication
> The Gist API provides up to one megabyte of content for each file in the gist. Each file returned for a gist through the API has a key called truncated. If truncated is true, the file is too large and only a portion of the contents were returned in content
>
>


## Searching on GitHub

https://docs.github.com/en/github/searching-for-information-on-github/searching-on-github

поиск с первой страницы

https://gist.github.com/search?q=language%3Adart+solution.txt&p=1


## Сделать переход по авторам (не поиском, а получить список gists по указанному URL)

![image](https://user-images.githubusercontent.com/17752828/111225939-7dda4080-85f1-11eb-9dda-e1ba5257a774.png)


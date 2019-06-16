# README

Rails開発環境で必要な初期設定がされたソース。  

## 構築手順

1. Dockerfileを下記の通り修正する。
```
$ vi Dockerfile

$ diff Dockerfile Dockerfile_old 
23,26c23,26
< #COPY . $APP_ROOT/
< #
< #EXPOSE 8888
< #CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8888"]
---
> COPY . $APP_ROOT/
> 
> EXPOSE 8888
> CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8888"]
$ 
```

2. Dockerイメージの作成とRailsソースの作成
```
$ docker build -t katsuya003/project .

$ docker run --rm -it -v "$PWD":/project katsuya003/project rails new . -BT -d mysql
```

3. Dockerfileを下記の通り修正する。
```
$ vi Dockerfile

$ diff Dockerfile Dockerfile_old 
23,26c23,26
< COPY . $APP_ROOT/
< 
< EXPOSE 8888
< CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8888"]
---
> #COPY . $APP_ROOT/
> 
> #EXPOSE 8888
> #CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8888"]
$ 
```

4. docker-composeでイメージを作成する。
```
$ docker-compose build

$ docker-compose up -d
```

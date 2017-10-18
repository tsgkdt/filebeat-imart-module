# imart module

intra-martの出力するログをfilebeatで取得するモジュール

| module | version |
|-------|----------|
| filebeat | 6.0.0-rc1 |


# Dockerfileについて

filebeat.ymlと、logフォルダをコンテナにマウントする例です。

```
docker run --rm -it -v /xxxxx/yyyyy/zzzzz/filebeat.yml:/filebeat/filebeat.yml:ro \
       -v /xxxxx/yyyyy/zzzzz/log/:/var/log/resin/ \
       tsgkadot/filebeat-imart-module
```

ホストのファイルをマウントするとき、filebeat.ymlについては、readonlyでマウントしないとfilebeatがエラー終了します。  
そのため、`:ro` をつけて、マウントしています。


# Compatibility

intra-mart Accel-Platform 2015 Summerで動作確認

# Dashboard

とりあえず初版。インポート時に使用するデータは、module/imart/_meta/kibana/以下を確認してください。

![](https://camo.qiitausercontent.com/aeb3eac8b21715d1ddb20519d06cad657a761212/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f3131313637362f37353739313737632d393731622d316633612d376539622d3462373862313831336431622e706e67)

## logs fileset settings

### var.paths

Windowsの場合、C:/resin*/log/　以下にあることを想定します。


# References

- [filebeatでmoduleを書いてみた話。intra-martのログをElasticsearchに入れる](http://qiita.com/tsgkdt/items/14d2fadc7e457c2c3646)

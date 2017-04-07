# imart module

intra-martの出力するログをfilebeatで取得するモジュール

| module | version |
|-------|----------|
| filebeat | 5.3.0 |


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

まだ作ってません

## logs fileset settings

### var.paths

Windowsの場合、C:/resin*/log/　以下にあることを想定します。



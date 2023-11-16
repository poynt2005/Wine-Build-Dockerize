# Wine-Build-Dockerize

### 說明

[項目鏈接](https://github.com/poynt2005/Wine-Build-Dockerize)  
因為有編譯 wine dll 的需求，所以創造一個 wine 編譯的 container  
編譯指令參考 [官方文件](https://wiki.winehq.org/Building_Wine) 以及 [Reddit Post](https://www.reddit.com/r/wine_gaming/comments/7xgux5/wine_3_how_to_build_a_proper_working_wine_for/?utm_source=embedv2&utm_medium=post_embed&utm_content=post_title&embed_host_url=https://publish.reddit.com/embed)

### 建置

`docker build -t wine-build .   `

### 使用

`docker pull poynt2005/wine-build`

1. wine 文件根目錄: /wine-dirs
2. wine 源代碼: /wine-dirs/wine-source
3. wine 32 位 編譯文件: /wine-dirs/wine32
4. wine 64 位 編譯文件: /wine-dirs/wine64

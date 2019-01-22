[![CircleCI](https://circleci.com/gh/mkanenobu/nim-erajp/tree/master.svg?style=svg)](https://circleci.com/gh/mkanenobu/nim-erajp/tree/master)  
# nim-erajp

## Installation

```
nimble install https://github.com/mkanenobu/nim-erajp
```

### Usage

```
import erajp

initJapaneseEra(dt: DateTime): Object =
```

DateTimeから和暦オブジェクトを生成

AlphabetEra: アルファベット一文字(例: "H"  
KanziEra: 漢字(例: "昭和"  
IntEraYear: 和暦(整数型)  

1868/01/01より前には未対応。

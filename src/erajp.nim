import times, strutils, sequtils

type
  JapaneseEra* = object
    AlphabetEra*: string
    KanziEra*: string
    KanziEraOneChar*: string
    IntEraYear*: int

  EraStartYear = enum
    Meiji  = "1868-01-01"
    Taisyo = "1912-07-30"
    Syowa  = "1926-12-25"
    Heisei = "1989-01-08"

  EraDiff {.pure.} = enum
    Meiji = 1867
    Taisyo = 1911
    Syowa = 1925
    Heisei = 1988

proc parse(dt: EraStartYear): DateTime =
  parse($dt, "yyyy-MM-dd")

proc initJapaneseEra*(dt: DateTime): JapaneseEra =
  ## Initialises new "JapaneseEra"
  var
    alphabetEra: string
    kanziEra: string
    kanziEraOneChar: string
    intEraYear: int

  if dt < parse(Meiji):
    raise newException(ValueError, "Unsupported date")
  elif parse(Heisei) <= dt:
    alphabetEra = "H"
    kanziEra = "平成"
    kanziEraOneChar = "平"
    intEraYear = dt.year - int(EraDiff.Heisei)
  elif parse(Syowa) <= dt:
    alphabetEra = "S"
    kanziEra = "昭和"
    kanziEraOneChar = "昭"
    intEraYear = dt.year - int(EraDiff.Syowa)
  elif parse(Taisyo) <= dt:
    alphabetEra = "T"
    kanziEra = "大正"
    kanziEraOneChar = "大"
    intEraYear = dt.year - int(EraDiff.Taisyo)
  elif parse(Meiji) <= dt:
    alphabetEra = "M"
    kanziEra = "明治"
    kanziEraOneChar = "明"
    intEraYear = dt.year - int(EraDiff.Meiji)

  return JapaneseEra(
    AlphabetEra: alphabetEra,
    KanziEra: kanziEra,
    KanziEraOneChar: kanziEraOneChar,
    IntEraYear: intEraYear,
  )


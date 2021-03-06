import times, strutils, sequtils

type
  JapaneseEra* = ref object of RootObj
    AlphabetEra*: string
    KanziEra*: string
    IntEraYear*: int

  EraStartDate = enum
    Meiji  = "1868-01-01"
    Taisyo = "1912-07-30"
    Syowa  = "1926-12-25"
    Heisei = "1989-01-08"
    Reiwa  = "2019-05-01"

  EraDiffFromAD {.pure.} = enum
    Meiji  = 1867
    Taisyo = 1911
    Syowa  = 1925
    Heisei = 1988
    Reiwa  = 2018

  EraNames {.pure.} = enum
    Meiji  = "明治"
    Taisyo = "大正"
    Syowa  = "昭和"
    Heisei = "平成"
    Reiwa  = "令和"

proc parse(dt: EraStartDate): DateTime =
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
  elif parse(Reiwa) <= dt:
    alphabetEra = "R"
    kanziEra = $EraNames.Reiwa
    intEraYear = dt.year - int(EraDiffFromAD.Reiwa)
  elif parse(Heisei) <= dt:
    alphabetEra = "H"
    kanziEra = $EraNames.Heisei
    intEraYear = dt.year - int(EraDiffFromAD.Heisei)
  elif parse(Syowa) <= dt:
    alphabetEra = "S"
    kanziEra = $EraNames.Syowa
    intEraYear = dt.year - int(EraDiffFromAD.Syowa)
  elif parse(Taisyo) <= dt:
    alphabetEra = "T"
    kanziEra = $EraNames.Taisyo
    intEraYear = dt.year - int(EraDiffFromAD.Taisyo)
  elif parse(Meiji) <= dt:
    alphabetEra = "M"
    kanziEra = $EraNames.Meiji
    intEraYear = dt.year - int(EraDiffFromAD.Meiji)

  return JapaneseEra(
    AlphabetEra: alphabetEra,
    KanziEra: kanziEra,
    IntEraYear: intEraYear,
  )


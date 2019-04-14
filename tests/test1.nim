# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest, times

import erajp

let
  t1 = parse("1989-01-01", "yyyy-MM-dd")
  t2 = parse("1989-01-08", "yyyy-MM-dd")
  t3 = parse("2019-05-01", "yyyy-MM-dd")

test "era":
  check initJapaneseEra(t1).IntEraYear == 64
  check initJapaneseEra(t2).IntEraYear == 1
  check initJapaneseEra(t1).KanziEra == "昭和"
  check initJapaneseEra(t2).KanziEra == "平成"
  check initJapaneseEra(t3).KanziEra == "令和"

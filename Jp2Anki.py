#!/usr/bin/python
# -*- coding: utf-8 -*-
#not finished
from lxml import etree
import MeCab
import argparse
import os
folder = os.path.dirname(__file__)
mecab = MeCab.Tagger("-Owakati")
while True:
    try:
        print mecab.parse(raw_input()),
    except EOFError:
        break
JMdict = etree.parse(os.path.join(folder, "JMdict_e"))
kanjidic = etree.parse(os.path.join(folder, "kanjidic2.xml"))
kanji_search = etree.XPath("/JMdict/entry/k_ele/keb[.=$word]")
kana_search = etree.XPath("/JMdict/entry/r_ele/reb[.=$word]")
print(etree.tostring(kanji_search(JMdict, word="")[0], encoding='utf-8'))



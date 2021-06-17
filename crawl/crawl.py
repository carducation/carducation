import requests
from bs4 import BeautifulSoup
import pandas as pd
import os

def get_html(subject):
    test = {}
    test['kor'] = list()
    test['type'] = list()
    test['eng'] = list()
    test['kor_detail'] = list()
    test['eng_detail'] = list()
    for page in range(1, 5):
        addr = "https://krdict.korean.go.kr/eng/dicSearchDetail/searchDetailSenseCategoryResult?searchFlag=Y&sort=W&currentPage="+str(page)+"&ParaWordNo=&deleteWord_no=&nation=eng&nationCode=6&syllablePosition=&searchType=D&lgCategoryCode="+str(subject)+"&miCategoryCode=-1&blockCount=100"
        web = requests.get(addr)
        if str(web.status_code) == '404':
            continue
        html = web.content
        result = BeautifulSoup(html, "html.parser")
        for each in result.find_all("dl"):
            first = each.find("dt")
            kor = str(first.find(attrs={'class':'word_type1_17'}).contents[0]).strip() # 한국어 뜻
            type = str(first.find(attrs={'class':'manyLang6 ml5'}).string).strip() # 품사 (영어)
            for mean, kordetail, engdetail in zip(each.find_all(lambda tag : tag.name == 'dd' and tag.get('class') == ['manyLang6']),
                                    each.find_all(lambda tag2 : tag2.name == 'dd' and tag2.get('class') == ['ml20']),
                                    each.find_all('dd', 'manyLang6 ml20')):
                test['kor'].append(kor)
                test['type'].append(type)
                test['eng'].append(mean.text[6:].strip())
                test['kor_detail'].append(kordetail.text.strip())
                test['eng_detail'].append(engdetail.text.strip())
    return test

if __name__ == '__main__':
    base_dir = "C:/Users/kimjiwoo/Desktop/Ireland/1web/word_crawl/"
    file = "word_excel.xlsx"
    xlxs_dir = os.path.join(base_dir, file)
    writer = pd.ExcelWriter(xlxs_dir, engine='xlsxwriter')
    category = ['dietary', 'politics and administration', 'nature', 'culture']
    csv = []
    j = 0
    for i in [3, 10, 11, 12]:
        csv.append(get_html(i))
    for j in range(4):
        dict_to_df = pd.DataFrame.from_dict(csv[j])
        dict_to_df.to_excel(writer, sheet_name = category[j])
    writer.save()

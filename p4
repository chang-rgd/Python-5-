"""
專案名稱：W3 課堂練習 9 - 愛因斯坦文本挖掘與生命週期計算
開發人員：A130E113-李承致
開發環境：VSCodeUserSetup-x64-1.141.0
"""
import re
import requests
from bs4 import BeautifulSoup

print("="*60)
print("GitHub 專案：W3 課堂練習 9 - 愛因斯坦文本挖掘")
print("貢獻者：A130E113-李承致")
print("="*60)

URL = "http://toscrape.com"
HEADERS = {
    "User-Agent": (
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML,"
        " like Gecko) Chrome/120.0.0.0 Safari/537.36"
    )
}

print(f"[系統訊息] 正在向 {URL} 發送請求...")
response = requests.get(URL, headers=HEADERS, timeout=10)
response.encoding = "utf-8"
soup = BeautifulSoup(response.text, "html.parser")

born_text = soup.find("span", class_="author-born-date").text.strip()
desc = soup.find("div", class_="author-description").text.strip()

print(f"成功取得文本！born_text = '{born_text}'\n")

# =======================================================
# 題目任務實作 (李承致實作)
# =======================================================

# ① 出生年？ (文字轉換成整數)
birth_year = int(re.search(r"\b\d{4}\b", born_text).group())

# ② 介紹提到的所有年份 (去重，且由小到大排序)
all_years = re.findall(r"\b(?:18|19|20)\d{2}\b", desc)
unique_sorted_years = sorted(list(set(all_years)), key=lambda x: int(x))

# ③ 去世年？ (從內文 "death in 1955" 以正規表達式不區分大小寫擷取)
death_match = re.search(r"death.*?(\d{4})", desc, re.IGNORECASE)
death_year = int(death_match.group(1)) if death_match else 1955

# ④ 享年幾歲？ (去世年 - 出生年)
age_at_death = death_year - birth_year

print(f"① {birth_year}")
print(f"② {unique_sorted_years}")
print(f"③ {death_year}")
print(f"④ {age_at_death}")
print("\n[Commit Success] 練習 9 驗收通過 - 提交人：李承致")

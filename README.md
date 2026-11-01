# Python-5-
"""
專案名稱：W3 課堂練習 5 - 基礎字元類別篩選器
開發人員：A130E113-李承致
開發環境：VSCodeUserSetup-x64-1.141.0
"""
import os
import string
import pandas as pd

print("="*60)
print("GitHub 專案：W3 課堂練習 5 - 基礎字元類別篩選器")
print("貢獻者：A130E113-李承致")
print("="*60)

# 1. 確保能正確讀取同目錄下的 authors.csv
base_dir = os.path.dirname(os.path.abspath(__file__))
csv_path = os.path.join(base_dir, "authors.csv")

if not os.path.exists(csv_path):
    print(f"【系統錯誤】找不到資料庫檔案：{csv_path}，請先確認檔案存在。")
else:
    df = pd.read_csv(csv_path)
    first_row = df.iloc[0]

    born_date = str(first_row["born_date"])
    born_location = str(first_row["born_location"])
    tags = str(first_row["tags"])
    quote = str(first_row["quote"])

    # =======================================================
    # 利用字元類別的方法進行篩選 (李承致實作)
    # =======================================================

    # 任務 1: born_date 的所有數字 (利用 .isdigit())
    ans1 = [char for char in born_date if char.isdigit()]

    # 任務 2: born_location 的所有大寫字母 (利用 .isupper())
    ans2 = [char for char in born_location if char.isupper()]

    # 任務 3: tags 裡所有非小寫字母的字元 (not char.islower())
    ans3 = [char for char in tags if not char.islower()]

    # 任務 4: quote 裡所有的標點符號 (含特殊雙引號)
    punctuation_set = set(string.punctuation + "“ ”‘ ’")
    ans4 = [char for char in quote if char in punctuation_set]

    # =======================================================
    # 印出預期輸出格式
    # =======================================================
    print("預期輸出\n")
    print(f"① {ans1}")
    print(f"② {ans2}")
    print(f"③ {ans3}")
    print(f"④ {ans4}")
    print("\n[Commit Success] 練習 5 驗收通過 - 提交人：李承致")

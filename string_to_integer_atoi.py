#one of the most hated exercises on leetcode, based on Python3 with regex.
#~32 ms, ~14mb
import re
class Solution:
    def myAtoi(self, s: str) -> int:
        try:
            val = int(re.findall(r"(^[\+\-]*\d+)",s.lstrip())[0])
            if val > 2147483647:
                return 2147483647
            elif val < -2147483648:
                return -2147483648
            else:
                return val
        except:
            return 0

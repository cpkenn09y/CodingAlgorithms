# Approach #1 : Record Letters Seen

class Solution(object):
    def nextGreatestLetter(self, letters, target):
        seen = set(letters)
        for i in xrange(1, 26):
            cand = chr((ord(target) - ord('a') + i) % 26 + ord('a'))
            if cand in seen:
                return cand

print nextGreatestLetter(["c", "f", "j"], "a")

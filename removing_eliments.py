s=input('enter a string')
res=""
for i in s:
    if i not in res:
        res+=i
print(res)
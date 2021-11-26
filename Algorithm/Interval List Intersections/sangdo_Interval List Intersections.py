class Solution:
    def intervalIntersection(self, firstList: List[List[int]], secondList: List[List[int]]) -> List[List[int]]:
        a,b = 0,0
        res = []
        while a != len(firstList) and b != len(secondList):
            line1 = firstList[a]
            line2 = secondList[b]
            if line1[0] <= line2[0] and line2[1] <= line1[1]:
                res.append(line2)
                b+=1
            elif line2[0] <= line1[0] and line1[1] <= line2[1]:
                res.append(line1)
                a+=1
            elif line1[1] < line2[0]:
                a+=1
            elif line2[1] < line1[0]:
                b+=1
            else:
                if line1[0] <= line2[0] <= line1[1]:
                    res.append([line2[0], line1[1]])
                    a+=1
                elif line1[0] <= line2[1] <= line1[1]:
                    res.append([line1[0], line2[1]])
                    b+=1
                elif line2[0] <= line1[0] <= line2[1]:
                    res.append([line1[0], line2[1]])
                    b+=1
                else:
                    res.append([line2[0], line1[1]])
                    a+=1
        return res
                
            

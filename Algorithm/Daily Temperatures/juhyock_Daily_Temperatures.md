Stack 사용 문제



온도와 인덱스를 저장해 현재 온도와 비교

- 저장된 온도가 현재 온도보다 낮은 경우 - pop (저장된 온도가 현재보다 높아질 때 까지)

- 저장된 온도가 현재 온도보다 높은 경우 - push



```cpp

class Solution {
public:
	vector<int> dailyTemperatures(vector<int>& temperatures) {

		vector<pair<int, int>> stack;
		vector<int> res(temperatures.size());

		for (int i = 0; i < temperatures.size(); i++) {

			if (stack.empty()) {
				stack.push_back({ temperatures[i], i });
			}

			while (!stack.empty() && stack.back().first < temperatures[i]) {
				res[stack.back().second] = i - stack.back().second;
				stack.pop_back();
			}

			stack.push_back({ temperatures[i], i });
		}

		while (!stack.empty()) {
			res[stack.back().second] = 0;
			stack.pop_back();
		}
		
		return res;
	}
};
```

